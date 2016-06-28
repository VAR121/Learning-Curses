#include <ncurses.h>
// Practise Ncurses
// Date: 03/03/2016

int main (void) {

    char first[4];
    char last[4];

    initscr();
    addstr("What are first 3 of your first name? ");
    refresh();
    getnstr(first,3);

    addstr("What are first 3 of last name? ");
    refresh();
    getnstr(last,3);

    addstr("Your secret agent name is ");
    printw("%s%s", first, last);
    addch('!');
    refresh();
    getch();

    endwin();
    return 0;
}