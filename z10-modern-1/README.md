# z10-modern-1

## Prerequisites

### OpenCV

#### macOS

```bash
brew install opencv
```

#### Ubuntu, Debian

```bash
sudo apt install libopencv-dev
```


## Build

```bash

cd my-library
cmake -S . -B build/
cmake --build build/
cmake --build build/ -target install

cd ../app
cmake -S . -B build/
cmake --build build/

cd ..

```