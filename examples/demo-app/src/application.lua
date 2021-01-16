------------------------------
-- Sample App : Main
------------------------------

-- We're going to load the main file on 'demo-library' as 'Sample'
-- As we've defined our library as '@my-user/my-library' on project.json
-- We can use that name here before the ':' to indicate which library to search the module 'main' on
local Sample = require('@my-user/my-library:main')

-- Call the function bar() from our library and print its results
print(Sample.barbaz())

-- Call the function bar() from our library and print its results
print(Sample.bar())

-- Call the function foo() from our library and print its results
-- Note that this line will not work, as foo() is a local function
print(Sample.foo())