#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/print.h"
#include "../h/kernel.h"
#include "../h/riscv.h"

void main() {
    Kernel::initKernel();
    mem_alloc(5);
    printString("Finished!\n");
}