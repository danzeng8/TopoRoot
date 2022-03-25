SET(MESH_SOURCES
  mesh_align.cc
  mesh_cat.cc
  mesh_cc.cc
  mesh_check.cc
  mesh_crunch.cc
  mesh_filter.cc
  mesh_hf.cc
  mesh_info.cc
  mesh_make.cc
  mesh_shade.cc
  mesh_view.cc
  xf.cc
  )

foreach(mesh_file ${MESH_SOURCES})
  get_filename_component(exe_name ${mesh_file} NAME_WE)
  add_executable(${exe_name} ${mesh_file})
  target_link_libraries(${exe_name} trimesh ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES})
endforeach(mesh_file ${MESH_SOURCES})
 include_directories(C:\Users\Yiwen Ju\source\Trimesh_Cmake\Trimesh2-master\include)