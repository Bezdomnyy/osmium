
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	65813103          	ld	sp,1624(sp) # 80004658 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	21d010ef          	jal	ra,80001a38 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <mem_alloc>:
.global mem_alloc
mem_alloc:
    mv a1, a0
    80001000:	00050593          	mv	a1,a0
    addi a0, zero, 0x01
    80001004:	00100513          	li	a0,1
    ecall
    80001008:	00000073          	ecall
    ret
    8000100c:	00008067          	ret

0000000080001010 <mem_free>:

.global mem_free
mem_free:
    mv a1, a0
    80001010:	00050593          	mv	a1,a0
    addi a0, zero, 0x02
    80001014:	00200513          	li	a0,2
    ecall
    80001018:	00000073          	ecall
    8000101c:	00008067          	ret

0000000080001020 <_ZN5RiscV13pushRegistersEv>:
.global _ZN5RiscV13pushRegistersEv
.type _ZN5RiscV13pushRegistersEv, @function

_ZN5RiscV13pushRegistersEv:
    addi sp, sp, -256
    80001020:	f0010113          	addi	sp,sp,-256
    .irp i, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\i, \i * 8 (sp)
    .endr
    80001024:	00313c23          	sd	gp,24(sp)
    80001028:	02413023          	sd	tp,32(sp)
    8000102c:	02513423          	sd	t0,40(sp)
    80001030:	02613823          	sd	t1,48(sp)
    80001034:	02713c23          	sd	t2,56(sp)
    80001038:	04813023          	sd	s0,64(sp)
    8000103c:	04913423          	sd	s1,72(sp)
    80001040:	04a13823          	sd	a0,80(sp)
    80001044:	04b13c23          	sd	a1,88(sp)
    80001048:	06c13023          	sd	a2,96(sp)
    8000104c:	06d13423          	sd	a3,104(sp)
    80001050:	06e13823          	sd	a4,112(sp)
    80001054:	06f13c23          	sd	a5,120(sp)
    80001058:	09013023          	sd	a6,128(sp)
    8000105c:	09113423          	sd	a7,136(sp)
    80001060:	09213823          	sd	s2,144(sp)
    80001064:	09313c23          	sd	s3,152(sp)
    80001068:	0b413023          	sd	s4,160(sp)
    8000106c:	0b513423          	sd	s5,168(sp)
    80001070:	0b613823          	sd	s6,176(sp)
    80001074:	0b713c23          	sd	s7,184(sp)
    80001078:	0d813023          	sd	s8,192(sp)
    8000107c:	0d913423          	sd	s9,200(sp)
    80001080:	0da13823          	sd	s10,208(sp)
    80001084:	0db13c23          	sd	s11,216(sp)
    80001088:	0fc13023          	sd	t3,224(sp)
    8000108c:	0fd13423          	sd	t4,232(sp)
    80001090:	0fe13823          	sd	t5,240(sp)
    80001094:	0ff13c23          	sd	t6,248(sp)
    ret
    80001098:	00008067          	ret

000000008000109c <_ZN5RiscV12popRegistersEv>:
.type _ZN5RiscV12popRegistersEv, @function

_ZN5RiscV12popRegistersEv:
    .irp i, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\i, \i * 8 (sp)
    .endr
    8000109c:	01813183          	ld	gp,24(sp)
    800010a0:	02013203          	ld	tp,32(sp)
    800010a4:	02813283          	ld	t0,40(sp)
    800010a8:	03013303          	ld	t1,48(sp)
    800010ac:	03813383          	ld	t2,56(sp)
    800010b0:	04013403          	ld	s0,64(sp)
    800010b4:	04813483          	ld	s1,72(sp)
    800010b8:	05013503          	ld	a0,80(sp)
    800010bc:	05813583          	ld	a1,88(sp)
    800010c0:	06013603          	ld	a2,96(sp)
    800010c4:	06813683          	ld	a3,104(sp)
    800010c8:	07013703          	ld	a4,112(sp)
    800010cc:	07813783          	ld	a5,120(sp)
    800010d0:	08013803          	ld	a6,128(sp)
    800010d4:	08813883          	ld	a7,136(sp)
    800010d8:	09013903          	ld	s2,144(sp)
    800010dc:	09813983          	ld	s3,152(sp)
    800010e0:	0a013a03          	ld	s4,160(sp)
    800010e4:	0a813a83          	ld	s5,168(sp)
    800010e8:	0b013b03          	ld	s6,176(sp)
    800010ec:	0b813b83          	ld	s7,184(sp)
    800010f0:	0c013c03          	ld	s8,192(sp)
    800010f4:	0c813c83          	ld	s9,200(sp)
    800010f8:	0d013d03          	ld	s10,208(sp)
    800010fc:	0d813d83          	ld	s11,216(sp)
    80001100:	0e013e03          	ld	t3,224(sp)
    80001104:	0e813e83          	ld	t4,232(sp)
    80001108:	0f013f03          	ld	t5,240(sp)
    8000110c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001110:	10010113          	addi	sp,sp,256
    ret
    80001114:	00008067          	ret

0000000080001118 <_ZN3CCB13contextSwitchEPNS_7ContextES1_>:


.global _ZN3CCB13contextSwitchEPNS_7ContextES1_
.type _ZN3CCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3CCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001118:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    8000111c:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001120:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001124:	0085b103          	ld	sp,8(a1)

    80001128:	00008067          	ret
    8000112c:	0000                	unimp
	...

0000000080001130 <_ZN6Kernel14supervisorTrapEv>:

.align 4
.global _ZN6Kernel14supervisorTrapEv
.type _ZN6Kernel14supervisorTrapEv, @function
_ZN6Kernel14supervisorTrapEv:
    addi sp, sp, -256
    80001130:	f0010113          	addi	sp,sp,-256
    .irp i, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\i, \i * 8(sp)
    .endr
    80001134:	00013023          	sd	zero,0(sp)
    80001138:	00113423          	sd	ra,8(sp)
    8000113c:	00213823          	sd	sp,16(sp)
    80001140:	00313c23          	sd	gp,24(sp)
    80001144:	02413023          	sd	tp,32(sp)
    80001148:	02513423          	sd	t0,40(sp)
    8000114c:	02613823          	sd	t1,48(sp)
    80001150:	02713c23          	sd	t2,56(sp)
    80001154:	04813023          	sd	s0,64(sp)
    80001158:	04913423          	sd	s1,72(sp)
    8000115c:	04a13823          	sd	a0,80(sp)
    80001160:	04b13c23          	sd	a1,88(sp)
    80001164:	06c13023          	sd	a2,96(sp)
    80001168:	06d13423          	sd	a3,104(sp)
    8000116c:	06e13823          	sd	a4,112(sp)
    80001170:	06f13c23          	sd	a5,120(sp)
    80001174:	09013023          	sd	a6,128(sp)
    80001178:	09113423          	sd	a7,136(sp)
    8000117c:	09213823          	sd	s2,144(sp)
    80001180:	09313c23          	sd	s3,152(sp)
    80001184:	0b413023          	sd	s4,160(sp)
    80001188:	0b513423          	sd	s5,168(sp)
    8000118c:	0b613823          	sd	s6,176(sp)
    80001190:	0b713c23          	sd	s7,184(sp)
    80001194:	0d813023          	sd	s8,192(sp)
    80001198:	0d913423          	sd	s9,200(sp)
    8000119c:	0da13823          	sd	s10,208(sp)
    800011a0:	0db13c23          	sd	s11,216(sp)
    800011a4:	0fc13023          	sd	t3,224(sp)
    800011a8:	0fd13423          	sd	t4,232(sp)
    800011ac:	0fe13823          	sd	t5,240(sp)
    800011b0:	0ff13c23          	sd	t6,248(sp)

    call _ZN6Kernel21supervisorTrapHandlerEv
    800011b4:	12c000ef          	jal	ra,800012e0 <_ZN6Kernel21supervisorTrapHandlerEv>



    .irp i, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\i, \i * 8(sp)
    .endr
    800011b8:	00013003          	ld	zero,0(sp)
    800011bc:	00813083          	ld	ra,8(sp)
    800011c0:	01013103          	ld	sp,16(sp)
    800011c4:	01813183          	ld	gp,24(sp)
    800011c8:	02013203          	ld	tp,32(sp)
    800011cc:	02813283          	ld	t0,40(sp)
    800011d0:	03013303          	ld	t1,48(sp)
    800011d4:	03813383          	ld	t2,56(sp)
    800011d8:	04013403          	ld	s0,64(sp)
    800011dc:	04813483          	ld	s1,72(sp)
    800011e0:	05013503          	ld	a0,80(sp)
    800011e4:	05813583          	ld	a1,88(sp)
    800011e8:	06013603          	ld	a2,96(sp)
    800011ec:	06813683          	ld	a3,104(sp)
    800011f0:	07013703          	ld	a4,112(sp)
    800011f4:	07813783          	ld	a5,120(sp)
    800011f8:	08013803          	ld	a6,128(sp)
    800011fc:	08813883          	ld	a7,136(sp)
    80001200:	09013903          	ld	s2,144(sp)
    80001204:	09813983          	ld	s3,152(sp)
    80001208:	0a013a03          	ld	s4,160(sp)
    8000120c:	0a813a83          	ld	s5,168(sp)
    80001210:	0b013b03          	ld	s6,176(sp)
    80001214:	0b813b83          	ld	s7,184(sp)
    80001218:	0c013c03          	ld	s8,192(sp)
    8000121c:	0c813c83          	ld	s9,200(sp)
    80001220:	0d013d03          	ld	s10,208(sp)
    80001224:	0d813d83          	ld	s11,216(sp)
    80001228:	0e013e03          	ld	t3,224(sp)
    8000122c:	0e813e83          	ld	t4,232(sp)
    80001230:	0f013f03          	ld	t5,240(sp)
    80001234:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001238:	10010113          	addi	sp,sp,256

    sret
    8000123c:	10200073          	sret

0000000080001240 <_ZN6Kernel10initKernelEv>:

#include "../h/kernel.h"
#include "../h/memory_allocator.h"
#include "../h/riscv.h"

void Kernel::initKernel() {
    80001240:	ff010113          	addi	sp,sp,-16
    80001244:	00113423          	sd	ra,8(sp)
    80001248:	00813023          	sd	s0,0(sp)
    8000124c:	01010413          	addi	s0,sp,16
    RiscV::writeStvec((uint64) &supervisorTrap);
    80001250:	00003797          	auipc	a5,0x3
    80001254:	4107b783          	ld	a5,1040(a5) # 80004660 <_GLOBAL_OFFSET_TABLE_+0x18>
    asm volatile("csrr %[stvec], stvec": [stvec] "=r" (stvec));
    return stvec;
}

inline void RiscV::writeStvec(uint64 stvec) {
    asm volatile("csrw stvec, %[stvec]":: [stvec] "r" (stvec));
    80001258:	10579073          	csrw	stvec,a5
    MemoryAllocator::initMem();
    8000125c:	00000097          	auipc	ra,0x0
    80001260:	334080e7          	jalr	820(ra) # 80001590 <_ZN15MemoryAllocator7initMemEv>
}
    80001264:	00813083          	ld	ra,8(sp)
    80001268:	00013403          	ld	s0,0(sp)
    8000126c:	01010113          	addi	sp,sp,16
    80001270:	00008067          	ret

0000000080001274 <_ZN6Kernel15syscall_handlerEv>:
    RiscV::clearSip(RiscV::SEIP);
    console_handler();
    RiscV::writeSepc(sepc);
}

void Kernel::syscall_handler() {
    80001274:	fe010113          	addi	sp,sp,-32
    80001278:	00113c23          	sd	ra,24(sp)
    8000127c:	00813823          	sd	s0,16(sp)
    80001280:	02010413          	addi	s0,sp,32
    //uint64 sepc = RiscV::readSepc();
    volatile uint64 syscall_id;
    asm volatile ("mv %[syscall_id], a0": [syscall_id] "=r" (syscall_id));
    80001284:	00050793          	mv	a5,a0
    80001288:	fef43423          	sd	a5,-24(s0)

    volatile uint64 arg0;
    switch(syscall_id) {
    8000128c:	fe843783          	ld	a5,-24(s0)
    80001290:	00100713          	li	a4,1
    80001294:	00e78e63          	beq	a5,a4,800012b0 <_ZN6Kernel15syscall_handlerEv+0x3c>
    80001298:	00200713          	li	a4,2
    8000129c:	02e78663          	beq	a5,a4,800012c8 <_ZN6Kernel15syscall_handlerEv+0x54>
            asm volatile ("mv %[arg0], a1": [arg0] "=r"(arg0));
            MemoryAllocator::free((void*)arg0);
            break;
    }
    //RiscV::writeSepc(sepc);
}
    800012a0:	01813083          	ld	ra,24(sp)
    800012a4:	01013403          	ld	s0,16(sp)
    800012a8:	02010113          	addi	sp,sp,32
    800012ac:	00008067          	ret
            asm volatile ("mv %[arg0], a1": [arg0] "=r"(arg0));
    800012b0:	00058793          	mv	a5,a1
    800012b4:	fef43023          	sd	a5,-32(s0)
            MemoryAllocator::allocate((size_t)arg0);
    800012b8:	fe043503          	ld	a0,-32(s0)
    800012bc:	00000097          	auipc	ra,0x0
    800012c0:	470080e7          	jalr	1136(ra) # 8000172c <_ZN15MemoryAllocator8allocateEm>
            break;
    800012c4:	fddff06f          	j	800012a0 <_ZN6Kernel15syscall_handlerEv+0x2c>
            asm volatile ("mv %[arg0], a1": [arg0] "=r"(arg0));
    800012c8:	00058793          	mv	a5,a1
    800012cc:	fef43023          	sd	a5,-32(s0)
            MemoryAllocator::free((void*)arg0);
    800012d0:	fe043503          	ld	a0,-32(s0)
    800012d4:	00000097          	auipc	ra,0x0
    800012d8:	4f8080e7          	jalr	1272(ra) # 800017cc <_ZN15MemoryAllocator4freeEPv>
}
    800012dc:	fc5ff06f          	j	800012a0 <_ZN6Kernel15syscall_handlerEv+0x2c>

