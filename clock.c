//Here's a simple timer app written in C that allows setting and resetting alarms and reminds you of an upcoming event:
//This program allows you to set alarms for specific times and events. It checks for events every minute and reminds you if an event is due at the current time. You can set multiple alarms, and it will remind you of each event when it occurs. To quit the program, enter '3'.//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_EVENTS 10
#define MAX_EVENT_LENGTH 50

typedef struct {
    int hour;
    int minute;
    char event[MAX_EVENT_LENGTH];
} Event;

Event events[MAX_EVENTS];
int num_events = 0;

void set_alarm(int hour, int minute, const char *event) {
    if (num_events < MAX_EVENTS) {
        events[num_events].hour = hour;
        events[num_events].minute = minute;
        strcpy(events[num_events].event, event);
        num_events++;
        printf("Alarm set for %d:%02d - %s\n", hour, minute, event);
    } else {
        printf("Maximum number of events reached.\n");
    }
}

void reset_alarm() {
    num_events = 0;
    printf("All alarms reset.\n");
}

void check_events(int current_hour, int current_minute) {
    for (int i = 0; i < num_events; i++) {
        if (current_hour == events[i].hour && current_minute == events[i].minute) {
            printf("Reminder: %s\n", events[i].event);
        }
    }
}

int main() {
    int hour, minute;
    char event[MAX_EVENT_LENGTH];
    char choice;

    while (1) {
        printf("\n1. Set Alarm\n2. Reset Alarm\n3. Quit\n");
        printf("Enter your choice: ");
        scanf(" %c", &choice);

        switch(choice) {
            case '1':
                printf("Enter hour (0-23): ");
                scanf("%d", &hour);
                printf("Enter minute (0-59): ");
                scanf("%d", &minute);
                printf("Enter event description: ");
                scanf("%s", event);
                set_alarm(hour, minute, event);
                break;
            case '2':
                reset_alarm();
                break;
            case '3':
                printf("Exiting...\n");
                return 0;
            default:
                printf("Invalid choice.\n");
        }

        // Simulate time passing (check for events every minute)
        for (int m = 0; m < 60; m++) {
            sleep(1); // Sleep for 1 second (replace with your system's sleep function)
            check_events(hour, minute);
            minute++;
            if (minute == 60) {
                minute = 0;
                hour = (hour + 1) % 24;
            }
        }
    }

    return 0;
}
