# HELP

After `libs::sm-lib` built and installed, you can build `app`:

```bash
cd z11-m1/
cmake -S libs/sm-lib -B libs/sm-lib/build
cmake --build libs/sm-lib/build
cmake --build libs/sm-lib/build --target install

cd z11-m1/
cmake -S app/ -B app/build/
cmake --build app/build/

# uninstall sm-lib
xargs rm < libs/sm-lib/build/install_manifest.txt
```

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




