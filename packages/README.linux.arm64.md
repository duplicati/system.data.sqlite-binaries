# System.Data.SQLite.Core.Duplicati.linux.arm64

This package contains the SQLite binaries required to use [System.Data.SQLite.Core](https://www.nuget.org/packages/System.Data.SQLite.Core/) on a Linux platform with the Arm64 CPU architecture.

Add this package to your project and the build process will include the binary in the output build.

Note, this package does not work with [System.Data.SQLite.Core](https://www.nuget.org/packages/System.Data.SQLite.Core/) after version `1.0.115.0` as it mangles the names of the entry points in the native library.
