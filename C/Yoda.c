#include <ncurses.h>
// Practise Ncurses
// Date: 03/03/2016

int main (void) {

    int yoda = 874;
    int ss = 65;

    initscr();
    printw("Yoda is %d years old\n", yoda);
    printw("He has collected %d years\n", yoda-ss);
    printw("of Social Security");

    refresh(); //display the result

    getch(); //Wait here

    endwin();
    return 0;
}