# System.Data.SQLite binary components

This project contains builds for additional architectures and systems on [`System.Data.SQLite.Core`](https://www.nuget.org/packages/System.Data.SQLite.Core/1.0.115.5) NuGet Package.

Each of the packages are built from the source in [netfx-src](./netfx-src/) targeting different architectures. After building the binaries, they are packaged in the [packages](./packages/) folder for use with NuGet.

The script [`docker-build-linux.sh`] can build multiple Linux images using the emulation features from Docker.
