call msvcEnv.bat x64
"%HOMEDRIVE%\D\dmd2\windows\bin\dub.exe" --compiler=dmd --arch=x86_64 --force --combined --build=release_sample --config=betterC_test1 --override-config=npp_api/betterC_library
"%HOMEDRIVE%\D\dmd2\windows\bin\dub.exe" --compiler=dmd --arch=x86_64 --force --combined --build=release_sample --config=betterC_test2 --override-config=npp_api/betterC_library
move /Y ".\plugins\betterC_test1\betterC_test1.dll" ".\plugins\betterC_test1\dmd_betterC_test1_x64.dll"
move /Y ".\plugins\betterC_test2\betterC_test2.dll" ".\plugins\betterC_test2\dmd_betterC_test2_x64.dll"
