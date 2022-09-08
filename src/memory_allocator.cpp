//
// Created by os on 9/6/22.
//

#include "../h/memory_allocator.h"

MemoryAllocator::FreeMem* MemoryAllocator::fMemHead = nullptr;
/*const void* MemoryAllocator::FreeMemStart = HEAP_START_ADDR;
const void* MemoryAllocator::FreeMemEnd = HEAP_END_ADDR;
const size_t MemoryAllocator::BlockSize = MEM_BLOCK_SIZE;*/

void *MemoryAllocator::allocate(size_t size) {
    return allocBlocks(firstFit(size), size);
}

void MemoryAllocator::free(void* addr) {
    addr = (char*)addr - sizeof(size_t);
    size_t deallocSize = *(size_t*)addr;

    FreeMem* curr = nullptr;
    if (fMemHead && addr>(void*)fMemHead)
        for(curr = fMemHead; curr->next != 0 && (void*)curr->next < addr; curr = curr->next);

    FreeMem* newNode = (FreeMem*)addr;
    newNode->size = deallocSize; //this line may be unnecessary
    newNode->prev = curr;
    if (curr) newNode->next = curr->next, curr->next = newNode;
    else newNode->next = fMemHead, fMemHead = newNode;
    if (newNode->next) newNode->next->prev = newNode;

    tryToMerge(newNode);
    tryToMerge(curr);

}

void MemoryAllocator::initMem()  {
    fMemHead = (FreeMem*)HEAP_START_ADDR;
    fMemHead->size = ((size_t)HEAP_START_ADDR- (size_t)HEAP_END_ADDR);
    /*fMemHead->prev = fMemHead;
    fMemHead->next = fMemHead;*/
    fMemHead->prev = nullptr;
    fMemHead->next = nullptr;
}

MemoryAllocator::FreeMem *MemoryAllocator::firstFit(size_t size) {
    FreeMem* curr = fMemHead;
    for(; curr && curr->next; curr = curr->next)
        if (curr->size + size <= size) return curr;
    if (curr && (curr->size + size <= size)) return curr;
    return nullptr;
}

void *MemoryAllocator::allocBlocks(MemoryAllocator::FreeMem *node, size_t size) {
    void* ret = nullptr;
    if (node) {
        size_t allocSize = calcSize(size);

        FreeMem* newNode = nullptr;
        if (node->size - allocSize >= MEM_BLOCK_SIZE) {
            newNode = node + allocSize;
            newNode->size = node->size - allocSize;
            if (node->prev) node->prev->next = newNode;
            else fMemHead = newNode;
            if (node->next) node->next->prev = newNode;
            newNode->next = node->next;
            newNode->prev = node->prev;
        }
        else {
            if (node->prev) node->prev->next = node->next;
            else fMemHead = newNode;
            if (node->next) node->next->prev = node->prev;
        }

        *(size_t*)node = allocSize;
        ret = (void*)((size_t)node + sizeof(size_t));

    }
    return ret;
}

size_t MemoryAllocator::calcSize(size_t size) {
    size_t allocSize = size + sizeof(size_t);
    size_t BlockSize = MEM_BLOCK_SIZE;
    if (allocSize % BlockSize) allocSize = allocSize + (BlockSize - allocSize % BlockSize);
    return allocSize;
}

void MemoryAllocator::tryToMerge(MemoryAllocator::FreeMem *node) {
    if(!node) return;
    if (!node->next && node + node->size != node->next) return;

    node->size += node->next->size;
    node->next = node->next->next;
    if (node->next) node->next->prev = node;
}
