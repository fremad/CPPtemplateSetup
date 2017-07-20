#include "../../Include/Catch.hpp"

unsigned int jump( unsigned int number ) {
    return 3;
}

TEST_CASE( "Check is computed", "[check]" ) {
    REQUIRE( jump(1) == 3 );
}