#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/print.h"
#include "../h/kernel.h"
#include "../h/riscv.h"



void main() {
    Kernel::initKernel();
    //int* i = (int*) mem_alloc(sizeof (int));
    int* i = (int*)HEAP_START_ADDR + 1;
    int test = (uint64)HEAP_START_ADDR + (uint64)sizeof(size_t);
    bool b = (uint64)
    printInt(test);
    //__putc(*i);
    //mem_free(i);
}