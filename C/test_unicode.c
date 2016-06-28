#include <ncurses.h>
#include <stdio.h>
#include <locale.h>

int
main (int argc, char *argv[])
{
    WINDOW *stdscr;
    char buffer[] = {
        '<',
        0xE2, 0x98, 0x83,       // U+2603 : snowman: OK
        0xE2, 0x9B, 0x84,       // U+26C4 : snowman without snow: ERROR (space displayed)
        0xF0, 0x9F, 0x98, 0xB8, // U+1F638: grinning cat face: ERROR (space displayed)
        '>',
        '\0' };

    setlocale (LC_ALL, "");

    stdscr = initscr ();
    mvwprintw (stdscr, 0, 0, buffer);
    getch ();
    endwin ();

    /* output the buffer outside of ncurses */
    printf("%s\n",buffer);
    return 0;
}
