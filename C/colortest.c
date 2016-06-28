#include <ncurses.h>
#include <stdlib.h>

//Mar-4-2016
//Purpose: Practice NCurses in C

void bomb(char *msg);

int main (void) {

    initscr();

    //first test for color ability of the terminal
    if (!has_colors())
        bomb("Terminal cannot do colors\n");
    //next attempt to initialize curses colors
    if(start_color() != OK)
        bomb("Unable to start colors.\n");   
         
    printw("Colors have been properly initialized.\n");
    printw("Congratulations!\n");
    printw("NCurses reports that you can use %d colors,\n",COLORS);
    printw("and %d color pairs.",COLOR_PAIRS);
    refresh();
    getch();
    endwin();
    return 0;
}

void bomb(char *msg)
{
    endwin();
    puts(msg);
    exit(1);
}