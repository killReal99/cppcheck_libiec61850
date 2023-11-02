# additional target to perform cppcheck run, requires cppcheck

find_program(CMAKE_CXX_CPPCHECK NAMES cppcheck)

add_custom_target(
        cppcheck
        COMMAND /usr/bin/cppcheck
        --language=c++
        --enable=all
        --template="[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)"
        ${ALL_SOURCE_FILES}
        2> cppcheck-result.xml
)
