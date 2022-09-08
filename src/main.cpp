#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/print.h"
#include "../h/kernel.h"
#include "../h/riscv.h"
#include "../h/memory_allocator.h"


void main() {
    Kernel::initKernel();
    //int* i = /*(int*) mem_alloc(sizeof(int));*/ (int*)((uint64)HEAP_START_ADDR + 1);
    //int* i = (int*)MemoryAllocator::allocate(sizeof(int));
    int* i = (int*) mem_alloc(sizeof(int));
    *i = 48;
    __putc(*i);
    mem_free(i);
}