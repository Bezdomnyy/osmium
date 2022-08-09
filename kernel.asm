
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	28013103          	ld	sp,640(sp) # 80004280 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	0fc010ef          	jal	ra,80001118 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <supervisorTrap>:
.extern handleSupervisorTrap
.align 4
.global supervisorTrap

supervisorTrap:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256

    sd x0, 0x00(sp)
    80001004:	00013023          	sd	zero,0(sp)
    sd x1, 0x10(sp)
    80001008:	00113823          	sd	ra,16(sp)
    sd x2, 0x18(sp)
    8000100c:	00213c23          	sd	sp,24(sp)
    sd x3, 0x20(sp)
    80001010:	02313023          	sd	gp,32(sp)
    sd x4, 0x28(sp)
    80001014:	02413423          	sd	tp,40(sp)
    sd x5, 0x30(sp)
    80001018:	02513823          	sd	t0,48(sp)
    # ...

    call handleSupervisorTrap
    8000101c:	024000ef          	jal	ra,80001040 <handleSupervisorTrap>

    ld x0, 0x00(sp)
    80001020:	00013003          	ld	zero,0(sp)
    ld x1, 0x10(sp)
    80001024:	01013083          	ld	ra,16(sp)
    ld x2, 0x18(sp)
    80001028:	01813103          	ld	sp,24(sp)
    ld x3, 0x20(sp)
    8000102c:	02013183          	ld	gp,32(sp)
    ld x4, 0x28(sp)
    80001030:	02813203          	ld	tp,40(sp)
    ld x5, 0x30(sp)
    80001034:	03013283          	ld	t0,48(sp)

    addi sp, sp, 256
    80001038:	10010113          	addi	sp,sp,256

    sret
    8000103c:	10200073          	sret

0000000080001040 <handleSupervisorTrap>:
#include "../lib/console.h"
#include "../lib/hw.h"

uint64 timerCount = 0;

