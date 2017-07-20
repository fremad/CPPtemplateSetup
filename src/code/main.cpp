#include <iostream>
#include "../includes/functions.hpp"
#include <pthread.h>
#include <boost/shared_ptr.hpp>


void* perform_work( void* argument )
{
  
  std::cout << "IT GOD DAMN WORKED!! \n";
 
  return NULL;
}

int main()
{ 
  
    pthread_t thread;
    
    pthread_create( &thread, NULL, perform_work, NULL );

    boost::shared_ptr<int> ptrToInt (new int(8));

    std::cout << "Hello "  <<  *ptrToInt << " world!\n" ;
    std::cout << "I changed\n";
    std::cout << hello() << "\n";
}