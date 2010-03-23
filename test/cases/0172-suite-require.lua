-- 0172-suite-require.lua: test for suite
-- This file is a part of lua-nucleo library
-- Copyright (c) lua-nucleo authors (see file `COPYRIGHT` for the license)

local make_suite = assert(loadfile('test/test-lib/init/no-strict.lua'))(...)

local ensure_error_with_substring
      = import 'lua-nucleo/ensure.lua'
      {
        'ensure_error_with_substring'
      }

do
local test = make_suite("test_require", { })

test "require" (function()
  require('wrong_require')
end)

  ensure_error_with_substring(
      "require('wrong_require')",
      "Suite `test_require' failed:\n"
   .. " %* Test `require': (.-): module 'wrong_require' not found:\n(.-)",
      test:run()
    )
  print("ABOVE FAIL WAS EXPECTED")
end
