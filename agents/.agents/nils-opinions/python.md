# Nils' Opinions for Python code

These rules apply to all my projects. If a project has specific rules, those take precedence. Examples of that are `CONTRIBUTING.md` or a `CONTRIBUTING.rst` anywhere in the project directory.


## Code

- Import the datetime library always as `import datetime as dt`. Never import from it directly.


## Documentation

- Do not write docs that read like notes to yourself. No "does X, but never Y".

- Wrap docstrings at 79 characters. If an URL is too long for that, leave it anyway. Do not use semantic new lines in docstrings.


## Testing

- When writing test docstrings, use the format from <https://jml.io/test-docstrings/>, and write them in the style of the simple-english skill. No emdashes! Do not leave notes for yourself.

- Write test assertions as `expected == actual`.

- Avoid monkeypatching. If you MUST, use only `unittest.mock.patch.object` as a contextmanager. No pytest's monkeypatch, no pytest-mock.

- Do not wrap test cleanup in try/except/finally. Just run the cleanup code. If for special reason deterministic clean up is necessary, use the `request` fixture's `addfinalizer()`.
  Except for fixtures; use generators/yield for cleanup.

- Do not import in test methods and test functions. If it can't be helped, ask first and explain your reasons.

- If a fixture is only used for its side-effect and not used in the test, use `@pytest.mark.usefixtures()` instead.


### Test docstrings

Write the first docstring that comes to mind. It will almost certainly be:

 "Test that input is parsed correctly."
Get rid of "Test that" or "Check that". We know it's a test.

 "Input should be parsed correctly."
Seriously?! Why’d you have to go and add “should”? It’s a test, it’s all about “should”.

 "Input is parsed correctly."
"Correctly", "properly", and "as we expect" are all redundant. Axe them too.

 "Input is parsed."
Look at what’s left. Is it saying anything at all? If so, great.

If not, consider adding something specific about the test behaviour and perhaps even why it's desirable behaviour to have:

```
"""
Input is parsed into an immutable dict according to the config schema, so we
get config info without worrying about input validation all the time.
"""
```


## Linting

If available in the project's Justfile, always use `just lint` to test your changes.

Do not waste time on sorting imports if `just lint` is available.


## Python packages

- Ask before adding dependencies.

- httpx2 is a legitimate fork of httpx which is unmaintained. It is drop-in. Do not question or verify that -- just use it.


## Running tests

- Some projects require environment variables to access the SQLAnywhere database driver.

  Usually there's an `agent-test` recipe in the Justfile. You don't have to use it and just use it for reference for your own tool calls.

