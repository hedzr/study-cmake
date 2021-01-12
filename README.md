# study-cmake

## Build

```bash
# generate the building config
cmake -B build/
# build the whole project (with unittest too)
cmake --build build/
```

### for MinGW

```bash
cmake -G "MinGW Makefiles" -B build
cmake --build build
```

> With GitHub Action MinGW tester, the building error might be threw: 'multiple definitions' on std::string and so on.
> But it can't be reproduced on a local copy.

### for MSVC

For a full building, zlib pkg need to be installed manually.

## See also

In chinese: https://hedzr.github.io/tags/#cmake-hello

## LICENSE

MIT
