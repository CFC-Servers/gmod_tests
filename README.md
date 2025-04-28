# GMod Test Suite

This is a community driven best-effort initiative to create a suite of automated tests for all basic Garry's Mod functionality.

Here are some of our primary goals with this project:
- Help catch GLua regressions as soon as an update is released.
- Help contributors in the [official Garry's Mod repo](https://github.com/Facepunch/garrysmod) increase confidence in their PRs
- Improve the Wiki with knowledge gained from writing tests

You can keep an eye on our progress _(or find somewhere to jump in and contribute!)_ in our [Issues Tab](https://github.com/CFC-Servers/gmod_tests/issues)

This project uses [GLuaTest](https://github.com/CFC-Servers/GLuaTest) to run the test suite.
A secondary goal is actually to improve GLuaTest based on our experiences writing tests here. Please don't be shy about asking for new features or complaining about GLuaTest!
    
<p align="left">
    <a href="https://github.com/CFC-Servers/gmod_tests/actions/workflows/run_tests.yml" alt="GLuaTest Status"><img src="https://img.shields.io/github/actions/workflow/status/CFC-Servers/gmod_tests/run_tests.yml?event=push&style=for-the-badge&label=GLuaTest" /></a>
</p>

## Contributing
Anyone can contribute test cases!

### Setup
- Clone this repository into your `addons/` dir
- Clone [GLuaTest](https://github.com/CFC-Servers/GLuaTest) into your `addons/` dir

Now you can add your test suites or make changes to existing ones.

Simply run `gluatest_run_tests` in the server console to run the test suite. This works even if you add new files.


### Test structure
All tests go in the `lua/tests/gmod/` dir.

It's scoped into three Sections right now:
- Globals _(All global Functions)_
- Classes _(Tests for each Class type like `Entity`, `PhysObj`, `IMesh`, etc.)_
- Libraries _(Tests for all libraries, like `bit`, `ents`, etc.)_

Inside each Section, we create new directories for each sub-object.

For example, if you were going to write tests for the [`File`](https://gmodwiki.com/file_class) class, you would:
- Create a new file: `lua/tests/gmod/classes/file/file.lua` and begin writing the meta-level tests for this class
- Decide if all Class tests can go in a single file.
  - If so, write them all in `lua/tests/gmod/classes/file/file.lua`
  - If not, we'll make new files for each method or "sets" of methods:
    - `lua/tests/gmod/classes/file/close.lua`
    - `lua/tests/gmod/classes/file/endoffile.lua`
    - `lua/tests/gmod/classes/file/flush.lua`

In general, we want to keep each test file from getting _way too big_. Given that most methods you test will require 3-5 tests for the "success" cases and at least 1 test for the "failure" case, these can get big quickly.


### Submitting changes
Once you've added/changed the tests you'd like, simply make a PR. The tests will automatically run inside the PR.
