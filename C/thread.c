#include <ncurses.h>
#include <stdlib.h>
#include <pthread.h>
#include <signal.h>
// #include <util/util.h>
#include <sys/time.h>

pthread_t thread1;
pthread_t thread2;
pthread_mutex_t my_mutex;

static unsigned int counter;

void thread1_main(void);
void thread2_main(void);
void draw_box(int th_num);

void sig_handler(int signum) {
    if (signum != SIGINT) {
        printf("Received invalid signum = %d in sig_handler()\n", signum);
        // ASSERT(signum == SIGINT);
    }

    printf("Received SIGINT. Exiting Application\n");
    endwin();
    pthread_cancel(thread1);
    pthread_cancel(thread2);

    exit(0);
}
int main(void) {

    pthread_attr_t attr;
    int status;

    signal(SIGINT, sig_handler);

    pthread_attr_init(&attr);
    pthread_attr_setstacksize(&attr, 1024*1024);    

    counter = 0;

    initscr();
    start_color();
    init_pair( 1, COLOR_RED, COLOR_YELLOW );
    init_pair( 2, COLOR_BLACK, COLOR_GREEN );
    attron( COLOR_PAIR(1) );
    attron( COLOR_PAIR(2) );

    status = pthread_create(&thread1, &attr, (void*)&thread1_main, NULL);
    status = pthread_create(&thread2, &attr, (void*)&thread2_main, NULL);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    refresh();
    getch();
    endwin();

    return 0;
}

void thread1_main(void) {
    unsigned int exec_period_usecs;

    exec_period_usecs = 1000000; /*in micro-seconds*/

    while(1) {
       usleep(exec_period_usecs);
       draw_box(1);
    }
}

void thread2_main(void) {
    unsigned int exec_period_usecs;

    exec_period_usecs = 1000000; /*in micro-seconds*/

   while(1) {
        usleep(exec_period_usecs);
        draw_box(2);
    }
}

void draw_box(int th_num) {

    pthread_mutex_lock(&my_mutex);

    if (counter > 70) {
        return ;
    }

    if(th_num == 1) {
        counter += 1;
        attron(COLOR_PAIR(th_num));
        move(th_num, counter);
        printw("*");
        refresh();
        // napms(100);
    } 
    else if (th_num == 2) {
        counter += 1;
        attron(COLOR_PAIR(th_num));
        move(th_num, counter);
        printw("*");
        refresh();
        // napms(100);
    }
    pthread_mutex_unlock(&my_mutex);
}

