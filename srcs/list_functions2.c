/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   list_functions2.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: avornane <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/05 13:23:59 by avornane          #+#    #+#             */
/*   Updated: 2019/12/05 13:24:00 by avornane         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fillit.h"

t_poslist	*create_position(int tetromino[4][2], int y_incr, int x_incr)
{
	t_poslist	*new;

	if (!(new = (t_poslist *)ft_memalloc(sizeof(t_poslist))))
		exit_error();
	new->position[0][0] = tetromino[0][0] + y_incr;
	new->position[0][1] = tetromino[0][1] + x_incr;
	new->position[1][0] = tetromino[1][0] + y_incr;
	new->position[1][1] = tetromino[1][1] + x_incr;
	new->position[2][0] = tetromino[2][0] + y_incr;
	new->position[2][1] = tetromino[2][1] + x_incr;
	new->position[3][0] = tetromino[3][0] + y_incr;
	new->position[3][1] = tetromino[3][1] + x_incr;
	new->usable = 1;
	new->selected = 0;
	new->next = NULL;
	return (new);
}

void		append_position(int tetromino[4][2],
			t_poslist **positions, int y_incr, int x_incr)
{
	t_poslist		*temp;

	if (*positions == NULL)
	{
		*positions = create_position(tetromino, y_incr, x_incr);
		return ;
	}
	temp = *positions;
	while (temp->next != NULL)
		temp = temp->next;
	temp->next = create_position(tetromino, y_incr, x_incr);
}

void		add_used_position(int position[4][2], t_uplist **used_positions)
{
	t_uplist	*temp;
	int			i;

	i = 0;
	while (i < 4)
	{
		if (!(temp = (t_uplist *)ft_memalloc(sizeof(t_uplist))))
			exit_error();
		temp->xy[0] = position[i][0];
		temp->xy[1] = position[i][1];
		temp->next = NULL;
		if (*used_positions == NULL)
			*used_positions = temp;
		else
		{
			temp->next = *used_positions;
			*used_positions = temp;
		}
		i++;
	}
}

void		remove_uplist(t_uplist **used_positions)
{
	t_uplist *tmp;

	while (*used_positions)
	{
		tmp = *used_positions;
		*used_positions = (*used_positions)->next;
		free(tmp);
		tmp = NULL;
	}
}
