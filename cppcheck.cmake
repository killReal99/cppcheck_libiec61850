# additional target to perform cppcheck run, requires cppcheck

find_program(CMAKE_CXX_CPPCHECK NAMES cppcheck)

file(GLOB_RECURSE ALL_SOURCE_FILES *.cpp *.h)

add_custom_target(
        cppcheck
        COMMAND /usr/bin/cppcheck
#        --check-config need more research
        --check-library
        --enable=all
        --force
        --inconclusive
        --max-ctu-depth=5 #need research
        --xml
        --xml-version=2
        --template="[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)"
        ${ALL_SOURCE_FILES}
        2> cppcheck-result.xml
)
