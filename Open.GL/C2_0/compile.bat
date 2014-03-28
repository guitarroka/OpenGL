::Some house cleaning:
@ECHO off

set projectName=test1

::Try compiling
g++ -c src\main.cpp -o obj\main.o -std=gnu++0x -Iinclude -g

::Check if compiler failed
IF %errorlevel%==0 (

	::Try linking
	g++ -o bin\test1.exe obj\main.o -Llib -lglew32s -lsfml-window-s -lsfml-system-s && (
		
		::If linked successfully
		ECHO Successfull! && ECHO Running: && ECHO.
		bin\%projectName%.exe

	) || (
	
		::If link failed
		ECHO.
		ECHO -----------------------
		ECHO --Linker Done Goofed!--
		ECHO -----------------------
		PAUSE
	)
) ELSE (

	::If compiler failed
	ECHO.
	ECHO -------------------------
	ECHO --Compiler Done Goofed!--
	ECHO -------------------------
	PAUSE
)

REM PAUSE