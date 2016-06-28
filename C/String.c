#include <ncurses.h>
// Practise Ncurses
// Date: 03/03/2016

int main (void) {

    char first[24];
    char last[32];

    initscr();
    addstr("What is your first name? ");
    refresh();
    getstr(first);

    addstr("What is your last name? ");
    refresh();
    getstr(last);

    printw("Pleased to meet you %s %s!", first, last);
    refresh();
    getch();

    endwin();
    return 0;
}