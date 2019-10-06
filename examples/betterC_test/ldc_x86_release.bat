call msvcEnv.bat
"%HOMEDRIVE%\ldc2\bin\dub.exe" --compiler=ldc2 --arch=x86 --force --combined --build=release_sample --config=betterC_test1 --override-config=npp_api/betterC_library
"%HOMEDRIVE%\ldc2\bin\dub.exe" --compiler=ldc2 --arch=x86 --force --combined --build=release_sample --config=betterC_test2 --override-config=npp_api/betterC_library
move /Y ".\plugins\betterC_test1\betterC_test1.dll" ".\plugins\betterC_test1\ldc_betterC_test1_x86.dll"
move /Y ".\plugins\betterC_test2\betterC_test2.dll" ".\plugins\betterC_test2\ldc_betterC_test2_x86.dll"
