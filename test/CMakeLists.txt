add_executable(test test.f90)

add_dependencies(test example)

# If macros are used:
# Ninja will preprocess macros before honoring dependencies
# Hence, need to specify directory for include files
# target_include_directories(app PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../example/)
target_link_libraries(test PRIVATE example)
# This is necessary if multiple languages are used, otherwise C/CXX linker may be used:
set_target_properties(test PROPERTIES LINKER_LANGUAGE Fortran)
