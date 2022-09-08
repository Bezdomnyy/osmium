//
// Created by os on 9/6/22.
//

#ifndef OSMIUM_KERNEL_H
#define OSMIUM_KERNEL_H

#include "memory_allocator.h"

class Kernel {
public:
    static void initKernel();
    static void supervisorTrap();
private:
    static void supervisorTrapHandler();
    static void syscall_handler();
};

#endif //OSMIUM_KERNEL_H
