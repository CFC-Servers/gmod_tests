--- @type GLuaTest_TestGroup
return {
    groupName = "Global:HTTP",
    cases = {
        {
            name = "Null bytes in response body are kept",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    url = "http://host.docker.internal:5000/response_null_byte_in_body",
                    success = function(code, body, headers)
                        expect(body).to.equal("Hello World\0!")
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Set-Cookie headers with same name are concatenated",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    url = "http://host.docker.internal:5000/response_multiple_cookies",
                    success = function(code, body, headers)
                        -- Note: RFC 6265 states that origin servers should not fold Set-Cookie
                        --       headers due to semantics changes. This does not just apply to
                        --       Cookies with Expires fields (as tested below).

                        -- Header order is nondeterministic, so we need to test both combinations.
                        expect((headers["Set-Cookie"] == "CookieA=1,CookieB=2") or (headers["Set-Cookie"] == "CookieB=2,CookieA=1")).to.beTrue()
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Set-Cookie headers with same name are concatenated even if invalid",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    url = "http://host.docker.internal:5000/response_multiple_cookies_with_expires",
                    success = function(code, body, headers)

                        -- Header order is nondeterministic, so we need to test both combinations.
                        local cookie_a = "CookieA=1; Expires=Sat, 02 Feb 2002 12:17:00 GMT"
                        local cookie_b = "CookieB=2; Expires=Fri, 21 Jul 2023 13:36:35 GMT"
                        expect((headers["Set-Cookie"] == (cookie_a .. "," .. cookie_b)) or (headers["Set-Cookie"] == (cookie_b .. "," .. cookie_a))).to.beTrue()
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Headers with same name are concatenated",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    url = "http://host.docker.internal:5000/response_multiple_warning",
                    success = function(code, body, headers)
                        -- Header order is nondeterministic, so we need to test both combinations.
                        local warning_a = "199 - Warning1"
                        local warning_b = "199 - Warning2"
                        expect((headers["Warning"] == (warning_a .. "," .. warning_b)) or (headers["Warning"] == (warning_b .. "," .. warning_a))).to.beTrue()
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Redirects are followed",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    url = "http://host.docker.internal:5000/response_redirect",
                    success = function(code, body, headers)
                        expect(code).to.equal(200)
                        expect(body).to.equal("Redirected!")

                        -- Let's make sure that headers from the redirection request are discarded.
                        expect(headers["Location"]).to.beNil()
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Content-Type for GET request is unset by default",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    method = "GET",
                    url = "http://host.docker.internal:5000/echo_content_type",
                    success = function(code, body, headers)
                        expect(code).to.equal(404)
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Content-Type for POST request defaults to urlencoded form",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    method = "POST",
                    url = "http://host.docker.internal:5000/echo_content_type",
                    success = function(code, body, headers)
                        expect(body).to.equal("application/x-www-form-urlencoded")
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Content-Type for POST request with body defaults to plaintext",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    method = "POST",
                    url = "http://host.docker.internal:5000/echo_content_type",
                    body = "Hello world!",
                    success = function(code, body, headers)
                        expect(body).to.equal("text/plain; charset=utf-8")
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Content-Type for POST request with header override sticks",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    method = "POST",
                    url = "http://host.docker.internal:5000/echo_content_type",
                    headers = {
                        ["Content-Type"] = "application/octet-stream",
                    },
                    success = function(code, body, headers)
                        expect(body).to.equal("application/octet-stream")
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Content-Type for POST request with body and header override sticks",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    method = "POST",
                    url = "http://host.docker.internal:5000/echo_content_type",
                    headers = {
                        ["Content-Type"] = "application/octet-stream",
                    },
                    body = "Hello world!",
                    success = function(code, body, headers)
                        expect(body).to.equal("application/octet-stream")
                        done()
                    end,
                    failed = function(err)
                        fail("HTTP request failed: " .. err)
                    end
                })
            end
        },
        {
            name = "Request methods are checked and translated",
            async = true,
            timeout = 1,
            func = function()
                -- We have to check multiple async requests, so we effectively implement something like a semaphore here.
                -- We initialize to 1 and decrement once after all requests have been queued so we can reliably check at all exits.
                local pending_requests = 1

                local function on_request_done()
                    pending_requests = pending_requests - 1
                    if pending_requests == 0 then
                        done()
                    end
                end

                local function test_method(method_in, method_out)
                    pending_requests = pending_requests + 1

                    local queued = HTTP({
                        method = method_in,
                        url = "http://host.docker.internal:5000/echo_method",
                        success = function(code, body, headers)
                            expect(body).to.equal(method_out)
                            on_request_done()
                        end,
                        failed = function(err)
                            expect(err).to.equal("invalid method")
                            on_request_done()
                        end,
                    })
                    expect(queued).to.beTrue()
                end

                -- An unset method should default to GET
                test_method(nil, "GET")

                -- Request methods noted as supported in Structures/HTTPRequest
                test_method("get", "GET")
                test_method("GET", "GET")
                test_method("post", "POST")
                test_method("POST", "POST")
                test_method("put", "PUT")
                test_method("PUT", "PUT")
                test_method("delete", "DELETE")
                test_method("DELETE", "DELETE")
                test_method("patch", "PATCH")
                test_method("PATCH", "PATCH")
                test_method("options", "OPTIONS")
                test_method("OPTIONS", "OPTIONS")

                -- HEAD is also one of those, but we don't get back the response body.
                test_method("head", "")
                test_method("HEAD", "")

                -- Other request methods defined by RFC 9110, those are unsupported.
                test_method("trace", nil)
                test_method("TRACE", nil)
                test_method("connect", nil)
                test_method("CONNECT", nil)

                -- All requests scheduled, check just in case the scheduler beat us every time.
                -- That said, the way GLuaTest runs tests should make this impossible.
                on_request_done()
            end
        },
        {
            name = "system.HTTPDisabled trick works",
            func = function()
                expect(HTTP({})).to.beTrue()
            end
        },
        {
            name = "Missing HTTPRequest throws error",
            func = function()
                expect(HTTP).to.err()
            end
        },
        {
            name = "Unset URL calls failure handler",
            async = true,
            timeout = 1,
            func = function()
                HTTP({
                    failed = function(err)
                        expect(err).to.equal("invalid url or GET parameters")
                        done()
                    end,
                })
            end
        },
    }
}
