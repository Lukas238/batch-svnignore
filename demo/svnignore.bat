@echo off
setlocal enableextensions enabledelayedexpansion

SET currentPath=%cd%
SET PATH_LIST=
cls

@ECHO =======================================================
@ECHO        Automatic add ignore paths/files to SVN
@ECHO =======================================================

@ECHO:
@ECHO Searching for .svnignore config files.

SET /A COUNT=0
for /r . %%g in (*.svnignore) do (
  setlocal EnableDelayedExpansion
  SET PATH_LIST=!PATH_LIST! %%g
  SET /A COUNT+=1
)
SLEEP 1
@ECHO:
@ECHO ^> !COUNT! files found!
@ECHO:
  

REM SET /A COUNT=0
REM for /f %%f in ('dir /b /d .svnignore') do (
REM 	echo %%f
REM 	SET PATH_LIST=!PATH_LIST! %%f
REM 	SET /A COUNT+=1
REM )


@ECHO:
@ECHO Updating SVN global-ignores property:
@ECHO:

SET /A COUNT=1
@ECHO -------------------------------------------------------
for %%f in (!PATH_LIST!) do (
	@ECHO !COUNT! ^| %%f
	@ECHO:
	cd /D %%~dpf
	svn propset svn:global-ignores -R -F .svnignore .
	@ECHO -------------------------------------------------------
	
	SET /A COUNT+=1
)
@ECHO:


cd /D %currentPath%

@ECHO:
@ECHO All done.
@ECHO:

pause
