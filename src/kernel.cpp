//
// Created by os on 9/6/22.
//

#include "../lib/hw.h"

#include "../h/kernel.hpp"
#include "../h/memory_allocator.h"
#include "../h/riscv.hpp"

void Kernel::supervisorTrapHandler() {
    volatile uint64 scause;
    asm volatile("csrr %[scause], scause": [scause] "=r" (scause) );
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) { syscall_handler(); return; }
}

void Kernel::syscall_handler() {
    volatile uint64 syscall_id;
    asm volatile ("mv %[syscall_id], a0": [syscall_id] "=r" (syscall_id));
    if (syscall_id == 0x01) {
        volatile uint64 arg0;
        asm volatile ("mv %[arg0], a1": [arg0] "=r" (arg0));
        MemoryAllocator::allocate(arg0);
        return;
    }

}