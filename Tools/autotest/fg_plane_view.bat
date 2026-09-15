@echo off

REM === 设置你的 autotest 目录 ===
set AUTOTESTDIR="%~dp0\aircraft"

REM === 自动从 D 盘搜索 FlightGear 3.x.x 目录 ===
FOR /F "delims=" %%D in ('dir "D:\FlightGear*" /b /ad') DO set FGDIR=%%D

echo Using FlightGear "%FGDIR%"

REM === 切换到 FG 的 bin 目录（注意：必须是 D 盘，而不是 C:\Program Files） ===
cd /d "D:\%FGDIR%\bin"

REM === 启动 FlightGear（你的参数完全保留） ===
fgfs ^
    --native-fdm=socket,in,10,,5503,udp ^
    --fdm=external ^
    --aircraft=Rascal110-JSBSim ^
    --fg-aircraft=%AUTOTESTDIR% ^
    --airport=KSFO ^
    --geometry=650x550 ^
    --bpp=32 ^
    --disable-hud-3d ^
    --disable-horizon-effect ^
    --timeofday=noon ^
    --disable-sound ^
    --disable-fullscreen ^
    --disable-random-objects ^
    --disable-ai-models ^
    --fog-disable ^
    --disable-specular-highlight ^
    --disable-anti-alias-hud ^
    --wind=0@0

pause
