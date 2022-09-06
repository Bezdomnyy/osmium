//
// Created by os on 9/6/22.
//

#ifndef OSMIUM_MEMORY_ALLOCATOR_H
#define OSMIUM_MEMORY_ALLOCATOR_H

#include "../lib/hw.h"
#include "../lib/console.h"
#include "print.h"

class MemoryAllocator {
public:
    static uint64 allocate(uint64 i) {
        printUint64(i);
        //console_handler();
        return 0;
    }

};


#endif //OSMIUM_MEMORY_ALLOCATOR_H
