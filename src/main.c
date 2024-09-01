#include <stdio.h>
#include <time.h>
#include "../include/service.h"

// Main etry function for the program
int main()
{
    printf("Hello, World! This is a native C program compiled on the command line.\n");
    printf("Calling service...\n");

    time_t currentTime = time(NULL);
    if(currentTime != (time_t)(-1))
    {
        printf("The current time is %s\n", asctime(gmtime(&currentTime)));
    }
        
    // init the variable
    double result = 0.0;
    
    // Call the service
    result = execute(3.0, 3.0);

    // Display the service out
    printf("Execute result: %lf\n", result);

    return 0;
}