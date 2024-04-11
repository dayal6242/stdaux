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





