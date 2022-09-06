//
// Created by os on 9/6/22.
//

#ifndef OSMIUM_RISCV_H
#define OSMIUM_RISCV_H


#include "../lib/hw.h"

class RiscV{
public:
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
        SIE = (1 << 1),
        SPIE = (1 << 5),
        SPP = (1 << 8),
    };

    //set bit-mask bits in the sstatus register
    static void setSstatus(uint64 mask);

    //clear bit-mask bits in the sstatus register
    static void clearSstatus(uint64 mask);

    //read from sstatus register
    static uint64 readSstatus();

    //write to sstatus register
    static void writeSstatus(uint64 sstatus);

private:

};


#endif //OSMIUM_RISCV_H
