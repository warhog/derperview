add_executable(${CMAKE_PROJECT_NAME} Main.cpp Process.cpp Video.cpp Resource.rc)

if (MSVC)
    target_link_libraries(${CMAKE_PROJECT_NAME} ${LIBAVUTIL} ${LIBAVCODEC} ${LIBAVFORMAT})
else()
    target_link_libraries(${CMAKE_PROJECT_NAME} Threads::Threads ${LIBAVUTIL} ${LIBAVCODEC} ${LIBAVFORMAT})
endif()

install(TARGETS ${CMAKE_PROJECT_NAME} DESTINATION bin)

