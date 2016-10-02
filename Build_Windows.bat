set "PATH=C:\Program Files (x86)\MSBuild\14.0\Bin\;C:\Program Files\CMake\bin;%PATH%"

mkdir build.x86_64
mkdir build.x86

cd build.x86_64

REM cmake ../llvm -G "Visual Studio 14 Win64" -DCMAKE_BUILD_TYPE=Release -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_GO_TESTS=OFF -DLLVM_INCLUDE_DOCS=OFF
msbuild tools/clang/tools/libclang/libclang.vcxproj /p:Configuration=Release;Platform=x64 /m:2

cd ..

cd build.x86

REM cmake ../llvm -G "Visual Studio 14" -DCMAKE_BUILD_TYPE=Release -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_GO_TESTS=OFF -DLLVM_INCLUDE_DOCS=OFF 
msbuild tools/clang/tools/libclang/libclang.vcxproj /p:Configuration=Release;Platform=Win32 /m:2 

cd ..

mkdir Binaries
cd Binaries
mkdir windows_x86
mkdir windows_x64
cd ..

copy "build.x86\Release\bin\libclang.dll" "Binaries\windows_x86\libclang.dll"
copy "build.x86\Release\lib\libclang.lib" "Binaries\windows_x86\libclang.lib"
copy "build.x86_64\Release\bin\libclang.dll" "Binaries\windows_x64\libclang.dll"
copy "build.x86_64\Release\lib\libclang.lib" "Binaries\windows_x64\libclang.lib"