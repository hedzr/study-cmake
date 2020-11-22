#!/usr/bin/env bash

set -e; [[ $DEBUG -ne 0 ]] && set -x


BUILD_DIR='build/'

cmake-init() {
	[ -d $BUILD_DIR ] || mkdir -p $BUILD_DIR
	cmake -S . -B $BUILD_DIR $*
}
cmake-build(){ cmake --build $BUILD_DIR $*;}
cmake-clean(){ cmake-build --target clean; }
cmake-install(){ cmake-build --target install; }
cmake-uninstall(){
	[ -f ${BUILD_DIR}install_manifest.txt ] && xargs rm < ${BUILD_DIR}install_manifest.txt
}
cmake-sudo-uninstall(){
	[ -f ${BUILD_DIR}install_manifest.txt ] && {
		# cat ${BUILD_DIR}install_manifest.txt | sudo xargs rm
		cat ${BUILD_DIR}install_manifest.txt | xargs -L1 dirname | sudo xargs rmdir -p
	}
}

cmake-ll-modules-dir(){
	ls -laG /Applications/CLion.app/Contents/bin/cmake/mac/share/cmake-*/Modules
}
cmake-ls-modules-dir(){
	ls -G /Applications/CLion.app/Contents/bin/cmake/mac/share/cmake-*/Modules
}




usage(){
	cat <<EOF
Usage: $(basename $0) command ...
Command:
  init              Make new directory 'build/' and generate the building makefiles from CMakeLists.txt
  build             Do building from the generated makefiles
  install           Do make install
  uninstall         Do make uninstall
  sudo-uninstall    Do sudo make uninstall
EOF
}
main-entry(){
	local cmd=$1 && shift
	eval "cmake-$cmd" "$@"
}

[ $# -eq 0 ] && usage || main-entry "$@"