#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid1, pid2;

    pid1 = fork();
    if (pid1 == 0) {
        // First child process
        printf("Child 1 running. PID: %d\n", getpid());
        sleep(2);
        exit(0);
    }

    pid2 = fork();
    if (pid2 == 0) {
        // Second child process
        printf("Child 2 running. PID: %d\n", getpid());
        sleep(2);
        exit(0);
    }

    // Parent process waits for all children to finish
    int status;
    pid_t wpid;
    while ((wpid = wait(&status)) > 0) {
        printf("Cleaning up child with PID: %d\n", wpid);
    }

    printf("All child processes cleaned up. No zombies remain.\n");
    return 0;
}
