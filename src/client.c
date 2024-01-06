#include "../include/minitalk.h"


int send_char(int pid, char character){
    int i = 0;
    while (i < 8){
        if (character & 1){
            if (kill(pid, SIGUSR2) == -1){
                return 0;
            }
        }
        else{
            if (kill(pid, SIGUSR1) == -1){
                return 0;
            }
        }
        sleep(10);
        character >>= 1;
        i++;
    }
    return 1;
}

int main(int argc, char **argv){
    (void)argc;
    int pid = atoi(argv[1]);
    char *str = argv[2];
    char character = str[0];

    if (send_char(pid, character)){
        return 0;
    }

    return 0;
}
