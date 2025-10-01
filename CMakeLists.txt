cmake_minimum_required(VERSION 3.28)

project(FortranTemplate VERSION 0.1
        DESCRIPTION "My Fortran program"
        LANGUAGES Fortran) # Add CXX C if necessary

enable_language(Fortran)


add_subdirectory(src)
add_subdirectory(app)
add_subdirectory(test)
