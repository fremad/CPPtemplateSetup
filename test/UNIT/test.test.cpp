#include "../../Include/Catch.hpp"

unsigned int check( unsigned int number ) {
    return 3;
}

TEST_CASE( "Check is computed", "[check]" ) {
    REQUIRE( check(1) == 3 );
}