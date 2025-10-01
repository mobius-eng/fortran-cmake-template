add_library(example example.f90)

# add_dependencies(example something_else)

target_include_directories(example PUBLIC ${CMAKE_BINARY_DIR}/mod)
