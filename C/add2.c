#include <ncurses.h>

int main (void) {

    char text1[] = "Oh give me a clone\n";
    char text2[] = "Yes a clone of my own";

    initscr();
    addstr(text1); // Add the first string
    addstr(text2); // Add the second string
    refresh(); //display the result

    getch(); //Wait here

    endwin();
    return 0;
}