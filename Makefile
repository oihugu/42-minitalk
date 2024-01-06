#### Bonus Flag Definition ####
BONUS_MODE = "false"

#### Source code ####
CLIENT = src/client.c
SERVER = src/server.c

#### Objects ####
CLIENT_OBJ = $(CLIENT:.c=.o)
SERVER_OBJ = $(SERVER:.c=.o)
OBJS = $(CLIENT_OBJ) $(SERVER_OBJ)

#### Definitions ####
PROJECT_NAME = minitalk
CLIENT_NAME = client
SERVER_NAME = server

#### Compiler ####
CC = gcc
CFLAGS = -Wall -Wextra -Werror
INCLUDES = -I./include

#### Colors ####
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
WHITE = \033[0;37m
RESET = \033[0m

#### Rules ####
all: $(PROJECT_NAME)

$(PROJECT_NAME): $(CLIENT_NAME) $(SERVER_NAME)

$(CLIENT_NAME): $(CLIENT_OBJ)
	@$(CC) $(CFLAGS) $(INCLUDES) $(CLIENT_OBJ) -o $(CLIENT_NAME)
	@echo "$(GREEN)$ Cliente Pronto 👌 $(RESET)"

$(SERVER_NAME): $(SERVER_OBJ)
	@$(CC) $(CFLAGS) $(INCLUDES) $(SERVER_OBJ) -o $(SERVER_NAME)
	@echo "$(GREEN)$ Servidor Pronto 👌 $(RESET)"

clean:
	@rm -f $(OBJS)
	@echo "$(RED)✗ Objetos Removidos $(RESET)"

fclean:
	@rm -f $(OBJS)
	@rm -f $(CLIENT_NAME)
	@rm -f $(SERVER_NAME)
	@echo "$(RED)✗ Objetos Removidos $(RESET)"
	@echo "$(RED)✗ Executavel $(CLIENT_NAME) Removido $(RESET)"
	@echo "$(RED)✗ Executavel $(SERVER_NAME) Removido $(RESET)"
	@echo "$(WHITE)✗✗✗✗✗ Removi a porra toda 😎 ✗✗✗✗✗$(RESET)"

%.o: %.c
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

re: fclean all