00000000800012e0 <_ZN6Kernel21supervisorTrapHandlerEv>:
void Kernel::supervisorTrapHandler() {
    800012e0:	fc010113          	addi	sp,sp,-64
    800012e4:	02113c23          	sd	ra,56(sp)
    800012e8:	02813823          	sd	s0,48(sp)
    800012ec:	02913423          	sd	s1,40(sp)
    800012f0:	03213023          	sd	s2,32(sp)
    800012f4:	04010413          	addi	s0,sp,64
    asm volatile("csrr %[scause], scause": [scause] "=r" (scause));
    800012f8:	142027f3          	csrr	a5,scause
    800012fc:	fcf43023          	sd	a5,-64(s0)
    return scause;
    80001300:	fc043483          	ld	s1,-64(s0)
    if (scause == 0x08 || scause == 0x09) {
    80001304:	ff848713          	addi	a4,s1,-8
    80001308:	00100793          	li	a5,1
    8000130c:	08e7f063          	bgeu	a5,a4,8000138c <_ZN6Kernel21supervisorTrapHandlerEv+0xac>
    if (scause == 0x07) {
    80001310:	00700793          	li	a5,7
    80001314:	0af48463          	beq	s1,a5,800013bc <_ZN6Kernel21supervisorTrapHandlerEv+0xdc>
    asm volatile("csrr %[sepc], sepc": [sepc] "=r" (sepc));
    80001318:	141027f3          	csrr	a5,sepc
    8000131c:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80001320:	fd843903          	ld	s2,-40(s0)
    uint64 sepc = RiscV::readSepc() + 4;
    80001324:	00490913          	addi	s2,s2,4
    printString("Neobradjen izuzetak.\n");
    80001328:	00003517          	auipc	a0,0x3
    8000132c:	d2850513          	addi	a0,a0,-728 # 80004050 <CONSOLE_STATUS+0x40>
    80001330:	00000097          	auipc	ra,0x0
    80001334:	560080e7          	jalr	1376(ra) # 80001890 <_Z11printStringPKc>
    printString("scause: ");
    80001338:	00003517          	auipc	a0,0x3
    8000133c:	d0850513          	addi	a0,a0,-760 # 80004040 <CONSOLE_STATUS+0x30>
    80001340:	00000097          	auipc	ra,0x0
    80001344:	550080e7          	jalr	1360(ra) # 80001890 <_Z11printStringPKc>
    printUint64(scause);
    80001348:	00048513          	mv	a0,s1
    8000134c:	00000097          	auipc	ra,0x0
    80001350:	588080e7          	jalr	1416(ra) # 800018d4 <_Z11printUint64m>
    __putc('\n');
    80001354:	00a00513          	li	a0,10
    80001358:	00002097          	auipc	ra,0x2
    8000135c:	7a4080e7          	jalr	1956(ra) # 80003afc <__putc>
inline void RiscV::setSip(uint64 mask) {
    asm volatile("csrs sip, %[mask]":: [mask] "r" (mask));
}

inline void RiscV::clearSip(uint64 mask) {
    asm volatile("csrc sip, %[mask]":: [mask] "r" (mask));
    80001360:	20000793          	li	a5,512
    80001364:	1447b073          	csrc	sip,a5
    console_handler();
    80001368:	00003097          	auipc	ra,0x3
    8000136c:	808080e7          	jalr	-2040(ra) # 80003b70 <console_handler>
    asm volatile("csrw sepc, %[sepc]":: [sepc] "r" (sepc));
    80001370:	14191073          	csrw	sepc,s2
}
    80001374:	03813083          	ld	ra,56(sp)
    80001378:	03013403          	ld	s0,48(sp)
    8000137c:	02813483          	ld	s1,40(sp)
    80001380:	02013903          	ld	s2,32(sp)
    80001384:	04010113          	addi	sp,sp,64
    80001388:	00008067          	ret
    asm volatile("csrr %[sepc], sepc": [sepc] "=r" (sepc));
    8000138c:	141027f3          	csrr	a5,sepc
    80001390:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001394:	fc843483          	ld	s1,-56(s0)
        uint64 sepc = RiscV::readSepc() + 4;
    80001398:	00448493          	addi	s1,s1,4
    asm volatile("csrc sip, %[mask]":: [mask] "r" (mask));
    8000139c:	00200913          	li	s2,2
    800013a0:	14493073          	csrc	sip,s2
        syscall_handler();
    800013a4:	00000097          	auipc	ra,0x0
    800013a8:	ed0080e7          	jalr	-304(ra) # 80001274 <_ZN6Kernel15syscall_handlerEv>
        asm volatile ("sd a0, 80(s0)");
    800013ac:	04a43823          	sd	a0,80(s0)
    800013b0:	14493073          	csrc	sip,s2
    asm volatile("csrw sepc, %[sepc]":: [sepc] "r" (sepc));
    800013b4:	14149073          	csrw	sepc,s1
        return;
    800013b8:	fbdff06f          	j	80001374 <_ZN6Kernel21supervisorTrapHandlerEv+0x94>
    asm volatile("csrr %[sepc], sepc": [sepc] "=r" (sepc));
    800013bc:	141027f3          	csrr	a5,sepc
    800013c0:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    800013c4:	fd043903          	ld	s2,-48(s0)
        uint64 sepc = RiscV::readSepc() + 4;
    800013c8:	00490913          	addi	s2,s2,4
        printString("Nedozvoljena adresa upisa.\n");
    800013cc:	00003517          	auipc	a0,0x3
    800013d0:	c5450513          	addi	a0,a0,-940 # 80004020 <CONSOLE_STATUS+0x10>
    800013d4:	00000097          	auipc	ra,0x0
    800013d8:	4bc080e7          	jalr	1212(ra) # 80001890 <_Z11printStringPKc>
        printString("scause: ");
    800013dc:	00003517          	auipc	a0,0x3
    800013e0:	c6450513          	addi	a0,a0,-924 # 80004040 <CONSOLE_STATUS+0x30>
    800013e4:	00000097          	auipc	ra,0x0
    800013e8:	4ac080e7          	jalr	1196(ra) # 80001890 <_Z11printStringPKc>
        printUint64(scause);
    800013ec:	00048513          	mv	a0,s1
    800013f0:	00000097          	auipc	ra,0x0
    800013f4:	4e4080e7          	jalr	1252(ra) # 800018d4 <_Z11printUint64m>
        __putc('\n');
    800013f8:	00a00513          	li	a0,10
    800013fc:	00002097          	auipc	ra,0x2
    80001400:	700080e7          	jalr	1792(ra) # 80003afc <__putc>
    asm volatile("csrw sepc, %[sepc]":: [sepc] "r" (sepc));
    80001404:	14191073          	csrw	sepc,s2
        return;
    80001408:	f6dff06f          	j	80001374 <_ZN6Kernel21supervisorTrapHandlerEv+0x94>

000000008000140c <main>:
#include "../h/kernel.h"
#include "../h/riscv.h"
#include "../h/memory_allocator.h"


void main() {
    8000140c:	fe010113          	addi	sp,sp,-32
    80001410:	00113c23          	sd	ra,24(sp)
    80001414:	00813823          	sd	s0,16(sp)
    80001418:	00913423          	sd	s1,8(sp)
    8000141c:	01213023          	sd	s2,0(sp)
    80001420:	02010413          	addi	s0,sp,32
    Kernel::initKernel();
    80001424:	00000097          	auipc	ra,0x0
    80001428:	e1c080e7          	jalr	-484(ra) # 80001240 <_ZN6Kernel10initKernelEv>
    printString("Here");
    8000142c:	00003517          	auipc	a0,0x3
    80001430:	c3c50513          	addi	a0,a0,-964 # 80004068 <CONSOLE_STATUS+0x58>
    80001434:	00000097          	auipc	ra,0x0
    80001438:	45c080e7          	jalr	1116(ra) # 80001890 <_Z11printStringPKc>
    int *a = new int[100000000];
    8000143c:	17d78537          	lui	a0,0x17d78
    80001440:	40050513          	addi	a0,a0,1024 # 17d78400 <_entry-0x68287c00>
    80001444:	00000097          	auipc	ra,0x0
    80001448:	0d4080e7          	jalr	212(ra) # 80001518 <_Znam>
    8000144c:	00050913          	mv	s2,a0
    //a[0] = 48; a[1] = 49; a[2] = 50; a[3] = 51; a[4] = 52;
    for (int i = 0; i < 5; i++)
    80001450:	00000493          	li	s1,0
    80001454:	00400793          	li	a5,4
    80001458:	0297c063          	blt	a5,s1,80001478 <main+0x6c>
        __putc(a[i]);
    8000145c:	00249793          	slli	a5,s1,0x2
    80001460:	00f907b3          	add	a5,s2,a5
    80001464:	0007c503          	lbu	a0,0(a5)
    80001468:	00002097          	auipc	ra,0x2
    8000146c:	694080e7          	jalr	1684(ra) # 80003afc <__putc>
    for (int i = 0; i < 5; i++)
    80001470:	0014849b          	addiw	s1,s1,1
    80001474:	fe1ff06f          	j	80001454 <main+0x48>

    printString("Here");
    80001478:	00003517          	auipc	a0,0x3
    8000147c:	bf050513          	addi	a0,a0,-1040 # 80004068 <CONSOLE_STATUS+0x58>
    80001480:	00000097          	auipc	ra,0x0
    80001484:	410080e7          	jalr	1040(ra) # 80001890 <_Z11printStringPKc>
    delete[] a;
    80001488:	00090863          	beqz	s2,80001498 <main+0x8c>
    8000148c:	00090513          	mv	a0,s2
    80001490:	00000097          	auipc	ra,0x0
    80001494:	0d8080e7          	jalr	216(ra) # 80001568 <_ZdaPv>
    int *b = (int*) mem_alloc(sizeof (int));
    80001498:	00400513          	li	a0,4
    8000149c:	00000097          	auipc	ra,0x0
    800014a0:	b64080e7          	jalr	-1180(ra) # 80001000 <mem_alloc>
    800014a4:	00050493          	mv	s1,a0
    *b = 48;
    800014a8:	03000793          	li	a5,48
    800014ac:	00f52023          	sw	a5,0(a0)
    printString("Here");
    800014b0:	00003517          	auipc	a0,0x3
    800014b4:	bb850513          	addi	a0,a0,-1096 # 80004068 <CONSOLE_STATUS+0x58>
    800014b8:	00000097          	auipc	ra,0x0
    800014bc:	3d8080e7          	jalr	984(ra) # 80001890 <_Z11printStringPKc>
    __putc(*b);
    800014c0:	0004c503          	lbu	a0,0(s1)
    800014c4:	00002097          	auipc	ra,0x2
    800014c8:	638080e7          	jalr	1592(ra) # 80003afc <__putc>
    mem_free(b);
    800014cc:	00048513          	mv	a0,s1
    800014d0:	00000097          	auipc	ra,0x0
    800014d4:	b40080e7          	jalr	-1216(ra) # 80001010 <mem_free>
    800014d8:	01813083          	ld	ra,24(sp)
    800014dc:	01013403          	ld	s0,16(sp)
    800014e0:	00813483          	ld	s1,8(sp)
    800014e4:	00013903          	ld	s2,0(sp)
    800014e8:	02010113          	addi	sp,sp,32
    800014ec:	00008067          	ret

00000000800014f0 <_Znwm>:

#include "../h/syscall_c.h"

//using size_t = decltype(sizeof(0));

void *operator new(size_t n) {
    800014f0:	ff010113          	addi	sp,sp,-16
    800014f4:	00113423          	sd	ra,8(sp)
    800014f8:	00813023          	sd	s0,0(sp)
    800014fc:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001500:	00000097          	auipc	ra,0x0
    80001504:	b00080e7          	jalr	-1280(ra) # 80001000 <mem_alloc>
}
    80001508:	00813083          	ld	ra,8(sp)
    8000150c:	00013403          	ld	s0,0(sp)
    80001510:	01010113          	addi	sp,sp,16
    80001514:	00008067          	ret

0000000080001518 <_Znam>:

void *operator new[](size_t n) {
    80001518:	ff010113          	addi	sp,sp,-16
    8000151c:	00113423          	sd	ra,8(sp)
    80001520:	00813023          	sd	s0,0(sp)
    80001524:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001528:	00000097          	auipc	ra,0x0
    8000152c:	ad8080e7          	jalr	-1320(ra) # 80001000 <mem_alloc>
}
    80001530:	00813083          	ld	ra,8(sp)
    80001534:	00013403          	ld	s0,0(sp)
    80001538:	01010113          	addi	sp,sp,16
    8000153c:	00008067          	ret

0000000080001540 <_ZdlPv>:

void operator delete(void *p) noexcept {
    80001540:	ff010113          	addi	sp,sp,-16
    80001544:	00113423          	sd	ra,8(sp)
    80001548:	00813023          	sd	s0,0(sp)
    8000154c:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001550:	00000097          	auipc	ra,0x0
    80001554:	ac0080e7          	jalr	-1344(ra) # 80001010 <mem_free>
}
    80001558:	00813083          	ld	ra,8(sp)
    8000155c:	00013403          	ld	s0,0(sp)
    80001560:	01010113          	addi	sp,sp,16
    80001564:	00008067          	ret

0000000080001568 <_ZdaPv>:

void operator delete[](void *p) noexcept {
    80001568:	ff010113          	addi	sp,sp,-16
    8000156c:	00113423          	sd	ra,8(sp)
    80001570:	00813023          	sd	s0,0(sp)
    80001574:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001578:	00000097          	auipc	ra,0x0
    8000157c:	a98080e7          	jalr	-1384(ra) # 80001010 <mem_free>
    80001580:	00813083          	ld	ra,8(sp)
    80001584:	00013403          	ld	s0,0(sp)
    80001588:	01010113          	addi	sp,sp,16
    8000158c:	00008067          	ret

0000000080001590 <_ZN15MemoryAllocator7initMemEv>:
    tryToMerge(newNode);
    tryToMerge(curr);

}

void MemoryAllocator::initMem()  {
    80001590:	ff010113          	addi	sp,sp,-16
    80001594:	00813423          	sd	s0,8(sp)
    80001598:	01010413          	addi	s0,sp,16
    fMemHead = (FreeMem*)HEAP_START_ADDR;
    8000159c:	00003797          	auipc	a5,0x3
    800015a0:	0b47b783          	ld	a5,180(a5) # 80004650 <_GLOBAL_OFFSET_TABLE_+0x8>
    800015a4:	0007b783          	ld	a5,0(a5)
    800015a8:	00003697          	auipc	a3,0x3
    800015ac:	10868693          	addi	a3,a3,264 # 800046b0 <_ZN15MemoryAllocator8fMemHeadE>
    800015b0:	00f6b023          	sd	a5,0(a3)
    fMemHead->size = (size_t) ((uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR );
    800015b4:	00003717          	auipc	a4,0x3
    800015b8:	0b473703          	ld	a4,180(a4) # 80004668 <_GLOBAL_OFFSET_TABLE_+0x20>
    800015bc:	00073703          	ld	a4,0(a4)
    800015c0:	40f70733          	sub	a4,a4,a5
    800015c4:	00e7b023          	sd	a4,0(a5)
    /*fMemHead->prev = fMemHead;
    fMemHead->next = fMemHead;*/
    fMemHead->prev = nullptr;
    800015c8:	0006b783          	ld	a5,0(a3)
    800015cc:	0007b423          	sd	zero,8(a5)
    fMemHead->next = nullptr;
    800015d0:	0007b823          	sd	zero,16(a5)
}
    800015d4:	00813403          	ld	s0,8(sp)
    800015d8:	01010113          	addi	sp,sp,16
    800015dc:	00008067          	ret

00000000800015e0 <_ZN15MemoryAllocator8firstFitEm>:

MemoryAllocator::FreeMem *MemoryAllocator::firstFit(size_t size) {
    800015e0:	ff010113          	addi	sp,sp,-16
    800015e4:	00813423          	sd	s0,8(sp)
    800015e8:	01010413          	addi	s0,sp,16
    800015ec:	00050613          	mv	a2,a0
    FreeMem* curr = fMemHead;
    800015f0:	00003517          	auipc	a0,0x3
    800015f4:	0c053503          	ld	a0,192(a0) # 800046b0 <_ZN15MemoryAllocator8fMemHeadE>
    for(; curr && curr->next; curr = curr->next)
    800015f8:	02050063          	beqz	a0,80001618 <_ZN15MemoryAllocator8firstFitEm+0x38>
    800015fc:	01053703          	ld	a4,16(a0)
    80001600:	00070c63          	beqz	a4,80001618 <_ZN15MemoryAllocator8firstFitEm+0x38>
        if (size + sizeof(size_t) <= curr->size) return curr;
    80001604:	00860793          	addi	a5,a2,8
    80001608:	00053683          	ld	a3,0(a0)
    8000160c:	00f6fe63          	bgeu	a3,a5,80001628 <_ZN15MemoryAllocator8firstFitEm+0x48>
    for(; curr && curr->next; curr = curr->next)
    80001610:	00070513          	mv	a0,a4
    80001614:	fe5ff06f          	j	800015f8 <_ZN15MemoryAllocator8firstFitEm+0x18>
    if (curr && (size + sizeof(size_t) <= curr->size)) return curr;
    80001618:	00050863          	beqz	a0,80001628 <_ZN15MemoryAllocator8firstFitEm+0x48>
    8000161c:	00860613          	addi	a2,a2,8
    80001620:	00053783          	ld	a5,0(a0)
    80001624:	00c7e863          	bltu	a5,a2,80001634 <_ZN15MemoryAllocator8firstFitEm+0x54>
    return nullptr;
}
    80001628:	00813403          	ld	s0,8(sp)
    8000162c:	01010113          	addi	sp,sp,16
    80001630:	00008067          	ret
    return nullptr;
    80001634:	00000513          	li	a0,0
    80001638:	ff1ff06f          	j	80001628 <_ZN15MemoryAllocator8firstFitEm+0x48>

000000008000163c <_ZN15MemoryAllocator8calcSizeEm>:

    }
    return ret;
}

size_t MemoryAllocator::calcSize(size_t size) {
    8000163c:	ff010113          	addi	sp,sp,-16
    80001640:	00813423          	sd	s0,8(sp)
    80001644:	01010413          	addi	s0,sp,16
    size_t allocSize = size + sizeof(size_t);
    80001648:	00850513          	addi	a0,a0,8
    size_t BlockSize = MEM_BLOCK_SIZE;
    if (allocSize % BlockSize) allocSize = allocSize + (BlockSize - allocSize % BlockSize);
    8000164c:	03f57793          	andi	a5,a0,63
    80001650:	00078863          	beqz	a5,80001660 <_ZN15MemoryAllocator8calcSizeEm+0x24>
    80001654:	04000713          	li	a4,64
    80001658:	40f707b3          	sub	a5,a4,a5
    8000165c:	00f50533          	add	a0,a0,a5
    return allocSize;
}
    80001660:	00813403          	ld	s0,8(sp)
    80001664:	01010113          	addi	sp,sp,16
    80001668:	00008067          	ret

000000008000166c <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm>:
void *MemoryAllocator::allocBlocks(MemoryAllocator::FreeMem *node, size_t size) {
    8000166c:	fe010113          	addi	sp,sp,-32
    80001670:	00113c23          	sd	ra,24(sp)
    80001674:	00813823          	sd	s0,16(sp)
    80001678:	00913423          	sd	s1,8(sp)
    8000167c:	02010413          	addi	s0,sp,32
    80001680:	00050493          	mv	s1,a0
    if (node) {
    80001684:	04050c63          	beqz	a0,800016dc <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm+0x70>
    80001688:	00058513          	mv	a0,a1
        size_t allocSize = calcSize(size);
    8000168c:	00000097          	auipc	ra,0x0
    80001690:	fb0080e7          	jalr	-80(ra) # 8000163c <_ZN15MemoryAllocator8calcSizeEm>
        if (node->size - allocSize >= MEM_BLOCK_SIZE) {
    80001694:	0004b783          	ld	a5,0(s1)
    80001698:	40a787b3          	sub	a5,a5,a0
    8000169c:	03f00713          	li	a4,63
    800016a0:	04f77e63          	bgeu	a4,a5,800016fc <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm+0x90>
            newNode = (FreeMem*)((uint64)node + (uint64)allocSize);
    800016a4:	00a48733          	add	a4,s1,a0
            newNode->size = node->size - allocSize;
    800016a8:	00f73023          	sd	a5,0(a4)
            if (node->prev) node->prev->next = newNode;
    800016ac:	0084b783          	ld	a5,8(s1)
    800016b0:	04078063          	beqz	a5,800016f0 <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm+0x84>
    800016b4:	00e7b823          	sd	a4,16(a5)
            if (node->next) node->next->prev = newNode;
    800016b8:	0104b783          	ld	a5,16(s1)
    800016bc:	00078463          	beqz	a5,800016c4 <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm+0x58>
    800016c0:	00e7b423          	sd	a4,8(a5)
            newNode->next = node->next;
    800016c4:	0104b783          	ld	a5,16(s1)
    800016c8:	00f73823          	sd	a5,16(a4)
            newNode->prev = node->prev;
    800016cc:	0084b783          	ld	a5,8(s1)
    800016d0:	00f73423          	sd	a5,8(a4)
        *(size_t*)node = allocSize;
    800016d4:	00a4b023          	sd	a0,0(s1)
        ret = (void*)((uint64)node + sizeof(size_t));
    800016d8:	00848513          	addi	a0,s1,8
}
    800016dc:	01813083          	ld	ra,24(sp)
    800016e0:	01013403          	ld	s0,16(sp)
    800016e4:	00813483          	ld	s1,8(sp)
    800016e8:	02010113          	addi	sp,sp,32
    800016ec:	00008067          	ret
            else fMemHead = newNode;
    800016f0:	00003797          	auipc	a5,0x3
    800016f4:	fce7b023          	sd	a4,-64(a5) # 800046b0 <_ZN15MemoryAllocator8fMemHeadE>
    800016f8:	fc1ff06f          	j	800016b8 <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm+0x4c>
            if (node->prev) node->prev->next = node->next;
    800016fc:	0084b783          	ld	a5,8(s1)
    80001700:	02078063          	beqz	a5,80001720 <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm+0xb4>
    80001704:	0104b703          	ld	a4,16(s1)
    80001708:	00e7b823          	sd	a4,16(a5)
            if (node->next) node->next->prev = node->prev;
    8000170c:	0104b783          	ld	a5,16(s1)
    80001710:	fc0782e3          	beqz	a5,800016d4 <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm+0x68>
    80001714:	0084b703          	ld	a4,8(s1)
    80001718:	00e7b423          	sd	a4,8(a5)
    8000171c:	fb9ff06f          	j	800016d4 <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm+0x68>
            else fMemHead = newNode;
    80001720:	00003797          	auipc	a5,0x3
    80001724:	f807b823          	sd	zero,-112(a5) # 800046b0 <_ZN15MemoryAllocator8fMemHeadE>
    80001728:	fe5ff06f          	j	8000170c <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm+0xa0>

000000008000172c <_ZN15MemoryAllocator8allocateEm>:
void *MemoryAllocator::allocate(size_t size) {
    8000172c:	fe010113          	addi	sp,sp,-32
    80001730:	00113c23          	sd	ra,24(sp)
    80001734:	00813823          	sd	s0,16(sp)
    80001738:	00913423          	sd	s1,8(sp)
    8000173c:	02010413          	addi	s0,sp,32
    80001740:	00050493          	mv	s1,a0
    return allocBlocks(firstFit(size), size);
    80001744:	00000097          	auipc	ra,0x0
    80001748:	e9c080e7          	jalr	-356(ra) # 800015e0 <_ZN15MemoryAllocator8firstFitEm>
    8000174c:	00048593          	mv	a1,s1
    80001750:	00000097          	auipc	ra,0x0
    80001754:	f1c080e7          	jalr	-228(ra) # 8000166c <_ZN15MemoryAllocator11allocBlocksEPNS_7FreeMemEm>
}
    80001758:	01813083          	ld	ra,24(sp)
    8000175c:	01013403          	ld	s0,16(sp)
    80001760:	00813483          	ld	s1,8(sp)
    80001764:	02010113          	addi	sp,sp,32
    80001768:	00008067          	ret

000000008000176c <_ZN15MemoryAllocator10tryToMergeEPNS_7FreeMemE>:

void MemoryAllocator::tryToMerge(MemoryAllocator::FreeMem *node) {
    8000176c:	ff010113          	addi	sp,sp,-16
    80001770:	00813423          	sd	s0,8(sp)
    80001774:	01010413          	addi	s0,sp,16
    if(!node) return;
    80001778:	02050663          	beqz	a0,800017a4 <_ZN15MemoryAllocator10tryToMergeEPNS_7FreeMemE+0x38>
    if (!node->next && node + node->size != node->next) return;
    8000177c:	01053783          	ld	a5,16(a0)
    80001780:	02078863          	beqz	a5,800017b0 <_ZN15MemoryAllocator10tryToMergeEPNS_7FreeMemE+0x44>

    node->size += node->next->size;
    80001784:	0007b683          	ld	a3,0(a5)
    80001788:	00053703          	ld	a4,0(a0)
    8000178c:	00d70733          	add	a4,a4,a3
    80001790:	00e53023          	sd	a4,0(a0)
    node->next = node->next->next;
    80001794:	0107b783          	ld	a5,16(a5)
    80001798:	00f53823          	sd	a5,16(a0)
    if (node->next) node->next->prev = node;
    8000179c:	00078463          	beqz	a5,800017a4 <_ZN15MemoryAllocator10tryToMergeEPNS_7FreeMemE+0x38>
    800017a0:	00a7b423          	sd	a0,8(a5)
}
    800017a4:	00813403          	ld	s0,8(sp)
    800017a8:	01010113          	addi	sp,sp,16
    800017ac:	00008067          	ret
    if (!node->next && node + node->size != node->next) return;
    800017b0:	00053683          	ld	a3,0(a0)
    800017b4:	00169713          	slli	a4,a3,0x1
    800017b8:	00d70733          	add	a4,a4,a3
    800017bc:	00371713          	slli	a4,a4,0x3
    800017c0:	00e50733          	add	a4,a0,a4
    800017c4:	fee790e3          	bne	a5,a4,800017a4 <_ZN15MemoryAllocator10tryToMergeEPNS_7FreeMemE+0x38>
    800017c8:	fbdff06f          	j	80001784 <_ZN15MemoryAllocator10tryToMergeEPNS_7FreeMemE+0x18>

00000000800017cc <_ZN15MemoryAllocator4freeEPv>:
void MemoryAllocator::free(void* addr) {
    800017cc:	fe010113          	addi	sp,sp,-32
    800017d0:	00113c23          	sd	ra,24(sp)
    800017d4:	00813823          	sd	s0,16(sp)
    800017d8:	00913423          	sd	s1,8(sp)
    800017dc:	02010413          	addi	s0,sp,32
    addr = (void*)((uint64)addr - sizeof(size_t));
    800017e0:	ff850513          	addi	a0,a0,-8
    if (fMemHead && addr>(void*)fMemHead)
    800017e4:	00003717          	auipc	a4,0x3
    800017e8:	ecc73703          	ld	a4,-308(a4) # 800046b0 <_ZN15MemoryAllocator8fMemHeadE>
    800017ec:	02070063          	beqz	a4,8000180c <_ZN15MemoryAllocator4freeEPv+0x40>
    800017f0:	02a77263          	bgeu	a4,a0,80001814 <_ZN15MemoryAllocator4freeEPv+0x48>
        for(curr = fMemHead; curr->next != 0 && (void*)curr->next < addr; curr = curr->next);
    800017f4:	00070793          	mv	a5,a4
    800017f8:	00078493          	mv	s1,a5
    800017fc:	0107b783          	ld	a5,16(a5)
    80001800:	00078c63          	beqz	a5,80001818 <_ZN15MemoryAllocator4freeEPv+0x4c>
    80001804:	fea7eae3          	bltu	a5,a0,800017f8 <_ZN15MemoryAllocator4freeEPv+0x2c>
    80001808:	0100006f          	j	80001818 <_ZN15MemoryAllocator4freeEPv+0x4c>
    FreeMem* curr = nullptr;
    8000180c:	00070493          	mv	s1,a4
    80001810:	0080006f          	j	80001818 <_ZN15MemoryAllocator4freeEPv+0x4c>
    80001814:	00000493          	li	s1,0
    newNode->prev = curr;
    80001818:	00953423          	sd	s1,8(a0)
    if (curr) newNode->next = curr->next, curr->next = newNode;
    8000181c:	04048263          	beqz	s1,80001860 <_ZN15MemoryAllocator4freeEPv+0x94>
    80001820:	0104b783          	ld	a5,16(s1)
    80001824:	00f53823          	sd	a5,16(a0)
    80001828:	00a4b823          	sd	a0,16(s1)
    if (newNode->next) newNode->next->prev = newNode;
    8000182c:	01053783          	ld	a5,16(a0)
    80001830:	00078463          	beqz	a5,80001838 <_ZN15MemoryAllocator4freeEPv+0x6c>
    80001834:	00a7b423          	sd	a0,8(a5)
    tryToMerge(newNode);
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	f34080e7          	jalr	-204(ra) # 8000176c <_ZN15MemoryAllocator10tryToMergeEPNS_7FreeMemE>
    tryToMerge(curr);
    80001840:	00048513          	mv	a0,s1
    80001844:	00000097          	auipc	ra,0x0
    80001848:	f28080e7          	jalr	-216(ra) # 8000176c <_ZN15MemoryAllocator10tryToMergeEPNS_7FreeMemE>
}
    8000184c:	01813083          	ld	ra,24(sp)
    80001850:	01013403          	ld	s0,16(sp)
    80001854:	00813483          	ld	s1,8(sp)
    80001858:	02010113          	addi	sp,sp,32
    8000185c:	00008067          	ret
    else newNode->next = fMemHead, fMemHead = newNode;
    80001860:	00e53823          	sd	a4,16(a0)
    80001864:	00003797          	auipc	a5,0x3
    80001868:	e4a7b623          	sd	a0,-436(a5) # 800046b0 <_ZN15MemoryAllocator8fMemHeadE>
    8000186c:	fc1ff06f          	j	8000182c <_ZN15MemoryAllocator4freeEPv+0x60>

0000000080001870 <_ZN5RiscV10popSppSpieEv>:
// definition of: 'inline void RiscV::pushRegisters();' is in util.S

// definition of: 'inline void RiscV::popRegisters();' is in util.S

void RiscV::popSppSpie()
{
    80001870:	ff010113          	addi	sp,sp,-16
    80001874:	00813423          	sd	s0,8(sp)
    80001878:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    8000187c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001880:	10200073          	sret
    80001884:	00813403          	ld	s0,8(sp)
    80001888:	01010113          	addi	sp,sp,16
    8000188c:	00008067          	ret

0000000080001890 <_Z11printStringPKc>:

#include "../h/print.h"
#include "../h/riscv.h"
#include "../lib/console.h"

void printString(char const *string) {
    80001890:	fe010113          	addi	sp,sp,-32
    80001894:	00113c23          	sd	ra,24(sp)
    80001898:	00813823          	sd	s0,16(sp)
    8000189c:	00913423          	sd	s1,8(sp)
    800018a0:	02010413          	addi	s0,sp,32
    800018a4:	00050493          	mv	s1,a0
    for (char const *c = string; *c != '\0'; c++) __putc(*c);
    800018a8:	0004c503          	lbu	a0,0(s1)
    800018ac:	00050a63          	beqz	a0,800018c0 <_Z11printStringPKc+0x30>
    800018b0:	00002097          	auipc	ra,0x2
    800018b4:	24c080e7          	jalr	588(ra) # 80003afc <__putc>
    800018b8:	00148493          	addi	s1,s1,1
    800018bc:	fedff06f          	j	800018a8 <_Z11printStringPKc+0x18>
}
    800018c0:	01813083          	ld	ra,24(sp)
    800018c4:	01013403          	ld	s0,16(sp)
    800018c8:	00813483          	ld	s1,8(sp)
    800018cc:	02010113          	addi	sp,sp,32
    800018d0:	00008067          	ret

00000000800018d4 <_Z11printUint64m>:

void printUint64(uint64 integer) {
    800018d4:	fc010113          	addi	sp,sp,-64
    800018d8:	02113c23          	sd	ra,56(sp)
    800018dc:	02813823          	sd	s0,48(sp)
    800018e0:	02913423          	sd	s1,40(sp)
    800018e4:	04010413          	addi	s0,sp,64
    static char digits[] = "0123456789";
    char output[20];
    int i = 0;
    800018e8:	00000493          	li	s1,0
    do {
        output[i++] = digits[integer % 10];
    800018ec:	00a00693          	li	a3,10
    800018f0:	02d57633          	remu	a2,a0,a3
    800018f4:	00002717          	auipc	a4,0x2
    800018f8:	77c70713          	addi	a4,a4,1916 # 80004070 <_ZZ11printUint64mE6digits>
    800018fc:	00c70733          	add	a4,a4,a2
    80001900:	00074703          	lbu	a4,0(a4)
    80001904:	fe040613          	addi	a2,s0,-32
    80001908:	009607b3          	add	a5,a2,s1
    8000190c:	0014849b          	addiw	s1,s1,1
    80001910:	fee78423          	sb	a4,-24(a5)
    } while ((integer/=10) != 0);
    80001914:	00050713          	mv	a4,a0
    80001918:	02d55533          	divu	a0,a0,a3
    8000191c:	00900793          	li	a5,9
    80001920:	fce7e6e3          	bltu	a5,a4,800018ec <_Z11printUint64m+0x18>
    while(--i >= 0) __putc(output[i]);
    80001924:	fff4849b          	addiw	s1,s1,-1
    80001928:	0004ce63          	bltz	s1,80001944 <_Z11printUint64m+0x70>
    8000192c:	fe040793          	addi	a5,s0,-32
    80001930:	009787b3          	add	a5,a5,s1
    80001934:	fe87c503          	lbu	a0,-24(a5)
    80001938:	00002097          	auipc	ra,0x2
    8000193c:	1c4080e7          	jalr	452(ra) # 80003afc <__putc>
    80001940:	fe5ff06f          	j	80001924 <_Z11printUint64m+0x50>
}
    80001944:	03813083          	ld	ra,56(sp)
    80001948:	03013403          	ld	s0,48(sp)
    8000194c:	02813483          	ld	s1,40(sp)
    80001950:	04010113          	addi	sp,sp,64
    80001954:	00008067          	ret

0000000080001958 <_Z8printIntx>:

void printInt(long long int integer) {
    80001958:	fe010113          	addi	sp,sp,-32
    8000195c:	00113c23          	sd	ra,24(sp)
    80001960:	00813823          	sd	s0,16(sp)
    80001964:	00913423          	sd	s1,8(sp)
    80001968:	02010413          	addi	s0,sp,32
    8000196c:	00050493          	mv	s1,a0
    if (integer < 0) __putc('-'), integer *= -1;
    80001970:	02054263          	bltz	a0,80001994 <_Z8printIntx+0x3c>
    printUint64(integer);
    80001974:	00048513          	mv	a0,s1
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	f5c080e7          	jalr	-164(ra) # 800018d4 <_Z11printUint64m>
}
    80001980:	01813083          	ld	ra,24(sp)
    80001984:	01013403          	ld	s0,16(sp)
    80001988:	00813483          	ld	s1,8(sp)
    8000198c:	02010113          	addi	sp,sp,32
    80001990:	00008067          	ret
    if (integer < 0) __putc('-'), integer *= -1;
    80001994:	02d00513          	li	a0,45
    80001998:	00002097          	auipc	ra,0x2
    8000199c:	164080e7          	jalr	356(ra) # 80003afc <__putc>
    800019a0:	409004b3          	neg	s1,s1
    800019a4:	fd1ff06f          	j	80001974 <_Z8printIntx+0x1c>

00000000800019a8 <_Z12printIntegerm>:

void printInteger(uint64 integer)
{
    800019a8:	fd010113          	addi	sp,sp,-48
    800019ac:	02113423          	sd	ra,40(sp)
    800019b0:	02813023          	sd	s0,32(sp)
    800019b4:	00913c23          	sd	s1,24(sp)
    800019b8:	03010413          	addi	s0,sp,48
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    800019bc:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800019c0:	00000493          	li	s1,0
    do
    {
        buf[i++] = digits[x % 10];
    800019c4:	00a00613          	li	a2,10
    800019c8:	02c5773b          	remuw	a4,a0,a2
    800019cc:	02071693          	slli	a3,a4,0x20
    800019d0:	0206d693          	srli	a3,a3,0x20
    800019d4:	00002717          	auipc	a4,0x2
    800019d8:	69c70713          	addi	a4,a4,1692 # 80004070 <_ZZ11printUint64mE6digits>
    800019dc:	00d70733          	add	a4,a4,a3
    800019e0:	01074703          	lbu	a4,16(a4)
    800019e4:	fe040693          	addi	a3,s0,-32
    800019e8:	009687b3          	add	a5,a3,s1
    800019ec:	0014849b          	addiw	s1,s1,1
    800019f0:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800019f4:	0005071b          	sext.w	a4,a0
    800019f8:	02c5553b          	divuw	a0,a0,a2
    800019fc:	00900793          	li	a5,9
    80001a00:	fce7e2e3          	bltu	a5,a4,800019c4 <_Z12printIntegerm+0x1c>
    if (neg)
        buf[i++] = '-';

    while (--i >= 0)
    80001a04:	fff4849b          	addiw	s1,s1,-1
    80001a08:	0004ce63          	bltz	s1,80001a24 <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    80001a0c:	fe040793          	addi	a5,s0,-32
    80001a10:	009787b3          	add	a5,a5,s1
    80001a14:	ff07c503          	lbu	a0,-16(a5)
    80001a18:	00002097          	auipc	ra,0x2
    80001a1c:	0e4080e7          	jalr	228(ra) # 80003afc <__putc>
    80001a20:	fe5ff06f          	j	80001a04 <_Z12printIntegerm+0x5c>
    80001a24:	02813083          	ld	ra,40(sp)
    80001a28:	02013403          	ld	s0,32(sp)
    80001a2c:	01813483          	ld	s1,24(sp)
    80001a30:	03010113          	addi	sp,sp,48
    80001a34:	00008067          	ret

0000000080001a38 <start>:
    80001a38:	ff010113          	addi	sp,sp,-16
    80001a3c:	00813423          	sd	s0,8(sp)
    80001a40:	01010413          	addi	s0,sp,16
    80001a44:	300027f3          	csrr	a5,mstatus
    80001a48:	ffffe737          	lui	a4,0xffffe
    80001a4c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff8edf>
    80001a50:	00e7f7b3          	and	a5,a5,a4
    80001a54:	00001737          	lui	a4,0x1
    80001a58:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001a5c:	00e7e7b3          	or	a5,a5,a4
    80001a60:	30079073          	csrw	mstatus,a5
    80001a64:	00000797          	auipc	a5,0x0
    80001a68:	16078793          	addi	a5,a5,352 # 80001bc4 <system_main>
    80001a6c:	34179073          	csrw	mepc,a5
    80001a70:	00000793          	li	a5,0
    80001a74:	18079073          	csrw	satp,a5
    80001a78:	000107b7          	lui	a5,0x10
    80001a7c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001a80:	30279073          	csrw	medeleg,a5
    80001a84:	30379073          	csrw	mideleg,a5
    80001a88:	104027f3          	csrr	a5,sie
    80001a8c:	2227e793          	ori	a5,a5,546
    80001a90:	10479073          	csrw	sie,a5
    80001a94:	fff00793          	li	a5,-1
    80001a98:	00a7d793          	srli	a5,a5,0xa
    80001a9c:	3b079073          	csrw	pmpaddr0,a5
    80001aa0:	00f00793          	li	a5,15
    80001aa4:	3a079073          	csrw	pmpcfg0,a5
    80001aa8:	f14027f3          	csrr	a5,mhartid
    80001aac:	0200c737          	lui	a4,0x200c
    80001ab0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001ab4:	0007869b          	sext.w	a3,a5
    80001ab8:	00269713          	slli	a4,a3,0x2
    80001abc:	000f4637          	lui	a2,0xf4
    80001ac0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001ac4:	00d70733          	add	a4,a4,a3
    80001ac8:	0037979b          	slliw	a5,a5,0x3
    80001acc:	020046b7          	lui	a3,0x2004
    80001ad0:	00d787b3          	add	a5,a5,a3
    80001ad4:	00c585b3          	add	a1,a1,a2
    80001ad8:	00371693          	slli	a3,a4,0x3
    80001adc:	00003717          	auipc	a4,0x3
    80001ae0:	be470713          	addi	a4,a4,-1052 # 800046c0 <timer_scratch>
    80001ae4:	00b7b023          	sd	a1,0(a5)
    80001ae8:	00d70733          	add	a4,a4,a3
    80001aec:	00f73c23          	sd	a5,24(a4)
    80001af0:	02c73023          	sd	a2,32(a4)
    80001af4:	34071073          	csrw	mscratch,a4
    80001af8:	00000797          	auipc	a5,0x0
    80001afc:	6e878793          	addi	a5,a5,1768 # 800021e0 <timervec>
    80001b00:	30579073          	csrw	mtvec,a5
    80001b04:	300027f3          	csrr	a5,mstatus
    80001b08:	0087e793          	ori	a5,a5,8
    80001b0c:	30079073          	csrw	mstatus,a5
    80001b10:	304027f3          	csrr	a5,mie
    80001b14:	0807e793          	ori	a5,a5,128
    80001b18:	30479073          	csrw	mie,a5
    80001b1c:	f14027f3          	csrr	a5,mhartid
    80001b20:	0007879b          	sext.w	a5,a5
    80001b24:	00078213          	mv	tp,a5
    80001b28:	30200073          	mret
    80001b2c:	00813403          	ld	s0,8(sp)
    80001b30:	01010113          	addi	sp,sp,16
    80001b34:	00008067          	ret

0000000080001b38 <timerinit>:
    80001b38:	ff010113          	addi	sp,sp,-16
    80001b3c:	00813423          	sd	s0,8(sp)
    80001b40:	01010413          	addi	s0,sp,16
    80001b44:	f14027f3          	csrr	a5,mhartid
    80001b48:	0200c737          	lui	a4,0x200c
    80001b4c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001b50:	0007869b          	sext.w	a3,a5
    80001b54:	00269713          	slli	a4,a3,0x2
    80001b58:	000f4637          	lui	a2,0xf4
    80001b5c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001b60:	00d70733          	add	a4,a4,a3
    80001b64:	0037979b          	slliw	a5,a5,0x3
    80001b68:	020046b7          	lui	a3,0x2004
    80001b6c:	00d787b3          	add	a5,a5,a3
    80001b70:	00c585b3          	add	a1,a1,a2
    80001b74:	00371693          	slli	a3,a4,0x3
    80001b78:	00003717          	auipc	a4,0x3
    80001b7c:	b4870713          	addi	a4,a4,-1208 # 800046c0 <timer_scratch>
    80001b80:	00b7b023          	sd	a1,0(a5)
    80001b84:	00d70733          	add	a4,a4,a3
    80001b88:	00f73c23          	sd	a5,24(a4)
    80001b8c:	02c73023          	sd	a2,32(a4)
    80001b90:	34071073          	csrw	mscratch,a4
    80001b94:	00000797          	auipc	a5,0x0
    80001b98:	64c78793          	addi	a5,a5,1612 # 800021e0 <timervec>
    80001b9c:	30579073          	csrw	mtvec,a5
    80001ba0:	300027f3          	csrr	a5,mstatus
    80001ba4:	0087e793          	ori	a5,a5,8
    80001ba8:	30079073          	csrw	mstatus,a5
    80001bac:	304027f3          	csrr	a5,mie
    80001bb0:	0807e793          	ori	a5,a5,128
    80001bb4:	30479073          	csrw	mie,a5
    80001bb8:	00813403          	ld	s0,8(sp)
    80001bbc:	01010113          	addi	sp,sp,16
    80001bc0:	00008067          	ret

0000000080001bc4 <system_main>:
    80001bc4:	fe010113          	addi	sp,sp,-32
    80001bc8:	00813823          	sd	s0,16(sp)
    80001bcc:	00913423          	sd	s1,8(sp)
    80001bd0:	00113c23          	sd	ra,24(sp)
    80001bd4:	02010413          	addi	s0,sp,32
    80001bd8:	00000097          	auipc	ra,0x0
    80001bdc:	0c4080e7          	jalr	196(ra) # 80001c9c <cpuid>
    80001be0:	00003497          	auipc	s1,0x3
    80001be4:	aa048493          	addi	s1,s1,-1376 # 80004680 <started>
    80001be8:	02050263          	beqz	a0,80001c0c <system_main+0x48>
    80001bec:	0004a783          	lw	a5,0(s1)
    80001bf0:	0007879b          	sext.w	a5,a5
    80001bf4:	fe078ce3          	beqz	a5,80001bec <system_main+0x28>
    80001bf8:	0ff0000f          	fence
    80001bfc:	00002517          	auipc	a0,0x2
    80001c00:	4c450513          	addi	a0,a0,1220 # 800040c0 <_ZZ12printIntegermE6digits+0x40>
    80001c04:	00001097          	auipc	ra,0x1
    80001c08:	a78080e7          	jalr	-1416(ra) # 8000267c <panic>
    80001c0c:	00001097          	auipc	ra,0x1
    80001c10:	9cc080e7          	jalr	-1588(ra) # 800025d8 <consoleinit>
    80001c14:	00001097          	auipc	ra,0x1
    80001c18:	158080e7          	jalr	344(ra) # 80002d6c <printfinit>
    80001c1c:	00002517          	auipc	a0,0x2
    80001c20:	58450513          	addi	a0,a0,1412 # 800041a0 <_ZZ12printIntegermE6digits+0x120>
    80001c24:	00001097          	auipc	ra,0x1
    80001c28:	ab4080e7          	jalr	-1356(ra) # 800026d8 <__printf>
    80001c2c:	00002517          	auipc	a0,0x2
    80001c30:	46450513          	addi	a0,a0,1124 # 80004090 <_ZZ12printIntegermE6digits+0x10>
    80001c34:	00001097          	auipc	ra,0x1
    80001c38:	aa4080e7          	jalr	-1372(ra) # 800026d8 <__printf>
    80001c3c:	00002517          	auipc	a0,0x2
    80001c40:	56450513          	addi	a0,a0,1380 # 800041a0 <_ZZ12printIntegermE6digits+0x120>
    80001c44:	00001097          	auipc	ra,0x1
    80001c48:	a94080e7          	jalr	-1388(ra) # 800026d8 <__printf>
    80001c4c:	00001097          	auipc	ra,0x1
    80001c50:	4ac080e7          	jalr	1196(ra) # 800030f8 <kinit>
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	148080e7          	jalr	328(ra) # 80001d9c <trapinit>
    80001c5c:	00000097          	auipc	ra,0x0
    80001c60:	16c080e7          	jalr	364(ra) # 80001dc8 <trapinithart>
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	5bc080e7          	jalr	1468(ra) # 80002220 <plicinit>
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	5dc080e7          	jalr	1500(ra) # 80002248 <plicinithart>
    80001c74:	00000097          	auipc	ra,0x0
    80001c78:	078080e7          	jalr	120(ra) # 80001cec <userinit>
    80001c7c:	0ff0000f          	fence
    80001c80:	00100793          	li	a5,1
    80001c84:	00002517          	auipc	a0,0x2
    80001c88:	42450513          	addi	a0,a0,1060 # 800040a8 <_ZZ12printIntegermE6digits+0x28>
    80001c8c:	00f4a023          	sw	a5,0(s1)
    80001c90:	00001097          	auipc	ra,0x1
    80001c94:	a48080e7          	jalr	-1464(ra) # 800026d8 <__printf>
    80001c98:	0000006f          	j	80001c98 <system_main+0xd4>

0000000080001c9c <cpuid>:
    80001c9c:	ff010113          	addi	sp,sp,-16
    80001ca0:	00813423          	sd	s0,8(sp)
    80001ca4:	01010413          	addi	s0,sp,16
    80001ca8:	00020513          	mv	a0,tp
    80001cac:	00813403          	ld	s0,8(sp)
    80001cb0:	0005051b          	sext.w	a0,a0
    80001cb4:	01010113          	addi	sp,sp,16
    80001cb8:	00008067          	ret

0000000080001cbc <mycpu>:
    80001cbc:	ff010113          	addi	sp,sp,-16
    80001cc0:	00813423          	sd	s0,8(sp)
    80001cc4:	01010413          	addi	s0,sp,16
    80001cc8:	00020793          	mv	a5,tp
    80001ccc:	00813403          	ld	s0,8(sp)
    80001cd0:	0007879b          	sext.w	a5,a5
    80001cd4:	00779793          	slli	a5,a5,0x7
    80001cd8:	00004517          	auipc	a0,0x4
    80001cdc:	a1850513          	addi	a0,a0,-1512 # 800056f0 <cpus>
    80001ce0:	00f50533          	add	a0,a0,a5
    80001ce4:	01010113          	addi	sp,sp,16
    80001ce8:	00008067          	ret

0000000080001cec <userinit>:
    80001cec:	ff010113          	addi	sp,sp,-16
    80001cf0:	00813423          	sd	s0,8(sp)
    80001cf4:	01010413          	addi	s0,sp,16
    80001cf8:	00813403          	ld	s0,8(sp)
    80001cfc:	01010113          	addi	sp,sp,16
    80001d00:	fffff317          	auipc	t1,0xfffff
    80001d04:	70c30067          	jr	1804(t1) # 8000140c <main>

0000000080001d08 <either_copyout>:
    80001d08:	ff010113          	addi	sp,sp,-16
    80001d0c:	00813023          	sd	s0,0(sp)
    80001d10:	00113423          	sd	ra,8(sp)
    80001d14:	01010413          	addi	s0,sp,16
    80001d18:	02051663          	bnez	a0,80001d44 <either_copyout+0x3c>
    80001d1c:	00058513          	mv	a0,a1
    80001d20:	00060593          	mv	a1,a2
    80001d24:	0006861b          	sext.w	a2,a3
    80001d28:	00002097          	auipc	ra,0x2
    80001d2c:	c5c080e7          	jalr	-932(ra) # 80003984 <__memmove>
    80001d30:	00813083          	ld	ra,8(sp)
    80001d34:	00013403          	ld	s0,0(sp)
    80001d38:	00000513          	li	a0,0
    80001d3c:	01010113          	addi	sp,sp,16
    80001d40:	00008067          	ret
    80001d44:	00002517          	auipc	a0,0x2
    80001d48:	3a450513          	addi	a0,a0,932 # 800040e8 <_ZZ12printIntegermE6digits+0x68>
    80001d4c:	00001097          	auipc	ra,0x1
    80001d50:	930080e7          	jalr	-1744(ra) # 8000267c <panic>

0000000080001d54 <either_copyin>:
    80001d54:	ff010113          	addi	sp,sp,-16
    80001d58:	00813023          	sd	s0,0(sp)
    80001d5c:	00113423          	sd	ra,8(sp)
    80001d60:	01010413          	addi	s0,sp,16
    80001d64:	02059463          	bnez	a1,80001d8c <either_copyin+0x38>
    80001d68:	00060593          	mv	a1,a2
    80001d6c:	0006861b          	sext.w	a2,a3
    80001d70:	00002097          	auipc	ra,0x2
    80001d74:	c14080e7          	jalr	-1004(ra) # 80003984 <__memmove>
    80001d78:	00813083          	ld	ra,8(sp)
    80001d7c:	00013403          	ld	s0,0(sp)
    80001d80:	00000513          	li	a0,0
    80001d84:	01010113          	addi	sp,sp,16
    80001d88:	00008067          	ret
    80001d8c:	00002517          	auipc	a0,0x2
    80001d90:	38450513          	addi	a0,a0,900 # 80004110 <_ZZ12printIntegermE6digits+0x90>
    80001d94:	00001097          	auipc	ra,0x1
    80001d98:	8e8080e7          	jalr	-1816(ra) # 8000267c <panic>

0000000080001d9c <trapinit>:
    80001d9c:	ff010113          	addi	sp,sp,-16
    80001da0:	00813423          	sd	s0,8(sp)
    80001da4:	01010413          	addi	s0,sp,16
    80001da8:	00813403          	ld	s0,8(sp)
    80001dac:	00002597          	auipc	a1,0x2
    80001db0:	38c58593          	addi	a1,a1,908 # 80004138 <_ZZ12printIntegermE6digits+0xb8>
    80001db4:	00004517          	auipc	a0,0x4
    80001db8:	9bc50513          	addi	a0,a0,-1604 # 80005770 <tickslock>
    80001dbc:	01010113          	addi	sp,sp,16
    80001dc0:	00001317          	auipc	t1,0x1
    80001dc4:	5c830067          	jr	1480(t1) # 80003388 <initlock>

0000000080001dc8 <trapinithart>:
    80001dc8:	ff010113          	addi	sp,sp,-16
    80001dcc:	00813423          	sd	s0,8(sp)
    80001dd0:	01010413          	addi	s0,sp,16
    80001dd4:	00000797          	auipc	a5,0x0
    80001dd8:	2fc78793          	addi	a5,a5,764 # 800020d0 <kernelvec>
    80001ddc:	10579073          	csrw	stvec,a5
    80001de0:	00813403          	ld	s0,8(sp)
    80001de4:	01010113          	addi	sp,sp,16
    80001de8:	00008067          	ret

0000000080001dec <usertrap>:
    80001dec:	ff010113          	addi	sp,sp,-16
    80001df0:	00813423          	sd	s0,8(sp)
    80001df4:	01010413          	addi	s0,sp,16
    80001df8:	00813403          	ld	s0,8(sp)
    80001dfc:	01010113          	addi	sp,sp,16
    80001e00:	00008067          	ret

0000000080001e04 <usertrapret>:
    80001e04:	ff010113          	addi	sp,sp,-16
    80001e08:	00813423          	sd	s0,8(sp)
    80001e0c:	01010413          	addi	s0,sp,16
    80001e10:	00813403          	ld	s0,8(sp)
    80001e14:	01010113          	addi	sp,sp,16
    80001e18:	00008067          	ret

0000000080001e1c <kerneltrap>:
    80001e1c:	fe010113          	addi	sp,sp,-32
    80001e20:	00813823          	sd	s0,16(sp)
    80001e24:	00113c23          	sd	ra,24(sp)
    80001e28:	00913423          	sd	s1,8(sp)
    80001e2c:	02010413          	addi	s0,sp,32
    80001e30:	142025f3          	csrr	a1,scause
    80001e34:	100027f3          	csrr	a5,sstatus
    80001e38:	0027f793          	andi	a5,a5,2
    80001e3c:	10079c63          	bnez	a5,80001f54 <kerneltrap+0x138>
    80001e40:	142027f3          	csrr	a5,scause
    80001e44:	0207ce63          	bltz	a5,80001e80 <kerneltrap+0x64>
    80001e48:	00002517          	auipc	a0,0x2
    80001e4c:	33850513          	addi	a0,a0,824 # 80004180 <_ZZ12printIntegermE6digits+0x100>
    80001e50:	00001097          	auipc	ra,0x1
    80001e54:	888080e7          	jalr	-1912(ra) # 800026d8 <__printf>
    80001e58:	141025f3          	csrr	a1,sepc
    80001e5c:	14302673          	csrr	a2,stval
    80001e60:	00002517          	auipc	a0,0x2
    80001e64:	33050513          	addi	a0,a0,816 # 80004190 <_ZZ12printIntegermE6digits+0x110>
    80001e68:	00001097          	auipc	ra,0x1
    80001e6c:	870080e7          	jalr	-1936(ra) # 800026d8 <__printf>
    80001e70:	00002517          	auipc	a0,0x2
    80001e74:	33850513          	addi	a0,a0,824 # 800041a8 <_ZZ12printIntegermE6digits+0x128>
    80001e78:	00001097          	auipc	ra,0x1
    80001e7c:	804080e7          	jalr	-2044(ra) # 8000267c <panic>
    80001e80:	0ff7f713          	andi	a4,a5,255
    80001e84:	00900693          	li	a3,9
    80001e88:	04d70063          	beq	a4,a3,80001ec8 <kerneltrap+0xac>
    80001e8c:	fff00713          	li	a4,-1
    80001e90:	03f71713          	slli	a4,a4,0x3f
    80001e94:	00170713          	addi	a4,a4,1
    80001e98:	fae798e3          	bne	a5,a4,80001e48 <kerneltrap+0x2c>
    80001e9c:	00000097          	auipc	ra,0x0
    80001ea0:	e00080e7          	jalr	-512(ra) # 80001c9c <cpuid>
    80001ea4:	06050663          	beqz	a0,80001f10 <kerneltrap+0xf4>
    80001ea8:	144027f3          	csrr	a5,sip
    80001eac:	ffd7f793          	andi	a5,a5,-3
    80001eb0:	14479073          	csrw	sip,a5
    80001eb4:	01813083          	ld	ra,24(sp)
    80001eb8:	01013403          	ld	s0,16(sp)
    80001ebc:	00813483          	ld	s1,8(sp)
    80001ec0:	02010113          	addi	sp,sp,32
    80001ec4:	00008067          	ret
    80001ec8:	00000097          	auipc	ra,0x0
    80001ecc:	3cc080e7          	jalr	972(ra) # 80002294 <plic_claim>
    80001ed0:	00a00793          	li	a5,10
    80001ed4:	00050493          	mv	s1,a0
    80001ed8:	06f50863          	beq	a0,a5,80001f48 <kerneltrap+0x12c>
    80001edc:	fc050ce3          	beqz	a0,80001eb4 <kerneltrap+0x98>
    80001ee0:	00050593          	mv	a1,a0
    80001ee4:	00002517          	auipc	a0,0x2
    80001ee8:	27c50513          	addi	a0,a0,636 # 80004160 <_ZZ12printIntegermE6digits+0xe0>
    80001eec:	00000097          	auipc	ra,0x0
    80001ef0:	7ec080e7          	jalr	2028(ra) # 800026d8 <__printf>
    80001ef4:	01013403          	ld	s0,16(sp)
    80001ef8:	01813083          	ld	ra,24(sp)
    80001efc:	00048513          	mv	a0,s1
    80001f00:	00813483          	ld	s1,8(sp)
    80001f04:	02010113          	addi	sp,sp,32
    80001f08:	00000317          	auipc	t1,0x0
    80001f0c:	3c430067          	jr	964(t1) # 800022cc <plic_complete>
    80001f10:	00004517          	auipc	a0,0x4
    80001f14:	86050513          	addi	a0,a0,-1952 # 80005770 <tickslock>
    80001f18:	00001097          	auipc	ra,0x1
    80001f1c:	494080e7          	jalr	1172(ra) # 800033ac <acquire>
    80001f20:	00002717          	auipc	a4,0x2
    80001f24:	76470713          	addi	a4,a4,1892 # 80004684 <ticks>
    80001f28:	00072783          	lw	a5,0(a4)
    80001f2c:	00004517          	auipc	a0,0x4
    80001f30:	84450513          	addi	a0,a0,-1980 # 80005770 <tickslock>
    80001f34:	0017879b          	addiw	a5,a5,1
    80001f38:	00f72023          	sw	a5,0(a4)
    80001f3c:	00001097          	auipc	ra,0x1
    80001f40:	53c080e7          	jalr	1340(ra) # 80003478 <release>
    80001f44:	f65ff06f          	j	80001ea8 <kerneltrap+0x8c>
    80001f48:	00001097          	auipc	ra,0x1
    80001f4c:	098080e7          	jalr	152(ra) # 80002fe0 <uartintr>
    80001f50:	fa5ff06f          	j	80001ef4 <kerneltrap+0xd8>
    80001f54:	00002517          	auipc	a0,0x2
    80001f58:	1ec50513          	addi	a0,a0,492 # 80004140 <_ZZ12printIntegermE6digits+0xc0>
    80001f5c:	00000097          	auipc	ra,0x0
    80001f60:	720080e7          	jalr	1824(ra) # 8000267c <panic>

0000000080001f64 <clockintr>:
    80001f64:	fe010113          	addi	sp,sp,-32
    80001f68:	00813823          	sd	s0,16(sp)
    80001f6c:	00913423          	sd	s1,8(sp)
    80001f70:	00113c23          	sd	ra,24(sp)
    80001f74:	02010413          	addi	s0,sp,32
    80001f78:	00003497          	auipc	s1,0x3
    80001f7c:	7f848493          	addi	s1,s1,2040 # 80005770 <tickslock>
    80001f80:	00048513          	mv	a0,s1
    80001f84:	00001097          	auipc	ra,0x1
    80001f88:	428080e7          	jalr	1064(ra) # 800033ac <acquire>
    80001f8c:	00002717          	auipc	a4,0x2
    80001f90:	6f870713          	addi	a4,a4,1784 # 80004684 <ticks>
    80001f94:	00072783          	lw	a5,0(a4)
    80001f98:	01013403          	ld	s0,16(sp)
    80001f9c:	01813083          	ld	ra,24(sp)
    80001fa0:	00048513          	mv	a0,s1
    80001fa4:	0017879b          	addiw	a5,a5,1
    80001fa8:	00813483          	ld	s1,8(sp)
    80001fac:	00f72023          	sw	a5,0(a4)
    80001fb0:	02010113          	addi	sp,sp,32
    80001fb4:	00001317          	auipc	t1,0x1
    80001fb8:	4c430067          	jr	1220(t1) # 80003478 <release>

0000000080001fbc <devintr>:
    80001fbc:	142027f3          	csrr	a5,scause
    80001fc0:	00000513          	li	a0,0
    80001fc4:	0007c463          	bltz	a5,80001fcc <devintr+0x10>
    80001fc8:	00008067          	ret
    80001fcc:	fe010113          	addi	sp,sp,-32
    80001fd0:	00813823          	sd	s0,16(sp)
    80001fd4:	00113c23          	sd	ra,24(sp)
    80001fd8:	00913423          	sd	s1,8(sp)
    80001fdc:	02010413          	addi	s0,sp,32
    80001fe0:	0ff7f713          	andi	a4,a5,255
    80001fe4:	00900693          	li	a3,9
    80001fe8:	04d70c63          	beq	a4,a3,80002040 <devintr+0x84>
    80001fec:	fff00713          	li	a4,-1
    80001ff0:	03f71713          	slli	a4,a4,0x3f
    80001ff4:	00170713          	addi	a4,a4,1
    80001ff8:	00e78c63          	beq	a5,a4,80002010 <devintr+0x54>
    80001ffc:	01813083          	ld	ra,24(sp)
    80002000:	01013403          	ld	s0,16(sp)
    80002004:	00813483          	ld	s1,8(sp)
    80002008:	02010113          	addi	sp,sp,32
    8000200c:	00008067          	ret
    80002010:	00000097          	auipc	ra,0x0
    80002014:	c8c080e7          	jalr	-884(ra) # 80001c9c <cpuid>
    80002018:	06050663          	beqz	a0,80002084 <devintr+0xc8>
    8000201c:	144027f3          	csrr	a5,sip
    80002020:	ffd7f793          	andi	a5,a5,-3
    80002024:	14479073          	csrw	sip,a5
    80002028:	01813083          	ld	ra,24(sp)
    8000202c:	01013403          	ld	s0,16(sp)
    80002030:	00813483          	ld	s1,8(sp)
    80002034:	00200513          	li	a0,2
    80002038:	02010113          	addi	sp,sp,32
    8000203c:	00008067          	ret
    80002040:	00000097          	auipc	ra,0x0
    80002044:	254080e7          	jalr	596(ra) # 80002294 <plic_claim>
    80002048:	00a00793          	li	a5,10
    8000204c:	00050493          	mv	s1,a0
    80002050:	06f50663          	beq	a0,a5,800020bc <devintr+0x100>
    80002054:	00100513          	li	a0,1
    80002058:	fa0482e3          	beqz	s1,80001ffc <devintr+0x40>
    8000205c:	00048593          	mv	a1,s1
    80002060:	00002517          	auipc	a0,0x2
    80002064:	10050513          	addi	a0,a0,256 # 80004160 <_ZZ12printIntegermE6digits+0xe0>
    80002068:	00000097          	auipc	ra,0x0
    8000206c:	670080e7          	jalr	1648(ra) # 800026d8 <__printf>
    80002070:	00048513          	mv	a0,s1
    80002074:	00000097          	auipc	ra,0x0
    80002078:	258080e7          	jalr	600(ra) # 800022cc <plic_complete>
    8000207c:	00100513          	li	a0,1
    80002080:	f7dff06f          	j	80001ffc <devintr+0x40>
    80002084:	00003517          	auipc	a0,0x3
    80002088:	6ec50513          	addi	a0,a0,1772 # 80005770 <tickslock>
    8000208c:	00001097          	auipc	ra,0x1
    80002090:	320080e7          	jalr	800(ra) # 800033ac <acquire>
    80002094:	00002717          	auipc	a4,0x2
    80002098:	5f070713          	addi	a4,a4,1520 # 80004684 <ticks>
    8000209c:	00072783          	lw	a5,0(a4)
    800020a0:	00003517          	auipc	a0,0x3
    800020a4:	6d050513          	addi	a0,a0,1744 # 80005770 <tickslock>
    800020a8:	0017879b          	addiw	a5,a5,1
    800020ac:	00f72023          	sw	a5,0(a4)
    800020b0:	00001097          	auipc	ra,0x1
    800020b4:	3c8080e7          	jalr	968(ra) # 80003478 <release>
    800020b8:	f65ff06f          	j	8000201c <devintr+0x60>
    800020bc:	00001097          	auipc	ra,0x1
    800020c0:	f24080e7          	jalr	-220(ra) # 80002fe0 <uartintr>
    800020c4:	fadff06f          	j	80002070 <devintr+0xb4>
	...

00000000800020d0 <kernelvec>:
    800020d0:	f0010113          	addi	sp,sp,-256
    800020d4:	00113023          	sd	ra,0(sp)
    800020d8:	00213423          	sd	sp,8(sp)
    800020dc:	00313823          	sd	gp,16(sp)
    800020e0:	00413c23          	sd	tp,24(sp)
    800020e4:	02513023          	sd	t0,32(sp)
    800020e8:	02613423          	sd	t1,40(sp)
    800020ec:	02713823          	sd	t2,48(sp)
    800020f0:	02813c23          	sd	s0,56(sp)
    800020f4:	04913023          	sd	s1,64(sp)
    800020f8:	04a13423          	sd	a0,72(sp)
    800020fc:	04b13823          	sd	a1,80(sp)
    80002100:	04c13c23          	sd	a2,88(sp)
    80002104:	06d13023          	sd	a3,96(sp)
    80002108:	06e13423          	sd	a4,104(sp)
    8000210c:	06f13823          	sd	a5,112(sp)
    80002110:	07013c23          	sd	a6,120(sp)
    80002114:	09113023          	sd	a7,128(sp)
    80002118:	09213423          	sd	s2,136(sp)
    8000211c:	09313823          	sd	s3,144(sp)
    80002120:	09413c23          	sd	s4,152(sp)
    80002124:	0b513023          	sd	s5,160(sp)
    80002128:	0b613423          	sd	s6,168(sp)
    8000212c:	0b713823          	sd	s7,176(sp)
    80002130:	0b813c23          	sd	s8,184(sp)
    80002134:	0d913023          	sd	s9,192(sp)
    80002138:	0da13423          	sd	s10,200(sp)
    8000213c:	0db13823          	sd	s11,208(sp)
    80002140:	0dc13c23          	sd	t3,216(sp)
    80002144:	0fd13023          	sd	t4,224(sp)
    80002148:	0fe13423          	sd	t5,232(sp)
    8000214c:	0ff13823          	sd	t6,240(sp)
    80002150:	ccdff0ef          	jal	ra,80001e1c <kerneltrap>
    80002154:	00013083          	ld	ra,0(sp)
    80002158:	00813103          	ld	sp,8(sp)
    8000215c:	01013183          	ld	gp,16(sp)
    80002160:	02013283          	ld	t0,32(sp)
    80002164:	02813303          	ld	t1,40(sp)
    80002168:	03013383          	ld	t2,48(sp)
    8000216c:	03813403          	ld	s0,56(sp)
    80002170:	04013483          	ld	s1,64(sp)
    80002174:	04813503          	ld	a0,72(sp)
    80002178:	05013583          	ld	a1,80(sp)
    8000217c:	05813603          	ld	a2,88(sp)
    80002180:	06013683          	ld	a3,96(sp)
    80002184:	06813703          	ld	a4,104(sp)
    80002188:	07013783          	ld	a5,112(sp)
    8000218c:	07813803          	ld	a6,120(sp)
    80002190:	08013883          	ld	a7,128(sp)
    80002194:	08813903          	ld	s2,136(sp)
    80002198:	09013983          	ld	s3,144(sp)
    8000219c:	09813a03          	ld	s4,152(sp)
    800021a0:	0a013a83          	ld	s5,160(sp)
    800021a4:	0a813b03          	ld	s6,168(sp)
    800021a8:	0b013b83          	ld	s7,176(sp)
    800021ac:	0b813c03          	ld	s8,184(sp)
    800021b0:	0c013c83          	ld	s9,192(sp)
    800021b4:	0c813d03          	ld	s10,200(sp)
    800021b8:	0d013d83          	ld	s11,208(sp)
    800021bc:	0d813e03          	ld	t3,216(sp)
    800021c0:	0e013e83          	ld	t4,224(sp)
    800021c4:	0e813f03          	ld	t5,232(sp)
    800021c8:	0f013f83          	ld	t6,240(sp)
    800021cc:	10010113          	addi	sp,sp,256
    800021d0:	10200073          	sret
    800021d4:	00000013          	nop
    800021d8:	00000013          	nop
    800021dc:	00000013          	nop

00000000800021e0 <timervec>:
    800021e0:	34051573          	csrrw	a0,mscratch,a0
    800021e4:	00b53023          	sd	a1,0(a0)
    800021e8:	00c53423          	sd	a2,8(a0)
    800021ec:	00d53823          	sd	a3,16(a0)
    800021f0:	01853583          	ld	a1,24(a0)
    800021f4:	02053603          	ld	a2,32(a0)
    800021f8:	0005b683          	ld	a3,0(a1)
    800021fc:	00c686b3          	add	a3,a3,a2
    80002200:	00d5b023          	sd	a3,0(a1)
    80002204:	00200593          	li	a1,2
    80002208:	14459073          	csrw	sip,a1
    8000220c:	01053683          	ld	a3,16(a0)
    80002210:	00853603          	ld	a2,8(a0)
    80002214:	00053583          	ld	a1,0(a0)
    80002218:	34051573          	csrrw	a0,mscratch,a0
    8000221c:	30200073          	mret

0000000080002220 <plicinit>:
    80002220:	ff010113          	addi	sp,sp,-16
    80002224:	00813423          	sd	s0,8(sp)
    80002228:	01010413          	addi	s0,sp,16
    8000222c:	00813403          	ld	s0,8(sp)
    80002230:	0c0007b7          	lui	a5,0xc000
    80002234:	00100713          	li	a4,1
    80002238:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000223c:	00e7a223          	sw	a4,4(a5)
    80002240:	01010113          	addi	sp,sp,16
    80002244:	00008067          	ret

0000000080002248 <plicinithart>:
    80002248:	ff010113          	addi	sp,sp,-16
    8000224c:	00813023          	sd	s0,0(sp)
    80002250:	00113423          	sd	ra,8(sp)
    80002254:	01010413          	addi	s0,sp,16
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	a44080e7          	jalr	-1468(ra) # 80001c9c <cpuid>
    80002260:	0085171b          	slliw	a4,a0,0x8
    80002264:	0c0027b7          	lui	a5,0xc002
    80002268:	00e787b3          	add	a5,a5,a4
    8000226c:	40200713          	li	a4,1026
    80002270:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002274:	00813083          	ld	ra,8(sp)
    80002278:	00013403          	ld	s0,0(sp)
    8000227c:	00d5151b          	slliw	a0,a0,0xd
    80002280:	0c2017b7          	lui	a5,0xc201
    80002284:	00a78533          	add	a0,a5,a0
    80002288:	00052023          	sw	zero,0(a0)
    8000228c:	01010113          	addi	sp,sp,16
    80002290:	00008067          	ret

0000000080002294 <plic_claim>:
    80002294:	ff010113          	addi	sp,sp,-16
    80002298:	00813023          	sd	s0,0(sp)
    8000229c:	00113423          	sd	ra,8(sp)
    800022a0:	01010413          	addi	s0,sp,16
    800022a4:	00000097          	auipc	ra,0x0
    800022a8:	9f8080e7          	jalr	-1544(ra) # 80001c9c <cpuid>
    800022ac:	00813083          	ld	ra,8(sp)
    800022b0:	00013403          	ld	s0,0(sp)
    800022b4:	00d5151b          	slliw	a0,a0,0xd
    800022b8:	0c2017b7          	lui	a5,0xc201
    800022bc:	00a78533          	add	a0,a5,a0
    800022c0:	00452503          	lw	a0,4(a0)
    800022c4:	01010113          	addi	sp,sp,16
    800022c8:	00008067          	ret

00000000800022cc <plic_complete>:
    800022cc:	fe010113          	addi	sp,sp,-32
    800022d0:	00813823          	sd	s0,16(sp)
    800022d4:	00913423          	sd	s1,8(sp)
    800022d8:	00113c23          	sd	ra,24(sp)
    800022dc:	02010413          	addi	s0,sp,32
    800022e0:	00050493          	mv	s1,a0
    800022e4:	00000097          	auipc	ra,0x0
    800022e8:	9b8080e7          	jalr	-1608(ra) # 80001c9c <cpuid>
    800022ec:	01813083          	ld	ra,24(sp)
    800022f0:	01013403          	ld	s0,16(sp)
    800022f4:	00d5179b          	slliw	a5,a0,0xd
    800022f8:	0c201737          	lui	a4,0xc201
    800022fc:	00f707b3          	add	a5,a4,a5
    80002300:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002304:	00813483          	ld	s1,8(sp)
    80002308:	02010113          	addi	sp,sp,32
    8000230c:	00008067          	ret

0000000080002310 <consolewrite>:
    80002310:	fb010113          	addi	sp,sp,-80
    80002314:	04813023          	sd	s0,64(sp)
    80002318:	04113423          	sd	ra,72(sp)
    8000231c:	02913c23          	sd	s1,56(sp)
    80002320:	03213823          	sd	s2,48(sp)
    80002324:	03313423          	sd	s3,40(sp)
    80002328:	03413023          	sd	s4,32(sp)
    8000232c:	01513c23          	sd	s5,24(sp)
    80002330:	05010413          	addi	s0,sp,80
    80002334:	06c05c63          	blez	a2,800023ac <consolewrite+0x9c>
    80002338:	00060993          	mv	s3,a2
    8000233c:	00050a13          	mv	s4,a0
    80002340:	00058493          	mv	s1,a1
    80002344:	00000913          	li	s2,0
    80002348:	fff00a93          	li	s5,-1
    8000234c:	01c0006f          	j	80002368 <consolewrite+0x58>
    80002350:	fbf44503          	lbu	a0,-65(s0)
    80002354:	0019091b          	addiw	s2,s2,1
    80002358:	00148493          	addi	s1,s1,1
    8000235c:	00001097          	auipc	ra,0x1
    80002360:	a9c080e7          	jalr	-1380(ra) # 80002df8 <uartputc>
    80002364:	03298063          	beq	s3,s2,80002384 <consolewrite+0x74>
    80002368:	00048613          	mv	a2,s1
    8000236c:	00100693          	li	a3,1
    80002370:	000a0593          	mv	a1,s4
    80002374:	fbf40513          	addi	a0,s0,-65
    80002378:	00000097          	auipc	ra,0x0
    8000237c:	9dc080e7          	jalr	-1572(ra) # 80001d54 <either_copyin>
    80002380:	fd5518e3          	bne	a0,s5,80002350 <consolewrite+0x40>
    80002384:	04813083          	ld	ra,72(sp)
    80002388:	04013403          	ld	s0,64(sp)
    8000238c:	03813483          	ld	s1,56(sp)
    80002390:	02813983          	ld	s3,40(sp)
    80002394:	02013a03          	ld	s4,32(sp)
    80002398:	01813a83          	ld	s5,24(sp)
    8000239c:	00090513          	mv	a0,s2
    800023a0:	03013903          	ld	s2,48(sp)
    800023a4:	05010113          	addi	sp,sp,80
    800023a8:	00008067          	ret
    800023ac:	00000913          	li	s2,0
    800023b0:	fd5ff06f          	j	80002384 <consolewrite+0x74>

00000000800023b4 <consoleread>:
    800023b4:	f9010113          	addi	sp,sp,-112
    800023b8:	06813023          	sd	s0,96(sp)
    800023bc:	04913c23          	sd	s1,88(sp)
    800023c0:	05213823          	sd	s2,80(sp)
    800023c4:	05313423          	sd	s3,72(sp)
    800023c8:	05413023          	sd	s4,64(sp)
    800023cc:	03513c23          	sd	s5,56(sp)
    800023d0:	03613823          	sd	s6,48(sp)
    800023d4:	03713423          	sd	s7,40(sp)
    800023d8:	03813023          	sd	s8,32(sp)
    800023dc:	06113423          	sd	ra,104(sp)
    800023e0:	01913c23          	sd	s9,24(sp)
    800023e4:	07010413          	addi	s0,sp,112
    800023e8:	00060b93          	mv	s7,a2
    800023ec:	00050913          	mv	s2,a0
    800023f0:	00058c13          	mv	s8,a1
    800023f4:	00060b1b          	sext.w	s6,a2
    800023f8:	00003497          	auipc	s1,0x3
    800023fc:	3a048493          	addi	s1,s1,928 # 80005798 <cons>
    80002400:	00400993          	li	s3,4
    80002404:	fff00a13          	li	s4,-1
    80002408:	00a00a93          	li	s5,10
    8000240c:	05705e63          	blez	s7,80002468 <consoleread+0xb4>
    80002410:	09c4a703          	lw	a4,156(s1)
    80002414:	0984a783          	lw	a5,152(s1)
    80002418:	0007071b          	sext.w	a4,a4
    8000241c:	08e78463          	beq	a5,a4,800024a4 <consoleread+0xf0>
    80002420:	07f7f713          	andi	a4,a5,127
    80002424:	00e48733          	add	a4,s1,a4
    80002428:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000242c:	0017869b          	addiw	a3,a5,1
    80002430:	08d4ac23          	sw	a3,152(s1)
    80002434:	00070c9b          	sext.w	s9,a4
    80002438:	0b370663          	beq	a4,s3,800024e4 <consoleread+0x130>
    8000243c:	00100693          	li	a3,1
    80002440:	f9f40613          	addi	a2,s0,-97
    80002444:	000c0593          	mv	a1,s8
    80002448:	00090513          	mv	a0,s2
    8000244c:	f8e40fa3          	sb	a4,-97(s0)
    80002450:	00000097          	auipc	ra,0x0
    80002454:	8b8080e7          	jalr	-1864(ra) # 80001d08 <either_copyout>
    80002458:	01450863          	beq	a0,s4,80002468 <consoleread+0xb4>
    8000245c:	001c0c13          	addi	s8,s8,1
    80002460:	fffb8b9b          	addiw	s7,s7,-1
    80002464:	fb5c94e3          	bne	s9,s5,8000240c <consoleread+0x58>
    80002468:	000b851b          	sext.w	a0,s7
    8000246c:	06813083          	ld	ra,104(sp)
    80002470:	06013403          	ld	s0,96(sp)
    80002474:	05813483          	ld	s1,88(sp)
    80002478:	05013903          	ld	s2,80(sp)
    8000247c:	04813983          	ld	s3,72(sp)
    80002480:	04013a03          	ld	s4,64(sp)
    80002484:	03813a83          	ld	s5,56(sp)
    80002488:	02813b83          	ld	s7,40(sp)
    8000248c:	02013c03          	ld	s8,32(sp)
    80002490:	01813c83          	ld	s9,24(sp)
    80002494:	40ab053b          	subw	a0,s6,a0
    80002498:	03013b03          	ld	s6,48(sp)
    8000249c:	07010113          	addi	sp,sp,112
    800024a0:	00008067          	ret
    800024a4:	00001097          	auipc	ra,0x1
    800024a8:	1d8080e7          	jalr	472(ra) # 8000367c <push_on>
    800024ac:	0984a703          	lw	a4,152(s1)
    800024b0:	09c4a783          	lw	a5,156(s1)
    800024b4:	0007879b          	sext.w	a5,a5
    800024b8:	fef70ce3          	beq	a4,a5,800024b0 <consoleread+0xfc>
    800024bc:	00001097          	auipc	ra,0x1
    800024c0:	234080e7          	jalr	564(ra) # 800036f0 <pop_on>
    800024c4:	0984a783          	lw	a5,152(s1)
    800024c8:	07f7f713          	andi	a4,a5,127
    800024cc:	00e48733          	add	a4,s1,a4
    800024d0:	01874703          	lbu	a4,24(a4)
    800024d4:	0017869b          	addiw	a3,a5,1
    800024d8:	08d4ac23          	sw	a3,152(s1)
    800024dc:	00070c9b          	sext.w	s9,a4
    800024e0:	f5371ee3          	bne	a4,s3,8000243c <consoleread+0x88>
    800024e4:	000b851b          	sext.w	a0,s7
    800024e8:	f96bf2e3          	bgeu	s7,s6,8000246c <consoleread+0xb8>
    800024ec:	08f4ac23          	sw	a5,152(s1)
    800024f0:	f7dff06f          	j	8000246c <consoleread+0xb8>

00000000800024f4 <consputc>:
    800024f4:	10000793          	li	a5,256
    800024f8:	00f50663          	beq	a0,a5,80002504 <consputc+0x10>
    800024fc:	00001317          	auipc	t1,0x1
    80002500:	9f430067          	jr	-1548(t1) # 80002ef0 <uartputc_sync>
    80002504:	ff010113          	addi	sp,sp,-16
    80002508:	00113423          	sd	ra,8(sp)
    8000250c:	00813023          	sd	s0,0(sp)
    80002510:	01010413          	addi	s0,sp,16
    80002514:	00800513          	li	a0,8
    80002518:	00001097          	auipc	ra,0x1
    8000251c:	9d8080e7          	jalr	-1576(ra) # 80002ef0 <uartputc_sync>
    80002520:	02000513          	li	a0,32
    80002524:	00001097          	auipc	ra,0x1
    80002528:	9cc080e7          	jalr	-1588(ra) # 80002ef0 <uartputc_sync>
    8000252c:	00013403          	ld	s0,0(sp)
    80002530:	00813083          	ld	ra,8(sp)
    80002534:	00800513          	li	a0,8
    80002538:	01010113          	addi	sp,sp,16
    8000253c:	00001317          	auipc	t1,0x1
    80002540:	9b430067          	jr	-1612(t1) # 80002ef0 <uartputc_sync>

0000000080002544 <consoleintr>:
    80002544:	fe010113          	addi	sp,sp,-32
    80002548:	00813823          	sd	s0,16(sp)
    8000254c:	00913423          	sd	s1,8(sp)
    80002550:	01213023          	sd	s2,0(sp)
    80002554:	00113c23          	sd	ra,24(sp)
    80002558:	02010413          	addi	s0,sp,32
    8000255c:	00003917          	auipc	s2,0x3
    80002560:	23c90913          	addi	s2,s2,572 # 80005798 <cons>
    80002564:	00050493          	mv	s1,a0
    80002568:	00090513          	mv	a0,s2
    8000256c:	00001097          	auipc	ra,0x1
    80002570:	e40080e7          	jalr	-448(ra) # 800033ac <acquire>
    80002574:	02048c63          	beqz	s1,800025ac <consoleintr+0x68>
    80002578:	0a092783          	lw	a5,160(s2)
    8000257c:	09892703          	lw	a4,152(s2)
    80002580:	07f00693          	li	a3,127
    80002584:	40e7873b          	subw	a4,a5,a4
    80002588:	02e6e263          	bltu	a3,a4,800025ac <consoleintr+0x68>
    8000258c:	00d00713          	li	a4,13
    80002590:	04e48063          	beq	s1,a4,800025d0 <consoleintr+0x8c>
    80002594:	07f7f713          	andi	a4,a5,127
    80002598:	00e90733          	add	a4,s2,a4
    8000259c:	0017879b          	addiw	a5,a5,1
    800025a0:	0af92023          	sw	a5,160(s2)
    800025a4:	00970c23          	sb	s1,24(a4)
    800025a8:	08f92e23          	sw	a5,156(s2)
    800025ac:	01013403          	ld	s0,16(sp)
    800025b0:	01813083          	ld	ra,24(sp)
    800025b4:	00813483          	ld	s1,8(sp)
    800025b8:	00013903          	ld	s2,0(sp)
    800025bc:	00003517          	auipc	a0,0x3
    800025c0:	1dc50513          	addi	a0,a0,476 # 80005798 <cons>
    800025c4:	02010113          	addi	sp,sp,32
    800025c8:	00001317          	auipc	t1,0x1
    800025cc:	eb030067          	jr	-336(t1) # 80003478 <release>
    800025d0:	00a00493          	li	s1,10
    800025d4:	fc1ff06f          	j	80002594 <consoleintr+0x50>

00000000800025d8 <consoleinit>:
    800025d8:	fe010113          	addi	sp,sp,-32
    800025dc:	00113c23          	sd	ra,24(sp)
    800025e0:	00813823          	sd	s0,16(sp)
    800025e4:	00913423          	sd	s1,8(sp)
    800025e8:	02010413          	addi	s0,sp,32
    800025ec:	00003497          	auipc	s1,0x3
    800025f0:	1ac48493          	addi	s1,s1,428 # 80005798 <cons>
    800025f4:	00048513          	mv	a0,s1
    800025f8:	00002597          	auipc	a1,0x2
    800025fc:	bc058593          	addi	a1,a1,-1088 # 800041b8 <_ZZ12printIntegermE6digits+0x138>
    80002600:	00001097          	auipc	ra,0x1
    80002604:	d88080e7          	jalr	-632(ra) # 80003388 <initlock>
    80002608:	00000097          	auipc	ra,0x0
    8000260c:	7ac080e7          	jalr	1964(ra) # 80002db4 <uartinit>
    80002610:	01813083          	ld	ra,24(sp)
    80002614:	01013403          	ld	s0,16(sp)
    80002618:	00000797          	auipc	a5,0x0
    8000261c:	d9c78793          	addi	a5,a5,-612 # 800023b4 <consoleread>
    80002620:	0af4bc23          	sd	a5,184(s1)
    80002624:	00000797          	auipc	a5,0x0
    80002628:	cec78793          	addi	a5,a5,-788 # 80002310 <consolewrite>
    8000262c:	0cf4b023          	sd	a5,192(s1)
    80002630:	00813483          	ld	s1,8(sp)
    80002634:	02010113          	addi	sp,sp,32
    80002638:	00008067          	ret

000000008000263c <console_read>:
    8000263c:	ff010113          	addi	sp,sp,-16
    80002640:	00813423          	sd	s0,8(sp)
    80002644:	01010413          	addi	s0,sp,16
    80002648:	00813403          	ld	s0,8(sp)
    8000264c:	00003317          	auipc	t1,0x3
    80002650:	20433303          	ld	t1,516(t1) # 80005850 <devsw+0x10>
    80002654:	01010113          	addi	sp,sp,16
    80002658:	00030067          	jr	t1

000000008000265c <console_write>:
    8000265c:	ff010113          	addi	sp,sp,-16
    80002660:	00813423          	sd	s0,8(sp)
    80002664:	01010413          	addi	s0,sp,16
    80002668:	00813403          	ld	s0,8(sp)
    8000266c:	00003317          	auipc	t1,0x3
    80002670:	1ec33303          	ld	t1,492(t1) # 80005858 <devsw+0x18>
    80002674:	01010113          	addi	sp,sp,16
    80002678:	00030067          	jr	t1

000000008000267c <panic>:
    8000267c:	fe010113          	addi	sp,sp,-32
    80002680:	00113c23          	sd	ra,24(sp)
    80002684:	00813823          	sd	s0,16(sp)
    80002688:	00913423          	sd	s1,8(sp)
    8000268c:	02010413          	addi	s0,sp,32
    80002690:	00050493          	mv	s1,a0
    80002694:	00002517          	auipc	a0,0x2
    80002698:	b2c50513          	addi	a0,a0,-1236 # 800041c0 <_ZZ12printIntegermE6digits+0x140>
    8000269c:	00003797          	auipc	a5,0x3
    800026a0:	2407ae23          	sw	zero,604(a5) # 800058f8 <pr+0x18>
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	034080e7          	jalr	52(ra) # 800026d8 <__printf>
    800026ac:	00048513          	mv	a0,s1
    800026b0:	00000097          	auipc	ra,0x0
    800026b4:	028080e7          	jalr	40(ra) # 800026d8 <__printf>
    800026b8:	00002517          	auipc	a0,0x2
    800026bc:	ae850513          	addi	a0,a0,-1304 # 800041a0 <_ZZ12printIntegermE6digits+0x120>
    800026c0:	00000097          	auipc	ra,0x0
    800026c4:	018080e7          	jalr	24(ra) # 800026d8 <__printf>
    800026c8:	00100793          	li	a5,1
    800026cc:	00002717          	auipc	a4,0x2
    800026d0:	faf72e23          	sw	a5,-68(a4) # 80004688 <panicked>
    800026d4:	0000006f          	j	800026d4 <panic+0x58>

00000000800026d8 <__printf>:
    800026d8:	f3010113          	addi	sp,sp,-208
    800026dc:	08813023          	sd	s0,128(sp)
    800026e0:	07313423          	sd	s3,104(sp)
    800026e4:	09010413          	addi	s0,sp,144
    800026e8:	05813023          	sd	s8,64(sp)
    800026ec:	08113423          	sd	ra,136(sp)
    800026f0:	06913c23          	sd	s1,120(sp)
    800026f4:	07213823          	sd	s2,112(sp)
    800026f8:	07413023          	sd	s4,96(sp)
    800026fc:	05513c23          	sd	s5,88(sp)
    80002700:	05613823          	sd	s6,80(sp)
    80002704:	05713423          	sd	s7,72(sp)
    80002708:	03913c23          	sd	s9,56(sp)
    8000270c:	03a13823          	sd	s10,48(sp)
    80002710:	03b13423          	sd	s11,40(sp)
    80002714:	00003317          	auipc	t1,0x3
    80002718:	1cc30313          	addi	t1,t1,460 # 800058e0 <pr>
    8000271c:	01832c03          	lw	s8,24(t1)
    80002720:	00b43423          	sd	a1,8(s0)
    80002724:	00c43823          	sd	a2,16(s0)
    80002728:	00d43c23          	sd	a3,24(s0)
    8000272c:	02e43023          	sd	a4,32(s0)
    80002730:	02f43423          	sd	a5,40(s0)
    80002734:	03043823          	sd	a6,48(s0)
    80002738:	03143c23          	sd	a7,56(s0)
    8000273c:	00050993          	mv	s3,a0
    80002740:	4a0c1663          	bnez	s8,80002bec <__printf+0x514>
    80002744:	60098c63          	beqz	s3,80002d5c <__printf+0x684>
    80002748:	0009c503          	lbu	a0,0(s3)
    8000274c:	00840793          	addi	a5,s0,8
    80002750:	f6f43c23          	sd	a5,-136(s0)
    80002754:	00000493          	li	s1,0
    80002758:	22050063          	beqz	a0,80002978 <__printf+0x2a0>
    8000275c:	00002a37          	lui	s4,0x2
    80002760:	00018ab7          	lui	s5,0x18
    80002764:	000f4b37          	lui	s6,0xf4
    80002768:	00989bb7          	lui	s7,0x989
    8000276c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002770:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002774:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002778:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000277c:	00148c9b          	addiw	s9,s1,1
    80002780:	02500793          	li	a5,37
    80002784:	01998933          	add	s2,s3,s9
    80002788:	38f51263          	bne	a0,a5,80002b0c <__printf+0x434>
    8000278c:	00094783          	lbu	a5,0(s2)
    80002790:	00078c9b          	sext.w	s9,a5
    80002794:	1e078263          	beqz	a5,80002978 <__printf+0x2a0>
    80002798:	0024849b          	addiw	s1,s1,2
    8000279c:	07000713          	li	a4,112
    800027a0:	00998933          	add	s2,s3,s1
    800027a4:	38e78a63          	beq	a5,a4,80002b38 <__printf+0x460>
    800027a8:	20f76863          	bltu	a4,a5,800029b8 <__printf+0x2e0>
    800027ac:	42a78863          	beq	a5,a0,80002bdc <__printf+0x504>
    800027b0:	06400713          	li	a4,100
    800027b4:	40e79663          	bne	a5,a4,80002bc0 <__printf+0x4e8>
    800027b8:	f7843783          	ld	a5,-136(s0)
    800027bc:	0007a603          	lw	a2,0(a5)
    800027c0:	00878793          	addi	a5,a5,8
    800027c4:	f6f43c23          	sd	a5,-136(s0)
    800027c8:	42064a63          	bltz	a2,80002bfc <__printf+0x524>
    800027cc:	00a00713          	li	a4,10
    800027d0:	02e677bb          	remuw	a5,a2,a4
    800027d4:	00002d97          	auipc	s11,0x2
    800027d8:	a14d8d93          	addi	s11,s11,-1516 # 800041e8 <digits>
    800027dc:	00900593          	li	a1,9
    800027e0:	0006051b          	sext.w	a0,a2
    800027e4:	00000c93          	li	s9,0
    800027e8:	02079793          	slli	a5,a5,0x20
    800027ec:	0207d793          	srli	a5,a5,0x20
    800027f0:	00fd87b3          	add	a5,s11,a5
    800027f4:	0007c783          	lbu	a5,0(a5)
    800027f8:	02e656bb          	divuw	a3,a2,a4
    800027fc:	f8f40023          	sb	a5,-128(s0)
    80002800:	14c5d863          	bge	a1,a2,80002950 <__printf+0x278>
    80002804:	06300593          	li	a1,99
    80002808:	00100c93          	li	s9,1
    8000280c:	02e6f7bb          	remuw	a5,a3,a4
    80002810:	02079793          	slli	a5,a5,0x20
    80002814:	0207d793          	srli	a5,a5,0x20
    80002818:	00fd87b3          	add	a5,s11,a5
    8000281c:	0007c783          	lbu	a5,0(a5)
    80002820:	02e6d73b          	divuw	a4,a3,a4
    80002824:	f8f400a3          	sb	a5,-127(s0)
    80002828:	12a5f463          	bgeu	a1,a0,80002950 <__printf+0x278>
    8000282c:	00a00693          	li	a3,10
    80002830:	00900593          	li	a1,9
    80002834:	02d777bb          	remuw	a5,a4,a3
    80002838:	02079793          	slli	a5,a5,0x20
    8000283c:	0207d793          	srli	a5,a5,0x20
    80002840:	00fd87b3          	add	a5,s11,a5
    80002844:	0007c503          	lbu	a0,0(a5)
    80002848:	02d757bb          	divuw	a5,a4,a3
    8000284c:	f8a40123          	sb	a0,-126(s0)
    80002850:	48e5f263          	bgeu	a1,a4,80002cd4 <__printf+0x5fc>
    80002854:	06300513          	li	a0,99
    80002858:	02d7f5bb          	remuw	a1,a5,a3
    8000285c:	02059593          	slli	a1,a1,0x20
    80002860:	0205d593          	srli	a1,a1,0x20
    80002864:	00bd85b3          	add	a1,s11,a1
    80002868:	0005c583          	lbu	a1,0(a1)
    8000286c:	02d7d7bb          	divuw	a5,a5,a3
    80002870:	f8b401a3          	sb	a1,-125(s0)
    80002874:	48e57263          	bgeu	a0,a4,80002cf8 <__printf+0x620>
    80002878:	3e700513          	li	a0,999
    8000287c:	02d7f5bb          	remuw	a1,a5,a3
    80002880:	02059593          	slli	a1,a1,0x20
    80002884:	0205d593          	srli	a1,a1,0x20
    80002888:	00bd85b3          	add	a1,s11,a1
    8000288c:	0005c583          	lbu	a1,0(a1)
    80002890:	02d7d7bb          	divuw	a5,a5,a3
    80002894:	f8b40223          	sb	a1,-124(s0)
    80002898:	46e57663          	bgeu	a0,a4,80002d04 <__printf+0x62c>
    8000289c:	02d7f5bb          	remuw	a1,a5,a3
    800028a0:	02059593          	slli	a1,a1,0x20
    800028a4:	0205d593          	srli	a1,a1,0x20
    800028a8:	00bd85b3          	add	a1,s11,a1
    800028ac:	0005c583          	lbu	a1,0(a1)
    800028b0:	02d7d7bb          	divuw	a5,a5,a3
    800028b4:	f8b402a3          	sb	a1,-123(s0)
    800028b8:	46ea7863          	bgeu	s4,a4,80002d28 <__printf+0x650>
    800028bc:	02d7f5bb          	remuw	a1,a5,a3
    800028c0:	02059593          	slli	a1,a1,0x20
    800028c4:	0205d593          	srli	a1,a1,0x20
    800028c8:	00bd85b3          	add	a1,s11,a1
    800028cc:	0005c583          	lbu	a1,0(a1)
    800028d0:	02d7d7bb          	divuw	a5,a5,a3
    800028d4:	f8b40323          	sb	a1,-122(s0)
    800028d8:	3eeaf863          	bgeu	s5,a4,80002cc8 <__printf+0x5f0>
    800028dc:	02d7f5bb          	remuw	a1,a5,a3
    800028e0:	02059593          	slli	a1,a1,0x20
    800028e4:	0205d593          	srli	a1,a1,0x20
    800028e8:	00bd85b3          	add	a1,s11,a1
    800028ec:	0005c583          	lbu	a1,0(a1)
    800028f0:	02d7d7bb          	divuw	a5,a5,a3
    800028f4:	f8b403a3          	sb	a1,-121(s0)
    800028f8:	42eb7e63          	bgeu	s6,a4,80002d34 <__printf+0x65c>
    800028fc:	02d7f5bb          	remuw	a1,a5,a3
    80002900:	02059593          	slli	a1,a1,0x20
    80002904:	0205d593          	srli	a1,a1,0x20
    80002908:	00bd85b3          	add	a1,s11,a1
    8000290c:	0005c583          	lbu	a1,0(a1)
    80002910:	02d7d7bb          	divuw	a5,a5,a3
    80002914:	f8b40423          	sb	a1,-120(s0)
    80002918:	42ebfc63          	bgeu	s7,a4,80002d50 <__printf+0x678>
    8000291c:	02079793          	slli	a5,a5,0x20
    80002920:	0207d793          	srli	a5,a5,0x20
    80002924:	00fd8db3          	add	s11,s11,a5
    80002928:	000dc703          	lbu	a4,0(s11)
    8000292c:	00a00793          	li	a5,10
    80002930:	00900c93          	li	s9,9
    80002934:	f8e404a3          	sb	a4,-119(s0)
    80002938:	00065c63          	bgez	a2,80002950 <__printf+0x278>
    8000293c:	f9040713          	addi	a4,s0,-112
    80002940:	00f70733          	add	a4,a4,a5
    80002944:	02d00693          	li	a3,45
    80002948:	fed70823          	sb	a3,-16(a4)
    8000294c:	00078c93          	mv	s9,a5
    80002950:	f8040793          	addi	a5,s0,-128
    80002954:	01978cb3          	add	s9,a5,s9
    80002958:	f7f40d13          	addi	s10,s0,-129
    8000295c:	000cc503          	lbu	a0,0(s9)
    80002960:	fffc8c93          	addi	s9,s9,-1
    80002964:	00000097          	auipc	ra,0x0
    80002968:	b90080e7          	jalr	-1136(ra) # 800024f4 <consputc>
    8000296c:	ffac98e3          	bne	s9,s10,8000295c <__printf+0x284>
    80002970:	00094503          	lbu	a0,0(s2)
    80002974:	e00514e3          	bnez	a0,8000277c <__printf+0xa4>
    80002978:	1a0c1663          	bnez	s8,80002b24 <__printf+0x44c>
    8000297c:	08813083          	ld	ra,136(sp)
    80002980:	08013403          	ld	s0,128(sp)
    80002984:	07813483          	ld	s1,120(sp)
    80002988:	07013903          	ld	s2,112(sp)
    8000298c:	06813983          	ld	s3,104(sp)
    80002990:	06013a03          	ld	s4,96(sp)
    80002994:	05813a83          	ld	s5,88(sp)
    80002998:	05013b03          	ld	s6,80(sp)
    8000299c:	04813b83          	ld	s7,72(sp)
    800029a0:	04013c03          	ld	s8,64(sp)
    800029a4:	03813c83          	ld	s9,56(sp)
    800029a8:	03013d03          	ld	s10,48(sp)
    800029ac:	02813d83          	ld	s11,40(sp)
    800029b0:	0d010113          	addi	sp,sp,208
    800029b4:	00008067          	ret
    800029b8:	07300713          	li	a4,115
    800029bc:	1ce78a63          	beq	a5,a4,80002b90 <__printf+0x4b8>
    800029c0:	07800713          	li	a4,120
    800029c4:	1ee79e63          	bne	a5,a4,80002bc0 <__printf+0x4e8>
    800029c8:	f7843783          	ld	a5,-136(s0)
    800029cc:	0007a703          	lw	a4,0(a5)
    800029d0:	00878793          	addi	a5,a5,8
    800029d4:	f6f43c23          	sd	a5,-136(s0)
    800029d8:	28074263          	bltz	a4,80002c5c <__printf+0x584>
    800029dc:	00002d97          	auipc	s11,0x2
    800029e0:	80cd8d93          	addi	s11,s11,-2036 # 800041e8 <digits>
    800029e4:	00f77793          	andi	a5,a4,15
    800029e8:	00fd87b3          	add	a5,s11,a5
    800029ec:	0007c683          	lbu	a3,0(a5)
    800029f0:	00f00613          	li	a2,15
    800029f4:	0007079b          	sext.w	a5,a4
    800029f8:	f8d40023          	sb	a3,-128(s0)
    800029fc:	0047559b          	srliw	a1,a4,0x4
    80002a00:	0047569b          	srliw	a3,a4,0x4
    80002a04:	00000c93          	li	s9,0
    80002a08:	0ee65063          	bge	a2,a4,80002ae8 <__printf+0x410>
    80002a0c:	00f6f693          	andi	a3,a3,15
    80002a10:	00dd86b3          	add	a3,s11,a3
    80002a14:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002a18:	0087d79b          	srliw	a5,a5,0x8
    80002a1c:	00100c93          	li	s9,1
    80002a20:	f8d400a3          	sb	a3,-127(s0)
    80002a24:	0cb67263          	bgeu	a2,a1,80002ae8 <__printf+0x410>
    80002a28:	00f7f693          	andi	a3,a5,15
    80002a2c:	00dd86b3          	add	a3,s11,a3
    80002a30:	0006c583          	lbu	a1,0(a3)
    80002a34:	00f00613          	li	a2,15
    80002a38:	0047d69b          	srliw	a3,a5,0x4
    80002a3c:	f8b40123          	sb	a1,-126(s0)
    80002a40:	0047d593          	srli	a1,a5,0x4
    80002a44:	28f67e63          	bgeu	a2,a5,80002ce0 <__printf+0x608>
    80002a48:	00f6f693          	andi	a3,a3,15
    80002a4c:	00dd86b3          	add	a3,s11,a3
    80002a50:	0006c503          	lbu	a0,0(a3)
    80002a54:	0087d813          	srli	a6,a5,0x8
    80002a58:	0087d69b          	srliw	a3,a5,0x8
    80002a5c:	f8a401a3          	sb	a0,-125(s0)
    80002a60:	28b67663          	bgeu	a2,a1,80002cec <__printf+0x614>
    80002a64:	00f6f693          	andi	a3,a3,15
    80002a68:	00dd86b3          	add	a3,s11,a3
    80002a6c:	0006c583          	lbu	a1,0(a3)
    80002a70:	00c7d513          	srli	a0,a5,0xc
    80002a74:	00c7d69b          	srliw	a3,a5,0xc
    80002a78:	f8b40223          	sb	a1,-124(s0)
    80002a7c:	29067a63          	bgeu	a2,a6,80002d10 <__printf+0x638>
    80002a80:	00f6f693          	andi	a3,a3,15
    80002a84:	00dd86b3          	add	a3,s11,a3
    80002a88:	0006c583          	lbu	a1,0(a3)
    80002a8c:	0107d813          	srli	a6,a5,0x10
    80002a90:	0107d69b          	srliw	a3,a5,0x10
    80002a94:	f8b402a3          	sb	a1,-123(s0)
    80002a98:	28a67263          	bgeu	a2,a0,80002d1c <__printf+0x644>
    80002a9c:	00f6f693          	andi	a3,a3,15
    80002aa0:	00dd86b3          	add	a3,s11,a3
    80002aa4:	0006c683          	lbu	a3,0(a3)
    80002aa8:	0147d79b          	srliw	a5,a5,0x14
    80002aac:	f8d40323          	sb	a3,-122(s0)
    80002ab0:	21067663          	bgeu	a2,a6,80002cbc <__printf+0x5e4>
    80002ab4:	02079793          	slli	a5,a5,0x20
    80002ab8:	0207d793          	srli	a5,a5,0x20
    80002abc:	00fd8db3          	add	s11,s11,a5
    80002ac0:	000dc683          	lbu	a3,0(s11)
    80002ac4:	00800793          	li	a5,8
    80002ac8:	00700c93          	li	s9,7
    80002acc:	f8d403a3          	sb	a3,-121(s0)
    80002ad0:	00075c63          	bgez	a4,80002ae8 <__printf+0x410>
    80002ad4:	f9040713          	addi	a4,s0,-112
    80002ad8:	00f70733          	add	a4,a4,a5
    80002adc:	02d00693          	li	a3,45
    80002ae0:	fed70823          	sb	a3,-16(a4)
    80002ae4:	00078c93          	mv	s9,a5
    80002ae8:	f8040793          	addi	a5,s0,-128
    80002aec:	01978cb3          	add	s9,a5,s9
    80002af0:	f7f40d13          	addi	s10,s0,-129
    80002af4:	000cc503          	lbu	a0,0(s9)
    80002af8:	fffc8c93          	addi	s9,s9,-1
    80002afc:	00000097          	auipc	ra,0x0
    80002b00:	9f8080e7          	jalr	-1544(ra) # 800024f4 <consputc>
    80002b04:	ff9d18e3          	bne	s10,s9,80002af4 <__printf+0x41c>
    80002b08:	0100006f          	j	80002b18 <__printf+0x440>
    80002b0c:	00000097          	auipc	ra,0x0
    80002b10:	9e8080e7          	jalr	-1560(ra) # 800024f4 <consputc>
    80002b14:	000c8493          	mv	s1,s9
    80002b18:	00094503          	lbu	a0,0(s2)
    80002b1c:	c60510e3          	bnez	a0,8000277c <__printf+0xa4>
    80002b20:	e40c0ee3          	beqz	s8,8000297c <__printf+0x2a4>
    80002b24:	00003517          	auipc	a0,0x3
    80002b28:	dbc50513          	addi	a0,a0,-580 # 800058e0 <pr>
    80002b2c:	00001097          	auipc	ra,0x1
    80002b30:	94c080e7          	jalr	-1716(ra) # 80003478 <release>
    80002b34:	e49ff06f          	j	8000297c <__printf+0x2a4>
    80002b38:	f7843783          	ld	a5,-136(s0)
    80002b3c:	03000513          	li	a0,48
    80002b40:	01000d13          	li	s10,16
    80002b44:	00878713          	addi	a4,a5,8
    80002b48:	0007bc83          	ld	s9,0(a5)
    80002b4c:	f6e43c23          	sd	a4,-136(s0)
    80002b50:	00000097          	auipc	ra,0x0
    80002b54:	9a4080e7          	jalr	-1628(ra) # 800024f4 <consputc>
    80002b58:	07800513          	li	a0,120
    80002b5c:	00000097          	auipc	ra,0x0
    80002b60:	998080e7          	jalr	-1640(ra) # 800024f4 <consputc>
    80002b64:	00001d97          	auipc	s11,0x1
    80002b68:	684d8d93          	addi	s11,s11,1668 # 800041e8 <digits>
    80002b6c:	03ccd793          	srli	a5,s9,0x3c
    80002b70:	00fd87b3          	add	a5,s11,a5
    80002b74:	0007c503          	lbu	a0,0(a5)
    80002b78:	fffd0d1b          	addiw	s10,s10,-1
    80002b7c:	004c9c93          	slli	s9,s9,0x4
    80002b80:	00000097          	auipc	ra,0x0
    80002b84:	974080e7          	jalr	-1676(ra) # 800024f4 <consputc>
    80002b88:	fe0d12e3          	bnez	s10,80002b6c <__printf+0x494>
    80002b8c:	f8dff06f          	j	80002b18 <__printf+0x440>
    80002b90:	f7843783          	ld	a5,-136(s0)
    80002b94:	0007bc83          	ld	s9,0(a5)
    80002b98:	00878793          	addi	a5,a5,8
    80002b9c:	f6f43c23          	sd	a5,-136(s0)
    80002ba0:	000c9a63          	bnez	s9,80002bb4 <__printf+0x4dc>
    80002ba4:	1080006f          	j	80002cac <__printf+0x5d4>
    80002ba8:	001c8c93          	addi	s9,s9,1
    80002bac:	00000097          	auipc	ra,0x0
    80002bb0:	948080e7          	jalr	-1720(ra) # 800024f4 <consputc>
    80002bb4:	000cc503          	lbu	a0,0(s9)
    80002bb8:	fe0518e3          	bnez	a0,80002ba8 <__printf+0x4d0>
    80002bbc:	f5dff06f          	j	80002b18 <__printf+0x440>
    80002bc0:	02500513          	li	a0,37
    80002bc4:	00000097          	auipc	ra,0x0
    80002bc8:	930080e7          	jalr	-1744(ra) # 800024f4 <consputc>
    80002bcc:	000c8513          	mv	a0,s9
    80002bd0:	00000097          	auipc	ra,0x0
    80002bd4:	924080e7          	jalr	-1756(ra) # 800024f4 <consputc>
    80002bd8:	f41ff06f          	j	80002b18 <__printf+0x440>
    80002bdc:	02500513          	li	a0,37
    80002be0:	00000097          	auipc	ra,0x0
    80002be4:	914080e7          	jalr	-1772(ra) # 800024f4 <consputc>
    80002be8:	f31ff06f          	j	80002b18 <__printf+0x440>
    80002bec:	00030513          	mv	a0,t1
    80002bf0:	00000097          	auipc	ra,0x0
    80002bf4:	7bc080e7          	jalr	1980(ra) # 800033ac <acquire>
    80002bf8:	b4dff06f          	j	80002744 <__printf+0x6c>
    80002bfc:	40c0053b          	negw	a0,a2
    80002c00:	00a00713          	li	a4,10
    80002c04:	02e576bb          	remuw	a3,a0,a4
    80002c08:	00001d97          	auipc	s11,0x1
    80002c0c:	5e0d8d93          	addi	s11,s11,1504 # 800041e8 <digits>
    80002c10:	ff700593          	li	a1,-9
    80002c14:	02069693          	slli	a3,a3,0x20
    80002c18:	0206d693          	srli	a3,a3,0x20
    80002c1c:	00dd86b3          	add	a3,s11,a3
    80002c20:	0006c683          	lbu	a3,0(a3)
    80002c24:	02e557bb          	divuw	a5,a0,a4
    80002c28:	f8d40023          	sb	a3,-128(s0)
    80002c2c:	10b65e63          	bge	a2,a1,80002d48 <__printf+0x670>
    80002c30:	06300593          	li	a1,99
    80002c34:	02e7f6bb          	remuw	a3,a5,a4
    80002c38:	02069693          	slli	a3,a3,0x20
    80002c3c:	0206d693          	srli	a3,a3,0x20
    80002c40:	00dd86b3          	add	a3,s11,a3
    80002c44:	0006c683          	lbu	a3,0(a3)
    80002c48:	02e7d73b          	divuw	a4,a5,a4
    80002c4c:	00200793          	li	a5,2
    80002c50:	f8d400a3          	sb	a3,-127(s0)
    80002c54:	bca5ece3          	bltu	a1,a0,8000282c <__printf+0x154>
    80002c58:	ce5ff06f          	j	8000293c <__printf+0x264>
    80002c5c:	40e007bb          	negw	a5,a4
    80002c60:	00001d97          	auipc	s11,0x1
    80002c64:	588d8d93          	addi	s11,s11,1416 # 800041e8 <digits>
    80002c68:	00f7f693          	andi	a3,a5,15
    80002c6c:	00dd86b3          	add	a3,s11,a3
    80002c70:	0006c583          	lbu	a1,0(a3)
    80002c74:	ff100613          	li	a2,-15
    80002c78:	0047d69b          	srliw	a3,a5,0x4
    80002c7c:	f8b40023          	sb	a1,-128(s0)
    80002c80:	0047d59b          	srliw	a1,a5,0x4
    80002c84:	0ac75e63          	bge	a4,a2,80002d40 <__printf+0x668>
    80002c88:	00f6f693          	andi	a3,a3,15
    80002c8c:	00dd86b3          	add	a3,s11,a3
    80002c90:	0006c603          	lbu	a2,0(a3)
    80002c94:	00f00693          	li	a3,15
    80002c98:	0087d79b          	srliw	a5,a5,0x8
    80002c9c:	f8c400a3          	sb	a2,-127(s0)
    80002ca0:	d8b6e4e3          	bltu	a3,a1,80002a28 <__printf+0x350>
    80002ca4:	00200793          	li	a5,2
    80002ca8:	e2dff06f          	j	80002ad4 <__printf+0x3fc>
    80002cac:	00001c97          	auipc	s9,0x1
    80002cb0:	51cc8c93          	addi	s9,s9,1308 # 800041c8 <_ZZ12printIntegermE6digits+0x148>
    80002cb4:	02800513          	li	a0,40
    80002cb8:	ef1ff06f          	j	80002ba8 <__printf+0x4d0>
    80002cbc:	00700793          	li	a5,7
    80002cc0:	00600c93          	li	s9,6
    80002cc4:	e0dff06f          	j	80002ad0 <__printf+0x3f8>
    80002cc8:	00700793          	li	a5,7
    80002ccc:	00600c93          	li	s9,6
    80002cd0:	c69ff06f          	j	80002938 <__printf+0x260>
    80002cd4:	00300793          	li	a5,3
    80002cd8:	00200c93          	li	s9,2
    80002cdc:	c5dff06f          	j	80002938 <__printf+0x260>
    80002ce0:	00300793          	li	a5,3
    80002ce4:	00200c93          	li	s9,2
    80002ce8:	de9ff06f          	j	80002ad0 <__printf+0x3f8>
    80002cec:	00400793          	li	a5,4
    80002cf0:	00300c93          	li	s9,3
    80002cf4:	dddff06f          	j	80002ad0 <__printf+0x3f8>
    80002cf8:	00400793          	li	a5,4
    80002cfc:	00300c93          	li	s9,3
    80002d00:	c39ff06f          	j	80002938 <__printf+0x260>
    80002d04:	00500793          	li	a5,5
    80002d08:	00400c93          	li	s9,4
    80002d0c:	c2dff06f          	j	80002938 <__printf+0x260>
    80002d10:	00500793          	li	a5,5
    80002d14:	00400c93          	li	s9,4
    80002d18:	db9ff06f          	j	80002ad0 <__printf+0x3f8>
    80002d1c:	00600793          	li	a5,6
    80002d20:	00500c93          	li	s9,5
    80002d24:	dadff06f          	j	80002ad0 <__printf+0x3f8>
    80002d28:	00600793          	li	a5,6
    80002d2c:	00500c93          	li	s9,5
    80002d30:	c09ff06f          	j	80002938 <__printf+0x260>
    80002d34:	00800793          	li	a5,8
    80002d38:	00700c93          	li	s9,7
    80002d3c:	bfdff06f          	j	80002938 <__printf+0x260>
    80002d40:	00100793          	li	a5,1
    80002d44:	d91ff06f          	j	80002ad4 <__printf+0x3fc>
    80002d48:	00100793          	li	a5,1
    80002d4c:	bf1ff06f          	j	8000293c <__printf+0x264>
    80002d50:	00900793          	li	a5,9
    80002d54:	00800c93          	li	s9,8
    80002d58:	be1ff06f          	j	80002938 <__printf+0x260>
    80002d5c:	00001517          	auipc	a0,0x1
    80002d60:	47450513          	addi	a0,a0,1140 # 800041d0 <_ZZ12printIntegermE6digits+0x150>
    80002d64:	00000097          	auipc	ra,0x0
    80002d68:	918080e7          	jalr	-1768(ra) # 8000267c <panic>

0000000080002d6c <printfinit>:
    80002d6c:	fe010113          	addi	sp,sp,-32
    80002d70:	00813823          	sd	s0,16(sp)
    80002d74:	00913423          	sd	s1,8(sp)
    80002d78:	00113c23          	sd	ra,24(sp)
    80002d7c:	02010413          	addi	s0,sp,32
    80002d80:	00003497          	auipc	s1,0x3
    80002d84:	b6048493          	addi	s1,s1,-1184 # 800058e0 <pr>
    80002d88:	00048513          	mv	a0,s1
    80002d8c:	00001597          	auipc	a1,0x1
    80002d90:	45458593          	addi	a1,a1,1108 # 800041e0 <_ZZ12printIntegermE6digits+0x160>
    80002d94:	00000097          	auipc	ra,0x0
    80002d98:	5f4080e7          	jalr	1524(ra) # 80003388 <initlock>
    80002d9c:	01813083          	ld	ra,24(sp)
    80002da0:	01013403          	ld	s0,16(sp)
    80002da4:	0004ac23          	sw	zero,24(s1)
    80002da8:	00813483          	ld	s1,8(sp)
    80002dac:	02010113          	addi	sp,sp,32
    80002db0:	00008067          	ret

0000000080002db4 <uartinit>:
    80002db4:	ff010113          	addi	sp,sp,-16
    80002db8:	00813423          	sd	s0,8(sp)
    80002dbc:	01010413          	addi	s0,sp,16
    80002dc0:	100007b7          	lui	a5,0x10000
    80002dc4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002dc8:	f8000713          	li	a4,-128
    80002dcc:	00e781a3          	sb	a4,3(a5)
    80002dd0:	00300713          	li	a4,3
    80002dd4:	00e78023          	sb	a4,0(a5)
    80002dd8:	000780a3          	sb	zero,1(a5)
    80002ddc:	00e781a3          	sb	a4,3(a5)
    80002de0:	00700693          	li	a3,7
    80002de4:	00d78123          	sb	a3,2(a5)
    80002de8:	00e780a3          	sb	a4,1(a5)
    80002dec:	00813403          	ld	s0,8(sp)
    80002df0:	01010113          	addi	sp,sp,16
    80002df4:	00008067          	ret

0000000080002df8 <uartputc>:
    80002df8:	00002797          	auipc	a5,0x2
    80002dfc:	8907a783          	lw	a5,-1904(a5) # 80004688 <panicked>
    80002e00:	00078463          	beqz	a5,80002e08 <uartputc+0x10>
    80002e04:	0000006f          	j	80002e04 <uartputc+0xc>
    80002e08:	fd010113          	addi	sp,sp,-48
    80002e0c:	02813023          	sd	s0,32(sp)
    80002e10:	00913c23          	sd	s1,24(sp)
    80002e14:	01213823          	sd	s2,16(sp)
    80002e18:	01313423          	sd	s3,8(sp)
    80002e1c:	02113423          	sd	ra,40(sp)
    80002e20:	03010413          	addi	s0,sp,48
    80002e24:	00002917          	auipc	s2,0x2
    80002e28:	86c90913          	addi	s2,s2,-1940 # 80004690 <uart_tx_r>
    80002e2c:	00093783          	ld	a5,0(s2)
    80002e30:	00002497          	auipc	s1,0x2
    80002e34:	86848493          	addi	s1,s1,-1944 # 80004698 <uart_tx_w>
    80002e38:	0004b703          	ld	a4,0(s1)
    80002e3c:	02078693          	addi	a3,a5,32
    80002e40:	00050993          	mv	s3,a0
    80002e44:	02e69c63          	bne	a3,a4,80002e7c <uartputc+0x84>
    80002e48:	00001097          	auipc	ra,0x1
    80002e4c:	834080e7          	jalr	-1996(ra) # 8000367c <push_on>
    80002e50:	00093783          	ld	a5,0(s2)
    80002e54:	0004b703          	ld	a4,0(s1)
    80002e58:	02078793          	addi	a5,a5,32
    80002e5c:	00e79463          	bne	a5,a4,80002e64 <uartputc+0x6c>
    80002e60:	0000006f          	j	80002e60 <uartputc+0x68>
    80002e64:	00001097          	auipc	ra,0x1
    80002e68:	88c080e7          	jalr	-1908(ra) # 800036f0 <pop_on>
    80002e6c:	00093783          	ld	a5,0(s2)
    80002e70:	0004b703          	ld	a4,0(s1)
    80002e74:	02078693          	addi	a3,a5,32
    80002e78:	fce688e3          	beq	a3,a4,80002e48 <uartputc+0x50>
    80002e7c:	01f77693          	andi	a3,a4,31
    80002e80:	00003597          	auipc	a1,0x3
    80002e84:	a8058593          	addi	a1,a1,-1408 # 80005900 <uart_tx_buf>
    80002e88:	00d586b3          	add	a3,a1,a3
    80002e8c:	00170713          	addi	a4,a4,1
    80002e90:	01368023          	sb	s3,0(a3)
    80002e94:	00e4b023          	sd	a4,0(s1)
    80002e98:	10000637          	lui	a2,0x10000
    80002e9c:	02f71063          	bne	a4,a5,80002ebc <uartputc+0xc4>
    80002ea0:	0340006f          	j	80002ed4 <uartputc+0xdc>
    80002ea4:	00074703          	lbu	a4,0(a4)
    80002ea8:	00f93023          	sd	a5,0(s2)
    80002eac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002eb0:	00093783          	ld	a5,0(s2)
    80002eb4:	0004b703          	ld	a4,0(s1)
    80002eb8:	00f70e63          	beq	a4,a5,80002ed4 <uartputc+0xdc>
    80002ebc:	00564683          	lbu	a3,5(a2)
    80002ec0:	01f7f713          	andi	a4,a5,31
    80002ec4:	00e58733          	add	a4,a1,a4
    80002ec8:	0206f693          	andi	a3,a3,32
    80002ecc:	00178793          	addi	a5,a5,1
    80002ed0:	fc069ae3          	bnez	a3,80002ea4 <uartputc+0xac>
    80002ed4:	02813083          	ld	ra,40(sp)
    80002ed8:	02013403          	ld	s0,32(sp)
    80002edc:	01813483          	ld	s1,24(sp)
    80002ee0:	01013903          	ld	s2,16(sp)
    80002ee4:	00813983          	ld	s3,8(sp)
    80002ee8:	03010113          	addi	sp,sp,48
    80002eec:	00008067          	ret

0000000080002ef0 <uartputc_sync>:
    80002ef0:	ff010113          	addi	sp,sp,-16
    80002ef4:	00813423          	sd	s0,8(sp)
    80002ef8:	01010413          	addi	s0,sp,16
    80002efc:	00001717          	auipc	a4,0x1
    80002f00:	78c72703          	lw	a4,1932(a4) # 80004688 <panicked>
    80002f04:	02071663          	bnez	a4,80002f30 <uartputc_sync+0x40>
    80002f08:	00050793          	mv	a5,a0
    80002f0c:	100006b7          	lui	a3,0x10000
    80002f10:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002f14:	02077713          	andi	a4,a4,32
    80002f18:	fe070ce3          	beqz	a4,80002f10 <uartputc_sync+0x20>
    80002f1c:	0ff7f793          	andi	a5,a5,255
    80002f20:	00f68023          	sb	a5,0(a3)
    80002f24:	00813403          	ld	s0,8(sp)
    80002f28:	01010113          	addi	sp,sp,16
    80002f2c:	00008067          	ret
    80002f30:	0000006f          	j	80002f30 <uartputc_sync+0x40>

0000000080002f34 <uartstart>:
    80002f34:	ff010113          	addi	sp,sp,-16
    80002f38:	00813423          	sd	s0,8(sp)
    80002f3c:	01010413          	addi	s0,sp,16
    80002f40:	00001617          	auipc	a2,0x1
    80002f44:	75060613          	addi	a2,a2,1872 # 80004690 <uart_tx_r>
    80002f48:	00001517          	auipc	a0,0x1
    80002f4c:	75050513          	addi	a0,a0,1872 # 80004698 <uart_tx_w>
    80002f50:	00063783          	ld	a5,0(a2)
    80002f54:	00053703          	ld	a4,0(a0)
    80002f58:	04f70263          	beq	a4,a5,80002f9c <uartstart+0x68>
    80002f5c:	100005b7          	lui	a1,0x10000
    80002f60:	00003817          	auipc	a6,0x3
    80002f64:	9a080813          	addi	a6,a6,-1632 # 80005900 <uart_tx_buf>
    80002f68:	01c0006f          	j	80002f84 <uartstart+0x50>
    80002f6c:	0006c703          	lbu	a4,0(a3)
    80002f70:	00f63023          	sd	a5,0(a2)
    80002f74:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002f78:	00063783          	ld	a5,0(a2)
    80002f7c:	00053703          	ld	a4,0(a0)
    80002f80:	00f70e63          	beq	a4,a5,80002f9c <uartstart+0x68>
    80002f84:	01f7f713          	andi	a4,a5,31
    80002f88:	00e806b3          	add	a3,a6,a4
    80002f8c:	0055c703          	lbu	a4,5(a1)
    80002f90:	00178793          	addi	a5,a5,1
    80002f94:	02077713          	andi	a4,a4,32
    80002f98:	fc071ae3          	bnez	a4,80002f6c <uartstart+0x38>
    80002f9c:	00813403          	ld	s0,8(sp)
    80002fa0:	01010113          	addi	sp,sp,16
    80002fa4:	00008067          	ret

0000000080002fa8 <uartgetc>:
    80002fa8:	ff010113          	addi	sp,sp,-16
    80002fac:	00813423          	sd	s0,8(sp)
    80002fb0:	01010413          	addi	s0,sp,16
    80002fb4:	10000737          	lui	a4,0x10000
    80002fb8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002fbc:	0017f793          	andi	a5,a5,1
    80002fc0:	00078c63          	beqz	a5,80002fd8 <uartgetc+0x30>
    80002fc4:	00074503          	lbu	a0,0(a4)
    80002fc8:	0ff57513          	andi	a0,a0,255
    80002fcc:	00813403          	ld	s0,8(sp)
    80002fd0:	01010113          	addi	sp,sp,16
    80002fd4:	00008067          	ret
    80002fd8:	fff00513          	li	a0,-1
    80002fdc:	ff1ff06f          	j	80002fcc <uartgetc+0x24>

0000000080002fe0 <uartintr>:
    80002fe0:	100007b7          	lui	a5,0x10000
    80002fe4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002fe8:	0017f793          	andi	a5,a5,1
    80002fec:	0a078463          	beqz	a5,80003094 <uartintr+0xb4>
    80002ff0:	fe010113          	addi	sp,sp,-32
    80002ff4:	00813823          	sd	s0,16(sp)
    80002ff8:	00913423          	sd	s1,8(sp)
    80002ffc:	00113c23          	sd	ra,24(sp)
    80003000:	02010413          	addi	s0,sp,32
    80003004:	100004b7          	lui	s1,0x10000
    80003008:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000300c:	0ff57513          	andi	a0,a0,255
    80003010:	fffff097          	auipc	ra,0xfffff
    80003014:	534080e7          	jalr	1332(ra) # 80002544 <consoleintr>
    80003018:	0054c783          	lbu	a5,5(s1)
    8000301c:	0017f793          	andi	a5,a5,1
    80003020:	fe0794e3          	bnez	a5,80003008 <uartintr+0x28>
    80003024:	00001617          	auipc	a2,0x1
    80003028:	66c60613          	addi	a2,a2,1644 # 80004690 <uart_tx_r>
    8000302c:	00001517          	auipc	a0,0x1
    80003030:	66c50513          	addi	a0,a0,1644 # 80004698 <uart_tx_w>
    80003034:	00063783          	ld	a5,0(a2)
    80003038:	00053703          	ld	a4,0(a0)
    8000303c:	04f70263          	beq	a4,a5,80003080 <uartintr+0xa0>
    80003040:	100005b7          	lui	a1,0x10000
    80003044:	00003817          	auipc	a6,0x3
    80003048:	8bc80813          	addi	a6,a6,-1860 # 80005900 <uart_tx_buf>
    8000304c:	01c0006f          	j	80003068 <uartintr+0x88>
    80003050:	0006c703          	lbu	a4,0(a3)
    80003054:	00f63023          	sd	a5,0(a2)
    80003058:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000305c:	00063783          	ld	a5,0(a2)
    80003060:	00053703          	ld	a4,0(a0)
    80003064:	00f70e63          	beq	a4,a5,80003080 <uartintr+0xa0>
    80003068:	01f7f713          	andi	a4,a5,31
    8000306c:	00e806b3          	add	a3,a6,a4
    80003070:	0055c703          	lbu	a4,5(a1)
    80003074:	00178793          	addi	a5,a5,1
    80003078:	02077713          	andi	a4,a4,32
    8000307c:	fc071ae3          	bnez	a4,80003050 <uartintr+0x70>
    80003080:	01813083          	ld	ra,24(sp)
    80003084:	01013403          	ld	s0,16(sp)
    80003088:	00813483          	ld	s1,8(sp)
    8000308c:	02010113          	addi	sp,sp,32
    80003090:	00008067          	ret
    80003094:	00001617          	auipc	a2,0x1
    80003098:	5fc60613          	addi	a2,a2,1532 # 80004690 <uart_tx_r>
    8000309c:	00001517          	auipc	a0,0x1
    800030a0:	5fc50513          	addi	a0,a0,1532 # 80004698 <uart_tx_w>
    800030a4:	00063783          	ld	a5,0(a2)
    800030a8:	00053703          	ld	a4,0(a0)
    800030ac:	04f70263          	beq	a4,a5,800030f0 <uartintr+0x110>
    800030b0:	100005b7          	lui	a1,0x10000
    800030b4:	00003817          	auipc	a6,0x3
    800030b8:	84c80813          	addi	a6,a6,-1972 # 80005900 <uart_tx_buf>
    800030bc:	01c0006f          	j	800030d8 <uartintr+0xf8>
    800030c0:	0006c703          	lbu	a4,0(a3)
    800030c4:	00f63023          	sd	a5,0(a2)
    800030c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800030cc:	00063783          	ld	a5,0(a2)
    800030d0:	00053703          	ld	a4,0(a0)
    800030d4:	02f70063          	beq	a4,a5,800030f4 <uartintr+0x114>
    800030d8:	01f7f713          	andi	a4,a5,31
    800030dc:	00e806b3          	add	a3,a6,a4
    800030e0:	0055c703          	lbu	a4,5(a1)
    800030e4:	00178793          	addi	a5,a5,1
    800030e8:	02077713          	andi	a4,a4,32
    800030ec:	fc071ae3          	bnez	a4,800030c0 <uartintr+0xe0>
    800030f0:	00008067          	ret
    800030f4:	00008067          	ret

00000000800030f8 <kinit>:
    800030f8:	fc010113          	addi	sp,sp,-64
    800030fc:	02913423          	sd	s1,40(sp)
    80003100:	fffff7b7          	lui	a5,0xfffff
    80003104:	00004497          	auipc	s1,0x4
    80003108:	81b48493          	addi	s1,s1,-2021 # 8000691f <end+0xfff>
    8000310c:	02813823          	sd	s0,48(sp)
    80003110:	01313c23          	sd	s3,24(sp)
    80003114:	00f4f4b3          	and	s1,s1,a5
    80003118:	02113c23          	sd	ra,56(sp)
    8000311c:	03213023          	sd	s2,32(sp)
    80003120:	01413823          	sd	s4,16(sp)
    80003124:	01513423          	sd	s5,8(sp)
    80003128:	04010413          	addi	s0,sp,64
    8000312c:	000017b7          	lui	a5,0x1
    80003130:	01100993          	li	s3,17
    80003134:	00f487b3          	add	a5,s1,a5
    80003138:	01b99993          	slli	s3,s3,0x1b
    8000313c:	06f9e063          	bltu	s3,a5,8000319c <kinit+0xa4>
    80003140:	00002a97          	auipc	s5,0x2
    80003144:	7e0a8a93          	addi	s5,s5,2016 # 80005920 <end>
    80003148:	0754ec63          	bltu	s1,s5,800031c0 <kinit+0xc8>
    8000314c:	0734fa63          	bgeu	s1,s3,800031c0 <kinit+0xc8>
    80003150:	00088a37          	lui	s4,0x88
    80003154:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003158:	00001917          	auipc	s2,0x1
    8000315c:	54890913          	addi	s2,s2,1352 # 800046a0 <kmem>
    80003160:	00ca1a13          	slli	s4,s4,0xc
    80003164:	0140006f          	j	80003178 <kinit+0x80>
    80003168:	000017b7          	lui	a5,0x1
    8000316c:	00f484b3          	add	s1,s1,a5
    80003170:	0554e863          	bltu	s1,s5,800031c0 <kinit+0xc8>
    80003174:	0534f663          	bgeu	s1,s3,800031c0 <kinit+0xc8>
    80003178:	00001637          	lui	a2,0x1
    8000317c:	00100593          	li	a1,1
    80003180:	00048513          	mv	a0,s1
    80003184:	00000097          	auipc	ra,0x0
    80003188:	5e4080e7          	jalr	1508(ra) # 80003768 <__memset>
    8000318c:	00093783          	ld	a5,0(s2)
    80003190:	00f4b023          	sd	a5,0(s1)
    80003194:	00993023          	sd	s1,0(s2)
    80003198:	fd4498e3          	bne	s1,s4,80003168 <kinit+0x70>
    8000319c:	03813083          	ld	ra,56(sp)
    800031a0:	03013403          	ld	s0,48(sp)
    800031a4:	02813483          	ld	s1,40(sp)
    800031a8:	02013903          	ld	s2,32(sp)
    800031ac:	01813983          	ld	s3,24(sp)
    800031b0:	01013a03          	ld	s4,16(sp)
    800031b4:	00813a83          	ld	s5,8(sp)
    800031b8:	04010113          	addi	sp,sp,64
    800031bc:	00008067          	ret
    800031c0:	00001517          	auipc	a0,0x1
    800031c4:	04050513          	addi	a0,a0,64 # 80004200 <digits+0x18>
    800031c8:	fffff097          	auipc	ra,0xfffff
    800031cc:	4b4080e7          	jalr	1204(ra) # 8000267c <panic>

00000000800031d0 <freerange>:
    800031d0:	fc010113          	addi	sp,sp,-64
    800031d4:	000017b7          	lui	a5,0x1
    800031d8:	02913423          	sd	s1,40(sp)
    800031dc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800031e0:	009504b3          	add	s1,a0,s1
    800031e4:	fffff537          	lui	a0,0xfffff
    800031e8:	02813823          	sd	s0,48(sp)
    800031ec:	02113c23          	sd	ra,56(sp)
    800031f0:	03213023          	sd	s2,32(sp)
    800031f4:	01313c23          	sd	s3,24(sp)
    800031f8:	01413823          	sd	s4,16(sp)
    800031fc:	01513423          	sd	s5,8(sp)
    80003200:	01613023          	sd	s6,0(sp)
    80003204:	04010413          	addi	s0,sp,64
    80003208:	00a4f4b3          	and	s1,s1,a0
    8000320c:	00f487b3          	add	a5,s1,a5
    80003210:	06f5e463          	bltu	a1,a5,80003278 <freerange+0xa8>
    80003214:	00002a97          	auipc	s5,0x2
    80003218:	70ca8a93          	addi	s5,s5,1804 # 80005920 <end>
    8000321c:	0954e263          	bltu	s1,s5,800032a0 <freerange+0xd0>
    80003220:	01100993          	li	s3,17
    80003224:	01b99993          	slli	s3,s3,0x1b
    80003228:	0734fc63          	bgeu	s1,s3,800032a0 <freerange+0xd0>
    8000322c:	00058a13          	mv	s4,a1
    80003230:	00001917          	auipc	s2,0x1
    80003234:	47090913          	addi	s2,s2,1136 # 800046a0 <kmem>
    80003238:	00002b37          	lui	s6,0x2
    8000323c:	0140006f          	j	80003250 <freerange+0x80>
    80003240:	000017b7          	lui	a5,0x1
    80003244:	00f484b3          	add	s1,s1,a5
    80003248:	0554ec63          	bltu	s1,s5,800032a0 <freerange+0xd0>
    8000324c:	0534fa63          	bgeu	s1,s3,800032a0 <freerange+0xd0>
    80003250:	00001637          	lui	a2,0x1
    80003254:	00100593          	li	a1,1
    80003258:	00048513          	mv	a0,s1
    8000325c:	00000097          	auipc	ra,0x0
    80003260:	50c080e7          	jalr	1292(ra) # 80003768 <__memset>
    80003264:	00093703          	ld	a4,0(s2)
    80003268:	016487b3          	add	a5,s1,s6
    8000326c:	00e4b023          	sd	a4,0(s1)
    80003270:	00993023          	sd	s1,0(s2)
    80003274:	fcfa76e3          	bgeu	s4,a5,80003240 <freerange+0x70>
    80003278:	03813083          	ld	ra,56(sp)
    8000327c:	03013403          	ld	s0,48(sp)
    80003280:	02813483          	ld	s1,40(sp)
    80003284:	02013903          	ld	s2,32(sp)
    80003288:	01813983          	ld	s3,24(sp)
    8000328c:	01013a03          	ld	s4,16(sp)
    80003290:	00813a83          	ld	s5,8(sp)
    80003294:	00013b03          	ld	s6,0(sp)
    80003298:	04010113          	addi	sp,sp,64
    8000329c:	00008067          	ret
    800032a0:	00001517          	auipc	a0,0x1
    800032a4:	f6050513          	addi	a0,a0,-160 # 80004200 <digits+0x18>
    800032a8:	fffff097          	auipc	ra,0xfffff
    800032ac:	3d4080e7          	jalr	980(ra) # 8000267c <panic>

00000000800032b0 <kfree>:
    800032b0:	fe010113          	addi	sp,sp,-32
    800032b4:	00813823          	sd	s0,16(sp)
    800032b8:	00113c23          	sd	ra,24(sp)
    800032bc:	00913423          	sd	s1,8(sp)
    800032c0:	02010413          	addi	s0,sp,32
    800032c4:	03451793          	slli	a5,a0,0x34
    800032c8:	04079c63          	bnez	a5,80003320 <kfree+0x70>
    800032cc:	00002797          	auipc	a5,0x2
    800032d0:	65478793          	addi	a5,a5,1620 # 80005920 <end>
    800032d4:	00050493          	mv	s1,a0
    800032d8:	04f56463          	bltu	a0,a5,80003320 <kfree+0x70>
    800032dc:	01100793          	li	a5,17
    800032e0:	01b79793          	slli	a5,a5,0x1b
    800032e4:	02f57e63          	bgeu	a0,a5,80003320 <kfree+0x70>
    800032e8:	00001637          	lui	a2,0x1
    800032ec:	00100593          	li	a1,1
    800032f0:	00000097          	auipc	ra,0x0
    800032f4:	478080e7          	jalr	1144(ra) # 80003768 <__memset>
    800032f8:	00001797          	auipc	a5,0x1
    800032fc:	3a878793          	addi	a5,a5,936 # 800046a0 <kmem>
    80003300:	0007b703          	ld	a4,0(a5)
    80003304:	01813083          	ld	ra,24(sp)
    80003308:	01013403          	ld	s0,16(sp)
    8000330c:	00e4b023          	sd	a4,0(s1)
    80003310:	0097b023          	sd	s1,0(a5)
    80003314:	00813483          	ld	s1,8(sp)
    80003318:	02010113          	addi	sp,sp,32
    8000331c:	00008067          	ret
    80003320:	00001517          	auipc	a0,0x1
    80003324:	ee050513          	addi	a0,a0,-288 # 80004200 <digits+0x18>
    80003328:	fffff097          	auipc	ra,0xfffff
    8000332c:	354080e7          	jalr	852(ra) # 8000267c <panic>

0000000080003330 <kalloc>:
    80003330:	fe010113          	addi	sp,sp,-32
    80003334:	00813823          	sd	s0,16(sp)
    80003338:	00913423          	sd	s1,8(sp)
    8000333c:	00113c23          	sd	ra,24(sp)
    80003340:	02010413          	addi	s0,sp,32
    80003344:	00001797          	auipc	a5,0x1
    80003348:	35c78793          	addi	a5,a5,860 # 800046a0 <kmem>
    8000334c:	0007b483          	ld	s1,0(a5)
    80003350:	02048063          	beqz	s1,80003370 <kalloc+0x40>
    80003354:	0004b703          	ld	a4,0(s1)
    80003358:	00001637          	lui	a2,0x1
    8000335c:	00500593          	li	a1,5
    80003360:	00048513          	mv	a0,s1
    80003364:	00e7b023          	sd	a4,0(a5)
    80003368:	00000097          	auipc	ra,0x0
    8000336c:	400080e7          	jalr	1024(ra) # 80003768 <__memset>
    80003370:	01813083          	ld	ra,24(sp)
    80003374:	01013403          	ld	s0,16(sp)
    80003378:	00048513          	mv	a0,s1
    8000337c:	00813483          	ld	s1,8(sp)
    80003380:	02010113          	addi	sp,sp,32
    80003384:	00008067          	ret

0000000080003388 <initlock>:
    80003388:	ff010113          	addi	sp,sp,-16
    8000338c:	00813423          	sd	s0,8(sp)
    80003390:	01010413          	addi	s0,sp,16
    80003394:	00813403          	ld	s0,8(sp)
    80003398:	00b53423          	sd	a1,8(a0)
    8000339c:	00052023          	sw	zero,0(a0)
    800033a0:	00053823          	sd	zero,16(a0)
    800033a4:	01010113          	addi	sp,sp,16
    800033a8:	00008067          	ret

00000000800033ac <acquire>:
    800033ac:	fe010113          	addi	sp,sp,-32
    800033b0:	00813823          	sd	s0,16(sp)
    800033b4:	00913423          	sd	s1,8(sp)
    800033b8:	00113c23          	sd	ra,24(sp)
    800033bc:	01213023          	sd	s2,0(sp)
    800033c0:	02010413          	addi	s0,sp,32
    800033c4:	00050493          	mv	s1,a0
    800033c8:	10002973          	csrr	s2,sstatus
    800033cc:	100027f3          	csrr	a5,sstatus
    800033d0:	ffd7f793          	andi	a5,a5,-3
    800033d4:	10079073          	csrw	sstatus,a5
    800033d8:	fffff097          	auipc	ra,0xfffff
    800033dc:	8e4080e7          	jalr	-1820(ra) # 80001cbc <mycpu>
    800033e0:	07852783          	lw	a5,120(a0)
    800033e4:	06078e63          	beqz	a5,80003460 <acquire+0xb4>
    800033e8:	fffff097          	auipc	ra,0xfffff
    800033ec:	8d4080e7          	jalr	-1836(ra) # 80001cbc <mycpu>
    800033f0:	07852783          	lw	a5,120(a0)
    800033f4:	0004a703          	lw	a4,0(s1)
    800033f8:	0017879b          	addiw	a5,a5,1
    800033fc:	06f52c23          	sw	a5,120(a0)
    80003400:	04071063          	bnez	a4,80003440 <acquire+0x94>
    80003404:	00100713          	li	a4,1
    80003408:	00070793          	mv	a5,a4
    8000340c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003410:	0007879b          	sext.w	a5,a5
    80003414:	fe079ae3          	bnez	a5,80003408 <acquire+0x5c>
    80003418:	0ff0000f          	fence
    8000341c:	fffff097          	auipc	ra,0xfffff
    80003420:	8a0080e7          	jalr	-1888(ra) # 80001cbc <mycpu>
    80003424:	01813083          	ld	ra,24(sp)
    80003428:	01013403          	ld	s0,16(sp)
    8000342c:	00a4b823          	sd	a0,16(s1)
    80003430:	00013903          	ld	s2,0(sp)
    80003434:	00813483          	ld	s1,8(sp)
    80003438:	02010113          	addi	sp,sp,32
    8000343c:	00008067          	ret
    80003440:	0104b903          	ld	s2,16(s1)
    80003444:	fffff097          	auipc	ra,0xfffff
    80003448:	878080e7          	jalr	-1928(ra) # 80001cbc <mycpu>
    8000344c:	faa91ce3          	bne	s2,a0,80003404 <acquire+0x58>
    80003450:	00001517          	auipc	a0,0x1
    80003454:	db850513          	addi	a0,a0,-584 # 80004208 <digits+0x20>
    80003458:	fffff097          	auipc	ra,0xfffff
    8000345c:	224080e7          	jalr	548(ra) # 8000267c <panic>
    80003460:	00195913          	srli	s2,s2,0x1
    80003464:	fffff097          	auipc	ra,0xfffff
    80003468:	858080e7          	jalr	-1960(ra) # 80001cbc <mycpu>
    8000346c:	00197913          	andi	s2,s2,1
    80003470:	07252e23          	sw	s2,124(a0)
    80003474:	f75ff06f          	j	800033e8 <acquire+0x3c>

0000000080003478 <release>:
    80003478:	fe010113          	addi	sp,sp,-32
    8000347c:	00813823          	sd	s0,16(sp)
    80003480:	00113c23          	sd	ra,24(sp)
    80003484:	00913423          	sd	s1,8(sp)
    80003488:	01213023          	sd	s2,0(sp)
    8000348c:	02010413          	addi	s0,sp,32
    80003490:	00052783          	lw	a5,0(a0)
    80003494:	00079a63          	bnez	a5,800034a8 <release+0x30>
    80003498:	00001517          	auipc	a0,0x1
    8000349c:	d7850513          	addi	a0,a0,-648 # 80004210 <digits+0x28>
    800034a0:	fffff097          	auipc	ra,0xfffff
    800034a4:	1dc080e7          	jalr	476(ra) # 8000267c <panic>
    800034a8:	01053903          	ld	s2,16(a0)
    800034ac:	00050493          	mv	s1,a0
    800034b0:	fffff097          	auipc	ra,0xfffff
    800034b4:	80c080e7          	jalr	-2036(ra) # 80001cbc <mycpu>
    800034b8:	fea910e3          	bne	s2,a0,80003498 <release+0x20>
    800034bc:	0004b823          	sd	zero,16(s1)
    800034c0:	0ff0000f          	fence
    800034c4:	0f50000f          	fence	iorw,ow
    800034c8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800034cc:	ffffe097          	auipc	ra,0xffffe
    800034d0:	7f0080e7          	jalr	2032(ra) # 80001cbc <mycpu>
    800034d4:	100027f3          	csrr	a5,sstatus
    800034d8:	0027f793          	andi	a5,a5,2
    800034dc:	04079a63          	bnez	a5,80003530 <release+0xb8>
    800034e0:	07852783          	lw	a5,120(a0)
    800034e4:	02f05e63          	blez	a5,80003520 <release+0xa8>
    800034e8:	fff7871b          	addiw	a4,a5,-1
    800034ec:	06e52c23          	sw	a4,120(a0)
    800034f0:	00071c63          	bnez	a4,80003508 <release+0x90>
    800034f4:	07c52783          	lw	a5,124(a0)
    800034f8:	00078863          	beqz	a5,80003508 <release+0x90>
    800034fc:	100027f3          	csrr	a5,sstatus
    80003500:	0027e793          	ori	a5,a5,2
    80003504:	10079073          	csrw	sstatus,a5
    80003508:	01813083          	ld	ra,24(sp)
    8000350c:	01013403          	ld	s0,16(sp)
    80003510:	00813483          	ld	s1,8(sp)
    80003514:	00013903          	ld	s2,0(sp)
    80003518:	02010113          	addi	sp,sp,32
    8000351c:	00008067          	ret
    80003520:	00001517          	auipc	a0,0x1
    80003524:	d1050513          	addi	a0,a0,-752 # 80004230 <digits+0x48>
    80003528:	fffff097          	auipc	ra,0xfffff
    8000352c:	154080e7          	jalr	340(ra) # 8000267c <panic>
    80003530:	00001517          	auipc	a0,0x1
    80003534:	ce850513          	addi	a0,a0,-792 # 80004218 <digits+0x30>
    80003538:	fffff097          	auipc	ra,0xfffff
    8000353c:	144080e7          	jalr	324(ra) # 8000267c <panic>

0000000080003540 <holding>:
    80003540:	00052783          	lw	a5,0(a0)
    80003544:	00079663          	bnez	a5,80003550 <holding+0x10>
    80003548:	00000513          	li	a0,0
    8000354c:	00008067          	ret
    80003550:	fe010113          	addi	sp,sp,-32
    80003554:	00813823          	sd	s0,16(sp)
    80003558:	00913423          	sd	s1,8(sp)
    8000355c:	00113c23          	sd	ra,24(sp)
    80003560:	02010413          	addi	s0,sp,32
    80003564:	01053483          	ld	s1,16(a0)
    80003568:	ffffe097          	auipc	ra,0xffffe
    8000356c:	754080e7          	jalr	1876(ra) # 80001cbc <mycpu>
    80003570:	01813083          	ld	ra,24(sp)
    80003574:	01013403          	ld	s0,16(sp)
    80003578:	40a48533          	sub	a0,s1,a0
    8000357c:	00153513          	seqz	a0,a0
    80003580:	00813483          	ld	s1,8(sp)
    80003584:	02010113          	addi	sp,sp,32
    80003588:	00008067          	ret

000000008000358c <push_off>:
    8000358c:	fe010113          	addi	sp,sp,-32
    80003590:	00813823          	sd	s0,16(sp)
    80003594:	00113c23          	sd	ra,24(sp)
    80003598:	00913423          	sd	s1,8(sp)
    8000359c:	02010413          	addi	s0,sp,32
    800035a0:	100024f3          	csrr	s1,sstatus
    800035a4:	100027f3          	csrr	a5,sstatus
    800035a8:	ffd7f793          	andi	a5,a5,-3
    800035ac:	10079073          	csrw	sstatus,a5
    800035b0:	ffffe097          	auipc	ra,0xffffe
    800035b4:	70c080e7          	jalr	1804(ra) # 80001cbc <mycpu>
    800035b8:	07852783          	lw	a5,120(a0)
    800035bc:	02078663          	beqz	a5,800035e8 <push_off+0x5c>
    800035c0:	ffffe097          	auipc	ra,0xffffe
    800035c4:	6fc080e7          	jalr	1788(ra) # 80001cbc <mycpu>
    800035c8:	07852783          	lw	a5,120(a0)
    800035cc:	01813083          	ld	ra,24(sp)
    800035d0:	01013403          	ld	s0,16(sp)
    800035d4:	0017879b          	addiw	a5,a5,1
    800035d8:	06f52c23          	sw	a5,120(a0)
    800035dc:	00813483          	ld	s1,8(sp)
    800035e0:	02010113          	addi	sp,sp,32
    800035e4:	00008067          	ret
    800035e8:	0014d493          	srli	s1,s1,0x1
    800035ec:	ffffe097          	auipc	ra,0xffffe
    800035f0:	6d0080e7          	jalr	1744(ra) # 80001cbc <mycpu>
    800035f4:	0014f493          	andi	s1,s1,1
    800035f8:	06952e23          	sw	s1,124(a0)
    800035fc:	fc5ff06f          	j	800035c0 <push_off+0x34>

0000000080003600 <pop_off>:
    80003600:	ff010113          	addi	sp,sp,-16
    80003604:	00813023          	sd	s0,0(sp)
    80003608:	00113423          	sd	ra,8(sp)
    8000360c:	01010413          	addi	s0,sp,16
    80003610:	ffffe097          	auipc	ra,0xffffe
    80003614:	6ac080e7          	jalr	1708(ra) # 80001cbc <mycpu>
    80003618:	100027f3          	csrr	a5,sstatus
    8000361c:	0027f793          	andi	a5,a5,2
    80003620:	04079663          	bnez	a5,8000366c <pop_off+0x6c>
    80003624:	07852783          	lw	a5,120(a0)
    80003628:	02f05a63          	blez	a5,8000365c <pop_off+0x5c>
    8000362c:	fff7871b          	addiw	a4,a5,-1
    80003630:	06e52c23          	sw	a4,120(a0)
    80003634:	00071c63          	bnez	a4,8000364c <pop_off+0x4c>
    80003638:	07c52783          	lw	a5,124(a0)
    8000363c:	00078863          	beqz	a5,8000364c <pop_off+0x4c>
    80003640:	100027f3          	csrr	a5,sstatus
    80003644:	0027e793          	ori	a5,a5,2
    80003648:	10079073          	csrw	sstatus,a5
    8000364c:	00813083          	ld	ra,8(sp)
    80003650:	00013403          	ld	s0,0(sp)
    80003654:	01010113          	addi	sp,sp,16
    80003658:	00008067          	ret
    8000365c:	00001517          	auipc	a0,0x1
    80003660:	bd450513          	addi	a0,a0,-1068 # 80004230 <digits+0x48>
    80003664:	fffff097          	auipc	ra,0xfffff
    80003668:	018080e7          	jalr	24(ra) # 8000267c <panic>
    8000366c:	00001517          	auipc	a0,0x1
    80003670:	bac50513          	addi	a0,a0,-1108 # 80004218 <digits+0x30>
    80003674:	fffff097          	auipc	ra,0xfffff
    80003678:	008080e7          	jalr	8(ra) # 8000267c <panic>

000000008000367c <push_on>:
    8000367c:	fe010113          	addi	sp,sp,-32
    80003680:	00813823          	sd	s0,16(sp)
    80003684:	00113c23          	sd	ra,24(sp)
    80003688:	00913423          	sd	s1,8(sp)
    8000368c:	02010413          	addi	s0,sp,32
    80003690:	100024f3          	csrr	s1,sstatus
    80003694:	100027f3          	csrr	a5,sstatus
    80003698:	0027e793          	ori	a5,a5,2
    8000369c:	10079073          	csrw	sstatus,a5
    800036a0:	ffffe097          	auipc	ra,0xffffe
    800036a4:	61c080e7          	jalr	1564(ra) # 80001cbc <mycpu>
    800036a8:	07852783          	lw	a5,120(a0)
    800036ac:	02078663          	beqz	a5,800036d8 <push_on+0x5c>
    800036b0:	ffffe097          	auipc	ra,0xffffe
    800036b4:	60c080e7          	jalr	1548(ra) # 80001cbc <mycpu>
    800036b8:	07852783          	lw	a5,120(a0)
    800036bc:	01813083          	ld	ra,24(sp)
    800036c0:	01013403          	ld	s0,16(sp)
    800036c4:	0017879b          	addiw	a5,a5,1
    800036c8:	06f52c23          	sw	a5,120(a0)
    800036cc:	00813483          	ld	s1,8(sp)
    800036d0:	02010113          	addi	sp,sp,32
    800036d4:	00008067          	ret
    800036d8:	0014d493          	srli	s1,s1,0x1
    800036dc:	ffffe097          	auipc	ra,0xffffe
    800036e0:	5e0080e7          	jalr	1504(ra) # 80001cbc <mycpu>
    800036e4:	0014f493          	andi	s1,s1,1
    800036e8:	06952e23          	sw	s1,124(a0)
    800036ec:	fc5ff06f          	j	800036b0 <push_on+0x34>

00000000800036f0 <pop_on>:
    800036f0:	ff010113          	addi	sp,sp,-16
    800036f4:	00813023          	sd	s0,0(sp)
    800036f8:	00113423          	sd	ra,8(sp)
    800036fc:	01010413          	addi	s0,sp,16
    80003700:	ffffe097          	auipc	ra,0xffffe
    80003704:	5bc080e7          	jalr	1468(ra) # 80001cbc <mycpu>
    80003708:	100027f3          	csrr	a5,sstatus
    8000370c:	0027f793          	andi	a5,a5,2
    80003710:	04078463          	beqz	a5,80003758 <pop_on+0x68>
    80003714:	07852783          	lw	a5,120(a0)
    80003718:	02f05863          	blez	a5,80003748 <pop_on+0x58>
    8000371c:	fff7879b          	addiw	a5,a5,-1
    80003720:	06f52c23          	sw	a5,120(a0)
    80003724:	07853783          	ld	a5,120(a0)
    80003728:	00079863          	bnez	a5,80003738 <pop_on+0x48>
    8000372c:	100027f3          	csrr	a5,sstatus
    80003730:	ffd7f793          	andi	a5,a5,-3
    80003734:	10079073          	csrw	sstatus,a5
    80003738:	00813083          	ld	ra,8(sp)
    8000373c:	00013403          	ld	s0,0(sp)
    80003740:	01010113          	addi	sp,sp,16
    80003744:	00008067          	ret
    80003748:	00001517          	auipc	a0,0x1
    8000374c:	b1050513          	addi	a0,a0,-1264 # 80004258 <digits+0x70>
    80003750:	fffff097          	auipc	ra,0xfffff
    80003754:	f2c080e7          	jalr	-212(ra) # 8000267c <panic>
    80003758:	00001517          	auipc	a0,0x1
    8000375c:	ae050513          	addi	a0,a0,-1312 # 80004238 <digits+0x50>
    80003760:	fffff097          	auipc	ra,0xfffff
    80003764:	f1c080e7          	jalr	-228(ra) # 8000267c <panic>

0000000080003768 <__memset>:
    80003768:	ff010113          	addi	sp,sp,-16
    8000376c:	00813423          	sd	s0,8(sp)
    80003770:	01010413          	addi	s0,sp,16
    80003774:	1a060e63          	beqz	a2,80003930 <__memset+0x1c8>
    80003778:	40a007b3          	neg	a5,a0
    8000377c:	0077f793          	andi	a5,a5,7
    80003780:	00778693          	addi	a3,a5,7
    80003784:	00b00813          	li	a6,11
    80003788:	0ff5f593          	andi	a1,a1,255
    8000378c:	fff6071b          	addiw	a4,a2,-1
    80003790:	1b06e663          	bltu	a3,a6,8000393c <__memset+0x1d4>
    80003794:	1cd76463          	bltu	a4,a3,8000395c <__memset+0x1f4>
    80003798:	1a078e63          	beqz	a5,80003954 <__memset+0x1ec>
    8000379c:	00b50023          	sb	a1,0(a0)
    800037a0:	00100713          	li	a4,1
    800037a4:	1ae78463          	beq	a5,a4,8000394c <__memset+0x1e4>
    800037a8:	00b500a3          	sb	a1,1(a0)
    800037ac:	00200713          	li	a4,2
    800037b0:	1ae78a63          	beq	a5,a4,80003964 <__memset+0x1fc>
    800037b4:	00b50123          	sb	a1,2(a0)
    800037b8:	00300713          	li	a4,3
    800037bc:	18e78463          	beq	a5,a4,80003944 <__memset+0x1dc>
    800037c0:	00b501a3          	sb	a1,3(a0)
    800037c4:	00400713          	li	a4,4
    800037c8:	1ae78263          	beq	a5,a4,8000396c <__memset+0x204>
    800037cc:	00b50223          	sb	a1,4(a0)
    800037d0:	00500713          	li	a4,5
    800037d4:	1ae78063          	beq	a5,a4,80003974 <__memset+0x20c>
    800037d8:	00b502a3          	sb	a1,5(a0)
    800037dc:	00700713          	li	a4,7
    800037e0:	18e79e63          	bne	a5,a4,8000397c <__memset+0x214>
    800037e4:	00b50323          	sb	a1,6(a0)
    800037e8:	00700e93          	li	t4,7
    800037ec:	00859713          	slli	a4,a1,0x8
    800037f0:	00e5e733          	or	a4,a1,a4
    800037f4:	01059e13          	slli	t3,a1,0x10
    800037f8:	01c76e33          	or	t3,a4,t3
    800037fc:	01859313          	slli	t1,a1,0x18
    80003800:	006e6333          	or	t1,t3,t1
    80003804:	02059893          	slli	a7,a1,0x20
    80003808:	40f60e3b          	subw	t3,a2,a5
    8000380c:	011368b3          	or	a7,t1,a7
    80003810:	02859813          	slli	a6,a1,0x28
    80003814:	0108e833          	or	a6,a7,a6
    80003818:	03059693          	slli	a3,a1,0x30
    8000381c:	003e589b          	srliw	a7,t3,0x3
    80003820:	00d866b3          	or	a3,a6,a3
    80003824:	03859713          	slli	a4,a1,0x38
    80003828:	00389813          	slli	a6,a7,0x3
    8000382c:	00f507b3          	add	a5,a0,a5
    80003830:	00e6e733          	or	a4,a3,a4
    80003834:	000e089b          	sext.w	a7,t3
    80003838:	00f806b3          	add	a3,a6,a5
    8000383c:	00e7b023          	sd	a4,0(a5)
    80003840:	00878793          	addi	a5,a5,8
    80003844:	fed79ce3          	bne	a5,a3,8000383c <__memset+0xd4>
    80003848:	ff8e7793          	andi	a5,t3,-8
    8000384c:	0007871b          	sext.w	a4,a5
    80003850:	01d787bb          	addw	a5,a5,t4
    80003854:	0ce88e63          	beq	a7,a4,80003930 <__memset+0x1c8>
    80003858:	00f50733          	add	a4,a0,a5
    8000385c:	00b70023          	sb	a1,0(a4)
    80003860:	0017871b          	addiw	a4,a5,1
    80003864:	0cc77663          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    80003868:	00e50733          	add	a4,a0,a4
    8000386c:	00b70023          	sb	a1,0(a4)
    80003870:	0027871b          	addiw	a4,a5,2
    80003874:	0ac77e63          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    80003878:	00e50733          	add	a4,a0,a4
    8000387c:	00b70023          	sb	a1,0(a4)
    80003880:	0037871b          	addiw	a4,a5,3
    80003884:	0ac77663          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    80003888:	00e50733          	add	a4,a0,a4
    8000388c:	00b70023          	sb	a1,0(a4)
    80003890:	0047871b          	addiw	a4,a5,4
    80003894:	08c77e63          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    80003898:	00e50733          	add	a4,a0,a4
    8000389c:	00b70023          	sb	a1,0(a4)
    800038a0:	0057871b          	addiw	a4,a5,5
    800038a4:	08c77663          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    800038a8:	00e50733          	add	a4,a0,a4
    800038ac:	00b70023          	sb	a1,0(a4)
    800038b0:	0067871b          	addiw	a4,a5,6
    800038b4:	06c77e63          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    800038b8:	00e50733          	add	a4,a0,a4
    800038bc:	00b70023          	sb	a1,0(a4)
    800038c0:	0077871b          	addiw	a4,a5,7
    800038c4:	06c77663          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    800038c8:	00e50733          	add	a4,a0,a4
    800038cc:	00b70023          	sb	a1,0(a4)
    800038d0:	0087871b          	addiw	a4,a5,8
    800038d4:	04c77e63          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    800038d8:	00e50733          	add	a4,a0,a4
    800038dc:	00b70023          	sb	a1,0(a4)
    800038e0:	0097871b          	addiw	a4,a5,9
    800038e4:	04c77663          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    800038e8:	00e50733          	add	a4,a0,a4
    800038ec:	00b70023          	sb	a1,0(a4)
    800038f0:	00a7871b          	addiw	a4,a5,10
    800038f4:	02c77e63          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    800038f8:	00e50733          	add	a4,a0,a4
    800038fc:	00b70023          	sb	a1,0(a4)
    80003900:	00b7871b          	addiw	a4,a5,11
    80003904:	02c77663          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    80003908:	00e50733          	add	a4,a0,a4
    8000390c:	00b70023          	sb	a1,0(a4)
    80003910:	00c7871b          	addiw	a4,a5,12
    80003914:	00c77e63          	bgeu	a4,a2,80003930 <__memset+0x1c8>
    80003918:	00e50733          	add	a4,a0,a4
    8000391c:	00b70023          	sb	a1,0(a4)
    80003920:	00d7879b          	addiw	a5,a5,13
    80003924:	00c7f663          	bgeu	a5,a2,80003930 <__memset+0x1c8>
    80003928:	00f507b3          	add	a5,a0,a5
    8000392c:	00b78023          	sb	a1,0(a5)
    80003930:	00813403          	ld	s0,8(sp)
    80003934:	01010113          	addi	sp,sp,16
    80003938:	00008067          	ret
    8000393c:	00b00693          	li	a3,11
    80003940:	e55ff06f          	j	80003794 <__memset+0x2c>
    80003944:	00300e93          	li	t4,3
    80003948:	ea5ff06f          	j	800037ec <__memset+0x84>
    8000394c:	00100e93          	li	t4,1
    80003950:	e9dff06f          	j	800037ec <__memset+0x84>
    80003954:	00000e93          	li	t4,0
    80003958:	e95ff06f          	j	800037ec <__memset+0x84>
    8000395c:	00000793          	li	a5,0
    80003960:	ef9ff06f          	j	80003858 <__memset+0xf0>
    80003964:	00200e93          	li	t4,2
    80003968:	e85ff06f          	j	800037ec <__memset+0x84>
    8000396c:	00400e93          	li	t4,4
    80003970:	e7dff06f          	j	800037ec <__memset+0x84>
    80003974:	00500e93          	li	t4,5
    80003978:	e75ff06f          	j	800037ec <__memset+0x84>
    8000397c:	00600e93          	li	t4,6
    80003980:	e6dff06f          	j	800037ec <__memset+0x84>

0000000080003984 <__memmove>:
    80003984:	ff010113          	addi	sp,sp,-16
    80003988:	00813423          	sd	s0,8(sp)
    8000398c:	01010413          	addi	s0,sp,16
    80003990:	0e060863          	beqz	a2,80003a80 <__memmove+0xfc>
    80003994:	fff6069b          	addiw	a3,a2,-1
    80003998:	0006881b          	sext.w	a6,a3
    8000399c:	0ea5e863          	bltu	a1,a0,80003a8c <__memmove+0x108>
    800039a0:	00758713          	addi	a4,a1,7
    800039a4:	00a5e7b3          	or	a5,a1,a0
    800039a8:	40a70733          	sub	a4,a4,a0
    800039ac:	0077f793          	andi	a5,a5,7
    800039b0:	00f73713          	sltiu	a4,a4,15
    800039b4:	00174713          	xori	a4,a4,1
    800039b8:	0017b793          	seqz	a5,a5
    800039bc:	00e7f7b3          	and	a5,a5,a4
    800039c0:	10078863          	beqz	a5,80003ad0 <__memmove+0x14c>
    800039c4:	00900793          	li	a5,9
    800039c8:	1107f463          	bgeu	a5,a6,80003ad0 <__memmove+0x14c>
    800039cc:	0036581b          	srliw	a6,a2,0x3
    800039d0:	fff8081b          	addiw	a6,a6,-1
    800039d4:	02081813          	slli	a6,a6,0x20
    800039d8:	01d85893          	srli	a7,a6,0x1d
    800039dc:	00858813          	addi	a6,a1,8
    800039e0:	00058793          	mv	a5,a1
    800039e4:	00050713          	mv	a4,a0
    800039e8:	01088833          	add	a6,a7,a6
    800039ec:	0007b883          	ld	a7,0(a5)
    800039f0:	00878793          	addi	a5,a5,8
    800039f4:	00870713          	addi	a4,a4,8
    800039f8:	ff173c23          	sd	a7,-8(a4)
    800039fc:	ff0798e3          	bne	a5,a6,800039ec <__memmove+0x68>
    80003a00:	ff867713          	andi	a4,a2,-8
    80003a04:	02071793          	slli	a5,a4,0x20
    80003a08:	0207d793          	srli	a5,a5,0x20
    80003a0c:	00f585b3          	add	a1,a1,a5
    80003a10:	40e686bb          	subw	a3,a3,a4
    80003a14:	00f507b3          	add	a5,a0,a5
    80003a18:	06e60463          	beq	a2,a4,80003a80 <__memmove+0xfc>
    80003a1c:	0005c703          	lbu	a4,0(a1)
    80003a20:	00e78023          	sb	a4,0(a5)
    80003a24:	04068e63          	beqz	a3,80003a80 <__memmove+0xfc>
    80003a28:	0015c603          	lbu	a2,1(a1)
    80003a2c:	00100713          	li	a4,1
    80003a30:	00c780a3          	sb	a2,1(a5)
    80003a34:	04e68663          	beq	a3,a4,80003a80 <__memmove+0xfc>
    80003a38:	0025c603          	lbu	a2,2(a1)
    80003a3c:	00200713          	li	a4,2
    80003a40:	00c78123          	sb	a2,2(a5)
    80003a44:	02e68e63          	beq	a3,a4,80003a80 <__memmove+0xfc>
    80003a48:	0035c603          	lbu	a2,3(a1)
    80003a4c:	00300713          	li	a4,3
    80003a50:	00c781a3          	sb	a2,3(a5)
    80003a54:	02e68663          	beq	a3,a4,80003a80 <__memmove+0xfc>
    80003a58:	0045c603          	lbu	a2,4(a1)
    80003a5c:	00400713          	li	a4,4
    80003a60:	00c78223          	sb	a2,4(a5)
    80003a64:	00e68e63          	beq	a3,a4,80003a80 <__memmove+0xfc>
    80003a68:	0055c603          	lbu	a2,5(a1)
    80003a6c:	00500713          	li	a4,5
    80003a70:	00c782a3          	sb	a2,5(a5)
    80003a74:	00e68663          	beq	a3,a4,80003a80 <__memmove+0xfc>
    80003a78:	0065c703          	lbu	a4,6(a1)
    80003a7c:	00e78323          	sb	a4,6(a5)
    80003a80:	00813403          	ld	s0,8(sp)
    80003a84:	01010113          	addi	sp,sp,16
    80003a88:	00008067          	ret
    80003a8c:	02061713          	slli	a4,a2,0x20
    80003a90:	02075713          	srli	a4,a4,0x20
    80003a94:	00e587b3          	add	a5,a1,a4
    80003a98:	f0f574e3          	bgeu	a0,a5,800039a0 <__memmove+0x1c>
    80003a9c:	02069613          	slli	a2,a3,0x20
    80003aa0:	02065613          	srli	a2,a2,0x20
    80003aa4:	fff64613          	not	a2,a2
    80003aa8:	00e50733          	add	a4,a0,a4
    80003aac:	00c78633          	add	a2,a5,a2
    80003ab0:	fff7c683          	lbu	a3,-1(a5)
    80003ab4:	fff78793          	addi	a5,a5,-1
    80003ab8:	fff70713          	addi	a4,a4,-1
    80003abc:	00d70023          	sb	a3,0(a4)
    80003ac0:	fec798e3          	bne	a5,a2,80003ab0 <__memmove+0x12c>
    80003ac4:	00813403          	ld	s0,8(sp)
    80003ac8:	01010113          	addi	sp,sp,16
    80003acc:	00008067          	ret
    80003ad0:	02069713          	slli	a4,a3,0x20
    80003ad4:	02075713          	srli	a4,a4,0x20
    80003ad8:	00170713          	addi	a4,a4,1
    80003adc:	00e50733          	add	a4,a0,a4
    80003ae0:	00050793          	mv	a5,a0
    80003ae4:	0005c683          	lbu	a3,0(a1)
    80003ae8:	00178793          	addi	a5,a5,1
    80003aec:	00158593          	addi	a1,a1,1
    80003af0:	fed78fa3          	sb	a3,-1(a5)
    80003af4:	fee798e3          	bne	a5,a4,80003ae4 <__memmove+0x160>
    80003af8:	f89ff06f          	j	80003a80 <__memmove+0xfc>

0000000080003afc <__putc>:
    80003afc:	fe010113          	addi	sp,sp,-32
    80003b00:	00813823          	sd	s0,16(sp)
    80003b04:	00113c23          	sd	ra,24(sp)
    80003b08:	02010413          	addi	s0,sp,32
    80003b0c:	00050793          	mv	a5,a0
    80003b10:	fef40593          	addi	a1,s0,-17
    80003b14:	00100613          	li	a2,1
    80003b18:	00000513          	li	a0,0
    80003b1c:	fef407a3          	sb	a5,-17(s0)
    80003b20:	fffff097          	auipc	ra,0xfffff
    80003b24:	b3c080e7          	jalr	-1220(ra) # 8000265c <console_write>
    80003b28:	01813083          	ld	ra,24(sp)
    80003b2c:	01013403          	ld	s0,16(sp)
    80003b30:	02010113          	addi	sp,sp,32
    80003b34:	00008067          	ret

0000000080003b38 <__getc>:
    80003b38:	fe010113          	addi	sp,sp,-32
    80003b3c:	00813823          	sd	s0,16(sp)
    80003b40:	00113c23          	sd	ra,24(sp)
    80003b44:	02010413          	addi	s0,sp,32
    80003b48:	fe840593          	addi	a1,s0,-24
    80003b4c:	00100613          	li	a2,1
    80003b50:	00000513          	li	a0,0
    80003b54:	fffff097          	auipc	ra,0xfffff
    80003b58:	ae8080e7          	jalr	-1304(ra) # 8000263c <console_read>
    80003b5c:	fe844503          	lbu	a0,-24(s0)
    80003b60:	01813083          	ld	ra,24(sp)
    80003b64:	01013403          	ld	s0,16(sp)
    80003b68:	02010113          	addi	sp,sp,32
    80003b6c:	00008067          	ret

0000000080003b70 <console_handler>:
    80003b70:	fe010113          	addi	sp,sp,-32
    80003b74:	00813823          	sd	s0,16(sp)
    80003b78:	00113c23          	sd	ra,24(sp)
    80003b7c:	00913423          	sd	s1,8(sp)
    80003b80:	02010413          	addi	s0,sp,32
    80003b84:	14202773          	csrr	a4,scause
    80003b88:	100027f3          	csrr	a5,sstatus
    80003b8c:	0027f793          	andi	a5,a5,2
    80003b90:	06079e63          	bnez	a5,80003c0c <console_handler+0x9c>
    80003b94:	00074c63          	bltz	a4,80003bac <console_handler+0x3c>
    80003b98:	01813083          	ld	ra,24(sp)
    80003b9c:	01013403          	ld	s0,16(sp)
    80003ba0:	00813483          	ld	s1,8(sp)
    80003ba4:	02010113          	addi	sp,sp,32
    80003ba8:	00008067          	ret
    80003bac:	0ff77713          	andi	a4,a4,255
    80003bb0:	00900793          	li	a5,9
    80003bb4:	fef712e3          	bne	a4,a5,80003b98 <console_handler+0x28>
    80003bb8:	ffffe097          	auipc	ra,0xffffe
    80003bbc:	6dc080e7          	jalr	1756(ra) # 80002294 <plic_claim>
    80003bc0:	00a00793          	li	a5,10
    80003bc4:	00050493          	mv	s1,a0
    80003bc8:	02f50c63          	beq	a0,a5,80003c00 <console_handler+0x90>
    80003bcc:	fc0506e3          	beqz	a0,80003b98 <console_handler+0x28>
    80003bd0:	00050593          	mv	a1,a0
    80003bd4:	00000517          	auipc	a0,0x0
    80003bd8:	58c50513          	addi	a0,a0,1420 # 80004160 <_ZZ12printIntegermE6digits+0xe0>
    80003bdc:	fffff097          	auipc	ra,0xfffff
    80003be0:	afc080e7          	jalr	-1284(ra) # 800026d8 <__printf>
    80003be4:	01013403          	ld	s0,16(sp)
    80003be8:	01813083          	ld	ra,24(sp)
    80003bec:	00048513          	mv	a0,s1
    80003bf0:	00813483          	ld	s1,8(sp)
    80003bf4:	02010113          	addi	sp,sp,32
    80003bf8:	ffffe317          	auipc	t1,0xffffe
    80003bfc:	6d430067          	jr	1748(t1) # 800022cc <plic_complete>
    80003c00:	fffff097          	auipc	ra,0xfffff
    80003c04:	3e0080e7          	jalr	992(ra) # 80002fe0 <uartintr>
    80003c08:	fddff06f          	j	80003be4 <console_handler+0x74>
    80003c0c:	00000517          	auipc	a0,0x0
    80003c10:	65450513          	addi	a0,a0,1620 # 80004260 <digits+0x78>
    80003c14:	fffff097          	auipc	ra,0xfffff
    80003c18:	a68080e7          	jalr	-1432(ra) # 8000267c <panic>
	...
