//
// Created by os on 9/6/22.
//

#include "../lib/hw.h"

#include "../h/kernel.h"
#include "../h/memory_allocator.h"
#include "../h/riscv.h"

void Kernel::initKernel() {
    RiscV::writeStvec((uint64) &supervisorTrap);
    MemoryAllocator::initMem();
}

void Kernel::supervisorTrapHandler() {
    uint64 scause = RiscV::readScause();

    if (scause == 0x08 || scause == 0x09) {
        uint64 sepc = RiscV::readSepc() + 4;
        RiscV::setSip(RiscV::SSIP);
        syscall_handler();
        RiscV::writeSepc(sepc);
        return;
    }
    if (scause ==0x07) {
        uint64 sepc = RiscV::readSepc() + 4;
        printString("Nedozvoljena adresa upisa.\n");
        printString("scause: ");
        printUint64(scause);
        __putc('\n');
        //RiscV::clearSip(RiscV::SEIP);
        RiscV::writeSepc(sepc);
    }

}

void Kernel::syscall_handler() {
    //uint64 sepc = RiscV::readSepc();
    volatile uint64 syscall_id;
    asm volatile ("mv %[syscall_id], a0": [syscall_id] "=r" (syscall_id));

    volatile uint64 arg0;
    switch(syscall_id) {
        case 0x01:
            asm volatile ("mv %[arg0], a1": [arg0] "=r"(arg0));
            MemoryAllocator::allocate((size_t)arg0);
            break;
        case 0x02:
            asm volatile ("mv %[arg0], a1": [arg0] "=r"(arg0));
            MemoryAllocator::free((void*)arg0);
            break;
    }
    //RiscV::writeSepc(sepc);
}