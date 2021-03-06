#!/usr/bin/env sh

#See http://xmlgraphics.apache.org/batik/tools/font-converter.html

#Internal variables
_thisDir=`dirname "$0"`
_libDir=$( cd "$_thisDir/../lib"; pwd )
_batikDir="$_libDir/apache-batik-1.8"
_rhinoDir="$_libDir/rhino-1.7R4"
_bsf24Dir="$_libDir/apache-commons-bsf-2.4.0/lib"
_commonsLoggingDir="$_libDir/apache-commons-logging-1.1.3"

#Check setup
if [ ! `which java 2> /dev/null` ]; then
  echo "Error: Could not find java" > /dev/stderr
  return
fi
if [ ! -d "$_libDir" ]; then
  echo "Error: Could not find \"$_libDir\"" > /dev/stderr
  return
fi
if [ ! -d "$_batikDir" ] || [ ! -s "$_batikDir/batik-1.8.jar" ]; then
  echo "Error: Could not find \"$_batikDir/batik-1.8.jar\"" > /dev/stderr
  return
fi
if [ ! -d "$_batikDir" ] || [ ! -s "$_batikDir/batik-ttf2svg-1.8.jar" ]; then
  echo "Error: Could not find \"$_batikDir/batik-ttf2svg-1.8.jar\"" > /dev/stderr
  return
fi
if [ ! -d "$_rhinoDir" ] || [ ! -s "$_rhinoDir/js.jar" ]; then
  echo "Error: Could not find \"$_rhinoDir/js.jar\"" > /dev/stderr
  return
fi
if [ ! -d "$_bsf24Dir" ] || [ ! -s "$_bsf24Dir/bsf.jar" ]; then
  echo "Error: Could not find \"$_bsf24Dir/bsf.jar\"" > /dev/stderr
  return
fi
if [ ! -d "$_commonsLoggingDir" ] || [ ! -s "$_commonsLoggingDir/commons-logging-1.1.3.jar" ]; then
  echo "Error: Could not find \"$_commonsLoggingDir/commons-logging-1.1.3.jar\"" > /dev/stderr
  return
fi

#Execute batik-ttf2svg (TrueType Font to SVG converter)
#To do: Replace jar with main class and setup classpath
java \
  -jar "$_batikDir/batik-ttf2svg-1.8.jar" \
  "$@"
