# HELP

## Simple way

To build libs::sm-lib and app-auto at once:

```bash
cd z11-m1/
cmake -B build/
cmake --build build/
```


## Second way

1. build `libs::sm-lib` at first

```bash
cd z11-m1/
# preparing the building scripts
cmake -S libs/sm-lib -B libs/sm-lib/build
# make building
cmake --build libs/sm-lib/build
# make installing
cmake --build libs/sm-lib/build --target install
```

2. build `app` now

After `libs::sm-lib` built and installed, you can build `app`:

```bash
cd z11-m1/
cmake -S app/ -B app/build/
cmake --build app/build/
```

3. uninstall `libs::sm-lib`

Once sm-lib installed, these files will be present:

```bash
Install the project...
-- Install configuration: ""
-- Installing: /usr/local/lib/libsm-lib.a
-- Installing: /usr/local/lib/cmake/sm-lib/sm-libTargets.cmake
-- Installing: /usr/local/lib/cmake/sm-lib/sm-libTargets-noconfig.cmake
-- Installing: /usr/local/include/sm-lib
-- Installing: /usr/local/include/sm-lib/sm-lib.hh
-- Installing: /usr/local/lib/cmake/sm-lib/sm-libConfig.cmake
```

So we can remove them by:

```bash
# uninstall sm-lib
xargs rm < libs/sm-lib/build/install_manifest.txt
```



