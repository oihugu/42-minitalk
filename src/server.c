/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aabduvak <aabduvak@42ISTANBUL.COM.TR>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/06 03:51:35 by aabduvak          #+#    #+#             */
/*   Updated: 2022/02/11 00:59:28 by aabduvak         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


#include "../include/minitalk.h"

void handler(int signum, siginfo_t *info, void *context)
{
    (void)context;
    int i = 0;

    printf("Received signal from client: %d\n", info->si_pid);

    while (i < 8)
    {
        if (signum == SIGUSR1)
            printf("0");
        else if (signum == SIGUSR2)
            printf("1");
        i++;
    }
    printf("\n");
}


int	main(void)
{
	struct sigaction info;

	int pid = getpid();
    printf("Server PID: %d\n", pid);

	info.sa_sigaction = handler;
	info.sa_flags = SA_SIGINFO;
	sigaction(SIGUSR1, &info, 0);
	sigaction(SIGUSR2, &info, 0);
	
    while (1)
		pause();
	return (0);
}