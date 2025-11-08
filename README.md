# GMod Test Suite

<p align="left">
    <a href="https://discord.gg/5JUqZjzmYJ" alt="Discord Invite"><img src="https://img.shields.io/discord/981394195812085770?label=Collaborate&logo=discord&logoColor=white" /></a>
</p>

This is a community driven best-effort initiative to create a suite of automated tests for all basic Garry's Mod functionality.

Here are some of our primary goals with this project:
- Help catch GLua regressions as soon as a branch is updated.
- Help contributors in the [official Garry's Mod repo](https://github.com/Facepunch/garrysmod) increase confidence in their PRs
- Improve the Wiki with knowledge gained from writing tests

You can keep an eye on our progress _(or find somewhere to jump in and contribute!)_ in our [Issues Tab](https://github.com/CFC-Servers/gmod_tests/issues)

**Special Note:**
- This project automatically runs the test suite on every change to any gmod branch. It also reports any failures to our [Dev Discord](https://discord.gg/5JUqZjzmYJ).
- This means that if any new Gmod changes break the tests, we will be notified immediately. This is a great way to catch regressions in Gmod as a whole, and it only gets more useful as we build out our test suite.

This project uses [GLuaTest](https://github.com/CFC-Servers/GLuaTest) to run the test suite.
A secondary goal is actually to improve GLuaTest based on our experiences writing tests here. Please don't be shy about asking for new features or complaining about GLuaTest!
    
<p align="left">
    <a href="https://github.com/CFC-Servers/gmod_tests/actions/workflows/branch_tests.yml" alt="Tests Status"><img src="https://img.shields.io/github/actions/workflow/status/CFC-Servers/gmod_tests/branch_tests.yml?event=schedule&style=for-the-badge&label=GLuaTest" /></a>
</p>

## Contributing
Anyone can contribute test cases!

### Setup
- Clone this repository into your `addons/` dir
- Clone [GLuaTest](https://github.com/CFC-Servers/GLuaTest) into your `addons/` dir
- Restart your local server
- (Optional LuaLS improvements):
  - If you store GLuaTest somewhere other than your `addons/` dir (along side `gmod_tests`), you can set the `GLUATEST_PATH=` environment variable
  - If you clone the [glua-api-snippets](https://github.com/luttje/glua-api-snippets/tree/lua-language-server-addon) repo, you can set the `GLUA_SNIPPETS_PATH=` environment variable to make gmod typing work in this project

Now you can add your test suites or make changes to existing ones.

Simply run `gluatest_run_tests` in the server console to run the test suite. This works even if you add new files.

### Test structure
All unit tests _(the primary type of test you'll probably be writing)_ go in the `lua/tests/gmod/unit/` dir.

It's scoped into three Sections right now:
- Globals _(All global Functions)_
- Classes _(Tests for each Class type like `Entity`, `PhysObj`, `IMesh`, etc.)_
- Libraries _(Tests for all libraries, like `bit`, `ents`, etc.)_

Inside each Section, we create new directories for each sub-object.

For example, if you were going to write tests for the [`File`](https://gmodwiki.com/file_class) class, you would:
- Create a new file: `lua/tests/gmod/classes/file/File.lua` and begin writing the meta-level tests for this class
- Decide if all Class tests can go in a single file.
  - If so, write them all in `lua/tests/gmod/classes/file/File.lua`
  - If not, we'll make new files for each method or "sets" of methods:
    - `lua/tests/gmod/classes/file/Close.lua`
    - `lua/tests/gmod/classes/file/EndOfFile.lua`
    - `lua/tests/gmod/classes/file/Flush.lua`

In general, we want to keep each test file from getting _way too big_. Given that most methods you test will require 3-5 tests for the "success" cases and at least 1 test for the "failure" case, these can get big quickly.

Definitely read some existing tests to get an idea of how to structure your tests.

Note: Be sure to annotate any new files with the GLuaTest type header:
```lua
--- @type GLuaTest_TestGroup
return {
    -- your test stuff in here
}
```


### Submitting changes
Once you've added/changed the tests you'd like, simply make a PR. The tests will automatically run inside the PR.
