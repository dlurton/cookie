cmake_minimum_required(VERSION 3.6)
project(cookie)

set(CMAKE_CXX_STANDARD 14)

set(ANTLR_JAR_LOCATION ${CMAKE_SOURCE_DIR}/antlr4/antlr-4.6-complete.jar)

set(GENERATED_SOURCE_FILES
		${CMAKE_SOURCE_DIR}/src/generated/HelloBaseListener.h
		${CMAKE_SOURCE_DIR}/src/generated/HelloBaseListener.cpp
		${CMAKE_SOURCE_DIR}/src/generated/HelloBaseVisitor.cpp
		${CMAKE_SOURCE_DIR}/src/generated/HelloVisitor.h
		${CMAKE_SOURCE_DIR}/src/generated/HelloVisitor.cpp
		${CMAKE_SOURCE_DIR}/src/generated/HelloLexer.h
		${CMAKE_SOURCE_DIR}/src/generated/HelloLexer.cpp
		${CMAKE_SOURCE_DIR}/src/generated/HelloListener.h
		${CMAKE_SOURCE_DIR}/src/generated/HelloListener.cpp
		${CMAKE_SOURCE_DIR}/src/generated/HelloParser.h
		${CMAKE_SOURCE_DIR}/src/generated/HelloParser.cpp
)

foreach( src_file ${GENERATED_SOURCE_FILES} )
	set_source_files_properties(${src_file} PROPERTIES GENERATED TRUE)
	set_source_files_properties(${src_file} PROPERTIES COMPILE_FLAGS -Wno-overloaded-virtual)
	set_source_files_properties(${src_file} PROPERTIES COMPILE_FLAGS -Wno-attributes)
endforeach(src_file ${GENERATED_SOURCE_FILES})
add_custom_command(
		COMMAND	"java" -jar ${ANTLR_JAR_LOCATION} -Werror -Dlanguage=Cpp -listener -visitor -o ${CMAKE_SOURCE_DIR}/src/generated/ -package CookieParser ${CMAKE_SOURCE_DIR}/src/Hello.g4
		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
		DEPENDS ${CMAKE_SOURCE_DIR}/src/Hello.g4
		OUTPUT ${GENERATED_SOURCE_FILES}
)

set(SOURCE_FILES src/main.cpp ${GENERATED_SOURCE_FILES})

add_executable(cookie ${cookie-generated-src} ${SOURCE_FILES})

target_link_libraries(cookie antlr4-runtime)

link_libraries(antlr4/run/usr/local/lib)
include_directories(antlr4/run/usr/local/include/antlr4-runtime)





