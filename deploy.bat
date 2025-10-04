@echo off

rem H is the destination game folder
rem GAMEDIR is the name of the mod folder (usually the mod name)
rem GAMEDATA is the name of the local GameData
rem VERSIONFILE is the name of the version file, usually the same as GAMEDATA,
rem    but not always

set H=%KSPDIR%

set GAMEDIR=B9_Aerospace_ProceduralWings
set GAMEDATA="GameData"
set VERSIONFILE=%GAMEDIR%.version

set DP0=r:\dp0\kspdev

rem --- Asegurarse de que Plugins sea una carpeta ---
if exist %GAMEDATA%\%GAMEDIR%\Plugins (
    if not exist %GAMEDATA%\%GAMEDIR%\Plugins\ (
        rem Si Plugins existe pero no es carpeta, eliminar archivo
        del %GAMEDATA%\%GAMEDIR%\Plugins
        mkdir %GAMEDATA%\%GAMEDIR%\Plugins
    )
) else (
    mkdir %GAMEDATA%\%GAMEDIR%\Plugins
)

rem --- Copiar DLL y PDB a Plugins ---
copy /Y "%1%2" "%GAMEDATA%\%GAMEDIR%\Plugins\"
copy /Y "%1%3.pdb" "%GAMEDATA%\%GAMEDIR%\Plugins\"

rem --- Copiar archivo de versión ---
copy /Y %VERSIONFILE% %GAMEDATA%\%GAMEDIR%

rem --- Copiar todo al juego y a DP0 ---
xcopy /y /s /I %GAMEDATA%\%GAMEDIR% "%H%\GameData\%GAMEDIR%"
xcopy /y /s /I %GAMEDATA%\%GAMEDIR% "%DP0%\GameData\%GAMEDIR%"

rem pause
