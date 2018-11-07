@echo off
set srsbasename=%~n1
if exist %srsbasename%.exe del %srsbasename%.exe
D:\BIN\SweetRust.exe %srsbasename%.srs >%srsbasename%_srs.rs
D:\Rust\cargo\bin\rustc.exe %2 %3 %4 %srsbasename%_srs.rs -o %srsbasename%.exe
if exist %srsbasename%.exe %srsbasename%.exe
set srsbasename=
