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
    static void* allocate(size_t size);

    static void free(void*);

    static void initMem();

    struct FreeMem {
        size_t size;
        FreeMem *prev;
        FreeMem *next;
    };
private:

    static FreeMem* fMemHead;

    /*static const void* FreeMemStart = HEAP_START_ADDR;
    static const void* FreeMemEnd = HEAP_END_ADDR;
    static const size_t BlockSize = MEM_BLOCK_SIZE;*/

    static FreeMem* firstFit(size_t size);

    static void* allocBlocks(FreeMem* node, size_t size);

    static size_t calcSize(size_t size);

    static void tryToMerge(FreeMem *node);

};


#endif //OSMIUM_MEMORY_ALLOCATOR_H
