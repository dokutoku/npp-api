call msvcEnv.bat x64
"%HOMEDRIVE%\ldc2\bin\dub.exe" build --compiler=ldc2 --arch=x86_64 --force --combined --build=release_sample --config=betterC_test1 --override-config=npp-api/betterC_library
"%HOMEDRIVE%\ldc2\bin\dub.exe" build --compiler=ldc2 --arch=x86_64 --force --combined --build=release_sample --config=betterC_test2 --override-config=npp-api/betterC_library
move /Y ".\plugins\betterC-test1\betterC-test1.dll" ".\plugins\betterC-test1\ldc_betterC-test1_x64.dll"
move /Y ".\plugins\betterC-test2\betterC-test2.dll" ".\plugins\betterC-test2\ldc_betterC-test2_x64.dll"
