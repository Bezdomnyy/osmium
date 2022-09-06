//
// Created by os on 9/6/22.
//

#ifndef OSMIUM_MEMORY_ALLOCATOR_H
#define OSMIUM_MEMORY_ALLOCATOR_H

#include "../lib/hw.h"
#include "print.hpp"

class MemoryAllocator {
public:
    static uint64 allocate(uint64 i) {
        printUint64(i);
        return 0;
    }

};


#endif //OSMIUM_MEMORY_ALLOCATOR_H
