#include <ncurses.h>

int main (void) {
    char text[] = "Greetings from NCurses";
    char *t;

    initscr(); //Initialize NCurses;
    t =  text; //Intialize pointer;

    while (*t) {
        addch(*t);
        t++;
        refresh();
        napms(100); //Delay
    }
    getch(); //Wait here

    endwin();
    return 0;
}