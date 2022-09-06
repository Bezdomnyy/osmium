//
// Created by os on 9/6/22.
//

#include "../lib/hw.h"

#include "../h/kernel.h"
#include "../h/memory_allocator.h"
#include "../h/riscv.h"

void Kernel::initKernel() {
    RiscV::writeStvec((uint64) &supervisorTrap);

}

void Kernel::supervisorTrapHandler() {
    uint64 sepc = RiscV::readSepc() + 4;
    RiscV::setSip(RiscV::SSIP);
    syscall_handler();
    RiscV::writeSepc(sepc);
}

void Kernel::syscall_handler() {
    uint64 sepc = RiscV::readSepc();
    volatile uint64 syscall_id;
    asm volatile ("mv %[syscall_id], a0": [syscall_id] "=r" (syscall_id));

    switch(syscall_id) {
        case 0x01:
            volatile uint64 arg0;
            asm volatile ("mv %[arg0], a1": [arg0] "=r"(arg0));
            MemoryAllocator::allocate(arg0);
            break;
    }
    RiscV::writeSepc(sepc);
}