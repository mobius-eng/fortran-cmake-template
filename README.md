# fortran-cmake-template

Template for Fortran project using CMake

## How to use it

1. Clone the repository
2. Change LICENSE (BSD license is used for the template only)
3. Add modules to `src/` -- these will compile to a static library
4. Change code in `app/` -- this will be linked against the library
5. Change code in `test/` -- this will be linked against the library
6. Add other apps or tests or libs if necessary

CMake presets are set to compile with Intel IFX compiler -- change if necessary. Two presets are defined, `debug` and `release`.

The template is meant to be used with VSCode+Modern Fortran extension. `.vscode` directory contains `launch.json` with settings necessary for debugging
`app` and `test` applications.