# Cookie

At the moment, cookie is the simplest and most basic proof that I can generate C++ code from an antlr4 grammar
with cmake.  One day it may be something else.  (And one day it may have a new name.)

## To Build

You'll need cmake 3.6 or later, C++14 compliant gcc, and java in your path.  Then, simply execute `./build-cookie`.

After building, the main executable will reside at `./build/cookie`

The `build-cookie` script will detect if antlr4 runtime has been built previously and attempt to build it for you.
Then, it will build cookie.

After this, you can open your favorite IDE and code away happily forever and ever.

## Notes

- The antlr4 cpp runtime needed to be modified as per this [issue](https://github.com/antlr/antlr4/issues/1608).
- The antlr4 .jar and src .zip files were obtained from this [page](http://www.antlr.org/download.html) on the antlr 
web site.






 