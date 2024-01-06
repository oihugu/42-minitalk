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
CFLAGS = -Wall -Wextra -Werror -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700
INCLUDES = -I./include

#### Colors ####
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
WHITE = \033[0;37m
RESET = \033[0m

#### Rules ####
all: $(PROJECT_NAME)

$(PROJECT_NAME):
	@echo "$(YELLOW) ⟦ Compilando Cliente e Servidor ⟧ $(RESET)"
	@make $(CLIENT_NAME)
	@make $(SERVER_NAME)
	@echo "$(GREEN)✓ Cliente e Servidor Compilados $(RESET)"

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
	@echo "$(RED)✗✗✗✗✗ Removi a porra toda 😎 ✗✗✗✗✗$(RESET)"

test:
	@echo "$(YELLOW) ☆*: .｡. o(≧▽≦)o .｡.:*☆ $(RESET)"
	@echo "$(YELLOW) ⟦ Testando Cliente e Servidor ⟧ $(RESET)"


%.o: %.c
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

re: fclean all

.PHONY: all clean fclean re test