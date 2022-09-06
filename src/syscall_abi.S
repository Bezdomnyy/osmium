//0x01
.global mem_alloc
mem_alloc:
    mv a1, a0
    addi a0, x0, 0x01
    ecall
    ret

//0x02
.global mem_free
mem_free:
    addi a0, x0, 0x02
    ecall
    ret