extern "C" void handleSupervisorTrap() {
    80001040:	fc010113          	addi	sp,sp,-64
    80001044:	02113c23          	sd	ra,56(sp)
    80001048:	02813823          	sd	s0,48(sp)
    8000104c:	02913423          	sd	s1,40(sp)
    80001050:	04010413          	addi	s0,sp,64
    volatile uint64 scauseVal;
    asm volatile ("csrr %[cause], scause": [cause] "=r" (scauseVal));
    80001054:	142027f3          	csrr	a5,scause
    80001058:	fcf43c23          	sd	a5,-40(s0)
    char word[9] = "Poruka!\n";
    8000105c:	00003797          	auipc	a5,0x3
    80001060:	fa478793          	addi	a5,a5,-92 # 80004000 <console_handler+0xdb0>
    80001064:	0007b703          	ld	a4,0(a5)
    80001068:	fce43423          	sd	a4,-56(s0)
    8000106c:	0087c783          	lbu	a5,8(a5)
    80001070:	fcf40823          	sb	a5,-48(s0)
    int cnt = 8;
    if (scauseVal == (0x01UL << 63 | 0x01)) {
    80001074:	fd843703          	ld	a4,-40(s0)
    80001078:	fff00793          	li	a5,-1
    8000107c:	03f79793          	slli	a5,a5,0x3f
    80001080:	00178793          	addi	a5,a5,1
    80001084:	02f70063          	beq	a4,a5,800010a4 <handleSupervisorTrap+0x64>
            timerCount = 0;
        }

        asm volatile ("csrc sip, 0x02");
    }
    console_handler();
    80001088:	00002097          	auipc	ra,0x2
    8000108c:	1c8080e7          	jalr	456(ra) # 80003250 <console_handler>
}
    80001090:	03813083          	ld	ra,56(sp)
    80001094:	03013403          	ld	s0,48(sp)
    80001098:	02813483          	ld	s1,40(sp)
    8000109c:	04010113          	addi	sp,sp,64
    800010a0:	00008067          	ret
        if (++timerCount >= 50) {
    800010a4:	00003717          	auipc	a4,0x3
    800010a8:	22c70713          	addi	a4,a4,556 # 800042d0 <timerCount>
    800010ac:	00073783          	ld	a5,0(a4)
    800010b0:	00178793          	addi	a5,a5,1
    800010b4:	00f73023          	sd	a5,0(a4)
    800010b8:	03100713          	li	a4,49
    800010bc:	02f77a63          	bgeu	a4,a5,800010f0 <handleSupervisorTrap+0xb0>
            for (int i = 0; i < cnt; i++) {
    800010c0:	00000493          	li	s1,0
    800010c4:	01c0006f          	j	800010e0 <handleSupervisorTrap+0xa0>
                __putc(word[i]);
    800010c8:	fe040793          	addi	a5,s0,-32
    800010cc:	009787b3          	add	a5,a5,s1
    800010d0:	fe87c503          	lbu	a0,-24(a5)
    800010d4:	00002097          	auipc	ra,0x2
    800010d8:	108080e7          	jalr	264(ra) # 800031dc <__putc>
            for (int i = 0; i < cnt; i++) {
    800010dc:	0014849b          	addiw	s1,s1,1
    800010e0:	00700793          	li	a5,7
    800010e4:	fe97d2e3          	bge	a5,s1,800010c8 <handleSupervisorTrap+0x88>
            timerCount = 0;
    800010e8:	00003797          	auipc	a5,0x3
    800010ec:	1e07b423          	sd	zero,488(a5) # 800042d0 <timerCount>
        asm volatile ("csrc sip, 0x02");
    800010f0:	14417073          	csrci	sip,2
    800010f4:	f95ff06f          	j	80001088 <handleSupervisorTrap+0x48>

00000000800010f8 <main>:

extern "C" void supervisorTrap();


void main() {
    800010f8:	ff010113          	addi	sp,sp,-16
    800010fc:	00813423          	sd	s0,8(sp)
    80001100:	01010413          	addi	s0,sp,16
    asm volatile("csrw stvec, %[trapVector]" : : [trapVector] "r" (&supervisorTrap));
    80001104:	00003797          	auipc	a5,0x3
    80001108:	1747b783          	ld	a5,372(a5) # 80004278 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000110c:	10579073          	csrw	stvec,a5
    asm volatile("csrs sstatus, 0x02");
    80001110:	10016073          	csrsi	sstatus,2
    while(1);
    80001114:	0000006f          	j	80001114 <main+0x1c>

0000000080001118 <start>:
    80001118:	ff010113          	addi	sp,sp,-16
    8000111c:	00813423          	sd	s0,8(sp)
    80001120:	01010413          	addi	s0,sp,16
    80001124:	300027f3          	csrr	a5,mstatus
    80001128:	ffffe737          	lui	a4,0xffffe
    8000112c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff92cf>
    80001130:	00e7f7b3          	and	a5,a5,a4
    80001134:	00001737          	lui	a4,0x1
    80001138:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000113c:	00e7e7b3          	or	a5,a5,a4
    80001140:	30079073          	csrw	mstatus,a5
    80001144:	00000797          	auipc	a5,0x0
    80001148:	16078793          	addi	a5,a5,352 # 800012a4 <system_main>
    8000114c:	34179073          	csrw	mepc,a5
    80001150:	00000793          	li	a5,0
    80001154:	18079073          	csrw	satp,a5
    80001158:	000107b7          	lui	a5,0x10
    8000115c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001160:	30279073          	csrw	medeleg,a5
    80001164:	30379073          	csrw	mideleg,a5
    80001168:	104027f3          	csrr	a5,sie
    8000116c:	2227e793          	ori	a5,a5,546
    80001170:	10479073          	csrw	sie,a5
    80001174:	fff00793          	li	a5,-1
    80001178:	00a7d793          	srli	a5,a5,0xa
    8000117c:	3b079073          	csrw	pmpaddr0,a5
    80001180:	00f00793          	li	a5,15
    80001184:	3a079073          	csrw	pmpcfg0,a5
    80001188:	f14027f3          	csrr	a5,mhartid
    8000118c:	0200c737          	lui	a4,0x200c
    80001190:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001194:	0007869b          	sext.w	a3,a5
    80001198:	00269713          	slli	a4,a3,0x2
    8000119c:	000f4637          	lui	a2,0xf4
    800011a0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800011a4:	00d70733          	add	a4,a4,a3
    800011a8:	0037979b          	slliw	a5,a5,0x3
    800011ac:	020046b7          	lui	a3,0x2004
    800011b0:	00d787b3          	add	a5,a5,a3
    800011b4:	00c585b3          	add	a1,a1,a2
    800011b8:	00371693          	slli	a3,a4,0x3
    800011bc:	00003717          	auipc	a4,0x3
    800011c0:	12470713          	addi	a4,a4,292 # 800042e0 <timer_scratch>
    800011c4:	00b7b023          	sd	a1,0(a5)
    800011c8:	00d70733          	add	a4,a4,a3
    800011cc:	00f73c23          	sd	a5,24(a4)
    800011d0:	02c73023          	sd	a2,32(a4)
    800011d4:	34071073          	csrw	mscratch,a4
    800011d8:	00000797          	auipc	a5,0x0
    800011dc:	6e878793          	addi	a5,a5,1768 # 800018c0 <timervec>
    800011e0:	30579073          	csrw	mtvec,a5
    800011e4:	300027f3          	csrr	a5,mstatus
    800011e8:	0087e793          	ori	a5,a5,8
    800011ec:	30079073          	csrw	mstatus,a5
    800011f0:	304027f3          	csrr	a5,mie
    800011f4:	0807e793          	ori	a5,a5,128
    800011f8:	30479073          	csrw	mie,a5
    800011fc:	f14027f3          	csrr	a5,mhartid
    80001200:	0007879b          	sext.w	a5,a5
    80001204:	00078213          	mv	tp,a5
    80001208:	30200073          	mret
    8000120c:	00813403          	ld	s0,8(sp)
    80001210:	01010113          	addi	sp,sp,16
    80001214:	00008067          	ret

0000000080001218 <timerinit>:
    80001218:	ff010113          	addi	sp,sp,-16
    8000121c:	00813423          	sd	s0,8(sp)
    80001220:	01010413          	addi	s0,sp,16
    80001224:	f14027f3          	csrr	a5,mhartid
    80001228:	0200c737          	lui	a4,0x200c
    8000122c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001230:	0007869b          	sext.w	a3,a5
    80001234:	00269713          	slli	a4,a3,0x2
    80001238:	000f4637          	lui	a2,0xf4
    8000123c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001240:	00d70733          	add	a4,a4,a3
    80001244:	0037979b          	slliw	a5,a5,0x3
    80001248:	020046b7          	lui	a3,0x2004
    8000124c:	00d787b3          	add	a5,a5,a3
    80001250:	00c585b3          	add	a1,a1,a2
    80001254:	00371693          	slli	a3,a4,0x3
    80001258:	00003717          	auipc	a4,0x3
    8000125c:	08870713          	addi	a4,a4,136 # 800042e0 <timer_scratch>
    80001260:	00b7b023          	sd	a1,0(a5)
    80001264:	00d70733          	add	a4,a4,a3
    80001268:	00f73c23          	sd	a5,24(a4)
    8000126c:	02c73023          	sd	a2,32(a4)
    80001270:	34071073          	csrw	mscratch,a4
    80001274:	00000797          	auipc	a5,0x0
    80001278:	64c78793          	addi	a5,a5,1612 # 800018c0 <timervec>
    8000127c:	30579073          	csrw	mtvec,a5
    80001280:	300027f3          	csrr	a5,mstatus
    80001284:	0087e793          	ori	a5,a5,8
    80001288:	30079073          	csrw	mstatus,a5
    8000128c:	304027f3          	csrr	a5,mie
    80001290:	0807e793          	ori	a5,a5,128
    80001294:	30479073          	csrw	mie,a5
    80001298:	00813403          	ld	s0,8(sp)
    8000129c:	01010113          	addi	sp,sp,16
    800012a0:	00008067          	ret

00000000800012a4 <system_main>:
    800012a4:	fe010113          	addi	sp,sp,-32
    800012a8:	00813823          	sd	s0,16(sp)
    800012ac:	00913423          	sd	s1,8(sp)
    800012b0:	00113c23          	sd	ra,24(sp)
    800012b4:	02010413          	addi	s0,sp,32
    800012b8:	00000097          	auipc	ra,0x0
    800012bc:	0c4080e7          	jalr	196(ra) # 8000137c <cpuid>
    800012c0:	00003497          	auipc	s1,0x3
    800012c4:	fe048493          	addi	s1,s1,-32 # 800042a0 <started>
    800012c8:	02050263          	beqz	a0,800012ec <system_main+0x48>
    800012cc:	0004a783          	lw	a5,0(s1)
    800012d0:	0007879b          	sext.w	a5,a5
    800012d4:	fe078ce3          	beqz	a5,800012cc <system_main+0x28>
    800012d8:	0ff0000f          	fence
    800012dc:	00003517          	auipc	a0,0x3
    800012e0:	d6450513          	addi	a0,a0,-668 # 80004040 <console_handler+0xdf0>
    800012e4:	00001097          	auipc	ra,0x1
    800012e8:	a78080e7          	jalr	-1416(ra) # 80001d5c <panic>
    800012ec:	00001097          	auipc	ra,0x1
    800012f0:	9cc080e7          	jalr	-1588(ra) # 80001cb8 <consoleinit>
    800012f4:	00001097          	auipc	ra,0x1
    800012f8:	158080e7          	jalr	344(ra) # 8000244c <printfinit>
    800012fc:	00003517          	auipc	a0,0x3
    80001300:	e2450513          	addi	a0,a0,-476 # 80004120 <console_handler+0xed0>
    80001304:	00001097          	auipc	ra,0x1
    80001308:	ab4080e7          	jalr	-1356(ra) # 80001db8 <__printf>
    8000130c:	00003517          	auipc	a0,0x3
    80001310:	d0450513          	addi	a0,a0,-764 # 80004010 <console_handler+0xdc0>
    80001314:	00001097          	auipc	ra,0x1
    80001318:	aa4080e7          	jalr	-1372(ra) # 80001db8 <__printf>
    8000131c:	00003517          	auipc	a0,0x3
    80001320:	e0450513          	addi	a0,a0,-508 # 80004120 <console_handler+0xed0>
    80001324:	00001097          	auipc	ra,0x1
    80001328:	a94080e7          	jalr	-1388(ra) # 80001db8 <__printf>
    8000132c:	00001097          	auipc	ra,0x1
    80001330:	4ac080e7          	jalr	1196(ra) # 800027d8 <kinit>
    80001334:	00000097          	auipc	ra,0x0
    80001338:	148080e7          	jalr	328(ra) # 8000147c <trapinit>
    8000133c:	00000097          	auipc	ra,0x0
    80001340:	16c080e7          	jalr	364(ra) # 800014a8 <trapinithart>
    80001344:	00000097          	auipc	ra,0x0
    80001348:	5bc080e7          	jalr	1468(ra) # 80001900 <plicinit>
    8000134c:	00000097          	auipc	ra,0x0
    80001350:	5dc080e7          	jalr	1500(ra) # 80001928 <plicinithart>
    80001354:	00000097          	auipc	ra,0x0
    80001358:	078080e7          	jalr	120(ra) # 800013cc <userinit>
    8000135c:	0ff0000f          	fence
    80001360:	00100793          	li	a5,1
    80001364:	00003517          	auipc	a0,0x3
    80001368:	cc450513          	addi	a0,a0,-828 # 80004028 <console_handler+0xdd8>
    8000136c:	00f4a023          	sw	a5,0(s1)
    80001370:	00001097          	auipc	ra,0x1
    80001374:	a48080e7          	jalr	-1464(ra) # 80001db8 <__printf>
    80001378:	0000006f          	j	80001378 <system_main+0xd4>

000000008000137c <cpuid>:
    8000137c:	ff010113          	addi	sp,sp,-16
    80001380:	00813423          	sd	s0,8(sp)
    80001384:	01010413          	addi	s0,sp,16
    80001388:	00020513          	mv	a0,tp
    8000138c:	00813403          	ld	s0,8(sp)
    80001390:	0005051b          	sext.w	a0,a0
    80001394:	01010113          	addi	sp,sp,16
    80001398:	00008067          	ret

000000008000139c <mycpu>:
    8000139c:	ff010113          	addi	sp,sp,-16
    800013a0:	00813423          	sd	s0,8(sp)
    800013a4:	01010413          	addi	s0,sp,16
    800013a8:	00020793          	mv	a5,tp
    800013ac:	00813403          	ld	s0,8(sp)
    800013b0:	0007879b          	sext.w	a5,a5
    800013b4:	00779793          	slli	a5,a5,0x7
    800013b8:	00004517          	auipc	a0,0x4
    800013bc:	f5850513          	addi	a0,a0,-168 # 80005310 <cpus>
    800013c0:	00f50533          	add	a0,a0,a5
    800013c4:	01010113          	addi	sp,sp,16
    800013c8:	00008067          	ret

00000000800013cc <userinit>:
    800013cc:	ff010113          	addi	sp,sp,-16
    800013d0:	00813423          	sd	s0,8(sp)
    800013d4:	01010413          	addi	s0,sp,16
    800013d8:	00813403          	ld	s0,8(sp)
    800013dc:	01010113          	addi	sp,sp,16
    800013e0:	00000317          	auipc	t1,0x0
    800013e4:	d1830067          	jr	-744(t1) # 800010f8 <main>

00000000800013e8 <either_copyout>:
    800013e8:	ff010113          	addi	sp,sp,-16
    800013ec:	00813023          	sd	s0,0(sp)
    800013f0:	00113423          	sd	ra,8(sp)
    800013f4:	01010413          	addi	s0,sp,16
    800013f8:	02051663          	bnez	a0,80001424 <either_copyout+0x3c>
    800013fc:	00058513          	mv	a0,a1
    80001400:	00060593          	mv	a1,a2
    80001404:	0006861b          	sext.w	a2,a3
    80001408:	00002097          	auipc	ra,0x2
    8000140c:	c5c080e7          	jalr	-932(ra) # 80003064 <__memmove>
    80001410:	00813083          	ld	ra,8(sp)
    80001414:	00013403          	ld	s0,0(sp)
    80001418:	00000513          	li	a0,0
    8000141c:	01010113          	addi	sp,sp,16
    80001420:	00008067          	ret
    80001424:	00003517          	auipc	a0,0x3
    80001428:	c4450513          	addi	a0,a0,-956 # 80004068 <console_handler+0xe18>
    8000142c:	00001097          	auipc	ra,0x1
    80001430:	930080e7          	jalr	-1744(ra) # 80001d5c <panic>

0000000080001434 <either_copyin>:
    80001434:	ff010113          	addi	sp,sp,-16
    80001438:	00813023          	sd	s0,0(sp)
    8000143c:	00113423          	sd	ra,8(sp)
    80001440:	01010413          	addi	s0,sp,16
    80001444:	02059463          	bnez	a1,8000146c <either_copyin+0x38>
    80001448:	00060593          	mv	a1,a2
    8000144c:	0006861b          	sext.w	a2,a3
    80001450:	00002097          	auipc	ra,0x2
    80001454:	c14080e7          	jalr	-1004(ra) # 80003064 <__memmove>
    80001458:	00813083          	ld	ra,8(sp)
    8000145c:	00013403          	ld	s0,0(sp)
    80001460:	00000513          	li	a0,0
    80001464:	01010113          	addi	sp,sp,16
    80001468:	00008067          	ret
    8000146c:	00003517          	auipc	a0,0x3
    80001470:	c2450513          	addi	a0,a0,-988 # 80004090 <console_handler+0xe40>
    80001474:	00001097          	auipc	ra,0x1
    80001478:	8e8080e7          	jalr	-1816(ra) # 80001d5c <panic>

000000008000147c <trapinit>:
    8000147c:	ff010113          	addi	sp,sp,-16
    80001480:	00813423          	sd	s0,8(sp)
    80001484:	01010413          	addi	s0,sp,16
    80001488:	00813403          	ld	s0,8(sp)
    8000148c:	00003597          	auipc	a1,0x3
    80001490:	c2c58593          	addi	a1,a1,-980 # 800040b8 <console_handler+0xe68>
    80001494:	00004517          	auipc	a0,0x4
    80001498:	efc50513          	addi	a0,a0,-260 # 80005390 <tickslock>
    8000149c:	01010113          	addi	sp,sp,16
    800014a0:	00001317          	auipc	t1,0x1
    800014a4:	5c830067          	jr	1480(t1) # 80002a68 <initlock>

00000000800014a8 <trapinithart>:
    800014a8:	ff010113          	addi	sp,sp,-16
    800014ac:	00813423          	sd	s0,8(sp)
    800014b0:	01010413          	addi	s0,sp,16
    800014b4:	00000797          	auipc	a5,0x0
    800014b8:	2fc78793          	addi	a5,a5,764 # 800017b0 <kernelvec>
    800014bc:	10579073          	csrw	stvec,a5
    800014c0:	00813403          	ld	s0,8(sp)
    800014c4:	01010113          	addi	sp,sp,16
    800014c8:	00008067          	ret

00000000800014cc <usertrap>:
    800014cc:	ff010113          	addi	sp,sp,-16
    800014d0:	00813423          	sd	s0,8(sp)
    800014d4:	01010413          	addi	s0,sp,16
    800014d8:	00813403          	ld	s0,8(sp)
    800014dc:	01010113          	addi	sp,sp,16
    800014e0:	00008067          	ret

00000000800014e4 <usertrapret>:
    800014e4:	ff010113          	addi	sp,sp,-16
    800014e8:	00813423          	sd	s0,8(sp)
    800014ec:	01010413          	addi	s0,sp,16
    800014f0:	00813403          	ld	s0,8(sp)
    800014f4:	01010113          	addi	sp,sp,16
    800014f8:	00008067          	ret

00000000800014fc <kerneltrap>:
    800014fc:	fe010113          	addi	sp,sp,-32
    80001500:	00813823          	sd	s0,16(sp)
    80001504:	00113c23          	sd	ra,24(sp)
    80001508:	00913423          	sd	s1,8(sp)
    8000150c:	02010413          	addi	s0,sp,32
    80001510:	142025f3          	csrr	a1,scause
    80001514:	100027f3          	csrr	a5,sstatus
    80001518:	0027f793          	andi	a5,a5,2
    8000151c:	10079c63          	bnez	a5,80001634 <kerneltrap+0x138>
    80001520:	142027f3          	csrr	a5,scause
    80001524:	0207ce63          	bltz	a5,80001560 <kerneltrap+0x64>
    80001528:	00003517          	auipc	a0,0x3
    8000152c:	bd850513          	addi	a0,a0,-1064 # 80004100 <console_handler+0xeb0>
    80001530:	00001097          	auipc	ra,0x1
    80001534:	888080e7          	jalr	-1912(ra) # 80001db8 <__printf>
    80001538:	141025f3          	csrr	a1,sepc
    8000153c:	14302673          	csrr	a2,stval
    80001540:	00003517          	auipc	a0,0x3
    80001544:	bd050513          	addi	a0,a0,-1072 # 80004110 <console_handler+0xec0>
    80001548:	00001097          	auipc	ra,0x1
    8000154c:	870080e7          	jalr	-1936(ra) # 80001db8 <__printf>
    80001550:	00003517          	auipc	a0,0x3
    80001554:	bd850513          	addi	a0,a0,-1064 # 80004128 <console_handler+0xed8>
    80001558:	00001097          	auipc	ra,0x1
    8000155c:	804080e7          	jalr	-2044(ra) # 80001d5c <panic>
    80001560:	0ff7f713          	andi	a4,a5,255
    80001564:	00900693          	li	a3,9
    80001568:	04d70063          	beq	a4,a3,800015a8 <kerneltrap+0xac>
    8000156c:	fff00713          	li	a4,-1
    80001570:	03f71713          	slli	a4,a4,0x3f
    80001574:	00170713          	addi	a4,a4,1
    80001578:	fae798e3          	bne	a5,a4,80001528 <kerneltrap+0x2c>
    8000157c:	00000097          	auipc	ra,0x0
    80001580:	e00080e7          	jalr	-512(ra) # 8000137c <cpuid>
    80001584:	06050663          	beqz	a0,800015f0 <kerneltrap+0xf4>
    80001588:	144027f3          	csrr	a5,sip
    8000158c:	ffd7f793          	andi	a5,a5,-3
    80001590:	14479073          	csrw	sip,a5
    80001594:	01813083          	ld	ra,24(sp)
    80001598:	01013403          	ld	s0,16(sp)
    8000159c:	00813483          	ld	s1,8(sp)
    800015a0:	02010113          	addi	sp,sp,32
    800015a4:	00008067          	ret
    800015a8:	00000097          	auipc	ra,0x0
    800015ac:	3cc080e7          	jalr	972(ra) # 80001974 <plic_claim>
    800015b0:	00a00793          	li	a5,10
    800015b4:	00050493          	mv	s1,a0
    800015b8:	06f50863          	beq	a0,a5,80001628 <kerneltrap+0x12c>
    800015bc:	fc050ce3          	beqz	a0,80001594 <kerneltrap+0x98>
    800015c0:	00050593          	mv	a1,a0
    800015c4:	00003517          	auipc	a0,0x3
    800015c8:	b1c50513          	addi	a0,a0,-1252 # 800040e0 <console_handler+0xe90>
    800015cc:	00000097          	auipc	ra,0x0
    800015d0:	7ec080e7          	jalr	2028(ra) # 80001db8 <__printf>
    800015d4:	01013403          	ld	s0,16(sp)
    800015d8:	01813083          	ld	ra,24(sp)
    800015dc:	00048513          	mv	a0,s1
    800015e0:	00813483          	ld	s1,8(sp)
    800015e4:	02010113          	addi	sp,sp,32
    800015e8:	00000317          	auipc	t1,0x0
    800015ec:	3c430067          	jr	964(t1) # 800019ac <plic_complete>
    800015f0:	00004517          	auipc	a0,0x4
    800015f4:	da050513          	addi	a0,a0,-608 # 80005390 <tickslock>
    800015f8:	00001097          	auipc	ra,0x1
    800015fc:	494080e7          	jalr	1172(ra) # 80002a8c <acquire>
    80001600:	00003717          	auipc	a4,0x3
    80001604:	ca470713          	addi	a4,a4,-860 # 800042a4 <ticks>
    80001608:	00072783          	lw	a5,0(a4)
    8000160c:	00004517          	auipc	a0,0x4
    80001610:	d8450513          	addi	a0,a0,-636 # 80005390 <tickslock>
    80001614:	0017879b          	addiw	a5,a5,1
    80001618:	00f72023          	sw	a5,0(a4)
    8000161c:	00001097          	auipc	ra,0x1
    80001620:	53c080e7          	jalr	1340(ra) # 80002b58 <release>
    80001624:	f65ff06f          	j	80001588 <kerneltrap+0x8c>
    80001628:	00001097          	auipc	ra,0x1
    8000162c:	098080e7          	jalr	152(ra) # 800026c0 <uartintr>
    80001630:	fa5ff06f          	j	800015d4 <kerneltrap+0xd8>
    80001634:	00003517          	auipc	a0,0x3
    80001638:	a8c50513          	addi	a0,a0,-1396 # 800040c0 <console_handler+0xe70>
    8000163c:	00000097          	auipc	ra,0x0
    80001640:	720080e7          	jalr	1824(ra) # 80001d5c <panic>

0000000080001644 <clockintr>:
    80001644:	fe010113          	addi	sp,sp,-32
    80001648:	00813823          	sd	s0,16(sp)
    8000164c:	00913423          	sd	s1,8(sp)
    80001650:	00113c23          	sd	ra,24(sp)
    80001654:	02010413          	addi	s0,sp,32
    80001658:	00004497          	auipc	s1,0x4
    8000165c:	d3848493          	addi	s1,s1,-712 # 80005390 <tickslock>
    80001660:	00048513          	mv	a0,s1
    80001664:	00001097          	auipc	ra,0x1
    80001668:	428080e7          	jalr	1064(ra) # 80002a8c <acquire>
    8000166c:	00003717          	auipc	a4,0x3
    80001670:	c3870713          	addi	a4,a4,-968 # 800042a4 <ticks>
    80001674:	00072783          	lw	a5,0(a4)
    80001678:	01013403          	ld	s0,16(sp)
    8000167c:	01813083          	ld	ra,24(sp)
    80001680:	00048513          	mv	a0,s1
    80001684:	0017879b          	addiw	a5,a5,1
    80001688:	00813483          	ld	s1,8(sp)
    8000168c:	00f72023          	sw	a5,0(a4)
    80001690:	02010113          	addi	sp,sp,32
    80001694:	00001317          	auipc	t1,0x1
    80001698:	4c430067          	jr	1220(t1) # 80002b58 <release>

000000008000169c <devintr>:
    8000169c:	142027f3          	csrr	a5,scause
    800016a0:	00000513          	li	a0,0
    800016a4:	0007c463          	bltz	a5,800016ac <devintr+0x10>
    800016a8:	00008067          	ret
    800016ac:	fe010113          	addi	sp,sp,-32
    800016b0:	00813823          	sd	s0,16(sp)
    800016b4:	00113c23          	sd	ra,24(sp)
    800016b8:	00913423          	sd	s1,8(sp)
    800016bc:	02010413          	addi	s0,sp,32
    800016c0:	0ff7f713          	andi	a4,a5,255
    800016c4:	00900693          	li	a3,9
    800016c8:	04d70c63          	beq	a4,a3,80001720 <devintr+0x84>
    800016cc:	fff00713          	li	a4,-1
    800016d0:	03f71713          	slli	a4,a4,0x3f
    800016d4:	00170713          	addi	a4,a4,1
    800016d8:	00e78c63          	beq	a5,a4,800016f0 <devintr+0x54>
    800016dc:	01813083          	ld	ra,24(sp)
    800016e0:	01013403          	ld	s0,16(sp)
    800016e4:	00813483          	ld	s1,8(sp)
    800016e8:	02010113          	addi	sp,sp,32
    800016ec:	00008067          	ret
    800016f0:	00000097          	auipc	ra,0x0
    800016f4:	c8c080e7          	jalr	-884(ra) # 8000137c <cpuid>
    800016f8:	06050663          	beqz	a0,80001764 <devintr+0xc8>
    800016fc:	144027f3          	csrr	a5,sip
    80001700:	ffd7f793          	andi	a5,a5,-3
    80001704:	14479073          	csrw	sip,a5
    80001708:	01813083          	ld	ra,24(sp)
    8000170c:	01013403          	ld	s0,16(sp)
    80001710:	00813483          	ld	s1,8(sp)
    80001714:	00200513          	li	a0,2
    80001718:	02010113          	addi	sp,sp,32
    8000171c:	00008067          	ret
    80001720:	00000097          	auipc	ra,0x0
    80001724:	254080e7          	jalr	596(ra) # 80001974 <plic_claim>
    80001728:	00a00793          	li	a5,10
    8000172c:	00050493          	mv	s1,a0
    80001730:	06f50663          	beq	a0,a5,8000179c <devintr+0x100>
    80001734:	00100513          	li	a0,1
    80001738:	fa0482e3          	beqz	s1,800016dc <devintr+0x40>
    8000173c:	00048593          	mv	a1,s1
    80001740:	00003517          	auipc	a0,0x3
    80001744:	9a050513          	addi	a0,a0,-1632 # 800040e0 <console_handler+0xe90>
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	670080e7          	jalr	1648(ra) # 80001db8 <__printf>
    80001750:	00048513          	mv	a0,s1
    80001754:	00000097          	auipc	ra,0x0
    80001758:	258080e7          	jalr	600(ra) # 800019ac <plic_complete>
    8000175c:	00100513          	li	a0,1
    80001760:	f7dff06f          	j	800016dc <devintr+0x40>
    80001764:	00004517          	auipc	a0,0x4
    80001768:	c2c50513          	addi	a0,a0,-980 # 80005390 <tickslock>
    8000176c:	00001097          	auipc	ra,0x1
    80001770:	320080e7          	jalr	800(ra) # 80002a8c <acquire>
    80001774:	00003717          	auipc	a4,0x3
    80001778:	b3070713          	addi	a4,a4,-1232 # 800042a4 <ticks>
    8000177c:	00072783          	lw	a5,0(a4)
    80001780:	00004517          	auipc	a0,0x4
    80001784:	c1050513          	addi	a0,a0,-1008 # 80005390 <tickslock>
    80001788:	0017879b          	addiw	a5,a5,1
    8000178c:	00f72023          	sw	a5,0(a4)
    80001790:	00001097          	auipc	ra,0x1
    80001794:	3c8080e7          	jalr	968(ra) # 80002b58 <release>
    80001798:	f65ff06f          	j	800016fc <devintr+0x60>
    8000179c:	00001097          	auipc	ra,0x1
    800017a0:	f24080e7          	jalr	-220(ra) # 800026c0 <uartintr>
    800017a4:	fadff06f          	j	80001750 <devintr+0xb4>
	...

00000000800017b0 <kernelvec>:
    800017b0:	f0010113          	addi	sp,sp,-256
    800017b4:	00113023          	sd	ra,0(sp)
    800017b8:	00213423          	sd	sp,8(sp)
    800017bc:	00313823          	sd	gp,16(sp)
    800017c0:	00413c23          	sd	tp,24(sp)
    800017c4:	02513023          	sd	t0,32(sp)
    800017c8:	02613423          	sd	t1,40(sp)
    800017cc:	02713823          	sd	t2,48(sp)
    800017d0:	02813c23          	sd	s0,56(sp)
    800017d4:	04913023          	sd	s1,64(sp)
    800017d8:	04a13423          	sd	a0,72(sp)
    800017dc:	04b13823          	sd	a1,80(sp)
    800017e0:	04c13c23          	sd	a2,88(sp)
    800017e4:	06d13023          	sd	a3,96(sp)
    800017e8:	06e13423          	sd	a4,104(sp)
    800017ec:	06f13823          	sd	a5,112(sp)
    800017f0:	07013c23          	sd	a6,120(sp)
    800017f4:	09113023          	sd	a7,128(sp)
    800017f8:	09213423          	sd	s2,136(sp)
    800017fc:	09313823          	sd	s3,144(sp)
    80001800:	09413c23          	sd	s4,152(sp)
    80001804:	0b513023          	sd	s5,160(sp)
    80001808:	0b613423          	sd	s6,168(sp)
    8000180c:	0b713823          	sd	s7,176(sp)
    80001810:	0b813c23          	sd	s8,184(sp)
    80001814:	0d913023          	sd	s9,192(sp)
    80001818:	0da13423          	sd	s10,200(sp)
    8000181c:	0db13823          	sd	s11,208(sp)
    80001820:	0dc13c23          	sd	t3,216(sp)
    80001824:	0fd13023          	sd	t4,224(sp)
    80001828:	0fe13423          	sd	t5,232(sp)
    8000182c:	0ff13823          	sd	t6,240(sp)
    80001830:	ccdff0ef          	jal	ra,800014fc <kerneltrap>
    80001834:	00013083          	ld	ra,0(sp)
    80001838:	00813103          	ld	sp,8(sp)
    8000183c:	01013183          	ld	gp,16(sp)
    80001840:	02013283          	ld	t0,32(sp)
    80001844:	02813303          	ld	t1,40(sp)
    80001848:	03013383          	ld	t2,48(sp)
    8000184c:	03813403          	ld	s0,56(sp)
    80001850:	04013483          	ld	s1,64(sp)
    80001854:	04813503          	ld	a0,72(sp)
    80001858:	05013583          	ld	a1,80(sp)
    8000185c:	05813603          	ld	a2,88(sp)
    80001860:	06013683          	ld	a3,96(sp)
    80001864:	06813703          	ld	a4,104(sp)
    80001868:	07013783          	ld	a5,112(sp)
    8000186c:	07813803          	ld	a6,120(sp)
    80001870:	08013883          	ld	a7,128(sp)
    80001874:	08813903          	ld	s2,136(sp)
    80001878:	09013983          	ld	s3,144(sp)
    8000187c:	09813a03          	ld	s4,152(sp)
    80001880:	0a013a83          	ld	s5,160(sp)
    80001884:	0a813b03          	ld	s6,168(sp)
    80001888:	0b013b83          	ld	s7,176(sp)
    8000188c:	0b813c03          	ld	s8,184(sp)
    80001890:	0c013c83          	ld	s9,192(sp)
    80001894:	0c813d03          	ld	s10,200(sp)
    80001898:	0d013d83          	ld	s11,208(sp)
    8000189c:	0d813e03          	ld	t3,216(sp)
    800018a0:	0e013e83          	ld	t4,224(sp)
    800018a4:	0e813f03          	ld	t5,232(sp)
    800018a8:	0f013f83          	ld	t6,240(sp)
    800018ac:	10010113          	addi	sp,sp,256
    800018b0:	10200073          	sret
    800018b4:	00000013          	nop
    800018b8:	00000013          	nop
    800018bc:	00000013          	nop

00000000800018c0 <timervec>:
    800018c0:	34051573          	csrrw	a0,mscratch,a0
    800018c4:	00b53023          	sd	a1,0(a0)
    800018c8:	00c53423          	sd	a2,8(a0)
    800018cc:	00d53823          	sd	a3,16(a0)
    800018d0:	01853583          	ld	a1,24(a0)
    800018d4:	02053603          	ld	a2,32(a0)
    800018d8:	0005b683          	ld	a3,0(a1)
    800018dc:	00c686b3          	add	a3,a3,a2
    800018e0:	00d5b023          	sd	a3,0(a1)
    800018e4:	00200593          	li	a1,2
    800018e8:	14459073          	csrw	sip,a1
    800018ec:	01053683          	ld	a3,16(a0)
    800018f0:	00853603          	ld	a2,8(a0)
    800018f4:	00053583          	ld	a1,0(a0)
    800018f8:	34051573          	csrrw	a0,mscratch,a0
    800018fc:	30200073          	mret

0000000080001900 <plicinit>:
    80001900:	ff010113          	addi	sp,sp,-16
    80001904:	00813423          	sd	s0,8(sp)
    80001908:	01010413          	addi	s0,sp,16
    8000190c:	00813403          	ld	s0,8(sp)
    80001910:	0c0007b7          	lui	a5,0xc000
    80001914:	00100713          	li	a4,1
    80001918:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000191c:	00e7a223          	sw	a4,4(a5)
    80001920:	01010113          	addi	sp,sp,16
    80001924:	00008067          	ret

0000000080001928 <plicinithart>:
    80001928:	ff010113          	addi	sp,sp,-16
    8000192c:	00813023          	sd	s0,0(sp)
    80001930:	00113423          	sd	ra,8(sp)
    80001934:	01010413          	addi	s0,sp,16
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	a44080e7          	jalr	-1468(ra) # 8000137c <cpuid>
    80001940:	0085171b          	slliw	a4,a0,0x8
    80001944:	0c0027b7          	lui	a5,0xc002
    80001948:	00e787b3          	add	a5,a5,a4
    8000194c:	40200713          	li	a4,1026
    80001950:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80001954:	00813083          	ld	ra,8(sp)
    80001958:	00013403          	ld	s0,0(sp)
    8000195c:	00d5151b          	slliw	a0,a0,0xd
    80001960:	0c2017b7          	lui	a5,0xc201
    80001964:	00a78533          	add	a0,a5,a0
    80001968:	00052023          	sw	zero,0(a0)
    8000196c:	01010113          	addi	sp,sp,16
    80001970:	00008067          	ret

0000000080001974 <plic_claim>:
    80001974:	ff010113          	addi	sp,sp,-16
    80001978:	00813023          	sd	s0,0(sp)
    8000197c:	00113423          	sd	ra,8(sp)
    80001980:	01010413          	addi	s0,sp,16
    80001984:	00000097          	auipc	ra,0x0
    80001988:	9f8080e7          	jalr	-1544(ra) # 8000137c <cpuid>
    8000198c:	00813083          	ld	ra,8(sp)
    80001990:	00013403          	ld	s0,0(sp)
    80001994:	00d5151b          	slliw	a0,a0,0xd
    80001998:	0c2017b7          	lui	a5,0xc201
    8000199c:	00a78533          	add	a0,a5,a0
    800019a0:	00452503          	lw	a0,4(a0)
    800019a4:	01010113          	addi	sp,sp,16
    800019a8:	00008067          	ret

00000000800019ac <plic_complete>:
    800019ac:	fe010113          	addi	sp,sp,-32
    800019b0:	00813823          	sd	s0,16(sp)
    800019b4:	00913423          	sd	s1,8(sp)
    800019b8:	00113c23          	sd	ra,24(sp)
    800019bc:	02010413          	addi	s0,sp,32
    800019c0:	00050493          	mv	s1,a0
    800019c4:	00000097          	auipc	ra,0x0
    800019c8:	9b8080e7          	jalr	-1608(ra) # 8000137c <cpuid>
    800019cc:	01813083          	ld	ra,24(sp)
    800019d0:	01013403          	ld	s0,16(sp)
    800019d4:	00d5179b          	slliw	a5,a0,0xd
    800019d8:	0c201737          	lui	a4,0xc201
    800019dc:	00f707b3          	add	a5,a4,a5
    800019e0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800019e4:	00813483          	ld	s1,8(sp)
    800019e8:	02010113          	addi	sp,sp,32
    800019ec:	00008067          	ret

00000000800019f0 <consolewrite>:
    800019f0:	fb010113          	addi	sp,sp,-80
    800019f4:	04813023          	sd	s0,64(sp)
    800019f8:	04113423          	sd	ra,72(sp)
    800019fc:	02913c23          	sd	s1,56(sp)
    80001a00:	03213823          	sd	s2,48(sp)
    80001a04:	03313423          	sd	s3,40(sp)
    80001a08:	03413023          	sd	s4,32(sp)
    80001a0c:	01513c23          	sd	s5,24(sp)
    80001a10:	05010413          	addi	s0,sp,80
    80001a14:	06c05c63          	blez	a2,80001a8c <consolewrite+0x9c>
    80001a18:	00060993          	mv	s3,a2
    80001a1c:	00050a13          	mv	s4,a0
    80001a20:	00058493          	mv	s1,a1
    80001a24:	00000913          	li	s2,0
    80001a28:	fff00a93          	li	s5,-1
    80001a2c:	01c0006f          	j	80001a48 <consolewrite+0x58>
    80001a30:	fbf44503          	lbu	a0,-65(s0)
    80001a34:	0019091b          	addiw	s2,s2,1
    80001a38:	00148493          	addi	s1,s1,1
    80001a3c:	00001097          	auipc	ra,0x1
    80001a40:	a9c080e7          	jalr	-1380(ra) # 800024d8 <uartputc>
    80001a44:	03298063          	beq	s3,s2,80001a64 <consolewrite+0x74>
    80001a48:	00048613          	mv	a2,s1
    80001a4c:	00100693          	li	a3,1
    80001a50:	000a0593          	mv	a1,s4
    80001a54:	fbf40513          	addi	a0,s0,-65
    80001a58:	00000097          	auipc	ra,0x0
    80001a5c:	9dc080e7          	jalr	-1572(ra) # 80001434 <either_copyin>
    80001a60:	fd5518e3          	bne	a0,s5,80001a30 <consolewrite+0x40>
    80001a64:	04813083          	ld	ra,72(sp)
    80001a68:	04013403          	ld	s0,64(sp)
    80001a6c:	03813483          	ld	s1,56(sp)
    80001a70:	02813983          	ld	s3,40(sp)
    80001a74:	02013a03          	ld	s4,32(sp)
    80001a78:	01813a83          	ld	s5,24(sp)
    80001a7c:	00090513          	mv	a0,s2
    80001a80:	03013903          	ld	s2,48(sp)
    80001a84:	05010113          	addi	sp,sp,80
    80001a88:	00008067          	ret
    80001a8c:	00000913          	li	s2,0
    80001a90:	fd5ff06f          	j	80001a64 <consolewrite+0x74>

0000000080001a94 <consoleread>:
    80001a94:	f9010113          	addi	sp,sp,-112
    80001a98:	06813023          	sd	s0,96(sp)
    80001a9c:	04913c23          	sd	s1,88(sp)
    80001aa0:	05213823          	sd	s2,80(sp)
    80001aa4:	05313423          	sd	s3,72(sp)
    80001aa8:	05413023          	sd	s4,64(sp)
    80001aac:	03513c23          	sd	s5,56(sp)
    80001ab0:	03613823          	sd	s6,48(sp)
    80001ab4:	03713423          	sd	s7,40(sp)
    80001ab8:	03813023          	sd	s8,32(sp)
    80001abc:	06113423          	sd	ra,104(sp)
    80001ac0:	01913c23          	sd	s9,24(sp)
    80001ac4:	07010413          	addi	s0,sp,112
    80001ac8:	00060b93          	mv	s7,a2
    80001acc:	00050913          	mv	s2,a0
    80001ad0:	00058c13          	mv	s8,a1
    80001ad4:	00060b1b          	sext.w	s6,a2
    80001ad8:	00004497          	auipc	s1,0x4
    80001adc:	8d048493          	addi	s1,s1,-1840 # 800053a8 <cons>
    80001ae0:	00400993          	li	s3,4
    80001ae4:	fff00a13          	li	s4,-1
    80001ae8:	00a00a93          	li	s5,10
    80001aec:	05705e63          	blez	s7,80001b48 <consoleread+0xb4>
    80001af0:	09c4a703          	lw	a4,156(s1)
    80001af4:	0984a783          	lw	a5,152(s1)
    80001af8:	0007071b          	sext.w	a4,a4
    80001afc:	08e78463          	beq	a5,a4,80001b84 <consoleread+0xf0>
    80001b00:	07f7f713          	andi	a4,a5,127
    80001b04:	00e48733          	add	a4,s1,a4
    80001b08:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80001b0c:	0017869b          	addiw	a3,a5,1
    80001b10:	08d4ac23          	sw	a3,152(s1)
    80001b14:	00070c9b          	sext.w	s9,a4
    80001b18:	0b370663          	beq	a4,s3,80001bc4 <consoleread+0x130>
    80001b1c:	00100693          	li	a3,1
    80001b20:	f9f40613          	addi	a2,s0,-97
    80001b24:	000c0593          	mv	a1,s8
    80001b28:	00090513          	mv	a0,s2
    80001b2c:	f8e40fa3          	sb	a4,-97(s0)
    80001b30:	00000097          	auipc	ra,0x0
    80001b34:	8b8080e7          	jalr	-1864(ra) # 800013e8 <either_copyout>
    80001b38:	01450863          	beq	a0,s4,80001b48 <consoleread+0xb4>
    80001b3c:	001c0c13          	addi	s8,s8,1
    80001b40:	fffb8b9b          	addiw	s7,s7,-1
    80001b44:	fb5c94e3          	bne	s9,s5,80001aec <consoleread+0x58>
    80001b48:	000b851b          	sext.w	a0,s7
    80001b4c:	06813083          	ld	ra,104(sp)
    80001b50:	06013403          	ld	s0,96(sp)
    80001b54:	05813483          	ld	s1,88(sp)
    80001b58:	05013903          	ld	s2,80(sp)
    80001b5c:	04813983          	ld	s3,72(sp)
    80001b60:	04013a03          	ld	s4,64(sp)
    80001b64:	03813a83          	ld	s5,56(sp)
    80001b68:	02813b83          	ld	s7,40(sp)
    80001b6c:	02013c03          	ld	s8,32(sp)
    80001b70:	01813c83          	ld	s9,24(sp)
    80001b74:	40ab053b          	subw	a0,s6,a0
    80001b78:	03013b03          	ld	s6,48(sp)
    80001b7c:	07010113          	addi	sp,sp,112
    80001b80:	00008067          	ret
    80001b84:	00001097          	auipc	ra,0x1
    80001b88:	1d8080e7          	jalr	472(ra) # 80002d5c <push_on>
    80001b8c:	0984a703          	lw	a4,152(s1)
    80001b90:	09c4a783          	lw	a5,156(s1)
    80001b94:	0007879b          	sext.w	a5,a5
    80001b98:	fef70ce3          	beq	a4,a5,80001b90 <consoleread+0xfc>
    80001b9c:	00001097          	auipc	ra,0x1
    80001ba0:	234080e7          	jalr	564(ra) # 80002dd0 <pop_on>
    80001ba4:	0984a783          	lw	a5,152(s1)
    80001ba8:	07f7f713          	andi	a4,a5,127
    80001bac:	00e48733          	add	a4,s1,a4
    80001bb0:	01874703          	lbu	a4,24(a4)
    80001bb4:	0017869b          	addiw	a3,a5,1
    80001bb8:	08d4ac23          	sw	a3,152(s1)
    80001bbc:	00070c9b          	sext.w	s9,a4
    80001bc0:	f5371ee3          	bne	a4,s3,80001b1c <consoleread+0x88>
    80001bc4:	000b851b          	sext.w	a0,s7
    80001bc8:	f96bf2e3          	bgeu	s7,s6,80001b4c <consoleread+0xb8>
    80001bcc:	08f4ac23          	sw	a5,152(s1)
    80001bd0:	f7dff06f          	j	80001b4c <consoleread+0xb8>

0000000080001bd4 <consputc>:
    80001bd4:	10000793          	li	a5,256
    80001bd8:	00f50663          	beq	a0,a5,80001be4 <consputc+0x10>
    80001bdc:	00001317          	auipc	t1,0x1
    80001be0:	9f430067          	jr	-1548(t1) # 800025d0 <uartputc_sync>
    80001be4:	ff010113          	addi	sp,sp,-16
    80001be8:	00113423          	sd	ra,8(sp)
    80001bec:	00813023          	sd	s0,0(sp)
    80001bf0:	01010413          	addi	s0,sp,16
    80001bf4:	00800513          	li	a0,8
    80001bf8:	00001097          	auipc	ra,0x1
    80001bfc:	9d8080e7          	jalr	-1576(ra) # 800025d0 <uartputc_sync>
    80001c00:	02000513          	li	a0,32
    80001c04:	00001097          	auipc	ra,0x1
    80001c08:	9cc080e7          	jalr	-1588(ra) # 800025d0 <uartputc_sync>
    80001c0c:	00013403          	ld	s0,0(sp)
    80001c10:	00813083          	ld	ra,8(sp)
    80001c14:	00800513          	li	a0,8
    80001c18:	01010113          	addi	sp,sp,16
    80001c1c:	00001317          	auipc	t1,0x1
    80001c20:	9b430067          	jr	-1612(t1) # 800025d0 <uartputc_sync>

0000000080001c24 <consoleintr>:
    80001c24:	fe010113          	addi	sp,sp,-32
    80001c28:	00813823          	sd	s0,16(sp)
    80001c2c:	00913423          	sd	s1,8(sp)
    80001c30:	01213023          	sd	s2,0(sp)
    80001c34:	00113c23          	sd	ra,24(sp)
    80001c38:	02010413          	addi	s0,sp,32
    80001c3c:	00003917          	auipc	s2,0x3
    80001c40:	76c90913          	addi	s2,s2,1900 # 800053a8 <cons>
    80001c44:	00050493          	mv	s1,a0
    80001c48:	00090513          	mv	a0,s2
    80001c4c:	00001097          	auipc	ra,0x1
    80001c50:	e40080e7          	jalr	-448(ra) # 80002a8c <acquire>
    80001c54:	02048c63          	beqz	s1,80001c8c <consoleintr+0x68>
    80001c58:	0a092783          	lw	a5,160(s2)
    80001c5c:	09892703          	lw	a4,152(s2)
    80001c60:	07f00693          	li	a3,127
    80001c64:	40e7873b          	subw	a4,a5,a4
    80001c68:	02e6e263          	bltu	a3,a4,80001c8c <consoleintr+0x68>
    80001c6c:	00d00713          	li	a4,13
    80001c70:	04e48063          	beq	s1,a4,80001cb0 <consoleintr+0x8c>
    80001c74:	07f7f713          	andi	a4,a5,127
    80001c78:	00e90733          	add	a4,s2,a4
    80001c7c:	0017879b          	addiw	a5,a5,1
    80001c80:	0af92023          	sw	a5,160(s2)
    80001c84:	00970c23          	sb	s1,24(a4)
    80001c88:	08f92e23          	sw	a5,156(s2)
    80001c8c:	01013403          	ld	s0,16(sp)
    80001c90:	01813083          	ld	ra,24(sp)
    80001c94:	00813483          	ld	s1,8(sp)
    80001c98:	00013903          	ld	s2,0(sp)
    80001c9c:	00003517          	auipc	a0,0x3
    80001ca0:	70c50513          	addi	a0,a0,1804 # 800053a8 <cons>
    80001ca4:	02010113          	addi	sp,sp,32
    80001ca8:	00001317          	auipc	t1,0x1
    80001cac:	eb030067          	jr	-336(t1) # 80002b58 <release>
    80001cb0:	00a00493          	li	s1,10
    80001cb4:	fc1ff06f          	j	80001c74 <consoleintr+0x50>

0000000080001cb8 <consoleinit>:
    80001cb8:	fe010113          	addi	sp,sp,-32
    80001cbc:	00113c23          	sd	ra,24(sp)
    80001cc0:	00813823          	sd	s0,16(sp)
    80001cc4:	00913423          	sd	s1,8(sp)
    80001cc8:	02010413          	addi	s0,sp,32
    80001ccc:	00003497          	auipc	s1,0x3
    80001cd0:	6dc48493          	addi	s1,s1,1756 # 800053a8 <cons>
    80001cd4:	00048513          	mv	a0,s1
    80001cd8:	00002597          	auipc	a1,0x2
    80001cdc:	46058593          	addi	a1,a1,1120 # 80004138 <console_handler+0xee8>
    80001ce0:	00001097          	auipc	ra,0x1
    80001ce4:	d88080e7          	jalr	-632(ra) # 80002a68 <initlock>
    80001ce8:	00000097          	auipc	ra,0x0
    80001cec:	7ac080e7          	jalr	1964(ra) # 80002494 <uartinit>
    80001cf0:	01813083          	ld	ra,24(sp)
    80001cf4:	01013403          	ld	s0,16(sp)
    80001cf8:	00000797          	auipc	a5,0x0
    80001cfc:	d9c78793          	addi	a5,a5,-612 # 80001a94 <consoleread>
    80001d00:	0af4bc23          	sd	a5,184(s1)
    80001d04:	00000797          	auipc	a5,0x0
    80001d08:	cec78793          	addi	a5,a5,-788 # 800019f0 <consolewrite>
    80001d0c:	0cf4b023          	sd	a5,192(s1)
    80001d10:	00813483          	ld	s1,8(sp)
    80001d14:	02010113          	addi	sp,sp,32
    80001d18:	00008067          	ret

0000000080001d1c <console_read>:
    80001d1c:	ff010113          	addi	sp,sp,-16
    80001d20:	00813423          	sd	s0,8(sp)
    80001d24:	01010413          	addi	s0,sp,16
    80001d28:	00813403          	ld	s0,8(sp)
    80001d2c:	00003317          	auipc	t1,0x3
    80001d30:	73433303          	ld	t1,1844(t1) # 80005460 <devsw+0x10>
    80001d34:	01010113          	addi	sp,sp,16
    80001d38:	00030067          	jr	t1

0000000080001d3c <console_write>:
    80001d3c:	ff010113          	addi	sp,sp,-16
    80001d40:	00813423          	sd	s0,8(sp)
    80001d44:	01010413          	addi	s0,sp,16
    80001d48:	00813403          	ld	s0,8(sp)
    80001d4c:	00003317          	auipc	t1,0x3
    80001d50:	71c33303          	ld	t1,1820(t1) # 80005468 <devsw+0x18>
    80001d54:	01010113          	addi	sp,sp,16
    80001d58:	00030067          	jr	t1

0000000080001d5c <panic>:
    80001d5c:	fe010113          	addi	sp,sp,-32
    80001d60:	00113c23          	sd	ra,24(sp)
    80001d64:	00813823          	sd	s0,16(sp)
    80001d68:	00913423          	sd	s1,8(sp)
    80001d6c:	02010413          	addi	s0,sp,32
    80001d70:	00050493          	mv	s1,a0
    80001d74:	00002517          	auipc	a0,0x2
    80001d78:	3cc50513          	addi	a0,a0,972 # 80004140 <console_handler+0xef0>
    80001d7c:	00003797          	auipc	a5,0x3
    80001d80:	7807a623          	sw	zero,1932(a5) # 80005508 <pr+0x18>
    80001d84:	00000097          	auipc	ra,0x0
    80001d88:	034080e7          	jalr	52(ra) # 80001db8 <__printf>
    80001d8c:	00048513          	mv	a0,s1
    80001d90:	00000097          	auipc	ra,0x0
    80001d94:	028080e7          	jalr	40(ra) # 80001db8 <__printf>
    80001d98:	00002517          	auipc	a0,0x2
    80001d9c:	38850513          	addi	a0,a0,904 # 80004120 <console_handler+0xed0>
    80001da0:	00000097          	auipc	ra,0x0
    80001da4:	018080e7          	jalr	24(ra) # 80001db8 <__printf>
    80001da8:	00100793          	li	a5,1
    80001dac:	00002717          	auipc	a4,0x2
    80001db0:	4ef72e23          	sw	a5,1276(a4) # 800042a8 <panicked>
    80001db4:	0000006f          	j	80001db4 <panic+0x58>

0000000080001db8 <__printf>:
    80001db8:	f3010113          	addi	sp,sp,-208
    80001dbc:	08813023          	sd	s0,128(sp)
    80001dc0:	07313423          	sd	s3,104(sp)
    80001dc4:	09010413          	addi	s0,sp,144
    80001dc8:	05813023          	sd	s8,64(sp)
    80001dcc:	08113423          	sd	ra,136(sp)
    80001dd0:	06913c23          	sd	s1,120(sp)
    80001dd4:	07213823          	sd	s2,112(sp)
    80001dd8:	07413023          	sd	s4,96(sp)
    80001ddc:	05513c23          	sd	s5,88(sp)
    80001de0:	05613823          	sd	s6,80(sp)
    80001de4:	05713423          	sd	s7,72(sp)
    80001de8:	03913c23          	sd	s9,56(sp)
    80001dec:	03a13823          	sd	s10,48(sp)
    80001df0:	03b13423          	sd	s11,40(sp)
    80001df4:	00003317          	auipc	t1,0x3
    80001df8:	6fc30313          	addi	t1,t1,1788 # 800054f0 <pr>
    80001dfc:	01832c03          	lw	s8,24(t1)
    80001e00:	00b43423          	sd	a1,8(s0)
    80001e04:	00c43823          	sd	a2,16(s0)
    80001e08:	00d43c23          	sd	a3,24(s0)
    80001e0c:	02e43023          	sd	a4,32(s0)
    80001e10:	02f43423          	sd	a5,40(s0)
    80001e14:	03043823          	sd	a6,48(s0)
    80001e18:	03143c23          	sd	a7,56(s0)
    80001e1c:	00050993          	mv	s3,a0
    80001e20:	4a0c1663          	bnez	s8,800022cc <__printf+0x514>
    80001e24:	60098c63          	beqz	s3,8000243c <__printf+0x684>
    80001e28:	0009c503          	lbu	a0,0(s3)
    80001e2c:	00840793          	addi	a5,s0,8
    80001e30:	f6f43c23          	sd	a5,-136(s0)
    80001e34:	00000493          	li	s1,0
    80001e38:	22050063          	beqz	a0,80002058 <__printf+0x2a0>
    80001e3c:	00002a37          	lui	s4,0x2
    80001e40:	00018ab7          	lui	s5,0x18
    80001e44:	000f4b37          	lui	s6,0xf4
    80001e48:	00989bb7          	lui	s7,0x989
    80001e4c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80001e50:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80001e54:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80001e58:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80001e5c:	00148c9b          	addiw	s9,s1,1
    80001e60:	02500793          	li	a5,37
    80001e64:	01998933          	add	s2,s3,s9
    80001e68:	38f51263          	bne	a0,a5,800021ec <__printf+0x434>
    80001e6c:	00094783          	lbu	a5,0(s2)
    80001e70:	00078c9b          	sext.w	s9,a5
    80001e74:	1e078263          	beqz	a5,80002058 <__printf+0x2a0>
    80001e78:	0024849b          	addiw	s1,s1,2
    80001e7c:	07000713          	li	a4,112
    80001e80:	00998933          	add	s2,s3,s1
    80001e84:	38e78a63          	beq	a5,a4,80002218 <__printf+0x460>
    80001e88:	20f76863          	bltu	a4,a5,80002098 <__printf+0x2e0>
    80001e8c:	42a78863          	beq	a5,a0,800022bc <__printf+0x504>
    80001e90:	06400713          	li	a4,100
    80001e94:	40e79663          	bne	a5,a4,800022a0 <__printf+0x4e8>
    80001e98:	f7843783          	ld	a5,-136(s0)
    80001e9c:	0007a603          	lw	a2,0(a5)
    80001ea0:	00878793          	addi	a5,a5,8
    80001ea4:	f6f43c23          	sd	a5,-136(s0)
    80001ea8:	42064a63          	bltz	a2,800022dc <__printf+0x524>
    80001eac:	00a00713          	li	a4,10
    80001eb0:	02e677bb          	remuw	a5,a2,a4
    80001eb4:	00002d97          	auipc	s11,0x2
    80001eb8:	2b4d8d93          	addi	s11,s11,692 # 80004168 <digits>
    80001ebc:	00900593          	li	a1,9
    80001ec0:	0006051b          	sext.w	a0,a2
    80001ec4:	00000c93          	li	s9,0
    80001ec8:	02079793          	slli	a5,a5,0x20
    80001ecc:	0207d793          	srli	a5,a5,0x20
    80001ed0:	00fd87b3          	add	a5,s11,a5
    80001ed4:	0007c783          	lbu	a5,0(a5)
    80001ed8:	02e656bb          	divuw	a3,a2,a4
    80001edc:	f8f40023          	sb	a5,-128(s0)
    80001ee0:	14c5d863          	bge	a1,a2,80002030 <__printf+0x278>
    80001ee4:	06300593          	li	a1,99
    80001ee8:	00100c93          	li	s9,1
    80001eec:	02e6f7bb          	remuw	a5,a3,a4
    80001ef0:	02079793          	slli	a5,a5,0x20
    80001ef4:	0207d793          	srli	a5,a5,0x20
    80001ef8:	00fd87b3          	add	a5,s11,a5
    80001efc:	0007c783          	lbu	a5,0(a5)
    80001f00:	02e6d73b          	divuw	a4,a3,a4
    80001f04:	f8f400a3          	sb	a5,-127(s0)
    80001f08:	12a5f463          	bgeu	a1,a0,80002030 <__printf+0x278>
    80001f0c:	00a00693          	li	a3,10
    80001f10:	00900593          	li	a1,9
    80001f14:	02d777bb          	remuw	a5,a4,a3
    80001f18:	02079793          	slli	a5,a5,0x20
    80001f1c:	0207d793          	srli	a5,a5,0x20
    80001f20:	00fd87b3          	add	a5,s11,a5
    80001f24:	0007c503          	lbu	a0,0(a5)
    80001f28:	02d757bb          	divuw	a5,a4,a3
    80001f2c:	f8a40123          	sb	a0,-126(s0)
    80001f30:	48e5f263          	bgeu	a1,a4,800023b4 <__printf+0x5fc>
    80001f34:	06300513          	li	a0,99
    80001f38:	02d7f5bb          	remuw	a1,a5,a3
    80001f3c:	02059593          	slli	a1,a1,0x20
    80001f40:	0205d593          	srli	a1,a1,0x20
    80001f44:	00bd85b3          	add	a1,s11,a1
    80001f48:	0005c583          	lbu	a1,0(a1)
    80001f4c:	02d7d7bb          	divuw	a5,a5,a3
    80001f50:	f8b401a3          	sb	a1,-125(s0)
    80001f54:	48e57263          	bgeu	a0,a4,800023d8 <__printf+0x620>
    80001f58:	3e700513          	li	a0,999
    80001f5c:	02d7f5bb          	remuw	a1,a5,a3
    80001f60:	02059593          	slli	a1,a1,0x20
    80001f64:	0205d593          	srli	a1,a1,0x20
    80001f68:	00bd85b3          	add	a1,s11,a1
    80001f6c:	0005c583          	lbu	a1,0(a1)
    80001f70:	02d7d7bb          	divuw	a5,a5,a3
    80001f74:	f8b40223          	sb	a1,-124(s0)
    80001f78:	46e57663          	bgeu	a0,a4,800023e4 <__printf+0x62c>
    80001f7c:	02d7f5bb          	remuw	a1,a5,a3
    80001f80:	02059593          	slli	a1,a1,0x20
    80001f84:	0205d593          	srli	a1,a1,0x20
    80001f88:	00bd85b3          	add	a1,s11,a1
    80001f8c:	0005c583          	lbu	a1,0(a1)
    80001f90:	02d7d7bb          	divuw	a5,a5,a3
    80001f94:	f8b402a3          	sb	a1,-123(s0)
    80001f98:	46ea7863          	bgeu	s4,a4,80002408 <__printf+0x650>
    80001f9c:	02d7f5bb          	remuw	a1,a5,a3
    80001fa0:	02059593          	slli	a1,a1,0x20
    80001fa4:	0205d593          	srli	a1,a1,0x20
    80001fa8:	00bd85b3          	add	a1,s11,a1
    80001fac:	0005c583          	lbu	a1,0(a1)
    80001fb0:	02d7d7bb          	divuw	a5,a5,a3
    80001fb4:	f8b40323          	sb	a1,-122(s0)
    80001fb8:	3eeaf863          	bgeu	s5,a4,800023a8 <__printf+0x5f0>
    80001fbc:	02d7f5bb          	remuw	a1,a5,a3
    80001fc0:	02059593          	slli	a1,a1,0x20
    80001fc4:	0205d593          	srli	a1,a1,0x20
    80001fc8:	00bd85b3          	add	a1,s11,a1
    80001fcc:	0005c583          	lbu	a1,0(a1)
    80001fd0:	02d7d7bb          	divuw	a5,a5,a3
    80001fd4:	f8b403a3          	sb	a1,-121(s0)
    80001fd8:	42eb7e63          	bgeu	s6,a4,80002414 <__printf+0x65c>
    80001fdc:	02d7f5bb          	remuw	a1,a5,a3
    80001fe0:	02059593          	slli	a1,a1,0x20
    80001fe4:	0205d593          	srli	a1,a1,0x20
    80001fe8:	00bd85b3          	add	a1,s11,a1
    80001fec:	0005c583          	lbu	a1,0(a1)
    80001ff0:	02d7d7bb          	divuw	a5,a5,a3
    80001ff4:	f8b40423          	sb	a1,-120(s0)
    80001ff8:	42ebfc63          	bgeu	s7,a4,80002430 <__printf+0x678>
    80001ffc:	02079793          	slli	a5,a5,0x20
    80002000:	0207d793          	srli	a5,a5,0x20
    80002004:	00fd8db3          	add	s11,s11,a5
    80002008:	000dc703          	lbu	a4,0(s11)
    8000200c:	00a00793          	li	a5,10
    80002010:	00900c93          	li	s9,9
    80002014:	f8e404a3          	sb	a4,-119(s0)
    80002018:	00065c63          	bgez	a2,80002030 <__printf+0x278>
    8000201c:	f9040713          	addi	a4,s0,-112
    80002020:	00f70733          	add	a4,a4,a5
    80002024:	02d00693          	li	a3,45
    80002028:	fed70823          	sb	a3,-16(a4)
    8000202c:	00078c93          	mv	s9,a5
    80002030:	f8040793          	addi	a5,s0,-128
    80002034:	01978cb3          	add	s9,a5,s9
    80002038:	f7f40d13          	addi	s10,s0,-129
    8000203c:	000cc503          	lbu	a0,0(s9)
    80002040:	fffc8c93          	addi	s9,s9,-1
    80002044:	00000097          	auipc	ra,0x0
    80002048:	b90080e7          	jalr	-1136(ra) # 80001bd4 <consputc>
    8000204c:	ffac98e3          	bne	s9,s10,8000203c <__printf+0x284>
    80002050:	00094503          	lbu	a0,0(s2)
    80002054:	e00514e3          	bnez	a0,80001e5c <__printf+0xa4>
    80002058:	1a0c1663          	bnez	s8,80002204 <__printf+0x44c>
    8000205c:	08813083          	ld	ra,136(sp)
    80002060:	08013403          	ld	s0,128(sp)
    80002064:	07813483          	ld	s1,120(sp)
    80002068:	07013903          	ld	s2,112(sp)
    8000206c:	06813983          	ld	s3,104(sp)
    80002070:	06013a03          	ld	s4,96(sp)
    80002074:	05813a83          	ld	s5,88(sp)
    80002078:	05013b03          	ld	s6,80(sp)
    8000207c:	04813b83          	ld	s7,72(sp)
    80002080:	04013c03          	ld	s8,64(sp)
    80002084:	03813c83          	ld	s9,56(sp)
    80002088:	03013d03          	ld	s10,48(sp)
    8000208c:	02813d83          	ld	s11,40(sp)
    80002090:	0d010113          	addi	sp,sp,208
    80002094:	00008067          	ret
    80002098:	07300713          	li	a4,115
    8000209c:	1ce78a63          	beq	a5,a4,80002270 <__printf+0x4b8>
    800020a0:	07800713          	li	a4,120
    800020a4:	1ee79e63          	bne	a5,a4,800022a0 <__printf+0x4e8>
    800020a8:	f7843783          	ld	a5,-136(s0)
    800020ac:	0007a703          	lw	a4,0(a5)
    800020b0:	00878793          	addi	a5,a5,8
    800020b4:	f6f43c23          	sd	a5,-136(s0)
    800020b8:	28074263          	bltz	a4,8000233c <__printf+0x584>
    800020bc:	00002d97          	auipc	s11,0x2
    800020c0:	0acd8d93          	addi	s11,s11,172 # 80004168 <digits>
    800020c4:	00f77793          	andi	a5,a4,15
    800020c8:	00fd87b3          	add	a5,s11,a5
    800020cc:	0007c683          	lbu	a3,0(a5)
    800020d0:	00f00613          	li	a2,15
    800020d4:	0007079b          	sext.w	a5,a4
    800020d8:	f8d40023          	sb	a3,-128(s0)
    800020dc:	0047559b          	srliw	a1,a4,0x4
    800020e0:	0047569b          	srliw	a3,a4,0x4
    800020e4:	00000c93          	li	s9,0
    800020e8:	0ee65063          	bge	a2,a4,800021c8 <__printf+0x410>
    800020ec:	00f6f693          	andi	a3,a3,15
    800020f0:	00dd86b3          	add	a3,s11,a3
    800020f4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800020f8:	0087d79b          	srliw	a5,a5,0x8
    800020fc:	00100c93          	li	s9,1
    80002100:	f8d400a3          	sb	a3,-127(s0)
    80002104:	0cb67263          	bgeu	a2,a1,800021c8 <__printf+0x410>
    80002108:	00f7f693          	andi	a3,a5,15
    8000210c:	00dd86b3          	add	a3,s11,a3
    80002110:	0006c583          	lbu	a1,0(a3)
    80002114:	00f00613          	li	a2,15
    80002118:	0047d69b          	srliw	a3,a5,0x4
    8000211c:	f8b40123          	sb	a1,-126(s0)
    80002120:	0047d593          	srli	a1,a5,0x4
    80002124:	28f67e63          	bgeu	a2,a5,800023c0 <__printf+0x608>
    80002128:	00f6f693          	andi	a3,a3,15
    8000212c:	00dd86b3          	add	a3,s11,a3
    80002130:	0006c503          	lbu	a0,0(a3)
    80002134:	0087d813          	srli	a6,a5,0x8
    80002138:	0087d69b          	srliw	a3,a5,0x8
    8000213c:	f8a401a3          	sb	a0,-125(s0)
    80002140:	28b67663          	bgeu	a2,a1,800023cc <__printf+0x614>
    80002144:	00f6f693          	andi	a3,a3,15
    80002148:	00dd86b3          	add	a3,s11,a3
    8000214c:	0006c583          	lbu	a1,0(a3)
    80002150:	00c7d513          	srli	a0,a5,0xc
    80002154:	00c7d69b          	srliw	a3,a5,0xc
    80002158:	f8b40223          	sb	a1,-124(s0)
    8000215c:	29067a63          	bgeu	a2,a6,800023f0 <__printf+0x638>
    80002160:	00f6f693          	andi	a3,a3,15
    80002164:	00dd86b3          	add	a3,s11,a3
    80002168:	0006c583          	lbu	a1,0(a3)
    8000216c:	0107d813          	srli	a6,a5,0x10
    80002170:	0107d69b          	srliw	a3,a5,0x10
    80002174:	f8b402a3          	sb	a1,-123(s0)
    80002178:	28a67263          	bgeu	a2,a0,800023fc <__printf+0x644>
    8000217c:	00f6f693          	andi	a3,a3,15
    80002180:	00dd86b3          	add	a3,s11,a3
    80002184:	0006c683          	lbu	a3,0(a3)
    80002188:	0147d79b          	srliw	a5,a5,0x14
    8000218c:	f8d40323          	sb	a3,-122(s0)
    80002190:	21067663          	bgeu	a2,a6,8000239c <__printf+0x5e4>
    80002194:	02079793          	slli	a5,a5,0x20
    80002198:	0207d793          	srli	a5,a5,0x20
    8000219c:	00fd8db3          	add	s11,s11,a5
    800021a0:	000dc683          	lbu	a3,0(s11)
    800021a4:	00800793          	li	a5,8
    800021a8:	00700c93          	li	s9,7
    800021ac:	f8d403a3          	sb	a3,-121(s0)
    800021b0:	00075c63          	bgez	a4,800021c8 <__printf+0x410>
    800021b4:	f9040713          	addi	a4,s0,-112
    800021b8:	00f70733          	add	a4,a4,a5
    800021bc:	02d00693          	li	a3,45
    800021c0:	fed70823          	sb	a3,-16(a4)
    800021c4:	00078c93          	mv	s9,a5
    800021c8:	f8040793          	addi	a5,s0,-128
    800021cc:	01978cb3          	add	s9,a5,s9
    800021d0:	f7f40d13          	addi	s10,s0,-129
    800021d4:	000cc503          	lbu	a0,0(s9)
    800021d8:	fffc8c93          	addi	s9,s9,-1
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	9f8080e7          	jalr	-1544(ra) # 80001bd4 <consputc>
    800021e4:	ff9d18e3          	bne	s10,s9,800021d4 <__printf+0x41c>
    800021e8:	0100006f          	j	800021f8 <__printf+0x440>
    800021ec:	00000097          	auipc	ra,0x0
    800021f0:	9e8080e7          	jalr	-1560(ra) # 80001bd4 <consputc>
    800021f4:	000c8493          	mv	s1,s9
    800021f8:	00094503          	lbu	a0,0(s2)
    800021fc:	c60510e3          	bnez	a0,80001e5c <__printf+0xa4>
    80002200:	e40c0ee3          	beqz	s8,8000205c <__printf+0x2a4>
    80002204:	00003517          	auipc	a0,0x3
    80002208:	2ec50513          	addi	a0,a0,748 # 800054f0 <pr>
    8000220c:	00001097          	auipc	ra,0x1
    80002210:	94c080e7          	jalr	-1716(ra) # 80002b58 <release>
    80002214:	e49ff06f          	j	8000205c <__printf+0x2a4>
    80002218:	f7843783          	ld	a5,-136(s0)
    8000221c:	03000513          	li	a0,48
    80002220:	01000d13          	li	s10,16
    80002224:	00878713          	addi	a4,a5,8
    80002228:	0007bc83          	ld	s9,0(a5)
    8000222c:	f6e43c23          	sd	a4,-136(s0)
    80002230:	00000097          	auipc	ra,0x0
    80002234:	9a4080e7          	jalr	-1628(ra) # 80001bd4 <consputc>
    80002238:	07800513          	li	a0,120
    8000223c:	00000097          	auipc	ra,0x0
    80002240:	998080e7          	jalr	-1640(ra) # 80001bd4 <consputc>
    80002244:	00002d97          	auipc	s11,0x2
    80002248:	f24d8d93          	addi	s11,s11,-220 # 80004168 <digits>
    8000224c:	03ccd793          	srli	a5,s9,0x3c
    80002250:	00fd87b3          	add	a5,s11,a5
    80002254:	0007c503          	lbu	a0,0(a5)
    80002258:	fffd0d1b          	addiw	s10,s10,-1
    8000225c:	004c9c93          	slli	s9,s9,0x4
    80002260:	00000097          	auipc	ra,0x0
    80002264:	974080e7          	jalr	-1676(ra) # 80001bd4 <consputc>
    80002268:	fe0d12e3          	bnez	s10,8000224c <__printf+0x494>
    8000226c:	f8dff06f          	j	800021f8 <__printf+0x440>
    80002270:	f7843783          	ld	a5,-136(s0)
    80002274:	0007bc83          	ld	s9,0(a5)
    80002278:	00878793          	addi	a5,a5,8
    8000227c:	f6f43c23          	sd	a5,-136(s0)
    80002280:	000c9a63          	bnez	s9,80002294 <__printf+0x4dc>
    80002284:	1080006f          	j	8000238c <__printf+0x5d4>
    80002288:	001c8c93          	addi	s9,s9,1
    8000228c:	00000097          	auipc	ra,0x0
    80002290:	948080e7          	jalr	-1720(ra) # 80001bd4 <consputc>
    80002294:	000cc503          	lbu	a0,0(s9)
    80002298:	fe0518e3          	bnez	a0,80002288 <__printf+0x4d0>
    8000229c:	f5dff06f          	j	800021f8 <__printf+0x440>
    800022a0:	02500513          	li	a0,37
    800022a4:	00000097          	auipc	ra,0x0
    800022a8:	930080e7          	jalr	-1744(ra) # 80001bd4 <consputc>
    800022ac:	000c8513          	mv	a0,s9
    800022b0:	00000097          	auipc	ra,0x0
    800022b4:	924080e7          	jalr	-1756(ra) # 80001bd4 <consputc>
    800022b8:	f41ff06f          	j	800021f8 <__printf+0x440>
    800022bc:	02500513          	li	a0,37
    800022c0:	00000097          	auipc	ra,0x0
    800022c4:	914080e7          	jalr	-1772(ra) # 80001bd4 <consputc>
    800022c8:	f31ff06f          	j	800021f8 <__printf+0x440>
    800022cc:	00030513          	mv	a0,t1
    800022d0:	00000097          	auipc	ra,0x0
    800022d4:	7bc080e7          	jalr	1980(ra) # 80002a8c <acquire>
    800022d8:	b4dff06f          	j	80001e24 <__printf+0x6c>
    800022dc:	40c0053b          	negw	a0,a2
    800022e0:	00a00713          	li	a4,10
    800022e4:	02e576bb          	remuw	a3,a0,a4
    800022e8:	00002d97          	auipc	s11,0x2
    800022ec:	e80d8d93          	addi	s11,s11,-384 # 80004168 <digits>
    800022f0:	ff700593          	li	a1,-9
    800022f4:	02069693          	slli	a3,a3,0x20
    800022f8:	0206d693          	srli	a3,a3,0x20
    800022fc:	00dd86b3          	add	a3,s11,a3
    80002300:	0006c683          	lbu	a3,0(a3)
    80002304:	02e557bb          	divuw	a5,a0,a4
    80002308:	f8d40023          	sb	a3,-128(s0)
    8000230c:	10b65e63          	bge	a2,a1,80002428 <__printf+0x670>
    80002310:	06300593          	li	a1,99
    80002314:	02e7f6bb          	remuw	a3,a5,a4
    80002318:	02069693          	slli	a3,a3,0x20
    8000231c:	0206d693          	srli	a3,a3,0x20
    80002320:	00dd86b3          	add	a3,s11,a3
    80002324:	0006c683          	lbu	a3,0(a3)
    80002328:	02e7d73b          	divuw	a4,a5,a4
    8000232c:	00200793          	li	a5,2
    80002330:	f8d400a3          	sb	a3,-127(s0)
    80002334:	bca5ece3          	bltu	a1,a0,80001f0c <__printf+0x154>
    80002338:	ce5ff06f          	j	8000201c <__printf+0x264>
    8000233c:	40e007bb          	negw	a5,a4
    80002340:	00002d97          	auipc	s11,0x2
    80002344:	e28d8d93          	addi	s11,s11,-472 # 80004168 <digits>
    80002348:	00f7f693          	andi	a3,a5,15
    8000234c:	00dd86b3          	add	a3,s11,a3
    80002350:	0006c583          	lbu	a1,0(a3)
    80002354:	ff100613          	li	a2,-15
    80002358:	0047d69b          	srliw	a3,a5,0x4
    8000235c:	f8b40023          	sb	a1,-128(s0)
    80002360:	0047d59b          	srliw	a1,a5,0x4
    80002364:	0ac75e63          	bge	a4,a2,80002420 <__printf+0x668>
    80002368:	00f6f693          	andi	a3,a3,15
    8000236c:	00dd86b3          	add	a3,s11,a3
    80002370:	0006c603          	lbu	a2,0(a3)
    80002374:	00f00693          	li	a3,15
    80002378:	0087d79b          	srliw	a5,a5,0x8
    8000237c:	f8c400a3          	sb	a2,-127(s0)
    80002380:	d8b6e4e3          	bltu	a3,a1,80002108 <__printf+0x350>
    80002384:	00200793          	li	a5,2
    80002388:	e2dff06f          	j	800021b4 <__printf+0x3fc>
    8000238c:	00002c97          	auipc	s9,0x2
    80002390:	dbcc8c93          	addi	s9,s9,-580 # 80004148 <console_handler+0xef8>
    80002394:	02800513          	li	a0,40
    80002398:	ef1ff06f          	j	80002288 <__printf+0x4d0>
    8000239c:	00700793          	li	a5,7
    800023a0:	00600c93          	li	s9,6
    800023a4:	e0dff06f          	j	800021b0 <__printf+0x3f8>
    800023a8:	00700793          	li	a5,7
    800023ac:	00600c93          	li	s9,6
    800023b0:	c69ff06f          	j	80002018 <__printf+0x260>
    800023b4:	00300793          	li	a5,3
    800023b8:	00200c93          	li	s9,2
    800023bc:	c5dff06f          	j	80002018 <__printf+0x260>
    800023c0:	00300793          	li	a5,3
    800023c4:	00200c93          	li	s9,2
    800023c8:	de9ff06f          	j	800021b0 <__printf+0x3f8>
    800023cc:	00400793          	li	a5,4
    800023d0:	00300c93          	li	s9,3
    800023d4:	dddff06f          	j	800021b0 <__printf+0x3f8>
    800023d8:	00400793          	li	a5,4
    800023dc:	00300c93          	li	s9,3
    800023e0:	c39ff06f          	j	80002018 <__printf+0x260>
    800023e4:	00500793          	li	a5,5
    800023e8:	00400c93          	li	s9,4
    800023ec:	c2dff06f          	j	80002018 <__printf+0x260>
    800023f0:	00500793          	li	a5,5
    800023f4:	00400c93          	li	s9,4
    800023f8:	db9ff06f          	j	800021b0 <__printf+0x3f8>
    800023fc:	00600793          	li	a5,6
    80002400:	00500c93          	li	s9,5
    80002404:	dadff06f          	j	800021b0 <__printf+0x3f8>
    80002408:	00600793          	li	a5,6
    8000240c:	00500c93          	li	s9,5
    80002410:	c09ff06f          	j	80002018 <__printf+0x260>
    80002414:	00800793          	li	a5,8
    80002418:	00700c93          	li	s9,7
    8000241c:	bfdff06f          	j	80002018 <__printf+0x260>
    80002420:	00100793          	li	a5,1
    80002424:	d91ff06f          	j	800021b4 <__printf+0x3fc>
    80002428:	00100793          	li	a5,1
    8000242c:	bf1ff06f          	j	8000201c <__printf+0x264>
    80002430:	00900793          	li	a5,9
    80002434:	00800c93          	li	s9,8
    80002438:	be1ff06f          	j	80002018 <__printf+0x260>
    8000243c:	00002517          	auipc	a0,0x2
    80002440:	d1450513          	addi	a0,a0,-748 # 80004150 <console_handler+0xf00>
    80002444:	00000097          	auipc	ra,0x0
    80002448:	918080e7          	jalr	-1768(ra) # 80001d5c <panic>

000000008000244c <printfinit>:
    8000244c:	fe010113          	addi	sp,sp,-32
    80002450:	00813823          	sd	s0,16(sp)
    80002454:	00913423          	sd	s1,8(sp)
    80002458:	00113c23          	sd	ra,24(sp)
    8000245c:	02010413          	addi	s0,sp,32
    80002460:	00003497          	auipc	s1,0x3
    80002464:	09048493          	addi	s1,s1,144 # 800054f0 <pr>
    80002468:	00048513          	mv	a0,s1
    8000246c:	00002597          	auipc	a1,0x2
    80002470:	cf458593          	addi	a1,a1,-780 # 80004160 <console_handler+0xf10>
    80002474:	00000097          	auipc	ra,0x0
    80002478:	5f4080e7          	jalr	1524(ra) # 80002a68 <initlock>
    8000247c:	01813083          	ld	ra,24(sp)
    80002480:	01013403          	ld	s0,16(sp)
    80002484:	0004ac23          	sw	zero,24(s1)
    80002488:	00813483          	ld	s1,8(sp)
    8000248c:	02010113          	addi	sp,sp,32
    80002490:	00008067          	ret

0000000080002494 <uartinit>:
    80002494:	ff010113          	addi	sp,sp,-16
    80002498:	00813423          	sd	s0,8(sp)
    8000249c:	01010413          	addi	s0,sp,16
    800024a0:	100007b7          	lui	a5,0x10000
    800024a4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800024a8:	f8000713          	li	a4,-128
    800024ac:	00e781a3          	sb	a4,3(a5)
    800024b0:	00300713          	li	a4,3
    800024b4:	00e78023          	sb	a4,0(a5)
    800024b8:	000780a3          	sb	zero,1(a5)
    800024bc:	00e781a3          	sb	a4,3(a5)
    800024c0:	00700693          	li	a3,7
    800024c4:	00d78123          	sb	a3,2(a5)
    800024c8:	00e780a3          	sb	a4,1(a5)
    800024cc:	00813403          	ld	s0,8(sp)
    800024d0:	01010113          	addi	sp,sp,16
    800024d4:	00008067          	ret

00000000800024d8 <uartputc>:
    800024d8:	00002797          	auipc	a5,0x2
    800024dc:	dd07a783          	lw	a5,-560(a5) # 800042a8 <panicked>
    800024e0:	00078463          	beqz	a5,800024e8 <uartputc+0x10>
    800024e4:	0000006f          	j	800024e4 <uartputc+0xc>
    800024e8:	fd010113          	addi	sp,sp,-48
    800024ec:	02813023          	sd	s0,32(sp)
    800024f0:	00913c23          	sd	s1,24(sp)
    800024f4:	01213823          	sd	s2,16(sp)
    800024f8:	01313423          	sd	s3,8(sp)
    800024fc:	02113423          	sd	ra,40(sp)
    80002500:	03010413          	addi	s0,sp,48
    80002504:	00002917          	auipc	s2,0x2
    80002508:	dac90913          	addi	s2,s2,-596 # 800042b0 <uart_tx_r>
    8000250c:	00093783          	ld	a5,0(s2)
    80002510:	00002497          	auipc	s1,0x2
    80002514:	da848493          	addi	s1,s1,-600 # 800042b8 <uart_tx_w>
    80002518:	0004b703          	ld	a4,0(s1)
    8000251c:	02078693          	addi	a3,a5,32
    80002520:	00050993          	mv	s3,a0
    80002524:	02e69c63          	bne	a3,a4,8000255c <uartputc+0x84>
    80002528:	00001097          	auipc	ra,0x1
    8000252c:	834080e7          	jalr	-1996(ra) # 80002d5c <push_on>
    80002530:	00093783          	ld	a5,0(s2)
    80002534:	0004b703          	ld	a4,0(s1)
    80002538:	02078793          	addi	a5,a5,32
    8000253c:	00e79463          	bne	a5,a4,80002544 <uartputc+0x6c>
    80002540:	0000006f          	j	80002540 <uartputc+0x68>
    80002544:	00001097          	auipc	ra,0x1
    80002548:	88c080e7          	jalr	-1908(ra) # 80002dd0 <pop_on>
    8000254c:	00093783          	ld	a5,0(s2)
    80002550:	0004b703          	ld	a4,0(s1)
    80002554:	02078693          	addi	a3,a5,32
    80002558:	fce688e3          	beq	a3,a4,80002528 <uartputc+0x50>
    8000255c:	01f77693          	andi	a3,a4,31
    80002560:	00003597          	auipc	a1,0x3
    80002564:	fb058593          	addi	a1,a1,-80 # 80005510 <uart_tx_buf>
    80002568:	00d586b3          	add	a3,a1,a3
    8000256c:	00170713          	addi	a4,a4,1
    80002570:	01368023          	sb	s3,0(a3)
    80002574:	00e4b023          	sd	a4,0(s1)
    80002578:	10000637          	lui	a2,0x10000
    8000257c:	02f71063          	bne	a4,a5,8000259c <uartputc+0xc4>
    80002580:	0340006f          	j	800025b4 <uartputc+0xdc>
    80002584:	00074703          	lbu	a4,0(a4)
    80002588:	00f93023          	sd	a5,0(s2)
    8000258c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002590:	00093783          	ld	a5,0(s2)
    80002594:	0004b703          	ld	a4,0(s1)
    80002598:	00f70e63          	beq	a4,a5,800025b4 <uartputc+0xdc>
    8000259c:	00564683          	lbu	a3,5(a2)
    800025a0:	01f7f713          	andi	a4,a5,31
    800025a4:	00e58733          	add	a4,a1,a4
    800025a8:	0206f693          	andi	a3,a3,32
    800025ac:	00178793          	addi	a5,a5,1
    800025b0:	fc069ae3          	bnez	a3,80002584 <uartputc+0xac>
    800025b4:	02813083          	ld	ra,40(sp)
    800025b8:	02013403          	ld	s0,32(sp)
    800025bc:	01813483          	ld	s1,24(sp)
    800025c0:	01013903          	ld	s2,16(sp)
    800025c4:	00813983          	ld	s3,8(sp)
    800025c8:	03010113          	addi	sp,sp,48
    800025cc:	00008067          	ret

00000000800025d0 <uartputc_sync>:
    800025d0:	ff010113          	addi	sp,sp,-16
    800025d4:	00813423          	sd	s0,8(sp)
    800025d8:	01010413          	addi	s0,sp,16
    800025dc:	00002717          	auipc	a4,0x2
    800025e0:	ccc72703          	lw	a4,-820(a4) # 800042a8 <panicked>
    800025e4:	02071663          	bnez	a4,80002610 <uartputc_sync+0x40>
    800025e8:	00050793          	mv	a5,a0
    800025ec:	100006b7          	lui	a3,0x10000
    800025f0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800025f4:	02077713          	andi	a4,a4,32
    800025f8:	fe070ce3          	beqz	a4,800025f0 <uartputc_sync+0x20>
    800025fc:	0ff7f793          	andi	a5,a5,255
    80002600:	00f68023          	sb	a5,0(a3)
    80002604:	00813403          	ld	s0,8(sp)
    80002608:	01010113          	addi	sp,sp,16
    8000260c:	00008067          	ret
    80002610:	0000006f          	j	80002610 <uartputc_sync+0x40>

0000000080002614 <uartstart>:
    80002614:	ff010113          	addi	sp,sp,-16
    80002618:	00813423          	sd	s0,8(sp)
    8000261c:	01010413          	addi	s0,sp,16
    80002620:	00002617          	auipc	a2,0x2
    80002624:	c9060613          	addi	a2,a2,-880 # 800042b0 <uart_tx_r>
    80002628:	00002517          	auipc	a0,0x2
    8000262c:	c9050513          	addi	a0,a0,-880 # 800042b8 <uart_tx_w>
    80002630:	00063783          	ld	a5,0(a2)
    80002634:	00053703          	ld	a4,0(a0)
    80002638:	04f70263          	beq	a4,a5,8000267c <uartstart+0x68>
    8000263c:	100005b7          	lui	a1,0x10000
    80002640:	00003817          	auipc	a6,0x3
    80002644:	ed080813          	addi	a6,a6,-304 # 80005510 <uart_tx_buf>
    80002648:	01c0006f          	j	80002664 <uartstart+0x50>
    8000264c:	0006c703          	lbu	a4,0(a3)
    80002650:	00f63023          	sd	a5,0(a2)
    80002654:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002658:	00063783          	ld	a5,0(a2)
    8000265c:	00053703          	ld	a4,0(a0)
    80002660:	00f70e63          	beq	a4,a5,8000267c <uartstart+0x68>
    80002664:	01f7f713          	andi	a4,a5,31
    80002668:	00e806b3          	add	a3,a6,a4
    8000266c:	0055c703          	lbu	a4,5(a1)
    80002670:	00178793          	addi	a5,a5,1
    80002674:	02077713          	andi	a4,a4,32
    80002678:	fc071ae3          	bnez	a4,8000264c <uartstart+0x38>
    8000267c:	00813403          	ld	s0,8(sp)
    80002680:	01010113          	addi	sp,sp,16
    80002684:	00008067          	ret

0000000080002688 <uartgetc>:
    80002688:	ff010113          	addi	sp,sp,-16
    8000268c:	00813423          	sd	s0,8(sp)
    80002690:	01010413          	addi	s0,sp,16
    80002694:	10000737          	lui	a4,0x10000
    80002698:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000269c:	0017f793          	andi	a5,a5,1
    800026a0:	00078c63          	beqz	a5,800026b8 <uartgetc+0x30>
    800026a4:	00074503          	lbu	a0,0(a4)
    800026a8:	0ff57513          	andi	a0,a0,255
    800026ac:	00813403          	ld	s0,8(sp)
    800026b0:	01010113          	addi	sp,sp,16
    800026b4:	00008067          	ret
    800026b8:	fff00513          	li	a0,-1
    800026bc:	ff1ff06f          	j	800026ac <uartgetc+0x24>

00000000800026c0 <uartintr>:
    800026c0:	100007b7          	lui	a5,0x10000
    800026c4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800026c8:	0017f793          	andi	a5,a5,1
    800026cc:	0a078463          	beqz	a5,80002774 <uartintr+0xb4>
    800026d0:	fe010113          	addi	sp,sp,-32
    800026d4:	00813823          	sd	s0,16(sp)
    800026d8:	00913423          	sd	s1,8(sp)
    800026dc:	00113c23          	sd	ra,24(sp)
    800026e0:	02010413          	addi	s0,sp,32
    800026e4:	100004b7          	lui	s1,0x10000
    800026e8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800026ec:	0ff57513          	andi	a0,a0,255
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	534080e7          	jalr	1332(ra) # 80001c24 <consoleintr>
    800026f8:	0054c783          	lbu	a5,5(s1)
    800026fc:	0017f793          	andi	a5,a5,1
    80002700:	fe0794e3          	bnez	a5,800026e8 <uartintr+0x28>
    80002704:	00002617          	auipc	a2,0x2
    80002708:	bac60613          	addi	a2,a2,-1108 # 800042b0 <uart_tx_r>
    8000270c:	00002517          	auipc	a0,0x2
    80002710:	bac50513          	addi	a0,a0,-1108 # 800042b8 <uart_tx_w>
    80002714:	00063783          	ld	a5,0(a2)
    80002718:	00053703          	ld	a4,0(a0)
    8000271c:	04f70263          	beq	a4,a5,80002760 <uartintr+0xa0>
    80002720:	100005b7          	lui	a1,0x10000
    80002724:	00003817          	auipc	a6,0x3
    80002728:	dec80813          	addi	a6,a6,-532 # 80005510 <uart_tx_buf>
    8000272c:	01c0006f          	j	80002748 <uartintr+0x88>
    80002730:	0006c703          	lbu	a4,0(a3)
    80002734:	00f63023          	sd	a5,0(a2)
    80002738:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000273c:	00063783          	ld	a5,0(a2)
    80002740:	00053703          	ld	a4,0(a0)
    80002744:	00f70e63          	beq	a4,a5,80002760 <uartintr+0xa0>
    80002748:	01f7f713          	andi	a4,a5,31
    8000274c:	00e806b3          	add	a3,a6,a4
    80002750:	0055c703          	lbu	a4,5(a1)
    80002754:	00178793          	addi	a5,a5,1
    80002758:	02077713          	andi	a4,a4,32
    8000275c:	fc071ae3          	bnez	a4,80002730 <uartintr+0x70>
    80002760:	01813083          	ld	ra,24(sp)
    80002764:	01013403          	ld	s0,16(sp)
    80002768:	00813483          	ld	s1,8(sp)
    8000276c:	02010113          	addi	sp,sp,32
    80002770:	00008067          	ret
    80002774:	00002617          	auipc	a2,0x2
    80002778:	b3c60613          	addi	a2,a2,-1220 # 800042b0 <uart_tx_r>
    8000277c:	00002517          	auipc	a0,0x2
    80002780:	b3c50513          	addi	a0,a0,-1220 # 800042b8 <uart_tx_w>
    80002784:	00063783          	ld	a5,0(a2)
    80002788:	00053703          	ld	a4,0(a0)
    8000278c:	04f70263          	beq	a4,a5,800027d0 <uartintr+0x110>
    80002790:	100005b7          	lui	a1,0x10000
    80002794:	00003817          	auipc	a6,0x3
    80002798:	d7c80813          	addi	a6,a6,-644 # 80005510 <uart_tx_buf>
    8000279c:	01c0006f          	j	800027b8 <uartintr+0xf8>
    800027a0:	0006c703          	lbu	a4,0(a3)
    800027a4:	00f63023          	sd	a5,0(a2)
    800027a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800027ac:	00063783          	ld	a5,0(a2)
    800027b0:	00053703          	ld	a4,0(a0)
    800027b4:	02f70063          	beq	a4,a5,800027d4 <uartintr+0x114>
    800027b8:	01f7f713          	andi	a4,a5,31
    800027bc:	00e806b3          	add	a3,a6,a4
    800027c0:	0055c703          	lbu	a4,5(a1)
    800027c4:	00178793          	addi	a5,a5,1
    800027c8:	02077713          	andi	a4,a4,32
    800027cc:	fc071ae3          	bnez	a4,800027a0 <uartintr+0xe0>
    800027d0:	00008067          	ret
    800027d4:	00008067          	ret

00000000800027d8 <kinit>:
    800027d8:	fc010113          	addi	sp,sp,-64
    800027dc:	02913423          	sd	s1,40(sp)
    800027e0:	fffff7b7          	lui	a5,0xfffff
    800027e4:	00004497          	auipc	s1,0x4
    800027e8:	d4b48493          	addi	s1,s1,-693 # 8000652f <end+0xfff>
    800027ec:	02813823          	sd	s0,48(sp)
    800027f0:	01313c23          	sd	s3,24(sp)
    800027f4:	00f4f4b3          	and	s1,s1,a5
    800027f8:	02113c23          	sd	ra,56(sp)
    800027fc:	03213023          	sd	s2,32(sp)
    80002800:	01413823          	sd	s4,16(sp)
    80002804:	01513423          	sd	s5,8(sp)
    80002808:	04010413          	addi	s0,sp,64
    8000280c:	000017b7          	lui	a5,0x1
    80002810:	01100993          	li	s3,17
    80002814:	00f487b3          	add	a5,s1,a5
    80002818:	01b99993          	slli	s3,s3,0x1b
    8000281c:	06f9e063          	bltu	s3,a5,8000287c <kinit+0xa4>
    80002820:	00003a97          	auipc	s5,0x3
    80002824:	d10a8a93          	addi	s5,s5,-752 # 80005530 <end>
    80002828:	0754ec63          	bltu	s1,s5,800028a0 <kinit+0xc8>
    8000282c:	0734fa63          	bgeu	s1,s3,800028a0 <kinit+0xc8>
    80002830:	00088a37          	lui	s4,0x88
    80002834:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002838:	00002917          	auipc	s2,0x2
    8000283c:	a8890913          	addi	s2,s2,-1400 # 800042c0 <kmem>
    80002840:	00ca1a13          	slli	s4,s4,0xc
    80002844:	0140006f          	j	80002858 <kinit+0x80>
    80002848:	000017b7          	lui	a5,0x1
    8000284c:	00f484b3          	add	s1,s1,a5
    80002850:	0554e863          	bltu	s1,s5,800028a0 <kinit+0xc8>
    80002854:	0534f663          	bgeu	s1,s3,800028a0 <kinit+0xc8>
    80002858:	00001637          	lui	a2,0x1
    8000285c:	00100593          	li	a1,1
    80002860:	00048513          	mv	a0,s1
    80002864:	00000097          	auipc	ra,0x0
    80002868:	5e4080e7          	jalr	1508(ra) # 80002e48 <__memset>
    8000286c:	00093783          	ld	a5,0(s2)
    80002870:	00f4b023          	sd	a5,0(s1)
    80002874:	00993023          	sd	s1,0(s2)
    80002878:	fd4498e3          	bne	s1,s4,80002848 <kinit+0x70>
    8000287c:	03813083          	ld	ra,56(sp)
    80002880:	03013403          	ld	s0,48(sp)
    80002884:	02813483          	ld	s1,40(sp)
    80002888:	02013903          	ld	s2,32(sp)
    8000288c:	01813983          	ld	s3,24(sp)
    80002890:	01013a03          	ld	s4,16(sp)
    80002894:	00813a83          	ld	s5,8(sp)
    80002898:	04010113          	addi	sp,sp,64
    8000289c:	00008067          	ret
    800028a0:	00002517          	auipc	a0,0x2
    800028a4:	8e050513          	addi	a0,a0,-1824 # 80004180 <digits+0x18>
    800028a8:	fffff097          	auipc	ra,0xfffff
    800028ac:	4b4080e7          	jalr	1204(ra) # 80001d5c <panic>

00000000800028b0 <freerange>:
    800028b0:	fc010113          	addi	sp,sp,-64
    800028b4:	000017b7          	lui	a5,0x1
    800028b8:	02913423          	sd	s1,40(sp)
    800028bc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800028c0:	009504b3          	add	s1,a0,s1
    800028c4:	fffff537          	lui	a0,0xfffff
    800028c8:	02813823          	sd	s0,48(sp)
    800028cc:	02113c23          	sd	ra,56(sp)
    800028d0:	03213023          	sd	s2,32(sp)
    800028d4:	01313c23          	sd	s3,24(sp)
    800028d8:	01413823          	sd	s4,16(sp)
    800028dc:	01513423          	sd	s5,8(sp)
    800028e0:	01613023          	sd	s6,0(sp)
    800028e4:	04010413          	addi	s0,sp,64
    800028e8:	00a4f4b3          	and	s1,s1,a0
    800028ec:	00f487b3          	add	a5,s1,a5
    800028f0:	06f5e463          	bltu	a1,a5,80002958 <freerange+0xa8>
    800028f4:	00003a97          	auipc	s5,0x3
    800028f8:	c3ca8a93          	addi	s5,s5,-964 # 80005530 <end>
    800028fc:	0954e263          	bltu	s1,s5,80002980 <freerange+0xd0>
    80002900:	01100993          	li	s3,17
    80002904:	01b99993          	slli	s3,s3,0x1b
    80002908:	0734fc63          	bgeu	s1,s3,80002980 <freerange+0xd0>
    8000290c:	00058a13          	mv	s4,a1
    80002910:	00002917          	auipc	s2,0x2
    80002914:	9b090913          	addi	s2,s2,-1616 # 800042c0 <kmem>
    80002918:	00002b37          	lui	s6,0x2
    8000291c:	0140006f          	j	80002930 <freerange+0x80>
    80002920:	000017b7          	lui	a5,0x1
    80002924:	00f484b3          	add	s1,s1,a5
    80002928:	0554ec63          	bltu	s1,s5,80002980 <freerange+0xd0>
    8000292c:	0534fa63          	bgeu	s1,s3,80002980 <freerange+0xd0>
    80002930:	00001637          	lui	a2,0x1
    80002934:	00100593          	li	a1,1
    80002938:	00048513          	mv	a0,s1
    8000293c:	00000097          	auipc	ra,0x0
    80002940:	50c080e7          	jalr	1292(ra) # 80002e48 <__memset>
    80002944:	00093703          	ld	a4,0(s2)
    80002948:	016487b3          	add	a5,s1,s6
    8000294c:	00e4b023          	sd	a4,0(s1)
    80002950:	00993023          	sd	s1,0(s2)
    80002954:	fcfa76e3          	bgeu	s4,a5,80002920 <freerange+0x70>
    80002958:	03813083          	ld	ra,56(sp)
    8000295c:	03013403          	ld	s0,48(sp)
    80002960:	02813483          	ld	s1,40(sp)
    80002964:	02013903          	ld	s2,32(sp)
    80002968:	01813983          	ld	s3,24(sp)
    8000296c:	01013a03          	ld	s4,16(sp)
    80002970:	00813a83          	ld	s5,8(sp)
    80002974:	00013b03          	ld	s6,0(sp)
    80002978:	04010113          	addi	sp,sp,64
    8000297c:	00008067          	ret
    80002980:	00002517          	auipc	a0,0x2
    80002984:	80050513          	addi	a0,a0,-2048 # 80004180 <digits+0x18>
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	3d4080e7          	jalr	980(ra) # 80001d5c <panic>

0000000080002990 <kfree>:
    80002990:	fe010113          	addi	sp,sp,-32
    80002994:	00813823          	sd	s0,16(sp)
    80002998:	00113c23          	sd	ra,24(sp)
    8000299c:	00913423          	sd	s1,8(sp)
    800029a0:	02010413          	addi	s0,sp,32
    800029a4:	03451793          	slli	a5,a0,0x34
    800029a8:	04079c63          	bnez	a5,80002a00 <kfree+0x70>
    800029ac:	00003797          	auipc	a5,0x3
    800029b0:	b8478793          	addi	a5,a5,-1148 # 80005530 <end>
    800029b4:	00050493          	mv	s1,a0
    800029b8:	04f56463          	bltu	a0,a5,80002a00 <kfree+0x70>
    800029bc:	01100793          	li	a5,17
    800029c0:	01b79793          	slli	a5,a5,0x1b
    800029c4:	02f57e63          	bgeu	a0,a5,80002a00 <kfree+0x70>
    800029c8:	00001637          	lui	a2,0x1
    800029cc:	00100593          	li	a1,1
    800029d0:	00000097          	auipc	ra,0x0
    800029d4:	478080e7          	jalr	1144(ra) # 80002e48 <__memset>
    800029d8:	00002797          	auipc	a5,0x2
    800029dc:	8e878793          	addi	a5,a5,-1816 # 800042c0 <kmem>
    800029e0:	0007b703          	ld	a4,0(a5)
    800029e4:	01813083          	ld	ra,24(sp)
    800029e8:	01013403          	ld	s0,16(sp)
    800029ec:	00e4b023          	sd	a4,0(s1)
    800029f0:	0097b023          	sd	s1,0(a5)
    800029f4:	00813483          	ld	s1,8(sp)
    800029f8:	02010113          	addi	sp,sp,32
    800029fc:	00008067          	ret
    80002a00:	00001517          	auipc	a0,0x1
    80002a04:	78050513          	addi	a0,a0,1920 # 80004180 <digits+0x18>
    80002a08:	fffff097          	auipc	ra,0xfffff
    80002a0c:	354080e7          	jalr	852(ra) # 80001d5c <panic>

0000000080002a10 <kalloc>:
    80002a10:	fe010113          	addi	sp,sp,-32
    80002a14:	00813823          	sd	s0,16(sp)
    80002a18:	00913423          	sd	s1,8(sp)
    80002a1c:	00113c23          	sd	ra,24(sp)
    80002a20:	02010413          	addi	s0,sp,32
    80002a24:	00002797          	auipc	a5,0x2
    80002a28:	89c78793          	addi	a5,a5,-1892 # 800042c0 <kmem>
    80002a2c:	0007b483          	ld	s1,0(a5)
    80002a30:	02048063          	beqz	s1,80002a50 <kalloc+0x40>
    80002a34:	0004b703          	ld	a4,0(s1)
    80002a38:	00001637          	lui	a2,0x1
    80002a3c:	00500593          	li	a1,5
    80002a40:	00048513          	mv	a0,s1
    80002a44:	00e7b023          	sd	a4,0(a5)
    80002a48:	00000097          	auipc	ra,0x0
    80002a4c:	400080e7          	jalr	1024(ra) # 80002e48 <__memset>
    80002a50:	01813083          	ld	ra,24(sp)
    80002a54:	01013403          	ld	s0,16(sp)
    80002a58:	00048513          	mv	a0,s1
    80002a5c:	00813483          	ld	s1,8(sp)
    80002a60:	02010113          	addi	sp,sp,32
    80002a64:	00008067          	ret

0000000080002a68 <initlock>:
    80002a68:	ff010113          	addi	sp,sp,-16
    80002a6c:	00813423          	sd	s0,8(sp)
    80002a70:	01010413          	addi	s0,sp,16
    80002a74:	00813403          	ld	s0,8(sp)
    80002a78:	00b53423          	sd	a1,8(a0)
    80002a7c:	00052023          	sw	zero,0(a0)
    80002a80:	00053823          	sd	zero,16(a0)
    80002a84:	01010113          	addi	sp,sp,16
    80002a88:	00008067          	ret

0000000080002a8c <acquire>:
    80002a8c:	fe010113          	addi	sp,sp,-32
    80002a90:	00813823          	sd	s0,16(sp)
    80002a94:	00913423          	sd	s1,8(sp)
    80002a98:	00113c23          	sd	ra,24(sp)
    80002a9c:	01213023          	sd	s2,0(sp)
    80002aa0:	02010413          	addi	s0,sp,32
    80002aa4:	00050493          	mv	s1,a0
    80002aa8:	10002973          	csrr	s2,sstatus
    80002aac:	100027f3          	csrr	a5,sstatus
    80002ab0:	ffd7f793          	andi	a5,a5,-3
    80002ab4:	10079073          	csrw	sstatus,a5
    80002ab8:	fffff097          	auipc	ra,0xfffff
    80002abc:	8e4080e7          	jalr	-1820(ra) # 8000139c <mycpu>
    80002ac0:	07852783          	lw	a5,120(a0)
    80002ac4:	06078e63          	beqz	a5,80002b40 <acquire+0xb4>
    80002ac8:	fffff097          	auipc	ra,0xfffff
    80002acc:	8d4080e7          	jalr	-1836(ra) # 8000139c <mycpu>
    80002ad0:	07852783          	lw	a5,120(a0)
    80002ad4:	0004a703          	lw	a4,0(s1)
    80002ad8:	0017879b          	addiw	a5,a5,1
    80002adc:	06f52c23          	sw	a5,120(a0)
    80002ae0:	04071063          	bnez	a4,80002b20 <acquire+0x94>
    80002ae4:	00100713          	li	a4,1
    80002ae8:	00070793          	mv	a5,a4
    80002aec:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80002af0:	0007879b          	sext.w	a5,a5
    80002af4:	fe079ae3          	bnez	a5,80002ae8 <acquire+0x5c>
    80002af8:	0ff0000f          	fence
    80002afc:	fffff097          	auipc	ra,0xfffff
    80002b00:	8a0080e7          	jalr	-1888(ra) # 8000139c <mycpu>
    80002b04:	01813083          	ld	ra,24(sp)
    80002b08:	01013403          	ld	s0,16(sp)
    80002b0c:	00a4b823          	sd	a0,16(s1)
    80002b10:	00013903          	ld	s2,0(sp)
    80002b14:	00813483          	ld	s1,8(sp)
    80002b18:	02010113          	addi	sp,sp,32
    80002b1c:	00008067          	ret
    80002b20:	0104b903          	ld	s2,16(s1)
    80002b24:	fffff097          	auipc	ra,0xfffff
    80002b28:	878080e7          	jalr	-1928(ra) # 8000139c <mycpu>
    80002b2c:	faa91ce3          	bne	s2,a0,80002ae4 <acquire+0x58>
    80002b30:	00001517          	auipc	a0,0x1
    80002b34:	65850513          	addi	a0,a0,1624 # 80004188 <digits+0x20>
    80002b38:	fffff097          	auipc	ra,0xfffff
    80002b3c:	224080e7          	jalr	548(ra) # 80001d5c <panic>
    80002b40:	00195913          	srli	s2,s2,0x1
    80002b44:	fffff097          	auipc	ra,0xfffff
    80002b48:	858080e7          	jalr	-1960(ra) # 8000139c <mycpu>
    80002b4c:	00197913          	andi	s2,s2,1
    80002b50:	07252e23          	sw	s2,124(a0)
    80002b54:	f75ff06f          	j	80002ac8 <acquire+0x3c>

0000000080002b58 <release>:
    80002b58:	fe010113          	addi	sp,sp,-32
    80002b5c:	00813823          	sd	s0,16(sp)
    80002b60:	00113c23          	sd	ra,24(sp)
    80002b64:	00913423          	sd	s1,8(sp)
    80002b68:	01213023          	sd	s2,0(sp)
    80002b6c:	02010413          	addi	s0,sp,32
    80002b70:	00052783          	lw	a5,0(a0)
    80002b74:	00079a63          	bnez	a5,80002b88 <release+0x30>
    80002b78:	00001517          	auipc	a0,0x1
    80002b7c:	61850513          	addi	a0,a0,1560 # 80004190 <digits+0x28>
    80002b80:	fffff097          	auipc	ra,0xfffff
    80002b84:	1dc080e7          	jalr	476(ra) # 80001d5c <panic>
    80002b88:	01053903          	ld	s2,16(a0)
    80002b8c:	00050493          	mv	s1,a0
    80002b90:	fffff097          	auipc	ra,0xfffff
    80002b94:	80c080e7          	jalr	-2036(ra) # 8000139c <mycpu>
    80002b98:	fea910e3          	bne	s2,a0,80002b78 <release+0x20>
    80002b9c:	0004b823          	sd	zero,16(s1)
    80002ba0:	0ff0000f          	fence
    80002ba4:	0f50000f          	fence	iorw,ow
    80002ba8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002bac:	ffffe097          	auipc	ra,0xffffe
    80002bb0:	7f0080e7          	jalr	2032(ra) # 8000139c <mycpu>
    80002bb4:	100027f3          	csrr	a5,sstatus
    80002bb8:	0027f793          	andi	a5,a5,2
    80002bbc:	04079a63          	bnez	a5,80002c10 <release+0xb8>
    80002bc0:	07852783          	lw	a5,120(a0)
    80002bc4:	02f05e63          	blez	a5,80002c00 <release+0xa8>
    80002bc8:	fff7871b          	addiw	a4,a5,-1
    80002bcc:	06e52c23          	sw	a4,120(a0)
    80002bd0:	00071c63          	bnez	a4,80002be8 <release+0x90>
    80002bd4:	07c52783          	lw	a5,124(a0)
    80002bd8:	00078863          	beqz	a5,80002be8 <release+0x90>
    80002bdc:	100027f3          	csrr	a5,sstatus
    80002be0:	0027e793          	ori	a5,a5,2
    80002be4:	10079073          	csrw	sstatus,a5
    80002be8:	01813083          	ld	ra,24(sp)
    80002bec:	01013403          	ld	s0,16(sp)
    80002bf0:	00813483          	ld	s1,8(sp)
    80002bf4:	00013903          	ld	s2,0(sp)
    80002bf8:	02010113          	addi	sp,sp,32
    80002bfc:	00008067          	ret
    80002c00:	00001517          	auipc	a0,0x1
    80002c04:	5b050513          	addi	a0,a0,1456 # 800041b0 <digits+0x48>
    80002c08:	fffff097          	auipc	ra,0xfffff
    80002c0c:	154080e7          	jalr	340(ra) # 80001d5c <panic>
    80002c10:	00001517          	auipc	a0,0x1
    80002c14:	58850513          	addi	a0,a0,1416 # 80004198 <digits+0x30>
    80002c18:	fffff097          	auipc	ra,0xfffff
    80002c1c:	144080e7          	jalr	324(ra) # 80001d5c <panic>

0000000080002c20 <holding>:
    80002c20:	00052783          	lw	a5,0(a0)
    80002c24:	00079663          	bnez	a5,80002c30 <holding+0x10>
    80002c28:	00000513          	li	a0,0
    80002c2c:	00008067          	ret
    80002c30:	fe010113          	addi	sp,sp,-32
    80002c34:	00813823          	sd	s0,16(sp)
    80002c38:	00913423          	sd	s1,8(sp)
    80002c3c:	00113c23          	sd	ra,24(sp)
    80002c40:	02010413          	addi	s0,sp,32
    80002c44:	01053483          	ld	s1,16(a0)
    80002c48:	ffffe097          	auipc	ra,0xffffe
    80002c4c:	754080e7          	jalr	1876(ra) # 8000139c <mycpu>
    80002c50:	01813083          	ld	ra,24(sp)
    80002c54:	01013403          	ld	s0,16(sp)
    80002c58:	40a48533          	sub	a0,s1,a0
    80002c5c:	00153513          	seqz	a0,a0
    80002c60:	00813483          	ld	s1,8(sp)
    80002c64:	02010113          	addi	sp,sp,32
    80002c68:	00008067          	ret

0000000080002c6c <push_off>:
    80002c6c:	fe010113          	addi	sp,sp,-32
    80002c70:	00813823          	sd	s0,16(sp)
    80002c74:	00113c23          	sd	ra,24(sp)
    80002c78:	00913423          	sd	s1,8(sp)
    80002c7c:	02010413          	addi	s0,sp,32
    80002c80:	100024f3          	csrr	s1,sstatus
    80002c84:	100027f3          	csrr	a5,sstatus
    80002c88:	ffd7f793          	andi	a5,a5,-3
    80002c8c:	10079073          	csrw	sstatus,a5
    80002c90:	ffffe097          	auipc	ra,0xffffe
    80002c94:	70c080e7          	jalr	1804(ra) # 8000139c <mycpu>
    80002c98:	07852783          	lw	a5,120(a0)
    80002c9c:	02078663          	beqz	a5,80002cc8 <push_off+0x5c>
    80002ca0:	ffffe097          	auipc	ra,0xffffe
    80002ca4:	6fc080e7          	jalr	1788(ra) # 8000139c <mycpu>
    80002ca8:	07852783          	lw	a5,120(a0)
    80002cac:	01813083          	ld	ra,24(sp)
    80002cb0:	01013403          	ld	s0,16(sp)
    80002cb4:	0017879b          	addiw	a5,a5,1
    80002cb8:	06f52c23          	sw	a5,120(a0)
    80002cbc:	00813483          	ld	s1,8(sp)
    80002cc0:	02010113          	addi	sp,sp,32
    80002cc4:	00008067          	ret
    80002cc8:	0014d493          	srli	s1,s1,0x1
    80002ccc:	ffffe097          	auipc	ra,0xffffe
    80002cd0:	6d0080e7          	jalr	1744(ra) # 8000139c <mycpu>
    80002cd4:	0014f493          	andi	s1,s1,1
    80002cd8:	06952e23          	sw	s1,124(a0)
    80002cdc:	fc5ff06f          	j	80002ca0 <push_off+0x34>

0000000080002ce0 <pop_off>:
    80002ce0:	ff010113          	addi	sp,sp,-16
    80002ce4:	00813023          	sd	s0,0(sp)
    80002ce8:	00113423          	sd	ra,8(sp)
    80002cec:	01010413          	addi	s0,sp,16
    80002cf0:	ffffe097          	auipc	ra,0xffffe
    80002cf4:	6ac080e7          	jalr	1708(ra) # 8000139c <mycpu>
    80002cf8:	100027f3          	csrr	a5,sstatus
    80002cfc:	0027f793          	andi	a5,a5,2
    80002d00:	04079663          	bnez	a5,80002d4c <pop_off+0x6c>
    80002d04:	07852783          	lw	a5,120(a0)
    80002d08:	02f05a63          	blez	a5,80002d3c <pop_off+0x5c>
    80002d0c:	fff7871b          	addiw	a4,a5,-1
    80002d10:	06e52c23          	sw	a4,120(a0)
    80002d14:	00071c63          	bnez	a4,80002d2c <pop_off+0x4c>
    80002d18:	07c52783          	lw	a5,124(a0)
    80002d1c:	00078863          	beqz	a5,80002d2c <pop_off+0x4c>
    80002d20:	100027f3          	csrr	a5,sstatus
    80002d24:	0027e793          	ori	a5,a5,2
    80002d28:	10079073          	csrw	sstatus,a5
    80002d2c:	00813083          	ld	ra,8(sp)
    80002d30:	00013403          	ld	s0,0(sp)
    80002d34:	01010113          	addi	sp,sp,16
    80002d38:	00008067          	ret
    80002d3c:	00001517          	auipc	a0,0x1
    80002d40:	47450513          	addi	a0,a0,1140 # 800041b0 <digits+0x48>
    80002d44:	fffff097          	auipc	ra,0xfffff
    80002d48:	018080e7          	jalr	24(ra) # 80001d5c <panic>
    80002d4c:	00001517          	auipc	a0,0x1
    80002d50:	44c50513          	addi	a0,a0,1100 # 80004198 <digits+0x30>
    80002d54:	fffff097          	auipc	ra,0xfffff
    80002d58:	008080e7          	jalr	8(ra) # 80001d5c <panic>

0000000080002d5c <push_on>:
    80002d5c:	fe010113          	addi	sp,sp,-32
    80002d60:	00813823          	sd	s0,16(sp)
    80002d64:	00113c23          	sd	ra,24(sp)
    80002d68:	00913423          	sd	s1,8(sp)
    80002d6c:	02010413          	addi	s0,sp,32
    80002d70:	100024f3          	csrr	s1,sstatus
    80002d74:	100027f3          	csrr	a5,sstatus
    80002d78:	0027e793          	ori	a5,a5,2
    80002d7c:	10079073          	csrw	sstatus,a5
    80002d80:	ffffe097          	auipc	ra,0xffffe
    80002d84:	61c080e7          	jalr	1564(ra) # 8000139c <mycpu>
    80002d88:	07852783          	lw	a5,120(a0)
    80002d8c:	02078663          	beqz	a5,80002db8 <push_on+0x5c>
    80002d90:	ffffe097          	auipc	ra,0xffffe
    80002d94:	60c080e7          	jalr	1548(ra) # 8000139c <mycpu>
    80002d98:	07852783          	lw	a5,120(a0)
    80002d9c:	01813083          	ld	ra,24(sp)
    80002da0:	01013403          	ld	s0,16(sp)
    80002da4:	0017879b          	addiw	a5,a5,1
    80002da8:	06f52c23          	sw	a5,120(a0)
    80002dac:	00813483          	ld	s1,8(sp)
    80002db0:	02010113          	addi	sp,sp,32
    80002db4:	00008067          	ret
    80002db8:	0014d493          	srli	s1,s1,0x1
    80002dbc:	ffffe097          	auipc	ra,0xffffe
    80002dc0:	5e0080e7          	jalr	1504(ra) # 8000139c <mycpu>
    80002dc4:	0014f493          	andi	s1,s1,1
    80002dc8:	06952e23          	sw	s1,124(a0)
    80002dcc:	fc5ff06f          	j	80002d90 <push_on+0x34>

0000000080002dd0 <pop_on>:
    80002dd0:	ff010113          	addi	sp,sp,-16
    80002dd4:	00813023          	sd	s0,0(sp)
    80002dd8:	00113423          	sd	ra,8(sp)
    80002ddc:	01010413          	addi	s0,sp,16
    80002de0:	ffffe097          	auipc	ra,0xffffe
    80002de4:	5bc080e7          	jalr	1468(ra) # 8000139c <mycpu>
    80002de8:	100027f3          	csrr	a5,sstatus
    80002dec:	0027f793          	andi	a5,a5,2
    80002df0:	04078463          	beqz	a5,80002e38 <pop_on+0x68>
    80002df4:	07852783          	lw	a5,120(a0)
    80002df8:	02f05863          	blez	a5,80002e28 <pop_on+0x58>
    80002dfc:	fff7879b          	addiw	a5,a5,-1
    80002e00:	06f52c23          	sw	a5,120(a0)
    80002e04:	07853783          	ld	a5,120(a0)
    80002e08:	00079863          	bnez	a5,80002e18 <pop_on+0x48>
    80002e0c:	100027f3          	csrr	a5,sstatus
    80002e10:	ffd7f793          	andi	a5,a5,-3
    80002e14:	10079073          	csrw	sstatus,a5
    80002e18:	00813083          	ld	ra,8(sp)
    80002e1c:	00013403          	ld	s0,0(sp)
    80002e20:	01010113          	addi	sp,sp,16
    80002e24:	00008067          	ret
    80002e28:	00001517          	auipc	a0,0x1
    80002e2c:	3b050513          	addi	a0,a0,944 # 800041d8 <digits+0x70>
    80002e30:	fffff097          	auipc	ra,0xfffff
    80002e34:	f2c080e7          	jalr	-212(ra) # 80001d5c <panic>
    80002e38:	00001517          	auipc	a0,0x1
    80002e3c:	38050513          	addi	a0,a0,896 # 800041b8 <digits+0x50>
    80002e40:	fffff097          	auipc	ra,0xfffff
    80002e44:	f1c080e7          	jalr	-228(ra) # 80001d5c <panic>

0000000080002e48 <__memset>:
    80002e48:	ff010113          	addi	sp,sp,-16
    80002e4c:	00813423          	sd	s0,8(sp)
    80002e50:	01010413          	addi	s0,sp,16
    80002e54:	1a060e63          	beqz	a2,80003010 <__memset+0x1c8>
    80002e58:	40a007b3          	neg	a5,a0
    80002e5c:	0077f793          	andi	a5,a5,7
    80002e60:	00778693          	addi	a3,a5,7
    80002e64:	00b00813          	li	a6,11
    80002e68:	0ff5f593          	andi	a1,a1,255
    80002e6c:	fff6071b          	addiw	a4,a2,-1
    80002e70:	1b06e663          	bltu	a3,a6,8000301c <__memset+0x1d4>
    80002e74:	1cd76463          	bltu	a4,a3,8000303c <__memset+0x1f4>
    80002e78:	1a078e63          	beqz	a5,80003034 <__memset+0x1ec>
    80002e7c:	00b50023          	sb	a1,0(a0)
    80002e80:	00100713          	li	a4,1
    80002e84:	1ae78463          	beq	a5,a4,8000302c <__memset+0x1e4>
    80002e88:	00b500a3          	sb	a1,1(a0)
    80002e8c:	00200713          	li	a4,2
    80002e90:	1ae78a63          	beq	a5,a4,80003044 <__memset+0x1fc>
    80002e94:	00b50123          	sb	a1,2(a0)
    80002e98:	00300713          	li	a4,3
    80002e9c:	18e78463          	beq	a5,a4,80003024 <__memset+0x1dc>
    80002ea0:	00b501a3          	sb	a1,3(a0)
    80002ea4:	00400713          	li	a4,4
    80002ea8:	1ae78263          	beq	a5,a4,8000304c <__memset+0x204>
    80002eac:	00b50223          	sb	a1,4(a0)
    80002eb0:	00500713          	li	a4,5
    80002eb4:	1ae78063          	beq	a5,a4,80003054 <__memset+0x20c>
    80002eb8:	00b502a3          	sb	a1,5(a0)
    80002ebc:	00700713          	li	a4,7
    80002ec0:	18e79e63          	bne	a5,a4,8000305c <__memset+0x214>
    80002ec4:	00b50323          	sb	a1,6(a0)
    80002ec8:	00700e93          	li	t4,7
    80002ecc:	00859713          	slli	a4,a1,0x8
    80002ed0:	00e5e733          	or	a4,a1,a4
    80002ed4:	01059e13          	slli	t3,a1,0x10
    80002ed8:	01c76e33          	or	t3,a4,t3
    80002edc:	01859313          	slli	t1,a1,0x18
    80002ee0:	006e6333          	or	t1,t3,t1
    80002ee4:	02059893          	slli	a7,a1,0x20
    80002ee8:	40f60e3b          	subw	t3,a2,a5
    80002eec:	011368b3          	or	a7,t1,a7
    80002ef0:	02859813          	slli	a6,a1,0x28
    80002ef4:	0108e833          	or	a6,a7,a6
    80002ef8:	03059693          	slli	a3,a1,0x30
    80002efc:	003e589b          	srliw	a7,t3,0x3
    80002f00:	00d866b3          	or	a3,a6,a3
    80002f04:	03859713          	slli	a4,a1,0x38
    80002f08:	00389813          	slli	a6,a7,0x3
    80002f0c:	00f507b3          	add	a5,a0,a5
    80002f10:	00e6e733          	or	a4,a3,a4
    80002f14:	000e089b          	sext.w	a7,t3
    80002f18:	00f806b3          	add	a3,a6,a5
    80002f1c:	00e7b023          	sd	a4,0(a5)
    80002f20:	00878793          	addi	a5,a5,8
    80002f24:	fed79ce3          	bne	a5,a3,80002f1c <__memset+0xd4>
    80002f28:	ff8e7793          	andi	a5,t3,-8
    80002f2c:	0007871b          	sext.w	a4,a5
    80002f30:	01d787bb          	addw	a5,a5,t4
    80002f34:	0ce88e63          	beq	a7,a4,80003010 <__memset+0x1c8>
    80002f38:	00f50733          	add	a4,a0,a5
    80002f3c:	00b70023          	sb	a1,0(a4)
    80002f40:	0017871b          	addiw	a4,a5,1
    80002f44:	0cc77663          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002f48:	00e50733          	add	a4,a0,a4
    80002f4c:	00b70023          	sb	a1,0(a4)
    80002f50:	0027871b          	addiw	a4,a5,2
    80002f54:	0ac77e63          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002f58:	00e50733          	add	a4,a0,a4
    80002f5c:	00b70023          	sb	a1,0(a4)
    80002f60:	0037871b          	addiw	a4,a5,3
    80002f64:	0ac77663          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002f68:	00e50733          	add	a4,a0,a4
    80002f6c:	00b70023          	sb	a1,0(a4)
    80002f70:	0047871b          	addiw	a4,a5,4
    80002f74:	08c77e63          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002f78:	00e50733          	add	a4,a0,a4
    80002f7c:	00b70023          	sb	a1,0(a4)
    80002f80:	0057871b          	addiw	a4,a5,5
    80002f84:	08c77663          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002f88:	00e50733          	add	a4,a0,a4
    80002f8c:	00b70023          	sb	a1,0(a4)
    80002f90:	0067871b          	addiw	a4,a5,6
    80002f94:	06c77e63          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002f98:	00e50733          	add	a4,a0,a4
    80002f9c:	00b70023          	sb	a1,0(a4)
    80002fa0:	0077871b          	addiw	a4,a5,7
    80002fa4:	06c77663          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002fa8:	00e50733          	add	a4,a0,a4
    80002fac:	00b70023          	sb	a1,0(a4)
    80002fb0:	0087871b          	addiw	a4,a5,8
    80002fb4:	04c77e63          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002fb8:	00e50733          	add	a4,a0,a4
    80002fbc:	00b70023          	sb	a1,0(a4)
    80002fc0:	0097871b          	addiw	a4,a5,9
    80002fc4:	04c77663          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002fc8:	00e50733          	add	a4,a0,a4
    80002fcc:	00b70023          	sb	a1,0(a4)
    80002fd0:	00a7871b          	addiw	a4,a5,10
    80002fd4:	02c77e63          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002fd8:	00e50733          	add	a4,a0,a4
    80002fdc:	00b70023          	sb	a1,0(a4)
    80002fe0:	00b7871b          	addiw	a4,a5,11
    80002fe4:	02c77663          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002fe8:	00e50733          	add	a4,a0,a4
    80002fec:	00b70023          	sb	a1,0(a4)
    80002ff0:	00c7871b          	addiw	a4,a5,12
    80002ff4:	00c77e63          	bgeu	a4,a2,80003010 <__memset+0x1c8>
    80002ff8:	00e50733          	add	a4,a0,a4
    80002ffc:	00b70023          	sb	a1,0(a4)
    80003000:	00d7879b          	addiw	a5,a5,13
    80003004:	00c7f663          	bgeu	a5,a2,80003010 <__memset+0x1c8>
    80003008:	00f507b3          	add	a5,a0,a5
    8000300c:	00b78023          	sb	a1,0(a5)
    80003010:	00813403          	ld	s0,8(sp)
    80003014:	01010113          	addi	sp,sp,16
    80003018:	00008067          	ret
    8000301c:	00b00693          	li	a3,11
    80003020:	e55ff06f          	j	80002e74 <__memset+0x2c>
    80003024:	00300e93          	li	t4,3
    80003028:	ea5ff06f          	j	80002ecc <__memset+0x84>
    8000302c:	00100e93          	li	t4,1
    80003030:	e9dff06f          	j	80002ecc <__memset+0x84>
    80003034:	00000e93          	li	t4,0
    80003038:	e95ff06f          	j	80002ecc <__memset+0x84>
    8000303c:	00000793          	li	a5,0
    80003040:	ef9ff06f          	j	80002f38 <__memset+0xf0>
    80003044:	00200e93          	li	t4,2
    80003048:	e85ff06f          	j	80002ecc <__memset+0x84>
    8000304c:	00400e93          	li	t4,4
    80003050:	e7dff06f          	j	80002ecc <__memset+0x84>
    80003054:	00500e93          	li	t4,5
    80003058:	e75ff06f          	j	80002ecc <__memset+0x84>
    8000305c:	00600e93          	li	t4,6
    80003060:	e6dff06f          	j	80002ecc <__memset+0x84>

0000000080003064 <__memmove>:
    80003064:	ff010113          	addi	sp,sp,-16
    80003068:	00813423          	sd	s0,8(sp)
    8000306c:	01010413          	addi	s0,sp,16
    80003070:	0e060863          	beqz	a2,80003160 <__memmove+0xfc>
    80003074:	fff6069b          	addiw	a3,a2,-1
    80003078:	0006881b          	sext.w	a6,a3
    8000307c:	0ea5e863          	bltu	a1,a0,8000316c <__memmove+0x108>
    80003080:	00758713          	addi	a4,a1,7
    80003084:	00a5e7b3          	or	a5,a1,a0
    80003088:	40a70733          	sub	a4,a4,a0
    8000308c:	0077f793          	andi	a5,a5,7
    80003090:	00f73713          	sltiu	a4,a4,15
    80003094:	00174713          	xori	a4,a4,1
    80003098:	0017b793          	seqz	a5,a5
    8000309c:	00e7f7b3          	and	a5,a5,a4
    800030a0:	10078863          	beqz	a5,800031b0 <__memmove+0x14c>
    800030a4:	00900793          	li	a5,9
    800030a8:	1107f463          	bgeu	a5,a6,800031b0 <__memmove+0x14c>
    800030ac:	0036581b          	srliw	a6,a2,0x3
    800030b0:	fff8081b          	addiw	a6,a6,-1
    800030b4:	02081813          	slli	a6,a6,0x20
    800030b8:	01d85893          	srli	a7,a6,0x1d
    800030bc:	00858813          	addi	a6,a1,8
    800030c0:	00058793          	mv	a5,a1
    800030c4:	00050713          	mv	a4,a0
    800030c8:	01088833          	add	a6,a7,a6
    800030cc:	0007b883          	ld	a7,0(a5)
    800030d0:	00878793          	addi	a5,a5,8
    800030d4:	00870713          	addi	a4,a4,8
    800030d8:	ff173c23          	sd	a7,-8(a4)
    800030dc:	ff0798e3          	bne	a5,a6,800030cc <__memmove+0x68>
    800030e0:	ff867713          	andi	a4,a2,-8
    800030e4:	02071793          	slli	a5,a4,0x20
    800030e8:	0207d793          	srli	a5,a5,0x20
    800030ec:	00f585b3          	add	a1,a1,a5
    800030f0:	40e686bb          	subw	a3,a3,a4
    800030f4:	00f507b3          	add	a5,a0,a5
    800030f8:	06e60463          	beq	a2,a4,80003160 <__memmove+0xfc>
    800030fc:	0005c703          	lbu	a4,0(a1)
    80003100:	00e78023          	sb	a4,0(a5)
    80003104:	04068e63          	beqz	a3,80003160 <__memmove+0xfc>
    80003108:	0015c603          	lbu	a2,1(a1)
    8000310c:	00100713          	li	a4,1
    80003110:	00c780a3          	sb	a2,1(a5)
    80003114:	04e68663          	beq	a3,a4,80003160 <__memmove+0xfc>
    80003118:	0025c603          	lbu	a2,2(a1)
    8000311c:	00200713          	li	a4,2
    80003120:	00c78123          	sb	a2,2(a5)
    80003124:	02e68e63          	beq	a3,a4,80003160 <__memmove+0xfc>
    80003128:	0035c603          	lbu	a2,3(a1)
    8000312c:	00300713          	li	a4,3
    80003130:	00c781a3          	sb	a2,3(a5)
    80003134:	02e68663          	beq	a3,a4,80003160 <__memmove+0xfc>
    80003138:	0045c603          	lbu	a2,4(a1)
    8000313c:	00400713          	li	a4,4
    80003140:	00c78223          	sb	a2,4(a5)
    80003144:	00e68e63          	beq	a3,a4,80003160 <__memmove+0xfc>
    80003148:	0055c603          	lbu	a2,5(a1)
    8000314c:	00500713          	li	a4,5
    80003150:	00c782a3          	sb	a2,5(a5)
    80003154:	00e68663          	beq	a3,a4,80003160 <__memmove+0xfc>
    80003158:	0065c703          	lbu	a4,6(a1)
    8000315c:	00e78323          	sb	a4,6(a5)
    80003160:	00813403          	ld	s0,8(sp)
    80003164:	01010113          	addi	sp,sp,16
    80003168:	00008067          	ret
    8000316c:	02061713          	slli	a4,a2,0x20
    80003170:	02075713          	srli	a4,a4,0x20
    80003174:	00e587b3          	add	a5,a1,a4
    80003178:	f0f574e3          	bgeu	a0,a5,80003080 <__memmove+0x1c>
    8000317c:	02069613          	slli	a2,a3,0x20
    80003180:	02065613          	srli	a2,a2,0x20
    80003184:	fff64613          	not	a2,a2
    80003188:	00e50733          	add	a4,a0,a4
    8000318c:	00c78633          	add	a2,a5,a2
    80003190:	fff7c683          	lbu	a3,-1(a5)
    80003194:	fff78793          	addi	a5,a5,-1
    80003198:	fff70713          	addi	a4,a4,-1
    8000319c:	00d70023          	sb	a3,0(a4)
    800031a0:	fec798e3          	bne	a5,a2,80003190 <__memmove+0x12c>
    800031a4:	00813403          	ld	s0,8(sp)
    800031a8:	01010113          	addi	sp,sp,16
    800031ac:	00008067          	ret
    800031b0:	02069713          	slli	a4,a3,0x20
    800031b4:	02075713          	srli	a4,a4,0x20
    800031b8:	00170713          	addi	a4,a4,1
    800031bc:	00e50733          	add	a4,a0,a4
    800031c0:	00050793          	mv	a5,a0
    800031c4:	0005c683          	lbu	a3,0(a1)
    800031c8:	00178793          	addi	a5,a5,1
    800031cc:	00158593          	addi	a1,a1,1
    800031d0:	fed78fa3          	sb	a3,-1(a5)
    800031d4:	fee798e3          	bne	a5,a4,800031c4 <__memmove+0x160>
    800031d8:	f89ff06f          	j	80003160 <__memmove+0xfc>

00000000800031dc <__putc>:
    800031dc:	fe010113          	addi	sp,sp,-32
    800031e0:	00813823          	sd	s0,16(sp)
    800031e4:	00113c23          	sd	ra,24(sp)
    800031e8:	02010413          	addi	s0,sp,32
    800031ec:	00050793          	mv	a5,a0
    800031f0:	fef40593          	addi	a1,s0,-17
    800031f4:	00100613          	li	a2,1
    800031f8:	00000513          	li	a0,0
    800031fc:	fef407a3          	sb	a5,-17(s0)
    80003200:	fffff097          	auipc	ra,0xfffff
    80003204:	b3c080e7          	jalr	-1220(ra) # 80001d3c <console_write>
    80003208:	01813083          	ld	ra,24(sp)
    8000320c:	01013403          	ld	s0,16(sp)
    80003210:	02010113          	addi	sp,sp,32
    80003214:	00008067          	ret

0000000080003218 <__getc>:
    80003218:	fe010113          	addi	sp,sp,-32
    8000321c:	00813823          	sd	s0,16(sp)
    80003220:	00113c23          	sd	ra,24(sp)
    80003224:	02010413          	addi	s0,sp,32
    80003228:	fe840593          	addi	a1,s0,-24
    8000322c:	00100613          	li	a2,1
    80003230:	00000513          	li	a0,0
    80003234:	fffff097          	auipc	ra,0xfffff
    80003238:	ae8080e7          	jalr	-1304(ra) # 80001d1c <console_read>
    8000323c:	fe844503          	lbu	a0,-24(s0)
    80003240:	01813083          	ld	ra,24(sp)
    80003244:	01013403          	ld	s0,16(sp)
    80003248:	02010113          	addi	sp,sp,32
    8000324c:	00008067          	ret

0000000080003250 <console_handler>:
    80003250:	fe010113          	addi	sp,sp,-32
    80003254:	00813823          	sd	s0,16(sp)
    80003258:	00113c23          	sd	ra,24(sp)
    8000325c:	00913423          	sd	s1,8(sp)
    80003260:	02010413          	addi	s0,sp,32
    80003264:	14202773          	csrr	a4,scause
    80003268:	100027f3          	csrr	a5,sstatus
    8000326c:	0027f793          	andi	a5,a5,2
    80003270:	06079e63          	bnez	a5,800032ec <console_handler+0x9c>
    80003274:	00074c63          	bltz	a4,8000328c <console_handler+0x3c>
    80003278:	01813083          	ld	ra,24(sp)
    8000327c:	01013403          	ld	s0,16(sp)
    80003280:	00813483          	ld	s1,8(sp)
    80003284:	02010113          	addi	sp,sp,32
    80003288:	00008067          	ret
    8000328c:	0ff77713          	andi	a4,a4,255
    80003290:	00900793          	li	a5,9
    80003294:	fef712e3          	bne	a4,a5,80003278 <console_handler+0x28>
    80003298:	ffffe097          	auipc	ra,0xffffe
    8000329c:	6dc080e7          	jalr	1756(ra) # 80001974 <plic_claim>
    800032a0:	00a00793          	li	a5,10
    800032a4:	00050493          	mv	s1,a0
    800032a8:	02f50c63          	beq	a0,a5,800032e0 <console_handler+0x90>
    800032ac:	fc0506e3          	beqz	a0,80003278 <console_handler+0x28>
    800032b0:	00050593          	mv	a1,a0
    800032b4:	00001517          	auipc	a0,0x1
    800032b8:	e2c50513          	addi	a0,a0,-468 # 800040e0 <console_handler+0xe90>
    800032bc:	fffff097          	auipc	ra,0xfffff
    800032c0:	afc080e7          	jalr	-1284(ra) # 80001db8 <__printf>
    800032c4:	01013403          	ld	s0,16(sp)
    800032c8:	01813083          	ld	ra,24(sp)
    800032cc:	00048513          	mv	a0,s1
    800032d0:	00813483          	ld	s1,8(sp)
    800032d4:	02010113          	addi	sp,sp,32
    800032d8:	ffffe317          	auipc	t1,0xffffe
    800032dc:	6d430067          	jr	1748(t1) # 800019ac <plic_complete>
    800032e0:	fffff097          	auipc	ra,0xfffff
    800032e4:	3e0080e7          	jalr	992(ra) # 800026c0 <uartintr>
    800032e8:	fddff06f          	j	800032c4 <console_handler+0x74>
    800032ec:	00001517          	auipc	a0,0x1
    800032f0:	ef450513          	addi	a0,a0,-268 # 800041e0 <digits+0x78>
    800032f4:	fffff097          	auipc	ra,0xfffff
    800032f8:	a68080e7          	jalr	-1432(ra) # 80001d5c <panic>
	...
