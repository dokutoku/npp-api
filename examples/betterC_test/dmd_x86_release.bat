call msvcEnv.bat
"%HOMEDRIVE%\D\dmd2\windows\bin\dub.exe" build --compiler=dmd --arch=x86_mscoff --force --combined --build=release_sample --config=betterC_test1 --override-config=npp-api/betterC_library
"%HOMEDRIVE%\D\dmd2\windows\bin\dub.exe" build --compiler=dmd --arch=x86_mscoff --force --combined --build=release_sample --config=betterC_test2 --override-config=npp-api/betterC_library
move /Y ".\plugins\betterC-test1\betterC-test1.dll" ".\plugins\betterC-test1\dmd_betterC-test1_x86.dll"
move /Y ".\plugins\betterC-test2\betterC-test2.dll" ".\plugins\betterC-test2\dmd_betterC-test2_x86.dll"
