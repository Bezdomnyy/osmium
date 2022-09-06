//
// Created by os on 9/6/22.
//

#ifndef OSMIUM_RISCV_H
#define OSMIUM_RISCV_H


#include "../lib/hw.h"

class RiscV {
public:
    // pop spp and spie sstatus bits
    static void popSppSpie();

    //push x3...x31 registers on stack
    static void pushRegisters();

    //pop x3...x31 registers from stack
    static void popRegisters();

    //read from scause register
    static uint64 readScause();

    //write to scause register
    static void writeScause(uint64 scause);

    //read from sepc register
    static uint64 readSepc();

    //write to sepc register
    static void writeSepc(uint64 sepc);

    //read from stvec register
    static uint64 readStvec();

    //write to stvec register
    static void writeStvec(uint64 stvec);

    enum SSTATUS
    {
        SIE = (1 << 1), //supervisor interrupt enable
        SPIE = (1 << 5),//supervisor previous interrupt enable
        SPP = (1 << 8), //supervisor previous privilege
    };

    //set bit-mask bits in the sstatus register
    static void setSstatus(uint64 mask);

    //clear bit-mask bits in the sstatus register
    static void clearSstatus(uint64 mask);

    //read from sstatus register
    static uint64 readSstatus();

    //write to sstatus register
    static void writeSstatus(uint64 sstatus);

    enum SIP
    {
        SSIP = (1 << 1), //supervisor software interrupt pending
        STIP = (1 << 5), //supervisor timer interrupt pending
                         // (tajmer je konfigurisan da baca software interrupt tako da se ovo ne koristi)
        SEIP = (1 << 9), //supervisor external interrupt pending
    };

    //set bit-mask bits in the sip register
    static void setSip(uint64 mask);

    //clear bit-mask bits in the sip register
    static void clearSip(uint64 mask);

    //read from sip register
    static uint64 readSip();

    //write to sip register
    static void writeSip(uint64 Sip);
private:

};

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
    asm volatile("csrs sstatus, %[mask]":: [mask] "r" (mask));
}

inline void RiscV::clearSstatus(uint64 mask) {
    asm volatile("csrc sstatus, %[mask]":: [mask] "r" (mask));
}

inline uint64 RiscV::readSstatus() {
    uint64 volatile sstatus;
    asm volatile("csrr %[sstatus], sstatus": [sstatus] "=r" (sstatus));
    return sstatus;
}

inline void RiscV::writeSstatus(uint64 sstatus) {
    asm volatile("csrw sstatus, %[sstatus]":: [sstatus] "r" (sstatus));
}

inline void RiscV::setSip(uint64 mask) {
    asm volatile("csrs sip, %[mask]":: [mask] "r" (mask));
}

inline void RiscV::clearSip(uint64 mask) {
    asm volatile("csrc sip, %[mask]":: [mask] "r" (mask));
}

inline uint64 RiscV::readSip() {
    uint64 volatile sip;
    asm volatile("csrr %[sip], sip": [sip] "=r" (sip));
    return sip;
}

inline void RiscV::writeSip(uint64 sip) {
    asm volatile("csrw sip, %[sip]":: [sip] "r"(sip));
}

#endif //OSMIUM_RISCV_H
