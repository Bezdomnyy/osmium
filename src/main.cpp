#include "../lib/console.h"
#include "../lib/hw.h"

uint64 timerCount = 0;

extern "C" void handleSupervisorTrap() {
    volatile uint64 scauseVal;
    asm volatile ("csrr %[cause], scause": [cause] "=r" (scauseVal));
    char word[9] = "Poruka!\n";
    int cnt = 8;
    if (scauseVal == (0x01UL << 63 | 0x01)) {
        if (++timerCount >= 50) {
            for (int i = 0; i < cnt; i++) {
                __putc(word[i]);
            }
            timerCount = 0;
        }

        asm volatile ("csrc sip, 0x02");
    }
    console_handler();
}

extern "C" void supervisorTrap();


void main() {
    asm volatile("csrw stvec, %[trapVector]" : : [trapVector] "r" (&supervisorTrap));
    asm volatile("csrs sstatus, 0x02");
    while(1);
}