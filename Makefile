# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ptuukkan <ptuukkan@student.hive.fi>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/18 12:36:17 by ptuukkan          #+#    #+#              #
#    Updated: 2019/12/10 14:03:30 by avornane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fillit
LIB = libft.a
SRCDIR = srcs
SRCS = main.c list_functions.c read_and_validate.c\
		convert_tetromino.c calculate_positions.c solve.c print_functions.c\
		list_functions2.c helper_functions.c

OBJDIR = objects
OBJS = $(SRCS:%.c=$(OBJDIR)/%.o)
INC = includes/

GCC = gcc -Werror -Wextra -Wall -g

all: $(NAME)

$(NAME): $(OBJS) libft/$(LIB)
	$(GCC) $(OBJS) -o $(NAME) libft/$(LIB)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(INC)/fillit.h
	@[ -d $(@D) ] || mkdir -p $(@D)
	$(GCC) -c $< -o $@ -I $(INC) -I libft/$(INC)

buildlib:
	make -C libft/

libft/$(LIB):
	@$(MAKE) buildlib

clean:
		/bin/rm -f $(OBJS)
		/bin/rm -rf $(OBJDIR)
		make -C libft/ clean

fclean : clean
		/bin/rm -f $(NAME)
		make -C libft/ fclean

re: fclean all

.PHONY: clean fclean all buildlib
