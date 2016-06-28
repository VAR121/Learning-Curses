#include <ncurses.h>
// Practise Ncurses
// Date: 03/03/2016

#define UNI 4.5

int main (void) {

    initscr();
    start_color();
    init_pair(1,COLOR_WHITE,COLOR_BLUE);
    bkgd(COLOR_PAIR(1));
    refresh();
    getch();

    endwin();
    return 0;
}