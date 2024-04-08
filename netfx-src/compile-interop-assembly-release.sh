#!/bin/bash

scriptdir=`dirname "$BASH_SOURCE"`
extradefs="$@"
archname=$ARCHNAME

if [[ "$archname" == "" ]]; then
  archname=$(uname -m)
fi

if [[ "$archname" == "386" ]]; then
  archname=x86
elif [[ "$archname" == "amd64" ]]; then
  archname=x64
elif [[ "$archname" == "arm/v7" ]]; then
  archname=armv7
elif [[ "$archname" == "arm/v5" ]]; then
  archname=armv5
elif [[ "$archname" == "arm64/v8" ]]; then
  archname=arm64
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  libname=libSQLite.Interop.dylib
  osname=macos
else
  libname=libSQLite.Interop.so
  osname=linux
fi
echo "Building $libname for $osname-$archname"

pushd "$scriptdir/SQLite.Interop/generic"
gcc -g -fPIC -shared $gccflags -o $libname interop.c -I../core -DSQLITE_THREADSAFE=1 -DSQLITE_USE_URI=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_ENABLE_STAT4=1 -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_LOAD_EXTENSION=1 -DSQLITE_ENABLE_RTREE=1 -DSQLITE_SOUNDEX=1 -DSQLITE_ENABLE_MEMORY_MANAGEMENT=1 -DSQLITE_ENABLE_API_ARMOR=1 -DSQLITE_ENABLE_DBSTAT_VTAB=1 -DSQLITE_ENABLE_STMTVTAB=1 -DSQLITE_ENABLE_UPDATE_DELETE_LIMIT=1 -DINTEROP_TEST_EXTENSION=1 -DINTEROP_EXTENSION_FUNCTIONS=1 -DINTEROP_VIRTUAL_TABLE=1 -DINTEROP_FTS5_EXTENSION=1 -DINTEROP_PERCENTILE_EXTENSION=1 -DINTEROP_TOTYPE_EXTENSION=1 -DINTEROP_REGEXP_EXTENSION=1 -DINTEROP_JSON1_EXTENSION=1 -DINTEROP_SHA1_EXTENSION=1 -DINTEROP_SHA3_EXTENSION=1 -DINTEROP_SESSION_EXTENSION=1 $extradefs -lm -lpthread -ldl
mkdir -p ../../../bin/$osname-$archname
cp $libname ../../../bin/$osname-$archname/SQLite.Interop.dll
mv $libname ../../../bin/$osname-$archname/
popd
