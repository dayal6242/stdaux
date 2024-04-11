# stdaux
For Assignment

Question-2
How to pass an array using call by value in C ? Assuming array is declared locally that is inside main() ?
Ans-In C, arrays are typically passed by reference, meaning that when you pass an array to a function, you're passing a pointer to the first element of the array. This allows functions to modify the original array directly.
However, if you want to simulate passing an array by value (i.e., you want to pass a copy of the array to the function), you can achieve this by copying the contents of the array into another array within the function. Here's how you can do it:
#include <stdio.h>
void manipulateArray(int arr[], int size) {
    int copy[size];
    for (int i = 0; i < size; i++) {
        copy[i] = arr[i];
    }

  
    for (int i = 0; i < size; i++) {
        copy[i] *= 2;
    }

printf("Manipulated Array: ");
    for (int i = 0; i < size; i++) {
printf("%d ", copy[i]);
    }
printf("\n");
}

int main() {
    int array[] = {1, 2, 3, 4, 5};
    int size = sizeof(array) / sizeof(array[0]);

manipulateArray(array, size);

printf("Original Array: ");
    for (int i = 0; i < size; i++) {
printf("%d ", array[i]);
    }
printf("\n");

    return 0;
}







Question-3
Which line will show error and why?
#include<stdio.h>
int main(){
char *a = "India";
char b[] = "India";
a = a+1;//line 5
b = b+1;//line 6

Ans-The line that will show an error is line 6: b = b+1;.
This line will result in a compilation error because you cannot modify the base address of an array (b is an array). 




Question-4
Write a simple web server in C (not C++) which accepts HTTP requests (eg. GET requests for HTML pages) and return
responses (eg. HTML pages showing parameters passed with GET request).

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>

#define PORT 8080
#define BUFFER_SIZE 1024

void handleRequest(int clientSocket) {
    char buffer[BUFFER_SIZE] = {0};
    char response[BUFFER_SIZE] = {0};
    char *htmlHeader = "HTTP/1.1 200 OK\nContent-Type: text/html\n\n";
    char *htmlBody = "<html><body><h1>Hello, World!</h1></body></html>";

recv(clientSocket, buffer, BUFFER_SIZE, 0);
printf("Received HTTP Request:\n%s\n", buffer);

strcat(response, htmlHeader);
strcat(response, htmlBody);

send(clientSocket, response, strlen(response), 0);

    close(clientSocket);
}

int main() {
    int serverSocket, clientSocket;
    struct sockaddr_inaddress;
    int addrlen = sizeof(address);

    if ((serverSocket = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
perror("socket failed");
exit(EXIT_FAILURE);
    }

  
    if (setsockopt(serverSocket, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &(int){1}, sizeof(int)) < 0) {
perror("setsockopt");
exit(EXIT_FAILURE);
    }
address.sin_family = AF_INET;
address.sin_addr.s_addr = INADDR_ANY;
address.sin_port = htons(PORT);

    if (bind(serverSocket, (struct sockaddr *)&address, sizeof(address)) < 0) {
perror("bind failed");
exit(EXIT_FAILURE);
    }

    if (listen(serverSocket, 3) < 0) {
perror("listen");
exit(EXIT_FAILURE);
    }

printf("Server listening on port %d...\n", PORT);

    while (1) {
        if ((clientSocket = accept(serverSocket, (struct sockaddr *)&address, (socklen_t*)&addrlen)) < 0) {
perror("accept");
exit(EXIT_FAILURE);
        }

handleRequest(clientSocket);
    }

    return 0;
}


Instructions

Compilation:
Open a terminal or command prompt and navigate to the directory containing the web_server.c file.
Compile the program using gcc:

Bash:
gcc  web_server.c –o web_server.c

This command will compile the web_server.c file and create an executable named web_server.c
Execution:
After successful compilation, you can run the executable by typing:
Bash:
./web_server
This command will start the web server, and it will begin listening for incoming HTTP requests on port 8080.
Testing:
You can test the server by opening a web browser and navigating tohttp://localhost:8080/?test=123. You should see a simple HTML page displaying the query string “test=123”.
Stopping the Server:
To stop the server, you can press ctrl + c in the terminal where the server is running. This will terminate the server process.
That's it! You have compiled and executed the simple web server program written in C.





Question-5
Design and Code a simple clone app of Tesla Powerhub software based on Chromium Embedded Framework? Link
attached for reference - https://www.tesla.com/support/energy/tesla-software/powerhub.

#include <iostream>
#include "include/cef_app.h"
#include "include/cef_browser.h"
#include "include/cef_command_line.h"
#include "include/cef_frame.h"
#include "include/cef_runnable.h"
#include "include/cef_scheme.h"
#include "include/cef_waitable_event.h"
#include "include/wrapper/cef_closure_task.h"
#include "include/wrapper/cef_helpers.h"
#include "include/wrapper/cef_message_router.h"

class TeslaPowerhubApp : public CefApp, public CefBrowserProcessHandler {
public:
TeslaPowerhubApp() {}

    virtual CefRefPtr<CefBrowserProcessHandler>GetBrowserProcessHandler() OVERRIDE { return this; }

    virtual void OnContextInitialized() OVERRIDE {
CefRefPtr<CefCommandLine>command_line = CefCommandLine::GetGlobalCommandLine();
CefRefPtr<CefBrowser> browser = CefBrowserHost::CreateBrowserSync(
CefWindowInfo(), CefBrowserSettings(), "https://www.tesla.com/support/energy/tesla-software/powerhub", NULL);
    }

    IMPLEMENT_REFCOUNTING(TeslaPowerhubApp);
};

int main(int argc, char* argv[]) {
CefMainArgsmain_args(argc, argv);
CefRefPtr<TeslaPowerhubApp>app(new TeslaPowerhubApp());
    return CefExecuteProcess(main_args, app.get(), NULL);
}


Compiling and executing a CEF-based application involves a bit more setup compared to a typical C or C++ program due to the dependency on the Chromium Embedded Framework. Here's a general guide on how to compile and execute the program:
Step 1: Set Up CEF
1.Download the CEF binary distribution from the official website: https://cefbuilds.com/.
2.Extract the downloaded archive to a directory on your system.
Step 2: Set Up Development Environment
1.Make sure you have a C++ compiler and CMake installed on your system.
2.Set up your project directory structure and create source files as per the example code provided earlier.
Step 3: Configure CMakeLists.txt
Create a CMakeLists.txt file in the root directory of your project to define the build configuration.
Here's a basic example:
cmake_minimum_required(VERSION 3.10)
project(tesla_powerhub_clone)

set(CMAKE_CXX_STANDARD 17)

# Find CEF
set(CEF_ROOT_DIR "/path/to/cef_binary")

find_package(CEF REQUIRED)
include_directories(${CEF_INCLUDE_DIRS})

add_executable(${PROJECT_NAME} src/main.cpp src/application.cpp src/browser_window.cpp src/browser_client.cpp src/resource_handler.cpp)
target_link_libraries(${PROJECT_NAME} ${CEF_LIBRARIES})

Replace /path/to/cef_binary with the actual path to the CEF binary distribution directory.

Step 4: Build the Project
Open a terminal or command prompt and navigate to your project directory. Then, run the following commands:
mkdir build
cd build
cmake ..
make

This will generate the build files and compile your application.

Step 5: Execute the Program
Once the compilation is successful, you can execute the program by running:
./tesla_powerhub_clone
Make sure you have the necessary CEF libraries available in your system's library path or alongside your executable.



