//
// Created by os on 9/6/22.
//

#include "../h/riscv.hpp"

// definition of: 'inline void RiscV::pushRegisters();' is in util.S

// definition of: 'inline void RiscV::popRegisters();' is in util.S

inline uint64 RiscV::readScause() {
    uint64 volatile scause;
    asm volatile("csrr %[scause], scause": [scause] "=r" (scause));
    return scause;
}

inline void RiscV::writeScause(uint64 scause) {
    asm volatile("csrw scause, %[scause]":: [scause] "r" (scause));
}

inline uint64 RiscV::readSepc() {
    uint64 volatile sepc;
    asm volatile("csrr %[sepc], sepc": [sepc] "=r" (sepc));
    return sepc;
}

inline void RiscV::writeSepc(uint64 sepc) {
    asm volatile("csrw sepc, %[sepc]":: [sepc] "r" (sepc));
}

inline uint64 RiscV::readStvec() {
    uint64 volatile stvec;
    asm volatile("csrr %[stvec], stvec": [stvec] "=r" (stvec));
    return stvec;
}

inline void RiscV::writeStvec(uint64 stvec) {
    asm volatile("csrw stvec, %[stvec]":: [stvec] "r" (stvec));
}

inline void RiscV::setSstatus(uint64 mask) {
    asm volatile("csrs sstaus, %[mask]":: [mask] "r" (mask));
}

inline void RiscV::clearSstatus(uint64 mask) {
    asm volatile("csrc sstaus, %[mask]":: [mask] "r" (mask));
}

inline uint64 RiscV::readSstatus() {
    uint64 volatile sstatus;
    asm volatile("csrr %[sstatus], sstatus": [sstatus] "=r" (sstatus));
    return sstatus;
}

inline void RiscV::writeSstatus(uint64 sstatus) {
    asm volatile("csrw sstatus, %[sstatus]":: [sstatus] "r" (sstatus));
}