# GMod Test Suite

This is a community driven effort to provide automated tests for all basic Garry's Mod functions.

This project uses [GLuaTest](https://github.com/CFC-Servers/GLuaTest) to run the test suite.

## Contributing
Anyone can contribute test cases!

### Setup
- Clone this repository into your `addons/` dir
- Clone [GLuaTest](https://github.com/CFC-Servers/GLuaTest) into your `addons/` dir

Now you can add your test suites or make changes to existing ones.

Simply run `gluatest_run_tests` in the server console to run the test suite. This works even if you add new files.


### Test structure
All tests go in the `lua/tests/` dir.

It's scoped into three Sections right now:
- Globals _(All global Functions)_
- Classes _(Tests for each Class type like `Entity`, `PhysObj`, `IMesh`, etc.)_
- Libraries _(Tests for all libraries, like `bit`, `ents`, etc.)_

Inside each Section, we create new directories for each sub-object.

For example, if you were going to write tests for the [`File`](https://gmodwiki.com/file_class) class, you would:
- Make a new directory: `lua/tests/classes/file/`
- Create a new file: `lua/tests/classes/file/file.lua` and begin writing the meta-level tests for this class
- Decide if all Class tests can go in a single file.
  - If so, write them all in `lua/tests/classes/file/file.lua`
  - If not, we'll make new files for each method or "sets" of methods:
    - `lua/tests/classes/file/close.lua`
    - `lua/tests/classes/file/endoffile.lua`
    - `lua/tests/classes/file/flush.lua`

In general, we want to keep each test file from getting _way too big_. Given that most methods you test will require 3-5 tests for the "success" cases and at least 1 test for the "failure" case, these can get big quickly.


### Submitting changes
Once you've added/changed the tests you'd like, simply make a PR. The tests will automatically run inside the PR.
