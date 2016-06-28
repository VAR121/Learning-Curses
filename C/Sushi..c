#include <ncurses.h>
// Practise Ncurses
// Date: 03/03/2016

#define UNI 4.5

int main (void) {

    int pieces;

    initscr();

    addstr("SUSHI BAR");
    move(3,0);

    printw("We have Uni today for $%.2f.\n", UNI);
    addstr("How many pieces would you like? ");
    refresh();

    scanw("%d", &pieces);
    printw("you want %d pieces?\n", pieces);
    printw("That will be $%.2f!", UNI*(float)pieces);
    refresh();
    getch();

    endwin();
    return 0;
}