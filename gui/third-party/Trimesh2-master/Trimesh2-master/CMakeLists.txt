project(trimesh CXX C)
cmake_minimum_required(VERSION 2.6.2)

find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)

if (__APPLE__)
  add_definitions(-DDARWIN)
endif(__APPLE__)

message("trimesh: ${trimesh_SOURCE_DIR}")
include_directories(
  ${trimesh_SOURCE_DIR}/include/GL
  ${trimesh_SOURCE_DIR}/include
  ${trimesh_SOURCE_DIR}
  )

add_subdirectory(lib)
add_subdirectory(gluit)
add_subdirectory(util)
