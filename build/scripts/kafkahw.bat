@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  kafkahw startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and KAFKAHW_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-server" "-XX:+UseG1GC" "-Djava.awt.headless=true" "-Xms4G" "-Xmx4G"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\kafkahw-1.0-SNAPSHOT.jar;%APP_HOME%\lib\kafka_2.12-2.8.1.jar;%APP_HOME%\lib\jcommander-1.81.jar;%APP_HOME%\lib\kafka-raft-2.8.1.jar;%APP_HOME%\lib\kafka-metadata-2.8.1.jar;%APP_HOME%\lib\kafka-clients-2.8.1.jar;%APP_HOME%\lib\argparse4j-0.7.0.jar;%APP_HOME%\lib\jackson-module-scala_2.12-2.10.5.jar;%APP_HOME%\lib\jackson-dataformat-csv-2.10.5.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.10.5.jar;%APP_HOME%\lib\jackson-module-paranamer-2.10.5.jar;%APP_HOME%\lib\jackson-databind-2.10.5.1.jar;%APP_HOME%\lib\jopt-simple-5.0.4.jar;%APP_HOME%\lib\metrics-core-2.2.0.jar;%APP_HOME%\lib\scala-collection-compat_2.12-2.3.0.jar;%APP_HOME%\lib\scala-java8-compat_2.12-0.9.1.jar;%APP_HOME%\lib\scala-logging_2.12-3.9.2.jar;%APP_HOME%\lib\scala-reflect-2.12.13.jar;%APP_HOME%\lib\scala-library-2.12.13.jar;%APP_HOME%\lib\zookeeper-3.5.9.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\commons-cli-1.4.jar;%APP_HOME%\lib\zstd-jni-1.4.9-1.jar;%APP_HOME%\lib\lz4-java-1.7.1.jar;%APP_HOME%\lib\snappy-java-1.1.8.1.jar;%APP_HOME%\lib\jackson-annotations-2.10.5.jar;%APP_HOME%\lib\jackson-core-2.10.5.jar;%APP_HOME%\lib\zookeeper-jute-3.5.9.jar;%APP_HOME%\lib\audience-annotations-0.5.0.jar;%APP_HOME%\lib\netty-handler-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.50.Final.jar;%APP_HOME%\lib\paranamer-2.8.jar;%APP_HOME%\lib\netty-codec-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-4.1.50.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.50.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.50.Final.jar;%APP_HOME%\lib\netty-common-4.1.50.Final.jar


@rem Execute kafkahw
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %KAFKAHW_OPTS%  -classpath "%CLASSPATH%" org.example.kafkahw %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable KAFKAHW_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%KAFKAHW_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
