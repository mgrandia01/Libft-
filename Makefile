# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mgrandia <mgrandia@student.42barcelon      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/06 16:16:34 by mgrandia          #+#    #+#              #
#    Updated: 2025/05/10 19:22:29 by mgrandia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = cc
AR = ar rcs
RM = rm -f

FLAGS = -Wall -Wextra -Werror -g

DIR_INC = includes/ 

DIR_OBJS = objs/

DIR_LIBFT = libft/
DIR_PRINTF = printf/
DIR_GNL = gnl/

SRC_LIBFT = ft_isalpha.c	ft_isdigit.c	ft_isalnum.c \
	    ft_isascii.c	ft_isprint.c \
      	ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c\
      	ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c\
      	ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c\
	ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c\
	ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c\
	ft_putnbr_fd.c\
	ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c\
       ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c

SRC_PRINTF = ft_printf.c printf_utils.c ft_uitoa.c decimal_print.c\
      hexa_print.c pointer_print.c text_print.c

SRC_GNL = get_next_line.c get_next_line_utils.c 

OBJS_LIBFT = $(SRC_LIBFT:%.c=$(DIR_OBJS)libft_%.o)
OBJS_PRINTF = $(SRC_PRINTF:%.c=$(DIR_OBJS)printf_%.o)
OBJS_GNL = $(SRC_GNL:%.c=$(DIR_OBJS)gnl_%.o)

$(DEP_FILES):.o=.d

all: $(NAME)

$(NAME): $(DIR_OBJS) $(OBJS_LIBFT) $(OBJS_PRINTF) $(OBJS_GNL)
	@$(AR) $(NAME) $(OBJS_LIBFT) $(OBJS_PRINTF) $(OBJS_GNL)	

$(DIR_OBJS):
	@mkdir -p $(DIR_OBJS)

$(DIR_OBJS)libft_%.o: $(DIR_LIBFT)%.c Makefile  includes/libft.h
	@$(CC) $(FLAGS) -MD -I$(DIR_INC) -c $< -o $@

$(DIR_OBJS)printf_%.o: $(DIR_PRINTF)%.c Makefile includes/ft_printf.h
	@$(CC) $(FLAGS) -MD -I$(DIR_INC) -c $< -o $@

$(DIR_OBJS)gnl_%.o: $(DIR_GNL)%.c Makefile includes/get_next_line.h
	@$(CC) $(FLAGS) -MD -I$(DIR_INC) -c $< -o $@
	
clean:
	@$(RM) -r $(DIR_OBJS)

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
-include: $(DEP_FILES)
