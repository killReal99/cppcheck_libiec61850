# additional target to perform cppcheck run, requires cppcheck

find_program(CMAKE_CXX_CPPCHECK NAMES cppcheck)

file(GLOB_RECURSE ALL_SOURCE_FILES *.cpp *.h)

add_custom_target(
        cppcheck
        COMMAND /usr/bin/cppcheck
        --enable=all
        --force
        --xml
        --xml-version=2
        --template="[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)"
        ${ALL_SOURCE_FILES}
        2> cppcheck-result.xml
)
