# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ptuukkan <ptuukkan@student.hive.fi>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/18 12:36:17 by ptuukkan          #+#    #+#              #
#    Updated: 2019/11/06 09:36:48 by ptuukkan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fillit
LIB = libft.a
SRCDIR = srcs
SRCS = main.c list_functions.c print_error.c print_usage.c read_and_validate.c

OBJDIR = objects
OBJS = $(SRCS:%.c=$(OBJDIR)/%.o)
INC = includes/

GCC = gcc -Werror -Wextra -Wall -g

all: $(NAME) $(CHECKER)

$(NAME): $(OBJS) libft/$(LIB)
	$(GCC) $(OBJS) -o $(NAME) libft/$(LIB)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(INC)/fillit.h
	@[ -d $(@D) ] || mkdir -p $(@D)
	$(GCC) -c $< -o $@ -I $(INC) -I libft/$(INC)

libft/$(LIB):
	make -C libft/

clean:
		/bin/rm -f $(OBJS)
		/bin/rm -rf $(OBJDIR)
		make -C libft/ clean

fclean : clean
		/bin/rm -f $(NAME)
		make -C libft/ fclean

re: fclean all

.PHONY: clean fclean all