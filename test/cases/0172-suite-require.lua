-- 0172-suite-require.lua: test for suite
-- This file is a part of lua-nucleo library
-- Copyright (c) lua-nucleo authors (see file `COPYRIGHT` for the license)

local make_suite = assert(loadfile('test/test-lib/init/no-strict.lua'))(...)

-- This file tests the suite ability to work while failed on tests
-- with strict file disabled.

local ensure_error_with_substring
      = import 'lua-nucleo/ensure.lua'
      {
        'ensure_error_with_substring'
      }

do
local test = make_suite("test_failed", { })

test "error" (function()
  error('Expected error')
end)

  ensure_error_with_substring(
      "require('wrong_require')",
      "Suite `test_failed' failed:\n"
   .. " %* Test `error': (.-): Expected error\n(.-)",
      test:run()
    )
  print("ABOVE FAIL WAS EXPECTED")
end
