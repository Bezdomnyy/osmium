#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/print.h"
#include "../h/kernel.h"
#include "../h/riscv.h"
#include "../h/memory_allocator.h"


void main() {
    Kernel::initKernel();
    printString("Here");
    int *a = new int[100000000];
    //a[0] = 48; a[1] = 49; a[2] = 50; a[3] = 51; a[4] = 52;
    for (int i = 0; i < 5; i++)
        __putc(a[i]);

    printString("Here");
    delete[] a;
    int *b = (int*) mem_alloc(sizeof (int));
    *b = 48;
    printString("Here");
    __putc(*b);
    mem_free(b);
}