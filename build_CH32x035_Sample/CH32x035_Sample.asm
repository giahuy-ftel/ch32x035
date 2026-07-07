
build_CH32x035_Sample/CH32x035_Sample.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_sinit>:

	.section	.init,"ax",@progbits
	.global	_start
	.align	1
_start:
	j	handle_reset
   0:	36d0906f          	j	9b6c <handle_reset>

Disassembly of section .vector:

00000004 <_vector_base>:
	...
   c:	9b12                	add	s6,s6,tp
   e:	0000                	unimp
  10:	9b14                	0x9b14
  12:	0000                	unimp
  14:	0000                	unimp
  16:	0000                	unimp
  18:	9b16                	add	s6,s6,t0
	...
  22:	0000                	unimp
  24:	9b18                	0x9b18
  26:	0000                	unimp
  28:	9b1a                	add	s6,s6,t1
	...
  32:	0000                	unimp
  34:	9b1c                	0x9b1c
  36:	0000                	unimp
  38:	0000                	unimp
  3a:	0000                	unimp
  3c:	9b1e                	add	s6,s6,t2
  3e:	0000                	unimp
  40:	0000                	unimp
  42:	0000                	unimp
  44:	9b20                	0x9b20
  46:	0000                	unimp
  48:	9b22                	add	s6,s6,s0
  4a:	0000                	unimp
  4c:	9b24                	0x9b24
  4e:	0000                	unimp
  50:	0000                	unimp
  52:	0000                	unimp
  54:	9b26                	add	s6,s6,s1
  56:	0000                	unimp
  58:	9b28                	0x9b28
  5a:	0000                	unimp
  5c:	9b2a                	add	s6,s6,a0
  5e:	0000                	unimp
  60:	9b2c                	0x9b2c
  62:	0000                	unimp
  64:	9b2e                	add	s6,s6,a1
  66:	0000                	unimp
  68:	9b30                	0x9b30
  6a:	0000                	unimp
  6c:	9b32                	add	s6,s6,a2
  6e:	0000                	unimp
  70:	9b34                	0x9b34
  72:	0000                	unimp
  74:	9b36                	add	s6,s6,a3
  76:	0000                	unimp
  78:	9b38                	0x9b38
  7a:	0000                	unimp
  7c:	9b3a                	add	s6,s6,a4
  7e:	0000                	unimp
  80:	9b3c                	0x9b3c
  82:	0000                	unimp
  84:	9b3e                	add	s6,s6,a5
  86:	0000                	unimp
  88:	9b40                	0x9b40
  8a:	0000                	unimp
  8c:	9b42                	add	s6,s6,a6
  8e:	0000                	unimp
  90:	9b44                	0x9b44
  92:	0000                	unimp
  94:	9b46                	add	s6,s6,a7
  96:	0000                	unimp
  98:	9b48                	0x9b48
  9a:	0000                	unimp
  9c:	9b4a                	add	s6,s6,s2
  9e:	0000                	unimp
  a0:	9b4c                	0x9b4c
  a2:	0000                	unimp
  a4:	9b4e                	add	s6,s6,s3
  a6:	0000                	unimp
  a8:	9b50                	0x9b50
  aa:	0000                	unimp
  ac:	9b52                	add	s6,s6,s4
  ae:	0000                	unimp
  b0:	9b54                	0x9b54
  b2:	0000                	unimp
  b4:	9b56                	add	s6,s6,s5
  b6:	0000                	unimp
  b8:	9b58                	0x9b58
  ba:	0000                	unimp
  bc:	9b5a                	add	s6,s6,s6
  be:	0000                	unimp
  c0:	9b5c                	0x9b5c
  c2:	0000                	unimp
  c4:	9b5e                	add	s6,s6,s7
  c6:	0000                	unimp
  c8:	9b60                	0x9b60
  ca:	0000                	unimp
  cc:	9b62                	add	s6,s6,s8
  ce:	0000                	unimp
  d0:	9b64                	0x9b64
  d2:	0000                	unimp
  d4:	9b66                	add	s6,s6,s9
  d6:	0000                	unimp
  d8:	9b68                	0x9b68
  da:	0000                	unimp
  dc:	9b6a                	add	s6,s6,s10
	...

Disassembly of section .text:

00000100 <__get_MSTATUS>:
 * @brief   Return the Machine Status Register
 *
 * @return  mstatus value
 */
uint32_t __get_MSTATUS(void)
{
     100:	1101                	addi	sp,sp,-32
     102:	ce22                	sw	s0,28(sp)
     104:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "mstatus" : "=r" (result) );
     106:	300027f3          	csrr	a5,mstatus
     10a:	fef42623          	sw	a5,-20(s0)
  return (result);
     10e:	fec42783          	lw	a5,-20(s0)
}
     112:	853e                	mv	a0,a5
     114:	4472                	lw	s0,28(sp)
     116:	6105                	addi	sp,sp,32
     118:	8082                	ret

0000011a <__set_MSTATUS>:
 * @param   value  - set mstatus value
 *
 * @return  none
 */
void __set_MSTATUS(uint32_t value)
{
     11a:	1101                	addi	sp,sp,-32
     11c:	ce22                	sw	s0,28(sp)
     11e:	1000                	addi	s0,sp,32
     120:	fea42623          	sw	a0,-20(s0)
  __ASM volatile ("csrw mstatus, %0" : : "r" (value) );
     124:	fec42783          	lw	a5,-20(s0)
     128:	30079073          	csrw	mstatus,a5
}
     12c:	0001                	nop
     12e:	4472                	lw	s0,28(sp)
     130:	6105                	addi	sp,sp,32
     132:	8082                	ret

00000134 <__get_MISA>:
 * @brief   Return the Machine ISA Register
 *
 * @return  misa value
 */
uint32_t __get_MISA(void)
{
     134:	1101                	addi	sp,sp,-32
     136:	ce22                	sw	s0,28(sp)
     138:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "misa" : "=r" (result) );
     13a:	301027f3          	csrr	a5,misa
     13e:	fef42623          	sw	a5,-20(s0)
  return (result);
     142:	fec42783          	lw	a5,-20(s0)
}
     146:	853e                	mv	a0,a5
     148:	4472                	lw	s0,28(sp)
     14a:	6105                	addi	sp,sp,32
     14c:	8082                	ret

0000014e <__set_MISA>:
 * @param   value  - set misa value
 *
 * @return  none
 */
void __set_MISA(uint32_t value)
{
     14e:	1101                	addi	sp,sp,-32
     150:	ce22                	sw	s0,28(sp)
     152:	1000                	addi	s0,sp,32
     154:	fea42623          	sw	a0,-20(s0)
  __ASM volatile ("csrw misa, %0" : : "r" (value) );
     158:	fec42783          	lw	a5,-20(s0)
     15c:	30179073          	csrw	misa,a5
}
     160:	0001                	nop
     162:	4472                	lw	s0,28(sp)
     164:	6105                	addi	sp,sp,32
     166:	8082                	ret

00000168 <__get_MTVEC>:
 * @brief   Return the Machine Trap-Vector Base-Address Register
 *
 * @return  mtvec value
 */
uint32_t __get_MTVEC(void)
{
     168:	1101                	addi	sp,sp,-32
     16a:	ce22                	sw	s0,28(sp)
     16c:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "mtvec" : "=r" (result) );
     16e:	305027f3          	csrr	a5,mtvec
     172:	fef42623          	sw	a5,-20(s0)
  return (result);
     176:	fec42783          	lw	a5,-20(s0)
}
     17a:	853e                	mv	a0,a5
     17c:	4472                	lw	s0,28(sp)
     17e:	6105                	addi	sp,sp,32
     180:	8082                	ret

00000182 <__set_MTVEC>:
 * @param   value  - set mtvec value
 *
 * @return  none
 */
void __set_MTVEC(uint32_t value)
{
     182:	1101                	addi	sp,sp,-32
     184:	ce22                	sw	s0,28(sp)
     186:	1000                	addi	s0,sp,32
     188:	fea42623          	sw	a0,-20(s0)
  __ASM volatile ("csrw mtvec, %0" : : "r" (value) );
     18c:	fec42783          	lw	a5,-20(s0)
     190:	30579073          	csrw	mtvec,a5
}
     194:	0001                	nop
     196:	4472                	lw	s0,28(sp)
     198:	6105                	addi	sp,sp,32
     19a:	8082                	ret

0000019c <__get_MSCRATCH>:
 * @brief   Return the Machine Seratch Register
 *
 * @return  mscratch value
 */
uint32_t __get_MSCRATCH(void)
{
     19c:	1101                	addi	sp,sp,-32
     19e:	ce22                	sw	s0,28(sp)
     1a0:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "mscratch" : "=r" (result) );
     1a2:	340027f3          	csrr	a5,mscratch
     1a6:	fef42623          	sw	a5,-20(s0)
  return (result);
     1aa:	fec42783          	lw	a5,-20(s0)
}
     1ae:	853e                	mv	a0,a5
     1b0:	4472                	lw	s0,28(sp)
     1b2:	6105                	addi	sp,sp,32
     1b4:	8082                	ret

000001b6 <__set_MSCRATCH>:
 * @param   value  - set mscratch value
 *
 * @return  none
 */
void __set_MSCRATCH(uint32_t value)
{
     1b6:	1101                	addi	sp,sp,-32
     1b8:	ce22                	sw	s0,28(sp)
     1ba:	1000                	addi	s0,sp,32
     1bc:	fea42623          	sw	a0,-20(s0)
  __ASM volatile ("csrw mscratch, %0" : : "r" (value) );
     1c0:	fec42783          	lw	a5,-20(s0)
     1c4:	34079073          	csrw	mscratch,a5
}
     1c8:	0001                	nop
     1ca:	4472                	lw	s0,28(sp)
     1cc:	6105                	addi	sp,sp,32
     1ce:	8082                	ret

000001d0 <__get_MEPC>:
 * @brief   Return the Machine Exception Program Register
 *
 * @return  mepc value
 */
uint32_t __get_MEPC(void)
{
     1d0:	1101                	addi	sp,sp,-32
     1d2:	ce22                	sw	s0,28(sp)
     1d4:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "mepc" : "=r" (result) );
     1d6:	341027f3          	csrr	a5,mepc
     1da:	fef42623          	sw	a5,-20(s0)
  return (result);
     1de:	fec42783          	lw	a5,-20(s0)
}
     1e2:	853e                	mv	a0,a5
     1e4:	4472                	lw	s0,28(sp)
     1e6:	6105                	addi	sp,sp,32
     1e8:	8082                	ret

000001ea <__set_MEPC>:
 * @brief   Set the Machine Exception Program Register
 *
 * @return  mepc value
 */
void __set_MEPC(uint32_t value)
{
     1ea:	1101                	addi	sp,sp,-32
     1ec:	ce22                	sw	s0,28(sp)
     1ee:	1000                	addi	s0,sp,32
     1f0:	fea42623          	sw	a0,-20(s0)
  __ASM volatile ("csrw mepc, %0" : : "r" (value) );
     1f4:	fec42783          	lw	a5,-20(s0)
     1f8:	34179073          	csrw	mepc,a5
}
     1fc:	0001                	nop
     1fe:	4472                	lw	s0,28(sp)
     200:	6105                	addi	sp,sp,32
     202:	8082                	ret

00000204 <__get_MCAUSE>:
 * @brief   Return the Machine Cause Register
 *
 * @return  mcause value
 */
uint32_t __get_MCAUSE(void)
{
     204:	1101                	addi	sp,sp,-32
     206:	ce22                	sw	s0,28(sp)
     208:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "mcause" : "=r" (result) );
     20a:	342027f3          	csrr	a5,mcause
     20e:	fef42623          	sw	a5,-20(s0)
  return (result);
     212:	fec42783          	lw	a5,-20(s0)
}
     216:	853e                	mv	a0,a5
     218:	4472                	lw	s0,28(sp)
     21a:	6105                	addi	sp,sp,32
     21c:	8082                	ret

0000021e <__set_MCAUSE>:
 * @brief   Set the Machine Cause Register
 *
 * @return  mcause value
 */
void __set_MCAUSE(uint32_t value)
{
     21e:	1101                	addi	sp,sp,-32
     220:	ce22                	sw	s0,28(sp)
     222:	1000                	addi	s0,sp,32
     224:	fea42623          	sw	a0,-20(s0)
  __ASM volatile ("csrw mcause, %0" : : "r" (value) );
     228:	fec42783          	lw	a5,-20(s0)
     22c:	34279073          	csrw	mcause,a5
}
     230:	0001                	nop
     232:	4472                	lw	s0,28(sp)
     234:	6105                	addi	sp,sp,32
     236:	8082                	ret

00000238 <__get_MTVAL>:
 * @brief   Return the Machine Trap Value Register
 *
 * @return  mtval value
 */
uint32_t __get_MTVAL(void)
{
     238:	1101                	addi	sp,sp,-32
     23a:	ce22                	sw	s0,28(sp)
     23c:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "mtval" : "=r" (result) );
     23e:	343027f3          	csrr	a5,mtval
     242:	fef42623          	sw	a5,-20(s0)
  return (result);
     246:	fec42783          	lw	a5,-20(s0)
}
     24a:	853e                	mv	a0,a5
     24c:	4472                	lw	s0,28(sp)
     24e:	6105                	addi	sp,sp,32
     250:	8082                	ret

00000252 <__set_MTVAL>:
 * @brief   Set the Machine Trap Value Register
 *
 * @return  mtval value
 */
void __set_MTVAL(uint32_t value)
{
     252:	1101                	addi	sp,sp,-32
     254:	ce22                	sw	s0,28(sp)
     256:	1000                	addi	s0,sp,32
     258:	fea42623          	sw	a0,-20(s0)
  __ASM volatile ("csrw mtval, %0" : : "r" (value) );
     25c:	fec42783          	lw	a5,-20(s0)
     260:	34379073          	csrw	mtval,a5
}
     264:	0001                	nop
     266:	4472                	lw	s0,28(sp)
     268:	6105                	addi	sp,sp,32
     26a:	8082                	ret

0000026c <__get_MVENDORID>:
 * @brief   Return Vendor ID Register
 *
 * @return  mvendorid value
 */
uint32_t __get_MVENDORID(void)
{
     26c:	1101                	addi	sp,sp,-32
     26e:	ce22                	sw	s0,28(sp)
     270:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "mvendorid" : "=r" (result) );
     272:	f11027f3          	csrr	a5,mvendorid
     276:	fef42623          	sw	a5,-20(s0)
  return (result);
     27a:	fec42783          	lw	a5,-20(s0)
}
     27e:	853e                	mv	a0,a5
     280:	4472                	lw	s0,28(sp)
     282:	6105                	addi	sp,sp,32
     284:	8082                	ret

00000286 <__get_MARCHID>:
 * @brief   Return Machine Architecture ID Register
 *
 * @return  marchid value
 */
uint32_t __get_MARCHID(void)
{
     286:	1101                	addi	sp,sp,-32
     288:	ce22                	sw	s0,28(sp)
     28a:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "marchid" : "=r" (result) );
     28c:	f12027f3          	csrr	a5,marchid
     290:	fef42623          	sw	a5,-20(s0)
  return (result);
     294:	fec42783          	lw	a5,-20(s0)
}
     298:	853e                	mv	a0,a5
     29a:	4472                	lw	s0,28(sp)
     29c:	6105                	addi	sp,sp,32
     29e:	8082                	ret

000002a0 <__get_MIMPID>:
 * @brief   Return Machine Implementation ID Register
 *
 * @return  mimpid value
 */
uint32_t __get_MIMPID(void)
{
     2a0:	1101                	addi	sp,sp,-32
     2a2:	ce22                	sw	s0,28(sp)
     2a4:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "mimpid" : "=r" (result) );
     2a6:	f13027f3          	csrr	a5,mimpid
     2aa:	fef42623          	sw	a5,-20(s0)
  return (result);
     2ae:	fec42783          	lw	a5,-20(s0)
}
     2b2:	853e                	mv	a0,a5
     2b4:	4472                	lw	s0,28(sp)
     2b6:	6105                	addi	sp,sp,32
     2b8:	8082                	ret

000002ba <__get_MHARTID>:
 * @brief   Return Hart ID Register
 *
 * @return  mhartid value
 */
uint32_t __get_MHARTID(void)
{
     2ba:	1101                	addi	sp,sp,-32
     2bc:	ce22                	sw	s0,28(sp)
     2be:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "csrr %0," "mhartid" : "=r" (result) );
     2c0:	f14027f3          	csrr	a5,mhartid
     2c4:	fef42623          	sw	a5,-20(s0)
  return (result);
     2c8:	fec42783          	lw	a5,-20(s0)
}
     2cc:	853e                	mv	a0,a5
     2ce:	4472                	lw	s0,28(sp)
     2d0:	6105                	addi	sp,sp,32
     2d2:	8082                	ret

000002d4 <__get_SP>:
 * @brief   Return SP Register
 *
 * @return  SP value
 */
uint32_t __get_SP(void)
{
     2d4:	1101                	addi	sp,sp,-32
     2d6:	ce22                	sw	s0,28(sp)
     2d8:	1000                	addi	s0,sp,32
  uint32_t result;

  __ASM volatile ( "mv %0," "sp" : "=r"(result) : );
     2da:	878a                	mv	a5,sp
     2dc:	fef42623          	sw	a5,-20(s0)
  return (result);
     2e0:	fec42783          	lw	a5,-20(s0)
}
     2e4:	853e                	mv	a0,a5
     2e6:	4472                	lw	s0,28(sp)
     2e8:	6105                	addi	sp,sp,32
     2ea:	8082                	ret

000002ec <SystemInit>:
 *        update the SystemCoreClock variable.
 *
 * @return  none
 */
void SystemInit (void)
{
     2ec:	1141                	addi	sp,sp,-16
     2ee:	c606                	sw	ra,12(sp)
     2f0:	c422                	sw	s0,8(sp)
     2f2:	0800                	addi	s0,sp,16
  RCC->CTLR |= (uint32_t)0x00000001;
     2f4:	400217b7          	lui	a5,0x40021
     2f8:	4398                	lw	a4,0(a5)
     2fa:	400217b7          	lui	a5,0x40021
     2fe:	00176713          	ori	a4,a4,1
     302:	c398                	sw	a4,0(a5)
  RCC->CFGR0 |= (uint32_t)0x00000050;
     304:	400217b7          	lui	a5,0x40021
     308:	43d8                	lw	a4,4(a5)
     30a:	400217b7          	lui	a5,0x40021
     30e:	05076713          	ori	a4,a4,80
     312:	c3d8                	sw	a4,4(a5)
  RCC->CFGR0 &= (uint32_t)0xF8FFFF5F;
     314:	400217b7          	lui	a5,0x40021
     318:	43d4                	lw	a3,4(a5)
     31a:	400217b7          	lui	a5,0x40021
     31e:	f9000737          	lui	a4,0xf9000
     322:	f5f70713          	addi	a4,a4,-161 # f8ffff5f <_eusrstack+0xd8ffbf5f>
     326:	8f75                	and	a4,a4,a3
     328:	c3d8                	sw	a4,4(a5)
  SetSysClock();
     32a:	2079                	jal	3b8 <SetSysClock>
}
     32c:	0001                	nop
     32e:	40b2                	lw	ra,12(sp)
     330:	4422                	lw	s0,8(sp)
     332:	0141                	addi	sp,sp,16
     334:	8082                	ret

00000336 <SystemCoreClockUpdate>:
 * @brief   Update SystemCoreClock variable according to Clock Register Values.
 *
 * @return  none
 */
void SystemCoreClockUpdate (void)
{
     336:	1101                	addi	sp,sp,-32
     338:	ce22                	sw	s0,28(sp)
     33a:	1000                	addi	s0,sp,32
    uint32_t tmp = 0;
     33c:	fe042623          	sw	zero,-20(s0)

    SystemCoreClock = HSI_VALUE;
     340:	200007b7          	lui	a5,0x20000
     344:	02dc7737          	lui	a4,0x2dc7
     348:	c0070713          	addi	a4,a4,-1024 # 2dc6c00 <_data_lma+0x2dba94c>
     34c:	02e7a023          	sw	a4,32(a5) # 20000020 <SystemCoreClock>
    tmp = AHBPrescTable[((RCC->CFGR0 & RCC_HPRE) >> 4)];
     350:	400217b7          	lui	a5,0x40021
     354:	43dc                	lw	a5,4(a5)
     356:	8391                	srli	a5,a5,0x4
     358:	00f7f713          	andi	a4,a5,15
     35c:	200007b7          	lui	a5,0x20000
     360:	00078793          	mv	a5,a5
     364:	97ba                	add	a5,a5,a4
     366:	0007c783          	lbu	a5,0(a5) # 20000000 <_data_vma>
     36a:	0ff7f793          	andi	a5,a5,255
     36e:	fef42623          	sw	a5,-20(s0)

    if(((RCC->CFGR0 & RCC_HPRE) >> 4) < 8)
     372:	400217b7          	lui	a5,0x40021
     376:	43dc                	lw	a5,4(a5)
     378:	0807f793          	andi	a5,a5,128
     37c:	ef91                	bnez	a5,398 <SystemCoreClockUpdate+0x62>
    {
        SystemCoreClock /= tmp;
     37e:	200007b7          	lui	a5,0x20000
     382:	0207a703          	lw	a4,32(a5) # 20000020 <SystemCoreClock>
     386:	fec42783          	lw	a5,-20(s0)
     38a:	02f75733          	divu	a4,a4,a5
     38e:	200007b7          	lui	a5,0x20000
     392:	02e7a023          	sw	a4,32(a5) # 20000020 <SystemCoreClock>
    }
    else
    {
        SystemCoreClock >>= tmp;
    }
}
     396:	a829                	j	3b0 <SystemCoreClockUpdate+0x7a>
        SystemCoreClock >>= tmp;
     398:	200007b7          	lui	a5,0x20000
     39c:	0207a703          	lw	a4,32(a5) # 20000020 <SystemCoreClock>
     3a0:	fec42783          	lw	a5,-20(s0)
     3a4:	00f75733          	srl	a4,a4,a5
     3a8:	200007b7          	lui	a5,0x20000
     3ac:	02e7a023          	sw	a4,32(a5) # 20000020 <SystemCoreClock>
}
     3b0:	0001                	nop
     3b2:	4472                	lw	s0,28(sp)
     3b4:	6105                	addi	sp,sp,32
     3b6:	8082                	ret

000003b8 <SetSysClock>:
 * @brief   Configures the System clock frequency, HCLK prescalers.
 *
 * @return  none
 */
static void SetSysClock(void)
{
     3b8:	1141                	addi	sp,sp,-16
     3ba:	c606                	sw	ra,12(sp)
     3bc:	c422                	sw	s0,8(sp)
     3be:	0800                	addi	s0,sp,16
#elif defined SYSCLK_FREQ_16MHz_HSI
    SetSysClockTo16_HSI();
#elif defined SYSCLK_FREQ_24MHz_HSI
    SetSysClockTo24_HSI();
#elif defined SYSCLK_FREQ_48MHz_HSI
    SetSysClockTo48_HSI();
     3c0:	2031                	jal	3cc <SetSysClockTo48_HSI>

#endif
}
     3c2:	0001                	nop
     3c4:	40b2                	lw	ra,12(sp)
     3c6:	4422                	lw	s0,8(sp)
     3c8:	0141                	addi	sp,sp,16
     3ca:	8082                	ret

000003cc <SetSysClockTo48_HSI>:
 * @brief   Sets System clock frequency to 48MHz and configure HCLK prescalers.
 *
 * @return  none
 */
static void SetSysClockTo48_HSI(void)
{
     3cc:	1141                	addi	sp,sp,-16
     3ce:	c622                	sw	s0,12(sp)
     3d0:	0800                	addi	s0,sp,16
    /* Flash 2 wait state */
    FLASH->ACTLR &= (uint32_t)((uint32_t)~FLASH_ACTLR_LATENCY);
     3d2:	400227b7          	lui	a5,0x40022
     3d6:	4398                	lw	a4,0(a5)
     3d8:	400227b7          	lui	a5,0x40022
     3dc:	9b71                	andi	a4,a4,-4
     3de:	c398                	sw	a4,0(a5)
    FLASH->ACTLR |= (uint32_t)FLASH_ACTLR_LATENCY_2;
     3e0:	400227b7          	lui	a5,0x40022
     3e4:	4398                	lw	a4,0(a5)
     3e6:	400227b7          	lui	a5,0x40022
     3ea:	00276713          	ori	a4,a4,2
     3ee:	c398                	sw	a4,0(a5)

    /* HCLK = SYSCLK = APB1 */
    RCC->CFGR0 &= (uint32_t)0xFFFFFF0F;
     3f0:	400217b7          	lui	a5,0x40021
     3f4:	43d8                	lw	a4,4(a5)
     3f6:	400217b7          	lui	a5,0x40021
     3fa:	f0f77713          	andi	a4,a4,-241
     3fe:	c3d8                	sw	a4,4(a5)
    RCC->CFGR0 |= (uint32_t)RCC_HPRE_DIV1;
     400:	40021737          	lui	a4,0x40021
     404:	400217b7          	lui	a5,0x40021
     408:	4358                	lw	a4,4(a4)
     40a:	c3d8                	sw	a4,4(a5)
}
     40c:	0001                	nop
     40e:	4432                	lw	s0,12(sp)
     410:	0141                	addi	sp,sp,16
     412:	8082                	ret

00000414 <ADC_DeInit>:
 * @param   ADCx - where x can be 1 to select the ADC peripheral.
 *
 * @return  none
 */
void ADC_DeInit(ADC_TypeDef *ADCx)
{
     414:	1101                	addi	sp,sp,-32
     416:	ce06                	sw	ra,28(sp)
     418:	cc22                	sw	s0,24(sp)
     41a:	1000                	addi	s0,sp,32
     41c:	fea42623          	sw	a0,-20(s0)
    if(ADCx == ADC1)
     420:	fec42703          	lw	a4,-20(s0)
     424:	400127b7          	lui	a5,0x40012
     428:	40078793          	addi	a5,a5,1024 # 40012400 <_eusrstack+0x2000e400>
     42c:	00f71c63          	bne	a4,a5,444 <ADC_DeInit+0x30>
    {
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC1, ENABLE);
     430:	4585                	li	a1,1
     432:	20000513          	li	a0,512
     436:	754040ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC1, DISABLE);
     43a:	4581                	li	a1,0
     43c:	20000513          	li	a0,512
     440:	74a040ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
    }
}
     444:	0001                	nop
     446:	40f2                	lw	ra,28(sp)
     448:	4462                	lw	s0,24(sp)
     44a:	6105                	addi	sp,sp,32
     44c:	8082                	ret

0000044e <ADC_Init>:
 *        peripheral.
 *
 * @return  none
 */
void ADC_Init(ADC_TypeDef *ADCx, ADC_InitTypeDef *ADC_InitStruct)
{
     44e:	7179                	addi	sp,sp,-48
     450:	d622                	sw	s0,44(sp)
     452:	1800                	addi	s0,sp,48
     454:	fca42e23          	sw	a0,-36(s0)
     458:	fcb42c23          	sw	a1,-40(s0)
    uint32_t tmpreg1 = 0;
     45c:	fe042623          	sw	zero,-20(s0)
    uint8_t  tmpreg2 = 0;
     460:	fe0405a3          	sb	zero,-21(s0)

    tmpreg1 = ADCx->CTLR1;
     464:	fdc42783          	lw	a5,-36(s0)
     468:	43dc                	lw	a5,4(a5)
     46a:	fef42623          	sw	a5,-20(s0)
    tmpreg1 &= CTLR1_CLEAR_Mask;
     46e:	fec42703          	lw	a4,-20(s0)
     472:	e0f107b7          	lui	a5,0xe0f10
     476:	eff78793          	addi	a5,a5,-257 # e0f0feff <_eusrstack+0xc0f0beff>
     47a:	8ff9                	and	a5,a5,a4
     47c:	fef42623          	sw	a5,-20(s0)
    tmpreg1 |= (uint32_t)(ADC_InitStruct->ADC_Mode | (uint32_t)ADC_InitStruct->ADC_OutputBuffer |
     480:	fd842783          	lw	a5,-40(s0)
     484:	4398                	lw	a4,0(a5)
     486:	fd842783          	lw	a5,-40(s0)
     48a:	4f9c                	lw	a5,24(a5)
     48c:	8f5d                	or	a4,a4,a5
                          (uint32_t)ADC_InitStruct->ADC_Pga | ((uint32_t)ADC_InitStruct->ADC_ScanConvMode << 8));
     48e:	fd842783          	lw	a5,-40(s0)
     492:	4fdc                	lw	a5,28(a5)
    tmpreg1 |= (uint32_t)(ADC_InitStruct->ADC_Mode | (uint32_t)ADC_InitStruct->ADC_OutputBuffer |
     494:	8f5d                	or	a4,a4,a5
                          (uint32_t)ADC_InitStruct->ADC_Pga | ((uint32_t)ADC_InitStruct->ADC_ScanConvMode << 8));
     496:	fd842783          	lw	a5,-40(s0)
     49a:	43dc                	lw	a5,4(a5)
     49c:	07a2                	slli	a5,a5,0x8
    tmpreg1 |= (uint32_t)(ADC_InitStruct->ADC_Mode | (uint32_t)ADC_InitStruct->ADC_OutputBuffer |
     49e:	8fd9                	or	a5,a5,a4
     4a0:	fec42703          	lw	a4,-20(s0)
     4a4:	8fd9                	or	a5,a5,a4
     4a6:	fef42623          	sw	a5,-20(s0)
    ADCx->CTLR1 = tmpreg1;
     4aa:	fdc42783          	lw	a5,-36(s0)
     4ae:	fec42703          	lw	a4,-20(s0)
     4b2:	c3d8                	sw	a4,4(a5)

    tmpreg1 = ADCx->CTLR2;
     4b4:	fdc42783          	lw	a5,-36(s0)
     4b8:	479c                	lw	a5,8(a5)
     4ba:	fef42623          	sw	a5,-20(s0)
    tmpreg1 &= CTLR2_CLEAR_Mask;
     4be:	fec42703          	lw	a4,-20(s0)
     4c2:	fff1f7b7          	lui	a5,0xfff1f
     4c6:	7fd78793          	addi	a5,a5,2045 # fff1f7fd <_eusrstack+0xdff1b7fd>
     4ca:	8ff9                	and	a5,a5,a4
     4cc:	fef42623          	sw	a5,-20(s0)
    tmpreg1 |= (uint32_t)(ADC_InitStruct->ADC_DataAlign | ADC_InitStruct->ADC_ExternalTrigConv |
     4d0:	fd842783          	lw	a5,-40(s0)
     4d4:	4b98                	lw	a4,16(a5)
     4d6:	fd842783          	lw	a5,-40(s0)
     4da:	47dc                	lw	a5,12(a5)
     4dc:	8f5d                	or	a4,a4,a5
                          ((uint32_t)ADC_InitStruct->ADC_ContinuousConvMode << 1));
     4de:	fd842783          	lw	a5,-40(s0)
     4e2:	479c                	lw	a5,8(a5)
     4e4:	0786                	slli	a5,a5,0x1
    tmpreg1 |= (uint32_t)(ADC_InitStruct->ADC_DataAlign | ADC_InitStruct->ADC_ExternalTrigConv |
     4e6:	8fd9                	or	a5,a5,a4
     4e8:	fec42703          	lw	a4,-20(s0)
     4ec:	8fd9                	or	a5,a5,a4
     4ee:	fef42623          	sw	a5,-20(s0)
    ADCx->CTLR2 = tmpreg1;
     4f2:	fdc42783          	lw	a5,-36(s0)
     4f6:	fec42703          	lw	a4,-20(s0)
     4fa:	c798                	sw	a4,8(a5)

    tmpreg1 = ADCx->RSQR1;
     4fc:	fdc42783          	lw	a5,-36(s0)
     500:	57dc                	lw	a5,44(a5)
     502:	fef42623          	sw	a5,-20(s0)
    tmpreg1 &= RSQR1_CLEAR_Mask;
     506:	fec42703          	lw	a4,-20(s0)
     50a:	ff1007b7          	lui	a5,0xff100
     50e:	17fd                	addi	a5,a5,-1
     510:	8ff9                	and	a5,a5,a4
     512:	fef42623          	sw	a5,-20(s0)
    tmpreg2 |= (uint8_t)(ADC_InitStruct->ADC_NbrOfChannel - (uint8_t)1);
     516:	fd842783          	lw	a5,-40(s0)
     51a:	0147c783          	lbu	a5,20(a5) # ff100014 <_eusrstack+0xdf0fc014>
     51e:	17fd                	addi	a5,a5,-1
     520:	0ff7f713          	andi	a4,a5,255
     524:	feb44783          	lbu	a5,-21(s0)
     528:	8fd9                	or	a5,a5,a4
     52a:	fef405a3          	sb	a5,-21(s0)
    tmpreg1 |= (uint32_t)tmpreg2 << 20;
     52e:	feb44783          	lbu	a5,-21(s0)
     532:	07d2                	slli	a5,a5,0x14
     534:	fec42703          	lw	a4,-20(s0)
     538:	8fd9                	or	a5,a5,a4
     53a:	fef42623          	sw	a5,-20(s0)
    ADCx->RSQR1 = tmpreg1;
     53e:	fdc42783          	lw	a5,-36(s0)
     542:	fec42703          	lw	a4,-20(s0)
     546:	d7d8                	sw	a4,44(a5)
}
     548:	0001                	nop
     54a:	5432                	lw	s0,44(sp)
     54c:	6145                	addi	sp,sp,48
     54e:	8082                	ret

00000550 <ADC_StructInit>:
 *        peripheral.
 *
 * @return  none
 */
void ADC_StructInit(ADC_InitTypeDef *ADC_InitStruct)
{
     550:	1101                	addi	sp,sp,-32
     552:	ce22                	sw	s0,28(sp)
     554:	1000                	addi	s0,sp,32
     556:	fea42623          	sw	a0,-20(s0)
    ADC_InitStruct->ADC_Mode = ADC_Mode_Independent;
     55a:	fec42783          	lw	a5,-20(s0)
     55e:	0007a023          	sw	zero,0(a5)
    ADC_InitStruct->ADC_ScanConvMode = DISABLE;
     562:	fec42783          	lw	a5,-20(s0)
     566:	0007a223          	sw	zero,4(a5)
    ADC_InitStruct->ADC_ContinuousConvMode = DISABLE;
     56a:	fec42783          	lw	a5,-20(s0)
     56e:	0007a423          	sw	zero,8(a5)
    ADC_InitStruct->ADC_ExternalTrigConv = ADC_ExternalTrigConv_T1_CC1;
     572:	fec42783          	lw	a5,-20(s0)
     576:	00020737          	lui	a4,0x20
     57a:	c7d8                	sw	a4,12(a5)
    ADC_InitStruct->ADC_DataAlign = ADC_DataAlign_Right;
     57c:	fec42783          	lw	a5,-20(s0)
     580:	0007a823          	sw	zero,16(a5)
    ADC_InitStruct->ADC_NbrOfChannel = 1;
     584:	fec42783          	lw	a5,-20(s0)
     588:	4705                	li	a4,1
     58a:	00e78a23          	sb	a4,20(a5)
}
     58e:	0001                	nop
     590:	4472                	lw	s0,28(sp)
     592:	6105                	addi	sp,sp,32
     594:	8082                	ret

00000596 <ADC_Cmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void ADC_Cmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
     596:	1101                	addi	sp,sp,-32
     598:	ce22                	sw	s0,28(sp)
     59a:	1000                	addi	s0,sp,32
     59c:	fea42623          	sw	a0,-20(s0)
     5a0:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
     5a4:	fe842783          	lw	a5,-24(s0)
     5a8:	cb91                	beqz	a5,5bc <ADC_Cmd+0x26>
    {
        ADCx->CTLR2 |= CTLR2_ADON_Set;
     5aa:	fec42783          	lw	a5,-20(s0)
     5ae:	479c                	lw	a5,8(a5)
     5b0:	0017e713          	ori	a4,a5,1
     5b4:	fec42783          	lw	a5,-20(s0)
     5b8:	c798                	sw	a4,8(a5)
    }
    else
    {
        ADCx->CTLR2 &= CTLR2_ADON_Reset;
    }
}
     5ba:	a809                	j	5cc <ADC_Cmd+0x36>
        ADCx->CTLR2 &= CTLR2_ADON_Reset;
     5bc:	fec42783          	lw	a5,-20(s0)
     5c0:	479c                	lw	a5,8(a5)
     5c2:	ffe7f713          	andi	a4,a5,-2
     5c6:	fec42783          	lw	a5,-20(s0)
     5ca:	c798                	sw	a4,8(a5)
}
     5cc:	0001                	nop
     5ce:	4472                	lw	s0,28(sp)
     5d0:	6105                	addi	sp,sp,32
     5d2:	8082                	ret

000005d4 <ADC_DMACmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void ADC_DMACmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
     5d4:	1101                	addi	sp,sp,-32
     5d6:	ce22                	sw	s0,28(sp)
     5d8:	1000                	addi	s0,sp,32
     5da:	fea42623          	sw	a0,-20(s0)
     5de:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
     5e2:	fe842783          	lw	a5,-24(s0)
     5e6:	cb91                	beqz	a5,5fa <ADC_DMACmd+0x26>
    {
        ADCx->CTLR2 |= CTLR2_DMA_Set;
     5e8:	fec42783          	lw	a5,-20(s0)
     5ec:	479c                	lw	a5,8(a5)
     5ee:	1007e713          	ori	a4,a5,256
     5f2:	fec42783          	lw	a5,-20(s0)
     5f6:	c798                	sw	a4,8(a5)
    }
    else
    {
        ADCx->CTLR2 &= CTLR2_DMA_Reset;
    }
}
     5f8:	a809                	j	60a <ADC_DMACmd+0x36>
        ADCx->CTLR2 &= CTLR2_DMA_Reset;
     5fa:	fec42783          	lw	a5,-20(s0)
     5fe:	479c                	lw	a5,8(a5)
     600:	eff7f713          	andi	a4,a5,-257
     604:	fec42783          	lw	a5,-20(s0)
     608:	c798                	sw	a4,8(a5)
}
     60a:	0001                	nop
     60c:	4472                	lw	s0,28(sp)
     60e:	6105                	addi	sp,sp,32
     610:	8082                	ret

00000612 <ADC_ITConfig>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void ADC_ITConfig(ADC_TypeDef *ADCx, uint16_t ADC_IT, FunctionalState NewState)
{
     612:	7179                	addi	sp,sp,-48
     614:	d622                	sw	s0,44(sp)
     616:	1800                	addi	s0,sp,48
     618:	fca42e23          	sw	a0,-36(s0)
     61c:	87ae                	mv	a5,a1
     61e:	fcc42a23          	sw	a2,-44(s0)
     622:	fcf41d23          	sh	a5,-38(s0)
    uint8_t itmask = 0;
     626:	fe0407a3          	sb	zero,-17(s0)

    itmask = (uint8_t)ADC_IT;
     62a:	fda45783          	lhu	a5,-38(s0)
     62e:	fef407a3          	sb	a5,-17(s0)

    if(NewState != DISABLE)
     632:	fd442783          	lw	a5,-44(s0)
     636:	cb99                	beqz	a5,64c <ADC_ITConfig+0x3a>
    {
        ADCx->CTLR1 |= itmask;
     638:	fdc42783          	lw	a5,-36(s0)
     63c:	43d8                	lw	a4,4(a5)
     63e:	fef44783          	lbu	a5,-17(s0)
     642:	8f5d                	or	a4,a4,a5
     644:	fdc42783          	lw	a5,-36(s0)
     648:	c3d8                	sw	a4,4(a5)
    }
    else
    {
        ADCx->CTLR1 &= (~(uint32_t)itmask);
    }
}
     64a:	a821                	j	662 <ADC_ITConfig+0x50>
        ADCx->CTLR1 &= (~(uint32_t)itmask);
     64c:	fdc42783          	lw	a5,-36(s0)
     650:	43d8                	lw	a4,4(a5)
     652:	fef44783          	lbu	a5,-17(s0)
     656:	fff7c793          	not	a5,a5
     65a:	8f7d                	and	a4,a4,a5
     65c:	fdc42783          	lw	a5,-36(s0)
     660:	c3d8                	sw	a4,4(a5)
}
     662:	0001                	nop
     664:	5432                	lw	s0,44(sp)
     666:	6145                	addi	sp,sp,48
     668:	8082                	ret

0000066a <ADC_SoftwareStartConvCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  None
 */
void ADC_SoftwareStartConvCmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
     66a:	1101                	addi	sp,sp,-32
     66c:	ce22                	sw	s0,28(sp)
     66e:	1000                	addi	s0,sp,32
     670:	fea42623          	sw	a0,-20(s0)
     674:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
     678:	fe842783          	lw	a5,-24(s0)
     67c:	cb99                	beqz	a5,692 <ADC_SoftwareStartConvCmd+0x28>
    {
        ADCx->CTLR2 |= CTLR2_EXTTRIG_SWSTART_Set;
     67e:	fec42783          	lw	a5,-20(s0)
     682:	4798                	lw	a4,8(a5)
     684:	005007b7          	lui	a5,0x500
     688:	8f5d                	or	a4,a4,a5
     68a:	fec42783          	lw	a5,-20(s0)
     68e:	c798                	sw	a4,8(a5)
    }
    else
    {
        ADCx->CTLR2 &= CTLR2_EXTTRIG_SWSTART_Reset;
    }
}
     690:	a819                	j	6a6 <ADC_SoftwareStartConvCmd+0x3c>
        ADCx->CTLR2 &= CTLR2_EXTTRIG_SWSTART_Reset;
     692:	fec42783          	lw	a5,-20(s0)
     696:	4798                	lw	a4,8(a5)
     698:	ffb007b7          	lui	a5,0xffb00
     69c:	17fd                	addi	a5,a5,-1
     69e:	8f7d                	and	a4,a4,a5
     6a0:	fec42783          	lw	a5,-20(s0)
     6a4:	c798                	sw	a4,8(a5)
}
     6a6:	0001                	nop
     6a8:	4472                	lw	s0,28(sp)
     6aa:	6105                	addi	sp,sp,32
     6ac:	8082                	ret

000006ae <ADC_GetSoftwareStartConvStatus>:
 *
 * @return  FlagStatus - SET or RESET.
 */

FlagStatus ADC_GetSoftwareStartConvStatus(ADC_TypeDef *ADCx)
{
     6ae:	7179                	addi	sp,sp,-48
     6b0:	d622                	sw	s0,44(sp)
     6b2:	1800                	addi	s0,sp,48
     6b4:	fca42e23          	sw	a0,-36(s0)
    FlagStatus bitstatus = RESET;
     6b8:	fe042623          	sw	zero,-20(s0)

    if((ADCx->CTLR2 & CTLR2_SWSTART_Set) != (uint32_t)RESET)
     6bc:	fdc42783          	lw	a5,-36(s0)
     6c0:	4798                	lw	a4,8(a5)
     6c2:	004007b7          	lui	a5,0x400
     6c6:	8ff9                	and	a5,a5,a4
     6c8:	c789                	beqz	a5,6d2 <ADC_GetSoftwareStartConvStatus+0x24>
    {
        bitstatus = SET;
     6ca:	4785                	li	a5,1
     6cc:	fef42623          	sw	a5,-20(s0)
     6d0:	a019                	j	6d6 <ADC_GetSoftwareStartConvStatus+0x28>
    }
    else
    {
        bitstatus = RESET;
     6d2:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
     6d6:	fec42783          	lw	a5,-20(s0)
}
     6da:	853e                	mv	a0,a5
     6dc:	5432                	lw	s0,44(sp)
     6de:	6145                	addi	sp,sp,48
     6e0:	8082                	ret

000006e2 <ADC_DiscModeChannelCountConfig>:
 *            count value(1-8).
 *
 * @return  None
 */
void ADC_DiscModeChannelCountConfig(ADC_TypeDef *ADCx, uint8_t Number)
{
     6e2:	7179                	addi	sp,sp,-48
     6e4:	d622                	sw	s0,44(sp)
     6e6:	1800                	addi	s0,sp,48
     6e8:	fca42e23          	sw	a0,-36(s0)
     6ec:	87ae                	mv	a5,a1
     6ee:	fcf40da3          	sb	a5,-37(s0)
    uint32_t tmpreg1 = 0;
     6f2:	fe042623          	sw	zero,-20(s0)
    uint32_t tmpreg2 = 0;
     6f6:	fe042423          	sw	zero,-24(s0)

    tmpreg1 = ADCx->CTLR1;
     6fa:	fdc42783          	lw	a5,-36(s0)
     6fe:	43dc                	lw	a5,4(a5)
     700:	fef42623          	sw	a5,-20(s0)
    tmpreg1 &= CTLR1_DISCNUM_Reset;
     704:	fec42703          	lw	a4,-20(s0)
     708:	77c9                	lui	a5,0xffff2
     70a:	17fd                	addi	a5,a5,-1
     70c:	8ff9                	and	a5,a5,a4
     70e:	fef42623          	sw	a5,-20(s0)
    tmpreg2 = Number - 1;
     712:	fdb44783          	lbu	a5,-37(s0)
     716:	17fd                	addi	a5,a5,-1
     718:	fef42423          	sw	a5,-24(s0)
    tmpreg1 |= tmpreg2 << 13;
     71c:	fe842783          	lw	a5,-24(s0)
     720:	07b6                	slli	a5,a5,0xd
     722:	fec42703          	lw	a4,-20(s0)
     726:	8fd9                	or	a5,a5,a4
     728:	fef42623          	sw	a5,-20(s0)
    ADCx->CTLR1 = tmpreg1;
     72c:	fdc42783          	lw	a5,-36(s0)
     730:	fec42703          	lw	a4,-20(s0)
     734:	c3d8                	sw	a4,4(a5)
}
     736:	0001                	nop
     738:	5432                	lw	s0,44(sp)
     73a:	6145                	addi	sp,sp,48
     73c:	8082                	ret

0000073e <ADC_DiscModeCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  None
 */
void ADC_DiscModeCmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
     73e:	1101                	addi	sp,sp,-32
     740:	ce22                	sw	s0,28(sp)
     742:	1000                	addi	s0,sp,32
     744:	fea42623          	sw	a0,-20(s0)
     748:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
     74c:	fe842783          	lw	a5,-24(s0)
     750:	cf81                	beqz	a5,768 <ADC_DiscModeCmd+0x2a>
    {
        ADCx->CTLR1 |= CTLR1_DISCEN_Set;
     752:	fec42783          	lw	a5,-20(s0)
     756:	43d8                	lw	a4,4(a5)
     758:	6785                	lui	a5,0x1
     75a:	80078793          	addi	a5,a5,-2048 # 800 <__stack_size>
     75e:	8f5d                	or	a4,a4,a5
     760:	fec42783          	lw	a5,-20(s0)
     764:	c3d8                	sw	a4,4(a5)
    }
    else
    {
        ADCx->CTLR1 &= CTLR1_DISCEN_Reset;
    }
}
     766:	a819                	j	77c <ADC_DiscModeCmd+0x3e>
        ADCx->CTLR1 &= CTLR1_DISCEN_Reset;
     768:	fec42783          	lw	a5,-20(s0)
     76c:	43d8                	lw	a4,4(a5)
     76e:	77fd                	lui	a5,0xfffff
     770:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
     774:	8f7d                	and	a4,a4,a5
     776:	fec42783          	lw	a5,-20(s0)
     77a:	c3d8                	sw	a4,4(a5)
}
     77c:	0001                	nop
     77e:	4472                	lw	s0,28(sp)
     780:	6105                	addi	sp,sp,32
     782:	8082                	ret

00000784 <ADC_RegularChannelConfig>:
 *            ADC_SampleTime_11Cycles - Sample time equal to 11 cycles.
 *
 * @return  None
 */
void ADC_RegularChannelConfig(ADC_TypeDef *ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime)
{
     784:	7179                	addi	sp,sp,-48
     786:	d622                	sw	s0,44(sp)
     788:	1800                	addi	s0,sp,48
     78a:	fca42e23          	sw	a0,-36(s0)
     78e:	87ae                	mv	a5,a1
     790:	8736                	mv	a4,a3
     792:	fcf40da3          	sb	a5,-37(s0)
     796:	87b2                	mv	a5,a2
     798:	fcf40d23          	sb	a5,-38(s0)
     79c:	87ba                	mv	a5,a4
     79e:	fcf40ca3          	sb	a5,-39(s0)
    uint32_t tmpreg1 = 0, tmpreg2 = 0;
     7a2:	fe042623          	sw	zero,-20(s0)
     7a6:	fe042423          	sw	zero,-24(s0)

    if(ADC_Channel > ADC_Channel_9)
     7aa:	fdb44703          	lbu	a4,-37(s0)
     7ae:	47a5                	li	a5,9
     7b0:	06e7f663          	bgeu	a5,a4,81c <__stack_size+0x1c>
    {
        tmpreg1 = ADCx->SAMPTR1;
     7b4:	fdc42783          	lw	a5,-36(s0)
     7b8:	47dc                	lw	a5,12(a5)
     7ba:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = SAMPTR1_SMP_Set << (3 * (ADC_Channel - 10));
     7be:	fdb44783          	lbu	a5,-37(s0)
     7c2:	ff678713          	addi	a4,a5,-10
     7c6:	87ba                	mv	a5,a4
     7c8:	0786                	slli	a5,a5,0x1
     7ca:	97ba                	add	a5,a5,a4
     7cc:	471d                	li	a4,7
     7ce:	00f717b3          	sll	a5,a4,a5
     7d2:	fef42423          	sw	a5,-24(s0)
        tmpreg1 &= ~tmpreg2;
     7d6:	fe842783          	lw	a5,-24(s0)
     7da:	fff7c793          	not	a5,a5
     7de:	fec42703          	lw	a4,-20(s0)
     7e2:	8ff9                	and	a5,a5,a4
     7e4:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = (uint32_t)ADC_SampleTime << (3 * (ADC_Channel - 10));
     7e8:	fd944683          	lbu	a3,-39(s0)
     7ec:	fdb44783          	lbu	a5,-37(s0)
     7f0:	ff678713          	addi	a4,a5,-10
     7f4:	87ba                	mv	a5,a4
     7f6:	0786                	slli	a5,a5,0x1
     7f8:	97ba                	add	a5,a5,a4
     7fa:	00f697b3          	sll	a5,a3,a5
     7fe:	fef42423          	sw	a5,-24(s0)
        tmpreg1 |= tmpreg2;
     802:	fec42703          	lw	a4,-20(s0)
     806:	fe842783          	lw	a5,-24(s0)
     80a:	8fd9                	or	a5,a5,a4
     80c:	fef42623          	sw	a5,-20(s0)
        ADCx->SAMPTR1 = tmpreg1;
     810:	fdc42783          	lw	a5,-36(s0)
     814:	fec42703          	lw	a4,-20(s0)
     818:	c7d8                	sw	a4,12(a5)
     81a:	a085                	j	87a <__stack_size+0x7a>
    }
    else
    {
        tmpreg1 = ADCx->SAMPTR2;
     81c:	fdc42783          	lw	a5,-36(s0)
     820:	4b9c                	lw	a5,16(a5)
     822:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = SAMPTR2_SMP_Set << (3 * ADC_Channel);
     826:	fdb44703          	lbu	a4,-37(s0)
     82a:	87ba                	mv	a5,a4
     82c:	0786                	slli	a5,a5,0x1
     82e:	97ba                	add	a5,a5,a4
     830:	471d                	li	a4,7
     832:	00f717b3          	sll	a5,a4,a5
     836:	fef42423          	sw	a5,-24(s0)
        tmpreg1 &= ~tmpreg2;
     83a:	fe842783          	lw	a5,-24(s0)
     83e:	fff7c793          	not	a5,a5
     842:	fec42703          	lw	a4,-20(s0)
     846:	8ff9                	and	a5,a5,a4
     848:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = (uint32_t)ADC_SampleTime << (3 * ADC_Channel);
     84c:	fd944683          	lbu	a3,-39(s0)
     850:	fdb44703          	lbu	a4,-37(s0)
     854:	87ba                	mv	a5,a4
     856:	0786                	slli	a5,a5,0x1
     858:	97ba                	add	a5,a5,a4
     85a:	00f697b3          	sll	a5,a3,a5
     85e:	fef42423          	sw	a5,-24(s0)
        tmpreg1 |= tmpreg2;
     862:	fec42703          	lw	a4,-20(s0)
     866:	fe842783          	lw	a5,-24(s0)
     86a:	8fd9                	or	a5,a5,a4
     86c:	fef42623          	sw	a5,-20(s0)
        ADCx->SAMPTR2 = tmpreg1;
     870:	fdc42783          	lw	a5,-36(s0)
     874:	fec42703          	lw	a4,-20(s0)
     878:	cb98                	sw	a4,16(a5)
    }

    if(Rank < 7)
     87a:	fda44703          	lbu	a4,-38(s0)
     87e:	4799                	li	a5,6
     880:	06e7e663          	bltu	a5,a4,8ec <__stack_size+0xec>
    {
        tmpreg1 = ADCx->RSQR3;
     884:	fdc42783          	lw	a5,-36(s0)
     888:	5bdc                	lw	a5,52(a5)
     88a:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = RSQR3_SQ_Set << (5 * (Rank - 1));
     88e:	fda44783          	lbu	a5,-38(s0)
     892:	fff78713          	addi	a4,a5,-1
     896:	87ba                	mv	a5,a4
     898:	078a                	slli	a5,a5,0x2
     89a:	97ba                	add	a5,a5,a4
     89c:	477d                	li	a4,31
     89e:	00f717b3          	sll	a5,a4,a5
     8a2:	fef42423          	sw	a5,-24(s0)
        tmpreg1 &= ~tmpreg2;
     8a6:	fe842783          	lw	a5,-24(s0)
     8aa:	fff7c793          	not	a5,a5
     8ae:	fec42703          	lw	a4,-20(s0)
     8b2:	8ff9                	and	a5,a5,a4
     8b4:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 1));
     8b8:	fdb44683          	lbu	a3,-37(s0)
     8bc:	fda44783          	lbu	a5,-38(s0)
     8c0:	fff78713          	addi	a4,a5,-1
     8c4:	87ba                	mv	a5,a4
     8c6:	078a                	slli	a5,a5,0x2
     8c8:	97ba                	add	a5,a5,a4
     8ca:	00f697b3          	sll	a5,a3,a5
     8ce:	fef42423          	sw	a5,-24(s0)
        tmpreg1 |= tmpreg2;
     8d2:	fec42703          	lw	a4,-20(s0)
     8d6:	fe842783          	lw	a5,-24(s0)
     8da:	8fd9                	or	a5,a5,a4
     8dc:	fef42623          	sw	a5,-20(s0)
        ADCx->RSQR3 = tmpreg1;
     8e0:	fdc42783          	lw	a5,-36(s0)
     8e4:	fec42703          	lw	a4,-20(s0)
     8e8:	dbd8                	sw	a4,52(a5)
        tmpreg1 &= ~tmpreg2;
        tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 13));
        tmpreg1 |= tmpreg2;
        ADCx->RSQR1 = tmpreg1;
    }
}
     8ea:	a8e9                	j	9c4 <__stack_size+0x1c4>
    else if(Rank < 13)
     8ec:	fda44703          	lbu	a4,-38(s0)
     8f0:	47b1                	li	a5,12
     8f2:	06e7e663          	bltu	a5,a4,95e <__stack_size+0x15e>
        tmpreg1 = ADCx->RSQR2;
     8f6:	fdc42783          	lw	a5,-36(s0)
     8fa:	5b9c                	lw	a5,48(a5)
     8fc:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = RSQR2_SQ_Set << (5 * (Rank - 7));
     900:	fda44783          	lbu	a5,-38(s0)
     904:	ff978713          	addi	a4,a5,-7
     908:	87ba                	mv	a5,a4
     90a:	078a                	slli	a5,a5,0x2
     90c:	97ba                	add	a5,a5,a4
     90e:	477d                	li	a4,31
     910:	00f717b3          	sll	a5,a4,a5
     914:	fef42423          	sw	a5,-24(s0)
        tmpreg1 &= ~tmpreg2;
     918:	fe842783          	lw	a5,-24(s0)
     91c:	fff7c793          	not	a5,a5
     920:	fec42703          	lw	a4,-20(s0)
     924:	8ff9                	and	a5,a5,a4
     926:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 7));
     92a:	fdb44683          	lbu	a3,-37(s0)
     92e:	fda44783          	lbu	a5,-38(s0)
     932:	ff978713          	addi	a4,a5,-7
     936:	87ba                	mv	a5,a4
     938:	078a                	slli	a5,a5,0x2
     93a:	97ba                	add	a5,a5,a4
     93c:	00f697b3          	sll	a5,a3,a5
     940:	fef42423          	sw	a5,-24(s0)
        tmpreg1 |= tmpreg2;
     944:	fec42703          	lw	a4,-20(s0)
     948:	fe842783          	lw	a5,-24(s0)
     94c:	8fd9                	or	a5,a5,a4
     94e:	fef42623          	sw	a5,-20(s0)
        ADCx->RSQR2 = tmpreg1;
     952:	fdc42783          	lw	a5,-36(s0)
     956:	fec42703          	lw	a4,-20(s0)
     95a:	db98                	sw	a4,48(a5)
}
     95c:	a0a5                	j	9c4 <__stack_size+0x1c4>
        tmpreg1 = ADCx->RSQR1;
     95e:	fdc42783          	lw	a5,-36(s0)
     962:	57dc                	lw	a5,44(a5)
     964:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = RSQR1_SQ_Set << (5 * (Rank - 13));
     968:	fda44783          	lbu	a5,-38(s0)
     96c:	ff378713          	addi	a4,a5,-13
     970:	87ba                	mv	a5,a4
     972:	078a                	slli	a5,a5,0x2
     974:	97ba                	add	a5,a5,a4
     976:	477d                	li	a4,31
     978:	00f717b3          	sll	a5,a4,a5
     97c:	fef42423          	sw	a5,-24(s0)
        tmpreg1 &= ~tmpreg2;
     980:	fe842783          	lw	a5,-24(s0)
     984:	fff7c793          	not	a5,a5
     988:	fec42703          	lw	a4,-20(s0)
     98c:	8ff9                	and	a5,a5,a4
     98e:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 13));
     992:	fdb44683          	lbu	a3,-37(s0)
     996:	fda44783          	lbu	a5,-38(s0)
     99a:	ff378713          	addi	a4,a5,-13
     99e:	87ba                	mv	a5,a4
     9a0:	078a                	slli	a5,a5,0x2
     9a2:	97ba                	add	a5,a5,a4
     9a4:	00f697b3          	sll	a5,a3,a5
     9a8:	fef42423          	sw	a5,-24(s0)
        tmpreg1 |= tmpreg2;
     9ac:	fec42703          	lw	a4,-20(s0)
     9b0:	fe842783          	lw	a5,-24(s0)
     9b4:	8fd9                	or	a5,a5,a4
     9b6:	fef42623          	sw	a5,-20(s0)
        ADCx->RSQR1 = tmpreg1;
     9ba:	fdc42783          	lw	a5,-36(s0)
     9be:	fec42703          	lw	a4,-20(s0)
     9c2:	d7d8                	sw	a4,44(a5)
}
     9c4:	0001                	nop
     9c6:	5432                	lw	s0,44(sp)
     9c8:	6145                	addi	sp,sp,48
     9ca:	8082                	ret

000009cc <ADC_ExternalTrigConvCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  None
 */
void ADC_ExternalTrigConvCmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
     9cc:	1101                	addi	sp,sp,-32
     9ce:	ce22                	sw	s0,28(sp)
     9d0:	1000                	addi	s0,sp,32
     9d2:	fea42623          	sw	a0,-20(s0)
     9d6:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
     9da:	fe842783          	lw	a5,-24(s0)
     9de:	cb99                	beqz	a5,9f4 <ADC_ExternalTrigConvCmd+0x28>
    {
        ADCx->CTLR2 |= CTLR2_EXTTRIG_Set;
     9e0:	fec42783          	lw	a5,-20(s0)
     9e4:	4798                	lw	a4,8(a5)
     9e6:	001007b7          	lui	a5,0x100
     9ea:	8f5d                	or	a4,a4,a5
     9ec:	fec42783          	lw	a5,-20(s0)
     9f0:	c798                	sw	a4,8(a5)
    }
    else
    {
        ADCx->CTLR2 &= CTLR2_EXTTRIG_Reset;
    }
}
     9f2:	a819                	j	a08 <ADC_ExternalTrigConvCmd+0x3c>
        ADCx->CTLR2 &= CTLR2_EXTTRIG_Reset;
     9f4:	fec42783          	lw	a5,-20(s0)
     9f8:	4798                	lw	a4,8(a5)
     9fa:	fff007b7          	lui	a5,0xfff00
     9fe:	17fd                	addi	a5,a5,-1
     a00:	8f7d                	and	a4,a4,a5
     a02:	fec42783          	lw	a5,-20(s0)
     a06:	c798                	sw	a4,8(a5)
}
     a08:	0001                	nop
     a0a:	4472                	lw	s0,28(sp)
     a0c:	6105                	addi	sp,sp,32
     a0e:	8082                	ret

00000a10 <ADC_GetConversionValue>:
 * @param   ADCx - where x can be 1 to select the ADC peripheral.
 *
 * @return  ADCx->RDATAR - The Data conversion value.
 */
uint16_t ADC_GetConversionValue(ADC_TypeDef *ADCx)
{
     a10:	1101                	addi	sp,sp,-32
     a12:	ce22                	sw	s0,28(sp)
     a14:	1000                	addi	s0,sp,32
     a16:	fea42623          	sw	a0,-20(s0)
    return (uint16_t)ADCx->RDATAR;
     a1a:	fec42783          	lw	a5,-20(s0)
     a1e:	47fc                	lw	a5,76(a5)
     a20:	07c2                	slli	a5,a5,0x10
     a22:	83c1                	srli	a5,a5,0x10
}
     a24:	853e                	mv	a0,a5
     a26:	4472                	lw	s0,28(sp)
     a28:	6105                	addi	sp,sp,32
     a2a:	8082                	ret

00000a2c <ADC_GetDualModeConversionValue>:
 * @brief   Returns the last ADC1 conversion result data in dual mode.
 *
 * @return  RDATAR_ADDRESS - The Data conversion value.
 */
uint32_t ADC_GetDualModeConversionValue(void)
{
     a2c:	1141                	addi	sp,sp,-16
     a2e:	c622                	sw	s0,12(sp)
     a30:	0800                	addi	s0,sp,16
    return (*(__IO uint32_t *)RDATAR_ADDRESS);
     a32:	400127b7          	lui	a5,0x40012
     a36:	44c78793          	addi	a5,a5,1100 # 4001244c <_eusrstack+0x2000e44c>
     a3a:	439c                	lw	a5,0(a5)
}
     a3c:	853e                	mv	a0,a5
     a3e:	4432                	lw	s0,12(sp)
     a40:	0141                	addi	sp,sp,16
     a42:	8082                	ret

00000a44 <ADC_AutoInjectedConvCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  None
 */
void ADC_AutoInjectedConvCmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
     a44:	1101                	addi	sp,sp,-32
     a46:	ce22                	sw	s0,28(sp)
     a48:	1000                	addi	s0,sp,32
     a4a:	fea42623          	sw	a0,-20(s0)
     a4e:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
     a52:	fe842783          	lw	a5,-24(s0)
     a56:	cb91                	beqz	a5,a6a <ADC_AutoInjectedConvCmd+0x26>
    {
        ADCx->CTLR1 |= CTLR1_JAUTO_Set;
     a58:	fec42783          	lw	a5,-20(s0)
     a5c:	43dc                	lw	a5,4(a5)
     a5e:	4007e713          	ori	a4,a5,1024
     a62:	fec42783          	lw	a5,-20(s0)
     a66:	c3d8                	sw	a4,4(a5)
    }
    else
    {
        ADCx->CTLR1 &= CTLR1_JAUTO_Reset;
    }
}
     a68:	a809                	j	a7a <ADC_AutoInjectedConvCmd+0x36>
        ADCx->CTLR1 &= CTLR1_JAUTO_Reset;
     a6a:	fec42783          	lw	a5,-20(s0)
     a6e:	43dc                	lw	a5,4(a5)
     a70:	bff7f713          	andi	a4,a5,-1025
     a74:	fec42783          	lw	a5,-20(s0)
     a78:	c3d8                	sw	a4,4(a5)
}
     a7a:	0001                	nop
     a7c:	4472                	lw	s0,28(sp)
     a7e:	6105                	addi	sp,sp,32
     a80:	8082                	ret

00000a82 <ADC_InjectedDiscModeCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  None
 */
void ADC_InjectedDiscModeCmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
     a82:	1101                	addi	sp,sp,-32
     a84:	ce22                	sw	s0,28(sp)
     a86:	1000                	addi	s0,sp,32
     a88:	fea42623          	sw	a0,-20(s0)
     a8c:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
     a90:	fe842783          	lw	a5,-24(s0)
     a94:	cb91                	beqz	a5,aa8 <ADC_InjectedDiscModeCmd+0x26>
    {
        ADCx->CTLR1 |= CTLR1_JDISCEN_Set;
     a96:	fec42783          	lw	a5,-20(s0)
     a9a:	43d8                	lw	a4,4(a5)
     a9c:	6785                	lui	a5,0x1
     a9e:	8f5d                	or	a4,a4,a5
     aa0:	fec42783          	lw	a5,-20(s0)
     aa4:	c3d8                	sw	a4,4(a5)
    }
    else
    {
        ADCx->CTLR1 &= CTLR1_JDISCEN_Reset;
    }
}
     aa6:	a811                	j	aba <ADC_InjectedDiscModeCmd+0x38>
        ADCx->CTLR1 &= CTLR1_JDISCEN_Reset;
     aa8:	fec42783          	lw	a5,-20(s0)
     aac:	43d8                	lw	a4,4(a5)
     aae:	77fd                	lui	a5,0xfffff
     ab0:	17fd                	addi	a5,a5,-1
     ab2:	8f7d                	and	a4,a4,a5
     ab4:	fec42783          	lw	a5,-20(s0)
     ab8:	c3d8                	sw	a4,4(a5)
}
     aba:	0001                	nop
     abc:	4472                	lw	s0,28(sp)
     abe:	6105                	addi	sp,sp,32
     ac0:	8082                	ret

00000ac2 <ADC_ExternalTrigInjectedConvConfig>:
 *        by software and not by external trigger.
 *
 * @return  None
 */
void ADC_ExternalTrigInjectedConvConfig(ADC_TypeDef *ADCx, uint32_t ADC_ExternalTrigInjecConv)
{
     ac2:	7179                	addi	sp,sp,-48
     ac4:	d622                	sw	s0,44(sp)
     ac6:	1800                	addi	s0,sp,48
     ac8:	fca42e23          	sw	a0,-36(s0)
     acc:	fcb42c23          	sw	a1,-40(s0)
    uint32_t tmpreg = 0;
     ad0:	fe042623          	sw	zero,-20(s0)

    tmpreg = ADCx->CTLR2;
     ad4:	fdc42783          	lw	a5,-36(s0)
     ad8:	479c                	lw	a5,8(a5)
     ada:	fef42623          	sw	a5,-20(s0)
    tmpreg &= CTLR2_JEXTSEL_Reset;
     ade:	fec42703          	lw	a4,-20(s0)
     ae2:	77e5                	lui	a5,0xffff9
     ae4:	17fd                	addi	a5,a5,-1
     ae6:	8ff9                	and	a5,a5,a4
     ae8:	fef42623          	sw	a5,-20(s0)
    tmpreg |= ADC_ExternalTrigInjecConv;
     aec:	fec42703          	lw	a4,-20(s0)
     af0:	fd842783          	lw	a5,-40(s0)
     af4:	8fd9                	or	a5,a5,a4
     af6:	fef42623          	sw	a5,-20(s0)
    ADCx->CTLR2 = tmpreg;
     afa:	fdc42783          	lw	a5,-36(s0)
     afe:	fec42703          	lw	a4,-20(s0)
     b02:	c798                	sw	a4,8(a5)
}
     b04:	0001                	nop
     b06:	5432                	lw	s0,44(sp)
     b08:	6145                	addi	sp,sp,48
     b0a:	8082                	ret

00000b0c <ADC_ExternalTrigInjectedConvCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  None
 */
void ADC_ExternalTrigInjectedConvCmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
     b0c:	1101                	addi	sp,sp,-32
     b0e:	ce22                	sw	s0,28(sp)
     b10:	1000                	addi	s0,sp,32
     b12:	fea42623          	sw	a0,-20(s0)
     b16:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
     b1a:	fe842783          	lw	a5,-24(s0)
     b1e:	cb91                	beqz	a5,b32 <ADC_ExternalTrigInjectedConvCmd+0x26>
    {
        ADCx->CTLR2 |= CTLR2_JEXTTRIG_Set;
     b20:	fec42783          	lw	a5,-20(s0)
     b24:	4798                	lw	a4,8(a5)
     b26:	67a1                	lui	a5,0x8
     b28:	8f5d                	or	a4,a4,a5
     b2a:	fec42783          	lw	a5,-20(s0)
     b2e:	c798                	sw	a4,8(a5)
    }
    else
    {
        ADCx->CTLR2 &= CTLR2_JEXTTRIG_Reset;
    }
}
     b30:	a811                	j	b44 <ADC_ExternalTrigInjectedConvCmd+0x38>
        ADCx->CTLR2 &= CTLR2_JEXTTRIG_Reset;
     b32:	fec42783          	lw	a5,-20(s0)
     b36:	4798                	lw	a4,8(a5)
     b38:	77e1                	lui	a5,0xffff8
     b3a:	17fd                	addi	a5,a5,-1
     b3c:	8f7d                	and	a4,a4,a5
     b3e:	fec42783          	lw	a5,-20(s0)
     b42:	c798                	sw	a4,8(a5)
}
     b44:	0001                	nop
     b46:	4472                	lw	s0,28(sp)
     b48:	6105                	addi	sp,sp,32
     b4a:	8082                	ret

00000b4c <ADC_SoftwareStartInjectedConvCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  None
 */
void ADC_SoftwareStartInjectedConvCmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
     b4c:	1101                	addi	sp,sp,-32
     b4e:	ce22                	sw	s0,28(sp)
     b50:	1000                	addi	s0,sp,32
     b52:	fea42623          	sw	a0,-20(s0)
     b56:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
     b5a:	fe842783          	lw	a5,-24(s0)
     b5e:	cb99                	beqz	a5,b74 <ADC_SoftwareStartInjectedConvCmd+0x28>
    {
        ADCx->CTLR2 |= CTLR2_JEXTTRIG_JSWSTART_Set;
     b60:	fec42783          	lw	a5,-20(s0)
     b64:	4798                	lw	a4,8(a5)
     b66:	002087b7          	lui	a5,0x208
     b6a:	8f5d                	or	a4,a4,a5
     b6c:	fec42783          	lw	a5,-20(s0)
     b70:	c798                	sw	a4,8(a5)
    }
    else
    {
        ADCx->CTLR2 &= CTLR2_JEXTTRIG_JSWSTART_Reset;
    }
}
     b72:	a819                	j	b88 <ADC_SoftwareStartInjectedConvCmd+0x3c>
        ADCx->CTLR2 &= CTLR2_JEXTTRIG_JSWSTART_Reset;
     b74:	fec42783          	lw	a5,-20(s0)
     b78:	4798                	lw	a4,8(a5)
     b7a:	ffdf87b7          	lui	a5,0xffdf8
     b7e:	17fd                	addi	a5,a5,-1
     b80:	8f7d                	and	a4,a4,a5
     b82:	fec42783          	lw	a5,-20(s0)
     b86:	c798                	sw	a4,8(a5)
}
     b88:	0001                	nop
     b8a:	4472                	lw	s0,28(sp)
     b8c:	6105                	addi	sp,sp,32
     b8e:	8082                	ret

00000b90 <ADC_GetSoftwareStartInjectedConvCmdStatus>:
 * @param   ADCx - where x can be 1 to select the ADC peripheral.
 *
 * @return  FlagStatus: SET or RESET.
 */
FlagStatus ADC_GetSoftwareStartInjectedConvCmdStatus(ADC_TypeDef *ADCx)
{
     b90:	7179                	addi	sp,sp,-48
     b92:	d622                	sw	s0,44(sp)
     b94:	1800                	addi	s0,sp,48
     b96:	fca42e23          	sw	a0,-36(s0)
    FlagStatus bitstatus = RESET;
     b9a:	fe042623          	sw	zero,-20(s0)

    if((ADCx->CTLR2 & CTLR2_JSWSTART_Set) != (uint32_t)RESET)
     b9e:	fdc42783          	lw	a5,-36(s0)
     ba2:	4798                	lw	a4,8(a5)
     ba4:	002007b7          	lui	a5,0x200
     ba8:	8ff9                	and	a5,a5,a4
     baa:	c789                	beqz	a5,bb4 <ADC_GetSoftwareStartInjectedConvCmdStatus+0x24>
    {
        bitstatus = SET;
     bac:	4785                	li	a5,1
     bae:	fef42623          	sw	a5,-20(s0)
     bb2:	a019                	j	bb8 <ADC_GetSoftwareStartInjectedConvCmdStatus+0x28>
    }
    else
    {
        bitstatus = RESET;
     bb4:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
     bb8:	fec42783          	lw	a5,-20(s0)
}
     bbc:	853e                	mv	a0,a5
     bbe:	5432                	lw	s0,44(sp)
     bc0:	6145                	addi	sp,sp,48
     bc2:	8082                	ret

00000bc4 <ADC_InjectedChannelConfig>:
 *            ADC_SampleTime_11Cycles - Sample time equal to 11 cycles.
 *
 * @return  None
 */
void ADC_InjectedChannelConfig(ADC_TypeDef *ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime)
{
     bc4:	7179                	addi	sp,sp,-48
     bc6:	d622                	sw	s0,44(sp)
     bc8:	1800                	addi	s0,sp,48
     bca:	fca42e23          	sw	a0,-36(s0)
     bce:	87ae                	mv	a5,a1
     bd0:	8736                	mv	a4,a3
     bd2:	fcf40da3          	sb	a5,-37(s0)
     bd6:	87b2                	mv	a5,a2
     bd8:	fcf40d23          	sb	a5,-38(s0)
     bdc:	87ba                	mv	a5,a4
     bde:	fcf40ca3          	sb	a5,-39(s0)
    uint32_t tmpreg1 = 0, tmpreg2 = 0, tmpreg3 = 0;
     be2:	fe042623          	sw	zero,-20(s0)
     be6:	fe042423          	sw	zero,-24(s0)
     bea:	fe042223          	sw	zero,-28(s0)

    if(ADC_Channel > ADC_Channel_9)
     bee:	fdb44703          	lbu	a4,-37(s0)
     bf2:	47a5                	li	a5,9
     bf4:	06e7f663          	bgeu	a5,a4,c60 <ADC_InjectedChannelConfig+0x9c>
    {
        tmpreg1 = ADCx->SAMPTR1;
     bf8:	fdc42783          	lw	a5,-36(s0)
     bfc:	47dc                	lw	a5,12(a5)
     bfe:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = SAMPTR1_SMP_Set << (3 * (ADC_Channel - 10));
     c02:	fdb44783          	lbu	a5,-37(s0)
     c06:	ff678713          	addi	a4,a5,-10 # 1ffff6 <_data_lma+0x1f3d42>
     c0a:	87ba                	mv	a5,a4
     c0c:	0786                	slli	a5,a5,0x1
     c0e:	97ba                	add	a5,a5,a4
     c10:	471d                	li	a4,7
     c12:	00f717b3          	sll	a5,a4,a5
     c16:	fef42423          	sw	a5,-24(s0)
        tmpreg1 &= ~tmpreg2;
     c1a:	fe842783          	lw	a5,-24(s0)
     c1e:	fff7c793          	not	a5,a5
     c22:	fec42703          	lw	a4,-20(s0)
     c26:	8ff9                	and	a5,a5,a4
     c28:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = (uint32_t)ADC_SampleTime << (3 * (ADC_Channel - 10));
     c2c:	fd944683          	lbu	a3,-39(s0)
     c30:	fdb44783          	lbu	a5,-37(s0)
     c34:	ff678713          	addi	a4,a5,-10
     c38:	87ba                	mv	a5,a4
     c3a:	0786                	slli	a5,a5,0x1
     c3c:	97ba                	add	a5,a5,a4
     c3e:	00f697b3          	sll	a5,a3,a5
     c42:	fef42423          	sw	a5,-24(s0)
        tmpreg1 |= tmpreg2;
     c46:	fec42703          	lw	a4,-20(s0)
     c4a:	fe842783          	lw	a5,-24(s0)
     c4e:	8fd9                	or	a5,a5,a4
     c50:	fef42623          	sw	a5,-20(s0)
        ADCx->SAMPTR1 = tmpreg1;
     c54:	fdc42783          	lw	a5,-36(s0)
     c58:	fec42703          	lw	a4,-20(s0)
     c5c:	c7d8                	sw	a4,12(a5)
     c5e:	a085                	j	cbe <ADC_InjectedChannelConfig+0xfa>
    }
    else
    {
        tmpreg1 = ADCx->SAMPTR2;
     c60:	fdc42783          	lw	a5,-36(s0)
     c64:	4b9c                	lw	a5,16(a5)
     c66:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = SAMPTR2_SMP_Set << (3 * ADC_Channel);
     c6a:	fdb44703          	lbu	a4,-37(s0)
     c6e:	87ba                	mv	a5,a4
     c70:	0786                	slli	a5,a5,0x1
     c72:	97ba                	add	a5,a5,a4
     c74:	471d                	li	a4,7
     c76:	00f717b3          	sll	a5,a4,a5
     c7a:	fef42423          	sw	a5,-24(s0)
        tmpreg1 &= ~tmpreg2;
     c7e:	fe842783          	lw	a5,-24(s0)
     c82:	fff7c793          	not	a5,a5
     c86:	fec42703          	lw	a4,-20(s0)
     c8a:	8ff9                	and	a5,a5,a4
     c8c:	fef42623          	sw	a5,-20(s0)
        tmpreg2 = (uint32_t)ADC_SampleTime << (3 * ADC_Channel);
     c90:	fd944683          	lbu	a3,-39(s0)
     c94:	fdb44703          	lbu	a4,-37(s0)
     c98:	87ba                	mv	a5,a4
     c9a:	0786                	slli	a5,a5,0x1
     c9c:	97ba                	add	a5,a5,a4
     c9e:	00f697b3          	sll	a5,a3,a5
     ca2:	fef42423          	sw	a5,-24(s0)
        tmpreg1 |= tmpreg2;
     ca6:	fec42703          	lw	a4,-20(s0)
     caa:	fe842783          	lw	a5,-24(s0)
     cae:	8fd9                	or	a5,a5,a4
     cb0:	fef42623          	sw	a5,-20(s0)
        ADCx->SAMPTR2 = tmpreg1;
     cb4:	fdc42783          	lw	a5,-36(s0)
     cb8:	fec42703          	lw	a4,-20(s0)
     cbc:	cb98                	sw	a4,16(a5)
    }

    tmpreg1 = ADCx->ISQR;
     cbe:	fdc42783          	lw	a5,-36(s0)
     cc2:	5f9c                	lw	a5,56(a5)
     cc4:	fef42623          	sw	a5,-20(s0)
    tmpreg3 = (tmpreg1 & ISQR_JL_Set) >> 20;
     cc8:	fec42783          	lw	a5,-20(s0)
     ccc:	83d1                	srli	a5,a5,0x14
     cce:	8b8d                	andi	a5,a5,3
     cd0:	fef42223          	sw	a5,-28(s0)
    tmpreg2 = ISQR_JSQ_Set << (5 * (uint8_t)((Rank + 3) - (tmpreg3 + 1)));
     cd4:	fe442783          	lw	a5,-28(s0)
     cd8:	0ff7f793          	andi	a5,a5,255
     cdc:	fda44703          	lbu	a4,-38(s0)
     ce0:	40f707b3          	sub	a5,a4,a5
     ce4:	0ff7f793          	andi	a5,a5,255
     ce8:	0789                	addi	a5,a5,2
     cea:	0ff7f793          	andi	a5,a5,255
     cee:	873e                	mv	a4,a5
     cf0:	87ba                	mv	a5,a4
     cf2:	078a                	slli	a5,a5,0x2
     cf4:	97ba                	add	a5,a5,a4
     cf6:	477d                	li	a4,31
     cf8:	00f717b3          	sll	a5,a4,a5
     cfc:	fef42423          	sw	a5,-24(s0)
    tmpreg1 &= ~tmpreg2;
     d00:	fe842783          	lw	a5,-24(s0)
     d04:	fff7c793          	not	a5,a5
     d08:	fec42703          	lw	a4,-20(s0)
     d0c:	8ff9                	and	a5,a5,a4
     d0e:	fef42623          	sw	a5,-20(s0)
    tmpreg2 = (uint32_t)ADC_Channel << (5 * (uint8_t)((Rank + 3) - (tmpreg3 + 1)));
     d12:	fdb44703          	lbu	a4,-37(s0)
     d16:	fe442783          	lw	a5,-28(s0)
     d1a:	0ff7f793          	andi	a5,a5,255
     d1e:	fda44683          	lbu	a3,-38(s0)
     d22:	40f687b3          	sub	a5,a3,a5
     d26:	0ff7f793          	andi	a5,a5,255
     d2a:	0789                	addi	a5,a5,2
     d2c:	0ff7f793          	andi	a5,a5,255
     d30:	86be                	mv	a3,a5
     d32:	87b6                	mv	a5,a3
     d34:	078a                	slli	a5,a5,0x2
     d36:	97b6                	add	a5,a5,a3
     d38:	00f717b3          	sll	a5,a4,a5
     d3c:	fef42423          	sw	a5,-24(s0)
    tmpreg1 |= tmpreg2;
     d40:	fec42703          	lw	a4,-20(s0)
     d44:	fe842783          	lw	a5,-24(s0)
     d48:	8fd9                	or	a5,a5,a4
     d4a:	fef42623          	sw	a5,-20(s0)
    ADCx->ISQR = tmpreg1;
     d4e:	fdc42783          	lw	a5,-36(s0)
     d52:	fec42703          	lw	a4,-20(s0)
     d56:	df98                	sw	a4,56(a5)
}
     d58:	0001                	nop
     d5a:	5432                	lw	s0,44(sp)
     d5c:	6145                	addi	sp,sp,48
     d5e:	8082                	ret

00000d60 <ADC_InjectedSequencerLengthConfig>:
 *            This parameter must be a number between 1 to 4.
 *
 * @return  None
 */
void ADC_InjectedSequencerLengthConfig(ADC_TypeDef *ADCx, uint8_t Length)
{
     d60:	7179                	addi	sp,sp,-48
     d62:	d622                	sw	s0,44(sp)
     d64:	1800                	addi	s0,sp,48
     d66:	fca42e23          	sw	a0,-36(s0)
     d6a:	87ae                	mv	a5,a1
     d6c:	fcf40da3          	sb	a5,-37(s0)
    uint32_t tmpreg1 = 0;
     d70:	fe042623          	sw	zero,-20(s0)
    uint32_t tmpreg2 = 0;
     d74:	fe042423          	sw	zero,-24(s0)

    tmpreg1 = ADCx->ISQR;
     d78:	fdc42783          	lw	a5,-36(s0)
     d7c:	5f9c                	lw	a5,56(a5)
     d7e:	fef42623          	sw	a5,-20(s0)
    tmpreg1 &= ISQR_JL_Reset;
     d82:	fec42703          	lw	a4,-20(s0)
     d86:	ffd007b7          	lui	a5,0xffd00
     d8a:	17fd                	addi	a5,a5,-1
     d8c:	8ff9                	and	a5,a5,a4
     d8e:	fef42623          	sw	a5,-20(s0)
    tmpreg2 = Length - 1;
     d92:	fdb44783          	lbu	a5,-37(s0)
     d96:	17fd                	addi	a5,a5,-1
     d98:	fef42423          	sw	a5,-24(s0)
    tmpreg1 |= tmpreg2 << 20;
     d9c:	fe842783          	lw	a5,-24(s0)
     da0:	07d2                	slli	a5,a5,0x14
     da2:	fec42703          	lw	a4,-20(s0)
     da6:	8fd9                	or	a5,a5,a4
     da8:	fef42623          	sw	a5,-20(s0)
    ADCx->ISQR = tmpreg1;
     dac:	fdc42783          	lw	a5,-36(s0)
     db0:	fec42703          	lw	a4,-20(s0)
     db4:	df98                	sw	a4,56(a5)
}
     db6:	0001                	nop
     db8:	5432                	lw	s0,44(sp)
     dba:	6145                	addi	sp,sp,48
     dbc:	8082                	ret

00000dbe <ADC_SetInjectedOffset>:
 *            This parameter must be a 12bit value.
 *
 * @return  None
 */
void ADC_SetInjectedOffset(ADC_TypeDef *ADCx, uint8_t ADC_InjectedChannel, uint16_t Offset)
{
     dbe:	7179                	addi	sp,sp,-48
     dc0:	d622                	sw	s0,44(sp)
     dc2:	1800                	addi	s0,sp,48
     dc4:	fca42e23          	sw	a0,-36(s0)
     dc8:	87ae                	mv	a5,a1
     dca:	8732                	mv	a4,a2
     dcc:	fcf40da3          	sb	a5,-37(s0)
     dd0:	87ba                	mv	a5,a4
     dd2:	fcf41c23          	sh	a5,-40(s0)
    __IO uint32_t tmp = 0;
     dd6:	fe042623          	sw	zero,-20(s0)

    tmp = (uint32_t)ADCx;
     dda:	fdc42783          	lw	a5,-36(s0)
     dde:	fef42623          	sw	a5,-20(s0)
    tmp += ADC_InjectedChannel;
     de2:	fdb44703          	lbu	a4,-37(s0)
     de6:	fec42783          	lw	a5,-20(s0)
     dea:	97ba                	add	a5,a5,a4
     dec:	fef42623          	sw	a5,-20(s0)

    *(__IO uint32_t *)tmp = (uint32_t)Offset;
     df0:	fec42783          	lw	a5,-20(s0)
     df4:	873e                	mv	a4,a5
     df6:	fd845783          	lhu	a5,-40(s0)
     dfa:	c31c                	sw	a5,0(a4)
}
     dfc:	0001                	nop
     dfe:	5432                	lw	s0,44(sp)
     e00:	6145                	addi	sp,sp,48
     e02:	8082                	ret

00000e04 <ADC_GetInjectedConversionValue>:
 *            ADC_InjectedChannel_4 - Injected Channel4 selected.
 *
 * @return  tmp - The Data conversion value.
 */
uint16_t ADC_GetInjectedConversionValue(ADC_TypeDef *ADCx, uint8_t ADC_InjectedChannel)
{
     e04:	7179                	addi	sp,sp,-48
     e06:	d622                	sw	s0,44(sp)
     e08:	1800                	addi	s0,sp,48
     e0a:	fca42e23          	sw	a0,-36(s0)
     e0e:	87ae                	mv	a5,a1
     e10:	fcf40da3          	sb	a5,-37(s0)
    __IO uint32_t tmp = 0;
     e14:	fe042623          	sw	zero,-20(s0)

    tmp = (uint32_t)ADCx;
     e18:	fdc42783          	lw	a5,-36(s0)
     e1c:	fef42623          	sw	a5,-20(s0)
    tmp += ADC_InjectedChannel + IDATAR_Offset;
     e20:	fdb44703          	lbu	a4,-37(s0)
     e24:	fec42783          	lw	a5,-20(s0)
     e28:	97ba                	add	a5,a5,a4
     e2a:	02878793          	addi	a5,a5,40 # ffd00028 <_eusrstack+0xdfcfc028>
     e2e:	fef42623          	sw	a5,-20(s0)

    return (uint16_t)(*(__IO uint32_t *)tmp);
     e32:	fec42783          	lw	a5,-20(s0)
     e36:	439c                	lw	a5,0(a5)
     e38:	07c2                	slli	a5,a5,0x10
     e3a:	83c1                	srli	a5,a5,0x10
}
     e3c:	853e                	mv	a0,a5
     e3e:	5432                	lw	s0,44(sp)
     e40:	6145                	addi	sp,sp,48
     e42:	8082                	ret

00000e44 <ADC_AnalogWatchdogCmd>:
 *        watchdog.
 *
 * @return  none
 */
void ADC_AnalogWatchdogCmd(ADC_TypeDef *ADCx, uint32_t ADC_AnalogWatchdog)
{
     e44:	7179                	addi	sp,sp,-48
     e46:	d622                	sw	s0,44(sp)
     e48:	1800                	addi	s0,sp,48
     e4a:	fca42e23          	sw	a0,-36(s0)
     e4e:	fcb42c23          	sw	a1,-40(s0)
    uint32_t tmpreg = 0;
     e52:	fe042623          	sw	zero,-20(s0)

    tmpreg = ADCx->CTLR1;
     e56:	fdc42783          	lw	a5,-36(s0)
     e5a:	43dc                	lw	a5,4(a5)
     e5c:	fef42623          	sw	a5,-20(s0)
    tmpreg &= CTLR1_AWDMode_Reset;
     e60:	fec42703          	lw	a4,-20(s0)
     e64:	ff4007b7          	lui	a5,0xff400
     e68:	dff78793          	addi	a5,a5,-513 # ff3ffdff <_eusrstack+0xdf3fbdff>
     e6c:	8ff9                	and	a5,a5,a4
     e6e:	fef42623          	sw	a5,-20(s0)
    tmpreg |= ADC_AnalogWatchdog;
     e72:	fec42703          	lw	a4,-20(s0)
     e76:	fd842783          	lw	a5,-40(s0)
     e7a:	8fd9                	or	a5,a5,a4
     e7c:	fef42623          	sw	a5,-20(s0)
    ADCx->CTLR1 = tmpreg;
     e80:	fdc42783          	lw	a5,-36(s0)
     e84:	fec42703          	lw	a4,-20(s0)
     e88:	c3d8                	sw	a4,4(a5)
}
     e8a:	0001                	nop
     e8c:	5432                	lw	s0,44(sp)
     e8e:	6145                	addi	sp,sp,48
     e90:	8082                	ret

00000e92 <ADC_AnalogWatchdogThresholdsConfig>:
 *
 * @return  none
 */
void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef *ADCx, uint16_t HighThreshold,
                                        uint16_t LowThreshold)
{
     e92:	1101                	addi	sp,sp,-32
     e94:	ce22                	sw	s0,28(sp)
     e96:	1000                	addi	s0,sp,32
     e98:	fea42623          	sw	a0,-20(s0)
     e9c:	87ae                	mv	a5,a1
     e9e:	8732                	mv	a4,a2
     ea0:	fef41523          	sh	a5,-22(s0)
     ea4:	87ba                	mv	a5,a4
     ea6:	fef41423          	sh	a5,-24(s0)
    ADCx->WDHTR = HighThreshold;
     eaa:	fea45703          	lhu	a4,-22(s0)
     eae:	fec42783          	lw	a5,-20(s0)
     eb2:	d3d8                	sw	a4,36(a5)
    ADCx->WDLTR = LowThreshold;
     eb4:	fe845703          	lhu	a4,-24(s0)
     eb8:	fec42783          	lw	a5,-20(s0)
     ebc:	d798                	sw	a4,40(a5)
}
     ebe:	0001                	nop
     ec0:	4472                	lw	s0,28(sp)
     ec2:	6105                	addi	sp,sp,32
     ec4:	8082                	ret

00000ec6 <ADC_AnalogWatchdog1ThresholdsConfig>:
 *
 * @return  none
 */
void ADC_AnalogWatchdog1ThresholdsConfig(ADC_TypeDef *ADCx, uint16_t HighThreshold,
                                        uint16_t LowThreshold)
{
     ec6:	1101                	addi	sp,sp,-32
     ec8:	ce22                	sw	s0,28(sp)
     eca:	1000                	addi	s0,sp,32
     ecc:	fea42623          	sw	a0,-20(s0)
     ed0:	87ae                	mv	a5,a1
     ed2:	8732                	mv	a4,a2
     ed4:	fef41523          	sh	a5,-22(s0)
     ed8:	87ba                	mv	a5,a4
     eda:	fef41423          	sh	a5,-24(s0)
    ADCx->WDTR1 = (uint32_t)HighThreshold<<16;
     ede:	fea45783          	lhu	a5,-22(s0)
     ee2:	01079713          	slli	a4,a5,0x10
     ee6:	fec42783          	lw	a5,-20(s0)
     eea:	cbf8                	sw	a4,84(a5)
    ADCx->WDTR1 |= (uint32_t)LowThreshold;
     eec:	fec42783          	lw	a5,-20(s0)
     ef0:	4bf8                	lw	a4,84(a5)
     ef2:	fe845783          	lhu	a5,-24(s0)
     ef6:	8f5d                	or	a4,a4,a5
     ef8:	fec42783          	lw	a5,-20(s0)
     efc:	cbf8                	sw	a4,84(a5)
}
     efe:	0001                	nop
     f00:	4472                	lw	s0,28(sp)
     f02:	6105                	addi	sp,sp,32
     f04:	8082                	ret

00000f06 <ADC_AnalogWatchdog2ThresholdsConfig>:
 *
 * @return  none
 */
void ADC_AnalogWatchdog2ThresholdsConfig(ADC_TypeDef *ADCx, uint16_t HighThreshold,
                                        uint16_t LowThreshold)
{
     f06:	1101                	addi	sp,sp,-32
     f08:	ce22                	sw	s0,28(sp)
     f0a:	1000                	addi	s0,sp,32
     f0c:	fea42623          	sw	a0,-20(s0)
     f10:	87ae                	mv	a5,a1
     f12:	8732                	mv	a4,a2
     f14:	fef41523          	sh	a5,-22(s0)
     f18:	87ba                	mv	a5,a4
     f1a:	fef41423          	sh	a5,-24(s0)
    ADCx->WDTR2 = (uint32_t)HighThreshold<<16;
     f1e:	fea45783          	lhu	a5,-22(s0)
     f22:	01079713          	slli	a4,a5,0x10
     f26:	fec42783          	lw	a5,-20(s0)
     f2a:	cfb8                	sw	a4,88(a5)
    ADCx->WDTR2 |= (uint32_t)LowThreshold;
     f2c:	fec42783          	lw	a5,-20(s0)
     f30:	4fb8                	lw	a4,88(a5)
     f32:	fe845783          	lhu	a5,-24(s0)
     f36:	8f5d                	or	a4,a4,a5
     f38:	fec42783          	lw	a5,-20(s0)
     f3c:	cfb8                	sw	a4,88(a5)
}
     f3e:	0001                	nop
     f40:	4472                	lw	s0,28(sp)
     f42:	6105                	addi	sp,sp,32
     f44:	8082                	ret

00000f46 <ADC_AnalogWatchdog3ThresholdsConfig>:
 *
 * @return  none
 */
void ADC_AnalogWatchdog3ThresholdsConfig(ADC_TypeDef *ADCx, uint16_t HighThreshold,
                                        uint16_t LowThreshold)
{
     f46:	1101                	addi	sp,sp,-32
     f48:	ce22                	sw	s0,28(sp)
     f4a:	1000                	addi	s0,sp,32
     f4c:	fea42623          	sw	a0,-20(s0)
     f50:	87ae                	mv	a5,a1
     f52:	8732                	mv	a4,a2
     f54:	fef41523          	sh	a5,-22(s0)
     f58:	87ba                	mv	a5,a4
     f5a:	fef41423          	sh	a5,-24(s0)
    ADCx->WDTR3 = (uint32_t)HighThreshold<<16;
     f5e:	fea45783          	lhu	a5,-22(s0)
     f62:	01079713          	slli	a4,a5,0x10
     f66:	fec42783          	lw	a5,-20(s0)
     f6a:	cff8                	sw	a4,92(a5)
    ADCx->WDTR3 |= (uint32_t)LowThreshold;
     f6c:	fec42783          	lw	a5,-20(s0)
     f70:	4ff8                	lw	a4,92(a5)
     f72:	fe845783          	lhu	a5,-24(s0)
     f76:	8f5d                	or	a4,a4,a5
     f78:	fec42783          	lw	a5,-20(s0)
     f7c:	cff8                	sw	a4,92(a5)
}
     f7e:	0001                	nop
     f80:	4472                	lw	s0,28(sp)
     f82:	6105                	addi	sp,sp,32
     f84:	8082                	ret

00000f86 <ADC_AnalogWatchdogSingleChannelConfig>:
 *            ADC_Channel_15 - ADC Channel15 selected.
 *
 * @return  None
 */
void ADC_AnalogWatchdogSingleChannelConfig(ADC_TypeDef *ADCx, uint8_t ADC_Channel)
{
     f86:	7179                	addi	sp,sp,-48
     f88:	d622                	sw	s0,44(sp)
     f8a:	1800                	addi	s0,sp,48
     f8c:	fca42e23          	sw	a0,-36(s0)
     f90:	87ae                	mv	a5,a1
     f92:	fcf40da3          	sb	a5,-37(s0)
    uint32_t tmpreg = 0;
     f96:	fe042623          	sw	zero,-20(s0)

    tmpreg = ADCx->CTLR1;
     f9a:	fdc42783          	lw	a5,-36(s0)
     f9e:	43dc                	lw	a5,4(a5)
     fa0:	fef42623          	sw	a5,-20(s0)
    tmpreg &= CTLR1_AWDCH_Reset;
     fa4:	fec42783          	lw	a5,-20(s0)
     fa8:	9b81                	andi	a5,a5,-32
     faa:	fef42623          	sw	a5,-20(s0)
    tmpreg |= ADC_Channel;
     fae:	fdb44783          	lbu	a5,-37(s0)
     fb2:	fec42703          	lw	a4,-20(s0)
     fb6:	8fd9                	or	a5,a5,a4
     fb8:	fef42623          	sw	a5,-20(s0)
    ADCx->CTLR1 = tmpreg;
     fbc:	fdc42783          	lw	a5,-36(s0)
     fc0:	fec42703          	lw	a4,-20(s0)
     fc4:	c3d8                	sw	a4,4(a5)
}
     fc6:	0001                	nop
     fc8:	5432                	lw	s0,44(sp)
     fca:	6145                	addi	sp,sp,48
     fcc:	8082                	ret

00000fce <ADC_GetFlagStatus>:
 *            ADC_FLAG_STRT - Start of regular group conversion flag.
 *
 * @return  FlagStatus: SET or RESET.
 */
FlagStatus ADC_GetFlagStatus(ADC_TypeDef *ADCx, uint8_t ADC_FLAG)
{
     fce:	7179                	addi	sp,sp,-48
     fd0:	d622                	sw	s0,44(sp)
     fd2:	1800                	addi	s0,sp,48
     fd4:	fca42e23          	sw	a0,-36(s0)
     fd8:	87ae                	mv	a5,a1
     fda:	fcf40da3          	sb	a5,-37(s0)
    FlagStatus bitstatus = RESET;
     fde:	fe042623          	sw	zero,-20(s0)

    if((ADCx->STATR & ADC_FLAG) != (uint8_t)RESET)
     fe2:	fdc42783          	lw	a5,-36(s0)
     fe6:	4398                	lw	a4,0(a5)
     fe8:	fdb44783          	lbu	a5,-37(s0)
     fec:	8ff9                	and	a5,a5,a4
     fee:	c789                	beqz	a5,ff8 <ADC_GetFlagStatus+0x2a>
    {
        bitstatus = SET;
     ff0:	4785                	li	a5,1
     ff2:	fef42623          	sw	a5,-20(s0)
     ff6:	a019                	j	ffc <ADC_GetFlagStatus+0x2e>
    }
    else
    {
        bitstatus = RESET;
     ff8:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
     ffc:	fec42783          	lw	a5,-20(s0)
}
    1000:	853e                	mv	a0,a5
    1002:	5432                	lw	s0,44(sp)
    1004:	6145                	addi	sp,sp,48
    1006:	8082                	ret

00001008 <ADC_ClearFlag>:
 *            ADC_FLAG_STRT - Start of regular group conversion flag.
 *
 * @return  none
 */
void ADC_ClearFlag(ADC_TypeDef *ADCx, uint8_t ADC_FLAG)
{
    1008:	1101                	addi	sp,sp,-32
    100a:	ce22                	sw	s0,28(sp)
    100c:	1000                	addi	s0,sp,32
    100e:	fea42623          	sw	a0,-20(s0)
    1012:	87ae                	mv	a5,a1
    1014:	fef405a3          	sb	a5,-21(s0)
    ADCx->STATR = ~(uint32_t)ADC_FLAG;
    1018:	feb44783          	lbu	a5,-21(s0)
    101c:	fff7c713          	not	a4,a5
    1020:	fec42783          	lw	a5,-20(s0)
    1024:	c398                	sw	a4,0(a5)
}
    1026:	0001                	nop
    1028:	4472                	lw	s0,28(sp)
    102a:	6105                	addi	sp,sp,32
    102c:	8082                	ret

0000102e <ADC_GetITStatus>:
 *            ADC_IT_JEOC - End of injected conversion interrupt mask.
 *
 * @return  FlagStatus: SET or RESET.
 */
ITStatus ADC_GetITStatus(ADC_TypeDef *ADCx, uint16_t ADC_IT)
{
    102e:	7179                	addi	sp,sp,-48
    1030:	d622                	sw	s0,44(sp)
    1032:	1800                	addi	s0,sp,48
    1034:	fca42e23          	sw	a0,-36(s0)
    1038:	87ae                	mv	a5,a1
    103a:	fcf41d23          	sh	a5,-38(s0)
    ITStatus bitstatus = RESET;
    103e:	fe042623          	sw	zero,-20(s0)
    uint32_t itmask = 0, enablestatus = 0;
    1042:	fe042423          	sw	zero,-24(s0)
    1046:	fe042223          	sw	zero,-28(s0)

    itmask = ADC_IT >> 8;
    104a:	fda45783          	lhu	a5,-38(s0)
    104e:	83a1                	srli	a5,a5,0x8
    1050:	07c2                	slli	a5,a5,0x10
    1052:	83c1                	srli	a5,a5,0x10
    1054:	fef42423          	sw	a5,-24(s0)
    enablestatus = (ADCx->CTLR1 & (uint8_t)ADC_IT);
    1058:	fdc42783          	lw	a5,-36(s0)
    105c:	43dc                	lw	a5,4(a5)
    105e:	fda45703          	lhu	a4,-38(s0)
    1062:	0ff77713          	andi	a4,a4,255
    1066:	8ff9                	and	a5,a5,a4
    1068:	fef42223          	sw	a5,-28(s0)

    if(((ADCx->STATR & itmask) != (uint32_t)RESET) && enablestatus)
    106c:	fdc42783          	lw	a5,-36(s0)
    1070:	4398                	lw	a4,0(a5)
    1072:	fe842783          	lw	a5,-24(s0)
    1076:	8ff9                	and	a5,a5,a4
    1078:	cb81                	beqz	a5,1088 <ADC_GetITStatus+0x5a>
    107a:	fe442783          	lw	a5,-28(s0)
    107e:	c789                	beqz	a5,1088 <ADC_GetITStatus+0x5a>
    {
        bitstatus = SET;
    1080:	4785                	li	a5,1
    1082:	fef42623          	sw	a5,-20(s0)
    1086:	a019                	j	108c <ADC_GetITStatus+0x5e>
    }
    else
    {
        bitstatus = RESET;
    1088:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    108c:	fec42783          	lw	a5,-20(s0)
}
    1090:	853e                	mv	a0,a5
    1092:	5432                	lw	s0,44(sp)
    1094:	6145                	addi	sp,sp,48
    1096:	8082                	ret

00001098 <ADC_ClearITPendingBit>:
 *            ADC_IT_JEOC - End of injected conversion interrupt mask.
 *
 * @return  none
 */
void ADC_ClearITPendingBit(ADC_TypeDef *ADCx, uint16_t ADC_IT)
{
    1098:	7179                	addi	sp,sp,-48
    109a:	d622                	sw	s0,44(sp)
    109c:	1800                	addi	s0,sp,48
    109e:	fca42e23          	sw	a0,-36(s0)
    10a2:	87ae                	mv	a5,a1
    10a4:	fcf41d23          	sh	a5,-38(s0)
    uint8_t itmask = 0;
    10a8:	fe0407a3          	sb	zero,-17(s0)

    itmask = (uint8_t)(ADC_IT >> 8);
    10ac:	fda45783          	lhu	a5,-38(s0)
    10b0:	83a1                	srli	a5,a5,0x8
    10b2:	07c2                	slli	a5,a5,0x10
    10b4:	83c1                	srli	a5,a5,0x10
    10b6:	fef407a3          	sb	a5,-17(s0)
    ADCx->STATR = ~(uint32_t)itmask;
    10ba:	fef44783          	lbu	a5,-17(s0)
    10be:	fff7c713          	not	a4,a5
    10c2:	fdc42783          	lw	a5,-36(s0)
    10c6:	c398                	sw	a4,0(a5)
}
    10c8:	0001                	nop
    10ca:	5432                	lw	s0,44(sp)
    10cc:	6145                	addi	sp,sp,48
    10ce:	8082                	ret

000010d0 <ADC_AnalogWatchdogResetCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void ADC_AnalogWatchdogResetCmd(ADC_TypeDef *ADCx, uint32_t ADC_AnalogWatchdog_x, FunctionalState NewState)
{
    10d0:	1101                	addi	sp,sp,-32
    10d2:	ce22                	sw	s0,28(sp)
    10d4:	1000                	addi	s0,sp,32
    10d6:	fea42623          	sw	a0,-20(s0)
    10da:	feb42423          	sw	a1,-24(s0)
    10de:	fec42223          	sw	a2,-28(s0)
  if (NewState != DISABLE)
    10e2:	fe442783          	lw	a5,-28(s0)
    10e6:	cb99                	beqz	a5,10fc <ADC_AnalogWatchdogResetCmd+0x2c>
  {
      ADCx->CTLR3 |= ADC_AnalogWatchdog_x;
    10e8:	fec42783          	lw	a5,-20(s0)
    10ec:	4bb8                	lw	a4,80(a5)
    10ee:	fe842783          	lw	a5,-24(s0)
    10f2:	8f5d                	or	a4,a4,a5
    10f4:	fec42783          	lw	a5,-20(s0)
    10f8:	cbb8                	sw	a4,80(a5)
  }
  else
  {
      ADCx->CTLR3 &= ~ADC_AnalogWatchdog_x;
  }
}
    10fa:	a821                	j	1112 <ADC_AnalogWatchdogResetCmd+0x42>
      ADCx->CTLR3 &= ~ADC_AnalogWatchdog_x;
    10fc:	fec42783          	lw	a5,-20(s0)
    1100:	4bb8                	lw	a4,80(a5)
    1102:	fe842783          	lw	a5,-24(s0)
    1106:	fff7c793          	not	a5,a5
    110a:	8f7d                	and	a4,a4,a5
    110c:	fec42783          	lw	a5,-20(s0)
    1110:	cbb8                	sw	a4,80(a5)
}
    1112:	0001                	nop
    1114:	4472                	lw	s0,28(sp)
    1116:	6105                	addi	sp,sp,32
    1118:	8082                	ret

0000111a <ADC_AnalogWatchdogScanCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void ADC_AnalogWatchdogScanCmd(ADC_TypeDef *ADCx, FunctionalState NewState)
{
    111a:	1101                	addi	sp,sp,-32
    111c:	ce22                	sw	s0,28(sp)
    111e:	1000                	addi	s0,sp,32
    1120:	fea42623          	sw	a0,-20(s0)
    1124:	feb42423          	sw	a1,-24(s0)
    if (NewState != DISABLE)
    1128:	fe842783          	lw	a5,-24(s0)
    112c:	cb91                	beqz	a5,1140 <ADC_AnalogWatchdogScanCmd+0x26>
    {
      ADCx->CTLR3 |= (1<<9);
    112e:	fec42783          	lw	a5,-20(s0)
    1132:	4bbc                	lw	a5,80(a5)
    1134:	2007e713          	ori	a4,a5,512
    1138:	fec42783          	lw	a5,-20(s0)
    113c:	cbb8                	sw	a4,80(a5)
    }
    else
    {
      ADCx->CTLR3 &= ~(1<<9);
    }
}
    113e:	a809                	j	1150 <ADC_AnalogWatchdogScanCmd+0x36>
      ADCx->CTLR3 &= ~(1<<9);
    1140:	fec42783          	lw	a5,-20(s0)
    1144:	4bbc                	lw	a5,80(a5)
    1146:	dff7f713          	andi	a4,a5,-513
    114a:	fec42783          	lw	a5,-20(s0)
    114e:	cbb8                	sw	a4,80(a5)
}
    1150:	0001                	nop
    1152:	4472                	lw	s0,28(sp)
    1154:	6105                	addi	sp,sp,32
    1156:	8082                	ret

00001158 <ADC_CLKConfig>:
 *            ADC_CLK_Div15 - ADC clock = SYSCLK/15
 *            ADC_CLK_Div16 - ADC clock = SYSCLK/16
 * @return  none
 */
void ADC_CLKConfig(ADC_TypeDef *ADCx, uint32_t ADC_CLK_Div_x)
{
    1158:	7179                	addi	sp,sp,-48
    115a:	d622                	sw	s0,44(sp)
    115c:	1800                	addi	s0,sp,48
    115e:	fca42e23          	sw	a0,-36(s0)
    1162:	fcb42c23          	sw	a1,-40(s0)
  uint32_t tmpreg = 0;
    1166:	fe042623          	sw	zero,-20(s0)

  tmpreg = ADCx->CTLR3;
    116a:	fdc42783          	lw	a5,-36(s0)
    116e:	4bbc                	lw	a5,80(a5)
    1170:	fef42623          	sw	a5,-20(s0)

  tmpreg &= CTLR3_CLK_Mask;
    1174:	fec42783          	lw	a5,-20(s0)
    1178:	e007f793          	andi	a5,a5,-512
    117c:	fef42623          	sw	a5,-20(s0)
  tmpreg |= ADC_CLK_Div_x;
    1180:	fec42703          	lw	a4,-20(s0)
    1184:	fd842783          	lw	a5,-40(s0)
    1188:	8fd9                	or	a5,a5,a4
    118a:	fef42623          	sw	a5,-20(s0)
  ADCx->CTLR3 = tmpreg;
    118e:	fdc42783          	lw	a5,-36(s0)
    1192:	fec42703          	lw	a4,-20(s0)
    1196:	cbb8                	sw	a4,80(a5)
}
    1198:	0001                	nop
    119a:	5432                	lw	s0,44(sp)
    119c:	6145                	addi	sp,sp,48
    119e:	8082                	ret

000011a0 <AutoWakeUpCmd>:
 *        (ENABLE or DISABLE).
 *
 * @return  none
 */
void AutoWakeUpCmd(FunctionalState NewState)
{
    11a0:	1101                	addi	sp,sp,-32
    11a2:	ce22                	sw	s0,28(sp)
    11a4:	1000                	addi	s0,sp,32
    11a6:	fea42623          	sw	a0,-20(s0)
    if(NewState)
    11aa:	fec42783          	lw	a5,-20(s0)
    11ae:	cf91                	beqz	a5,11ca <AutoWakeUpCmd+0x2a>
    {
        AWU->CSR |= (1 << 1);
    11b0:	400267b7          	lui	a5,0x40026
    11b4:	40078793          	addi	a5,a5,1024 # 40026400 <_eusrstack+0x20022400>
    11b8:	4398                	lw	a4,0(a5)
    11ba:	400267b7          	lui	a5,0x40026
    11be:	40078793          	addi	a5,a5,1024 # 40026400 <_eusrstack+0x20022400>
    11c2:	00276713          	ori	a4,a4,2
    11c6:	c398                	sw	a4,0(a5)
    }
    else
    {
        AWU->CSR &= ~(1 << 1);
    }
}
    11c8:	a821                	j	11e0 <AutoWakeUpCmd+0x40>
        AWU->CSR &= ~(1 << 1);
    11ca:	400267b7          	lui	a5,0x40026
    11ce:	40078793          	addi	a5,a5,1024 # 40026400 <_eusrstack+0x20022400>
    11d2:	4398                	lw	a4,0(a5)
    11d4:	400267b7          	lui	a5,0x40026
    11d8:	40078793          	addi	a5,a5,1024 # 40026400 <_eusrstack+0x20022400>
    11dc:	9b75                	andi	a4,a4,-3
    11de:	c398                	sw	a4,0(a5)
}
    11e0:	0001                	nop
    11e2:	4472                	lw	s0,28(sp)
    11e4:	6105                	addi	sp,sp,32
    11e6:	8082                	ret

000011e8 <AWU_SetPrescaler>:
 *            AWU_Prescaler_61440 - AWU counter clock = LSI/61440
 *
 * @return  none
 */
void AWU_SetPrescaler(uint32_t AWU_Prescaler)
{
    11e8:	7179                	addi	sp,sp,-48
    11ea:	d622                	sw	s0,44(sp)
    11ec:	1800                	addi	s0,sp,48
    11ee:	fca42e23          	sw	a0,-36(s0)
    uint32_t tmpreg = 0;
    11f2:	fe042623          	sw	zero,-20(s0)
    tmpreg = AWU->PSC & AWUPSC_MASK;
    11f6:	400267b7          	lui	a5,0x40026
    11fa:	40078793          	addi	a5,a5,1024 # 40026400 <_eusrstack+0x20022400>
    11fe:	479c                	lw	a5,8(a5)
    1200:	9bc1                	andi	a5,a5,-16
    1202:	fef42623          	sw	a5,-20(s0)
    tmpreg |= AWU_Prescaler;
    1206:	fec42703          	lw	a4,-20(s0)
    120a:	fdc42783          	lw	a5,-36(s0)
    120e:	8fd9                	or	a5,a5,a4
    1210:	fef42623          	sw	a5,-20(s0)
    AWU->PSC = tmpreg;
    1214:	400267b7          	lui	a5,0x40026
    1218:	40078793          	addi	a5,a5,1024 # 40026400 <_eusrstack+0x20022400>
    121c:	fec42703          	lw	a4,-20(s0)
    1220:	c798                	sw	a4,8(a5)
}
    1222:	0001                	nop
    1224:	5432                	lw	s0,44(sp)
    1226:	6145                	addi	sp,sp,48
    1228:	8082                	ret

0000122a <AWU_SetWindowValue>:
 *        downcounter,which must be lower than 0x3F
 *
 * @return  none
 */
void AWU_SetWindowValue(uint8_t WindowValue)
{
    122a:	7179                	addi	sp,sp,-48
    122c:	d622                	sw	s0,44(sp)
    122e:	1800                	addi	s0,sp,48
    1230:	87aa                	mv	a5,a0
    1232:	fcf40fa3          	sb	a5,-33(s0)
    __IO uint32_t tmpreg = 0;
    1236:	fe042623          	sw	zero,-20(s0)

    tmpreg = AWU->WR & AWUWR_MASK;
    123a:	400267b7          	lui	a5,0x40026
    123e:	40078793          	addi	a5,a5,1024 # 40026400 <_eusrstack+0x20022400>
    1242:	43dc                	lw	a5,4(a5)
    1244:	fc07f793          	andi	a5,a5,-64
    1248:	fef42623          	sw	a5,-20(s0)
    tmpreg |= WindowValue;
    124c:	fdf44703          	lbu	a4,-33(s0)
    1250:	fec42783          	lw	a5,-20(s0)
    1254:	8fd9                	or	a5,a5,a4
    1256:	fef42623          	sw	a5,-20(s0)

    AWU->WR = tmpreg;
    125a:	400267b7          	lui	a5,0x40026
    125e:	40078793          	addi	a5,a5,1024 # 40026400 <_eusrstack+0x20022400>
    1262:	fec42703          	lw	a4,-20(s0)
    1266:	c3d8                	sw	a4,4(a5)
}
    1268:	0001                	nop
    126a:	5432                	lw	s0,44(sp)
    126c:	6145                	addi	sp,sp,48
    126e:	8082                	ret

00001270 <DBGMCU_GetREVID>:
 * @brief   Returns the device revision identifier.
 *
 * @return  Revision identifier.
 */
uint32_t DBGMCU_GetREVID(void)
{
    1270:	1141                	addi	sp,sp,-16
    1272:	c622                	sw	s0,12(sp)
    1274:	0800                	addi	s0,sp,16
	return ((*(uint32_t *)0x1FFFF704) >> 16);
    1276:	1ffff7b7          	lui	a5,0x1ffff
    127a:	70478793          	addi	a5,a5,1796 # 1ffff704 <_data_lma+0x1fff3450>
    127e:	439c                	lw	a5,0(a5)
    1280:	83c1                	srli	a5,a5,0x10
}
    1282:	853e                	mv	a0,a5
    1284:	4432                	lw	s0,12(sp)
    1286:	0141                	addi	sp,sp,16
    1288:	8082                	ret

0000128a <DBGMCU_GetDEVID>:
 * @brief   Returns the device identifier.
 *
 * @return  Device identifier.
 */
uint32_t DBGMCU_GetDEVID(void)
{
    128a:	1141                	addi	sp,sp,-16
    128c:	c622                	sw	s0,12(sp)
    128e:	0800                	addi	s0,sp,16
	return ((*(uint32_t *)0x1FFFF704) & IDCODE_DEVID_MASK);
    1290:	1ffff7b7          	lui	a5,0x1ffff
    1294:	70478793          	addi	a5,a5,1796 # 1ffff704 <_data_lma+0x1fff3450>
    1298:	4398                	lw	a4,0(a5)
    129a:	67c1                	lui	a5,0x10
    129c:	17fd                	addi	a5,a5,-1
    129e:	8ff9                	and	a5,a5,a4
}
    12a0:	853e                	mv	a0,a5
    12a2:	4432                	lw	s0,12(sp)
    12a4:	0141                	addi	sp,sp,16
    12a6:	8082                	ret

000012a8 <__get_DEBUG_CR>:
 * @brief   Return the DEBUGE Control Register
 *
 * @return  DEBUGE Control value
 */
uint32_t __get_DEBUG_CR(void)
{
    12a8:	1101                	addi	sp,sp,-32
    12aa:	ce22                	sw	s0,28(sp)
    12ac:	1000                	addi	s0,sp,32
	uint32_t result;

	__asm volatile("csrr %0,""0x7C0" : "=r"(result));
    12ae:	7c0027f3          	csrr	a5,0x7c0
    12b2:	fef42623          	sw	a5,-20(s0)
	return (result);
    12b6:	fec42783          	lw	a5,-20(s0)
}
    12ba:	853e                	mv	a0,a5
    12bc:	4472                	lw	s0,28(sp)
    12be:	6105                	addi	sp,sp,32
    12c0:	8082                	ret

000012c2 <__set_DEBUG_CR>:
 * @param   value  - set DEBUGE Control value
 *
 * @return  none
 */
void __set_DEBUG_CR(uint32_t value)
{
    12c2:	1101                	addi	sp,sp,-32
    12c4:	ce22                	sw	s0,28(sp)
    12c6:	1000                	addi	s0,sp,32
    12c8:	fea42623          	sw	a0,-20(s0)
	__asm volatile("csrw 0x7C0, %0" : : "r"(value));
    12cc:	fec42783          	lw	a5,-20(s0)
    12d0:	7c079073          	csrw	0x7c0,a5
}
    12d4:	0001                	nop
    12d6:	4472                	lw	s0,28(sp)
    12d8:	6105                	addi	sp,sp,32
    12da:	8082                	ret

000012dc <DBGMCU_Config>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void DBGMCU_Config(uint32_t DBGMCU_Periph, FunctionalState NewState)
{
    12dc:	7179                	addi	sp,sp,-48
    12de:	d606                	sw	ra,44(sp)
    12e0:	d422                	sw	s0,40(sp)
    12e2:	1800                	addi	s0,sp,48
    12e4:	fca42e23          	sw	a0,-36(s0)
    12e8:	fcb42c23          	sw	a1,-40(s0)
	uint32_t val;

	if(NewState != DISABLE)
    12ec:	fd842783          	lw	a5,-40(s0)
    12f0:	c789                	beqz	a5,12fa <DBGMCU_Config+0x1e>
	{
		__set_DEBUG_CR(DBGMCU_Periph);
    12f2:	fdc42503          	lw	a0,-36(s0)
    12f6:	37f1                	jal	12c2 <__set_DEBUG_CR>
		val = __get_DEBUG_CR();
		val &= ~(uint32_t)DBGMCU_Periph;
		__set_DEBUG_CR(val);
	}

}
    12f8:	a005                	j	1318 <DBGMCU_Config+0x3c>
		val = __get_DEBUG_CR();
    12fa:	377d                	jal	12a8 <__get_DEBUG_CR>
    12fc:	fea42623          	sw	a0,-20(s0)
		val &= ~(uint32_t)DBGMCU_Periph;
    1300:	fdc42783          	lw	a5,-36(s0)
    1304:	fff7c793          	not	a5,a5
    1308:	fec42703          	lw	a4,-20(s0)
    130c:	8ff9                	and	a5,a5,a4
    130e:	fef42623          	sw	a5,-20(s0)
		__set_DEBUG_CR(val);
    1312:	fec42503          	lw	a0,-20(s0)
    1316:	3775                	jal	12c2 <__set_DEBUG_CR>
}
    1318:	0001                	nop
    131a:	50b2                	lw	ra,44(sp)
    131c:	5422                	lw	s0,40(sp)
    131e:	6145                	addi	sp,sp,48
    1320:	8082                	ret

00001322 <DBGMCU_GetCHIPID>:
 *  CH32X035G8R6-0x035B06x1
 *  CH32X035F7P6-0x035706x1
 *  CH32X033F8P6-0x035A06x1
 */
uint32_t DBGMCU_GetCHIPID( void )
{
    1322:	1141                	addi	sp,sp,-16
    1324:	c622                	sw	s0,12(sp)
    1326:	0800                	addi	s0,sp,16
	return( *( uint32_t * )0x1FFFF704 );
    1328:	1ffff7b7          	lui	a5,0x1ffff
    132c:	70478793          	addi	a5,a5,1796 # 1ffff704 <_data_lma+0x1fff3450>
    1330:	439c                	lw	a5,0(a5)
}
    1332:	853e                	mv	a0,a5
    1334:	4432                	lw	s0,12(sp)
    1336:	0141                	addi	sp,sp,16
    1338:	8082                	ret

0000133a <DMA_DeInit>:
 *        1 to 8 for DMA1 to select the DMA Channel.
 *
 * @return  none
 */
void DMA_DeInit(DMA_Channel_TypeDef *DMAy_Channelx)
{
    133a:	1101                	addi	sp,sp,-32
    133c:	ce22                	sw	s0,28(sp)
    133e:	1000                	addi	s0,sp,32
    1340:	fea42623          	sw	a0,-20(s0)
    DMAy_Channelx->CFGR &= (uint16_t)(~DMA_CFGR1_EN);
    1344:	fec42783          	lw	a5,-20(s0)
    1348:	4398                	lw	a4,0(a5)
    134a:	67c1                	lui	a5,0x10
    134c:	17f9                	addi	a5,a5,-2
    134e:	8f7d                	and	a4,a4,a5
    1350:	fec42783          	lw	a5,-20(s0)
    1354:	c398                	sw	a4,0(a5)
    DMAy_Channelx->CFGR = 0;
    1356:	fec42783          	lw	a5,-20(s0)
    135a:	0007a023          	sw	zero,0(a5) # 10000 <_data_lma+0x3d4c>
    DMAy_Channelx->CNTR = 0;
    135e:	fec42783          	lw	a5,-20(s0)
    1362:	0007a223          	sw	zero,4(a5)
    DMAy_Channelx->PADDR = 0;
    1366:	fec42783          	lw	a5,-20(s0)
    136a:	0007a423          	sw	zero,8(a5)
    DMAy_Channelx->MADDR = 0;
    136e:	fec42783          	lw	a5,-20(s0)
    1372:	0007a623          	sw	zero,12(a5)
    if(DMAy_Channelx == DMA1_Channel1)
    1376:	fec42703          	lw	a4,-20(s0)
    137a:	400207b7          	lui	a5,0x40020
    137e:	07a1                	addi	a5,a5,8
    1380:	00f71b63          	bne	a4,a5,1396 <DMA_DeInit+0x5c>
    {
        DMA1->INTFCR |= DMA1_Channel1_IT_Mask;
    1384:	400207b7          	lui	a5,0x40020
    1388:	43d8                	lw	a4,4(a5)
    138a:	400207b7          	lui	a5,0x40020
    138e:	00f76713          	ori	a4,a4,15
    1392:	c3d8                	sw	a4,4(a5)
    }
    else if(DMAy_Channelx == DMA1_Channel8)
    {
        DMA1->INTFCR |= DMA1_Channel8_IT_Mask;
    }
}
    1394:	a8e5                	j	148c <DMA_DeInit+0x152>
    else if(DMAy_Channelx == DMA1_Channel2)
    1396:	fec42703          	lw	a4,-20(s0)
    139a:	400207b7          	lui	a5,0x40020
    139e:	07f1                	addi	a5,a5,28
    13a0:	00f71b63          	bne	a4,a5,13b6 <DMA_DeInit+0x7c>
        DMA1->INTFCR |= DMA1_Channel2_IT_Mask;
    13a4:	400207b7          	lui	a5,0x40020
    13a8:	43d8                	lw	a4,4(a5)
    13aa:	400207b7          	lui	a5,0x40020
    13ae:	0f076713          	ori	a4,a4,240
    13b2:	c3d8                	sw	a4,4(a5)
}
    13b4:	a8e1                	j	148c <DMA_DeInit+0x152>
    else if(DMAy_Channelx == DMA1_Channel3)
    13b6:	fec42703          	lw	a4,-20(s0)
    13ba:	400207b7          	lui	a5,0x40020
    13be:	03078793          	addi	a5,a5,48 # 40020030 <_eusrstack+0x2001c030>
    13c2:	00f71d63          	bne	a4,a5,13dc <DMA_DeInit+0xa2>
        DMA1->INTFCR |= DMA1_Channel3_IT_Mask;
    13c6:	400207b7          	lui	a5,0x40020
    13ca:	43d4                	lw	a3,4(a5)
    13cc:	400207b7          	lui	a5,0x40020
    13d0:	6705                	lui	a4,0x1
    13d2:	f0070713          	addi	a4,a4,-256 # f00 <ADC_AnalogWatchdog1ThresholdsConfig+0x3a>
    13d6:	8f55                	or	a4,a4,a3
    13d8:	c3d8                	sw	a4,4(a5)
}
    13da:	a84d                	j	148c <DMA_DeInit+0x152>
    else if(DMAy_Channelx == DMA1_Channel4)
    13dc:	fec42703          	lw	a4,-20(s0)
    13e0:	400207b7          	lui	a5,0x40020
    13e4:	04478793          	addi	a5,a5,68 # 40020044 <_eusrstack+0x2001c044>
    13e8:	00f71b63          	bne	a4,a5,13fe <DMA_DeInit+0xc4>
        DMA1->INTFCR |= DMA1_Channel4_IT_Mask;
    13ec:	400207b7          	lui	a5,0x40020
    13f0:	43d4                	lw	a3,4(a5)
    13f2:	400207b7          	lui	a5,0x40020
    13f6:	673d                	lui	a4,0xf
    13f8:	8f55                	or	a4,a4,a3
    13fa:	c3d8                	sw	a4,4(a5)
}
    13fc:	a841                	j	148c <DMA_DeInit+0x152>
    else if(DMAy_Channelx == DMA1_Channel5)
    13fe:	fec42703          	lw	a4,-20(s0)
    1402:	400207b7          	lui	a5,0x40020
    1406:	05878793          	addi	a5,a5,88 # 40020058 <_eusrstack+0x2001c058>
    140a:	00f71c63          	bne	a4,a5,1422 <DMA_DeInit+0xe8>
        DMA1->INTFCR |= DMA1_Channel5_IT_Mask;
    140e:	400207b7          	lui	a5,0x40020
    1412:	43d4                	lw	a3,4(a5)
    1414:	400207b7          	lui	a5,0x40020
    1418:	000f0737          	lui	a4,0xf0
    141c:	8f55                	or	a4,a4,a3
    141e:	c3d8                	sw	a4,4(a5)
}
    1420:	a0b5                	j	148c <DMA_DeInit+0x152>
    else if(DMAy_Channelx == DMA1_Channel6)
    1422:	fec42703          	lw	a4,-20(s0)
    1426:	400207b7          	lui	a5,0x40020
    142a:	06c78793          	addi	a5,a5,108 # 4002006c <_eusrstack+0x2001c06c>
    142e:	00f71c63          	bne	a4,a5,1446 <DMA_DeInit+0x10c>
        DMA1->INTFCR |= DMA1_Channel6_IT_Mask;
    1432:	400207b7          	lui	a5,0x40020
    1436:	43d4                	lw	a3,4(a5)
    1438:	400207b7          	lui	a5,0x40020
    143c:	00f00737          	lui	a4,0xf00
    1440:	8f55                	or	a4,a4,a3
    1442:	c3d8                	sw	a4,4(a5)
}
    1444:	a0a1                	j	148c <DMA_DeInit+0x152>
    else if(DMAy_Channelx == DMA1_Channel7)
    1446:	fec42703          	lw	a4,-20(s0)
    144a:	400207b7          	lui	a5,0x40020
    144e:	08078793          	addi	a5,a5,128 # 40020080 <_eusrstack+0x2001c080>
    1452:	00f71c63          	bne	a4,a5,146a <DMA_DeInit+0x130>
        DMA1->INTFCR |= DMA1_Channel7_IT_Mask;
    1456:	400207b7          	lui	a5,0x40020
    145a:	43d4                	lw	a3,4(a5)
    145c:	400207b7          	lui	a5,0x40020
    1460:	0f000737          	lui	a4,0xf000
    1464:	8f55                	or	a4,a4,a3
    1466:	c3d8                	sw	a4,4(a5)
}
    1468:	a015                	j	148c <DMA_DeInit+0x152>
    else if(DMAy_Channelx == DMA1_Channel8)
    146a:	fec42703          	lw	a4,-20(s0)
    146e:	400207b7          	lui	a5,0x40020
    1472:	09478793          	addi	a5,a5,148 # 40020094 <_eusrstack+0x2001c094>
    1476:	00f71b63          	bne	a4,a5,148c <DMA_DeInit+0x152>
        DMA1->INTFCR |= DMA1_Channel8_IT_Mask;
    147a:	400207b7          	lui	a5,0x40020
    147e:	43d4                	lw	a3,4(a5)
    1480:	400207b7          	lui	a5,0x40020
    1484:	f0000737          	lui	a4,0xf0000
    1488:	8f55                	or	a4,a4,a3
    148a:	c3d8                	sw	a4,4(a5)
}
    148c:	0001                	nop
    148e:	4472                	lw	s0,28(sp)
    1490:	6105                	addi	sp,sp,32
    1492:	8082                	ret

00001494 <DMA_Init>:
 *        contains the configuration information for the specified DMA Channel.
 *
 * @return  none
 */
void DMA_Init(DMA_Channel_TypeDef *DMAy_Channelx, DMA_InitTypeDef *DMA_InitStruct)
{
    1494:	7179                	addi	sp,sp,-48
    1496:	d622                	sw	s0,44(sp)
    1498:	1800                	addi	s0,sp,48
    149a:	fca42e23          	sw	a0,-36(s0)
    149e:	fcb42c23          	sw	a1,-40(s0)
    uint32_t tmpreg = 0;
    14a2:	fe042623          	sw	zero,-20(s0)

    tmpreg = DMAy_Channelx->CFGR;
    14a6:	fdc42783          	lw	a5,-36(s0)
    14aa:	439c                	lw	a5,0(a5)
    14ac:	fef42623          	sw	a5,-20(s0)
    tmpreg &= CFGR_CLEAR_Mask;
    14b0:	fec42703          	lw	a4,-20(s0)
    14b4:	77e1                	lui	a5,0xffff8
    14b6:	07bd                	addi	a5,a5,15
    14b8:	8ff9                	and	a5,a5,a4
    14ba:	fef42623          	sw	a5,-20(s0)
    tmpreg |= DMA_InitStruct->DMA_DIR | DMA_InitStruct->DMA_Mode |
    14be:	fd842783          	lw	a5,-40(s0)
    14c2:	4798                	lw	a4,8(a5)
    14c4:	fd842783          	lw	a5,-40(s0)
    14c8:	539c                	lw	a5,32(a5)
    14ca:	8f5d                	or	a4,a4,a5
              DMA_InitStruct->DMA_PeripheralInc | DMA_InitStruct->DMA_MemoryInc |
    14cc:	fd842783          	lw	a5,-40(s0)
    14d0:	4b9c                	lw	a5,16(a5)
    tmpreg |= DMA_InitStruct->DMA_DIR | DMA_InitStruct->DMA_Mode |
    14d2:	8f5d                	or	a4,a4,a5
              DMA_InitStruct->DMA_PeripheralInc | DMA_InitStruct->DMA_MemoryInc |
    14d4:	fd842783          	lw	a5,-40(s0)
    14d8:	4bdc                	lw	a5,20(a5)
    14da:	8f5d                	or	a4,a4,a5
              DMA_InitStruct->DMA_PeripheralDataSize | DMA_InitStruct->DMA_MemoryDataSize |
    14dc:	fd842783          	lw	a5,-40(s0)
    14e0:	4f9c                	lw	a5,24(a5)
              DMA_InitStruct->DMA_PeripheralInc | DMA_InitStruct->DMA_MemoryInc |
    14e2:	8f5d                	or	a4,a4,a5
              DMA_InitStruct->DMA_PeripheralDataSize | DMA_InitStruct->DMA_MemoryDataSize |
    14e4:	fd842783          	lw	a5,-40(s0)
    14e8:	4fdc                	lw	a5,28(a5)
    14ea:	8f5d                	or	a4,a4,a5
              DMA_InitStruct->DMA_Priority | DMA_InitStruct->DMA_M2M;
    14ec:	fd842783          	lw	a5,-40(s0)
    14f0:	53dc                	lw	a5,36(a5)
              DMA_InitStruct->DMA_PeripheralDataSize | DMA_InitStruct->DMA_MemoryDataSize |
    14f2:	8f5d                	or	a4,a4,a5
              DMA_InitStruct->DMA_Priority | DMA_InitStruct->DMA_M2M;
    14f4:	fd842783          	lw	a5,-40(s0)
    14f8:	579c                	lw	a5,40(a5)
    14fa:	8fd9                	or	a5,a5,a4
    tmpreg |= DMA_InitStruct->DMA_DIR | DMA_InitStruct->DMA_Mode |
    14fc:	fec42703          	lw	a4,-20(s0)
    1500:	8fd9                	or	a5,a5,a4
    1502:	fef42623          	sw	a5,-20(s0)

    DMAy_Channelx->CFGR = tmpreg;
    1506:	fdc42783          	lw	a5,-36(s0)
    150a:	fec42703          	lw	a4,-20(s0)
    150e:	c398                	sw	a4,0(a5)
    DMAy_Channelx->CNTR = DMA_InitStruct->DMA_BufferSize;
    1510:	fd842783          	lw	a5,-40(s0)
    1514:	47d8                	lw	a4,12(a5)
    1516:	fdc42783          	lw	a5,-36(s0)
    151a:	c3d8                	sw	a4,4(a5)
    DMAy_Channelx->PADDR = DMA_InitStruct->DMA_PeripheralBaseAddr;
    151c:	fd842783          	lw	a5,-40(s0)
    1520:	4398                	lw	a4,0(a5)
    1522:	fdc42783          	lw	a5,-36(s0)
    1526:	c798                	sw	a4,8(a5)
    DMAy_Channelx->MADDR = DMA_InitStruct->DMA_MemoryBaseAddr;
    1528:	fd842783          	lw	a5,-40(s0)
    152c:	43d8                	lw	a4,4(a5)
    152e:	fdc42783          	lw	a5,-36(s0)
    1532:	c7d8                	sw	a4,12(a5)
}
    1534:	0001                	nop
    1536:	5432                	lw	s0,44(sp)
    1538:	6145                	addi	sp,sp,48
    153a:	8082                	ret

0000153c <DMA_StructInit>:
 *        contains the configuration information for the specified DMA Channel.
 *
 * @return  none
 */
void DMA_StructInit(DMA_InitTypeDef *DMA_InitStruct)
{
    153c:	1101                	addi	sp,sp,-32
    153e:	ce22                	sw	s0,28(sp)
    1540:	1000                	addi	s0,sp,32
    1542:	fea42623          	sw	a0,-20(s0)
    DMA_InitStruct->DMA_PeripheralBaseAddr = 0;
    1546:	fec42783          	lw	a5,-20(s0)
    154a:	0007a023          	sw	zero,0(a5) # ffff8000 <_eusrstack+0xdfff4000>
    DMA_InitStruct->DMA_MemoryBaseAddr = 0;
    154e:	fec42783          	lw	a5,-20(s0)
    1552:	0007a223          	sw	zero,4(a5)
    DMA_InitStruct->DMA_DIR = DMA_DIR_PeripheralSRC;
    1556:	fec42783          	lw	a5,-20(s0)
    155a:	0007a423          	sw	zero,8(a5)
    DMA_InitStruct->DMA_BufferSize = 0;
    155e:	fec42783          	lw	a5,-20(s0)
    1562:	0007a623          	sw	zero,12(a5)
    DMA_InitStruct->DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    1566:	fec42783          	lw	a5,-20(s0)
    156a:	0007a823          	sw	zero,16(a5)
    DMA_InitStruct->DMA_MemoryInc = DMA_MemoryInc_Disable;
    156e:	fec42783          	lw	a5,-20(s0)
    1572:	0007aa23          	sw	zero,20(a5)
    DMA_InitStruct->DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
    1576:	fec42783          	lw	a5,-20(s0)
    157a:	0007ac23          	sw	zero,24(a5)
    DMA_InitStruct->DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
    157e:	fec42783          	lw	a5,-20(s0)
    1582:	0007ae23          	sw	zero,28(a5)
    DMA_InitStruct->DMA_Mode = DMA_Mode_Normal;
    1586:	fec42783          	lw	a5,-20(s0)
    158a:	0207a023          	sw	zero,32(a5)
    DMA_InitStruct->DMA_Priority = DMA_Priority_Low;
    158e:	fec42783          	lw	a5,-20(s0)
    1592:	0207a223          	sw	zero,36(a5)
    DMA_InitStruct->DMA_M2M = DMA_M2M_Disable;
    1596:	fec42783          	lw	a5,-20(s0)
    159a:	0207a423          	sw	zero,40(a5)
}
    159e:	0001                	nop
    15a0:	4472                	lw	s0,28(sp)
    15a2:	6105                	addi	sp,sp,32
    15a4:	8082                	ret

000015a6 <DMA_Cmd>:
 *          NewState - new state of the DMAy Channelx(ENABLE or DISABLE).
 *
 * @return  none
 */
void DMA_Cmd(DMA_Channel_TypeDef *DMAy_Channelx, FunctionalState NewState)
{
    15a6:	1101                	addi	sp,sp,-32
    15a8:	ce22                	sw	s0,28(sp)
    15aa:	1000                	addi	s0,sp,32
    15ac:	fea42623          	sw	a0,-20(s0)
    15b0:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    15b4:	fe842783          	lw	a5,-24(s0)
    15b8:	cb91                	beqz	a5,15cc <DMA_Cmd+0x26>
    {
        DMAy_Channelx->CFGR |= DMA_CFGR1_EN;
    15ba:	fec42783          	lw	a5,-20(s0)
    15be:	439c                	lw	a5,0(a5)
    15c0:	0017e713          	ori	a4,a5,1
    15c4:	fec42783          	lw	a5,-20(s0)
    15c8:	c398                	sw	a4,0(a5)
    }
    else
    {
        DMAy_Channelx->CFGR &= (uint16_t)(~DMA_CFGR1_EN);
    }
}
    15ca:	a811                	j	15de <DMA_Cmd+0x38>
        DMAy_Channelx->CFGR &= (uint16_t)(~DMA_CFGR1_EN);
    15cc:	fec42783          	lw	a5,-20(s0)
    15d0:	4398                	lw	a4,0(a5)
    15d2:	67c1                	lui	a5,0x10
    15d4:	17f9                	addi	a5,a5,-2
    15d6:	8f7d                	and	a4,a4,a5
    15d8:	fec42783          	lw	a5,-20(s0)
    15dc:	c398                	sw	a4,0(a5)
}
    15de:	0001                	nop
    15e0:	4472                	lw	s0,28(sp)
    15e2:	6105                	addi	sp,sp,32
    15e4:	8082                	ret

000015e6 <DMA_ITConfig>:
 *          NewState - new state of the DMAy Channelx(ENABLE or DISABLE).
 *
 * @return  none
 */
void DMA_ITConfig(DMA_Channel_TypeDef *DMAy_Channelx, uint32_t DMA_IT, FunctionalState NewState)
{
    15e6:	1101                	addi	sp,sp,-32
    15e8:	ce22                	sw	s0,28(sp)
    15ea:	1000                	addi	s0,sp,32
    15ec:	fea42623          	sw	a0,-20(s0)
    15f0:	feb42423          	sw	a1,-24(s0)
    15f4:	fec42223          	sw	a2,-28(s0)
    if(NewState != DISABLE)
    15f8:	fe442783          	lw	a5,-28(s0)
    15fc:	cb99                	beqz	a5,1612 <DMA_ITConfig+0x2c>
    {
        DMAy_Channelx->CFGR |= DMA_IT;
    15fe:	fec42783          	lw	a5,-20(s0)
    1602:	4398                	lw	a4,0(a5)
    1604:	fe842783          	lw	a5,-24(s0)
    1608:	8f5d                	or	a4,a4,a5
    160a:	fec42783          	lw	a5,-20(s0)
    160e:	c398                	sw	a4,0(a5)
    }
    else
    {
        DMAy_Channelx->CFGR &= ~DMA_IT;
    }
}
    1610:	a821                	j	1628 <DMA_ITConfig+0x42>
        DMAy_Channelx->CFGR &= ~DMA_IT;
    1612:	fec42783          	lw	a5,-20(s0)
    1616:	4398                	lw	a4,0(a5)
    1618:	fe842783          	lw	a5,-24(s0)
    161c:	fff7c793          	not	a5,a5
    1620:	8f7d                	and	a4,a4,a5
    1622:	fec42783          	lw	a5,-20(s0)
    1626:	c398                	sw	a4,0(a5)
}
    1628:	0001                	nop
    162a:	4472                	lw	s0,28(sp)
    162c:	6105                	addi	sp,sp,32
    162e:	8082                	ret

00001630 <DMA_SetCurrDataCounter>:
 *        transfer.
 *
 * @return  none
 */
void DMA_SetCurrDataCounter(DMA_Channel_TypeDef *DMAy_Channelx, uint16_t DataNumber)
{
    1630:	1101                	addi	sp,sp,-32
    1632:	ce22                	sw	s0,28(sp)
    1634:	1000                	addi	s0,sp,32
    1636:	fea42623          	sw	a0,-20(s0)
    163a:	87ae                	mv	a5,a1
    163c:	fef41523          	sh	a5,-22(s0)
    DMAy_Channelx->CNTR = DataNumber;
    1640:	fea45703          	lhu	a4,-22(s0)
    1644:	fec42783          	lw	a5,-20(s0)
    1648:	c3d8                	sw	a4,4(a5)
}
    164a:	0001                	nop
    164c:	4472                	lw	s0,28(sp)
    164e:	6105                	addi	sp,sp,32
    1650:	8082                	ret

00001652 <DMA_GetCurrDataCounter>:
 *
 * @return  DataNumber - The number of remaining data units in the current
 *        DMAy Channelx transfer.
 */
uint16_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef *DMAy_Channelx)
{
    1652:	1101                	addi	sp,sp,-32
    1654:	ce22                	sw	s0,28(sp)
    1656:	1000                	addi	s0,sp,32
    1658:	fea42623          	sw	a0,-20(s0)
    return ((uint16_t)(DMAy_Channelx->CNTR));
    165c:	fec42783          	lw	a5,-20(s0)
    1660:	43dc                	lw	a5,4(a5)
    1662:	07c2                	slli	a5,a5,0x10
    1664:	83c1                	srli	a5,a5,0x10
}
    1666:	853e                	mv	a0,a5
    1668:	4472                	lw	s0,28(sp)
    166a:	6105                	addi	sp,sp,32
    166c:	8082                	ret

0000166e <DMA_GetFlagStatus>:
 *            DMA1_FLAG_TE8 - DMA1 Channel8 transfer error flag.

 * @return  The new state of DMAy_FLAG (SET or RESET).
 */
FlagStatus DMA_GetFlagStatus(uint32_t DMAy_FLAG)
{
    166e:	7179                	addi	sp,sp,-48
    1670:	d622                	sw	s0,44(sp)
    1672:	1800                	addi	s0,sp,48
    1674:	fca42e23          	sw	a0,-36(s0)
    FlagStatus bitstatus = RESET;
    1678:	fe042623          	sw	zero,-20(s0)
    uint32_t   tmpreg = 0;
    167c:	fe042423          	sw	zero,-24(s0)

    tmpreg = DMA1->INTFR;
    1680:	400207b7          	lui	a5,0x40020
    1684:	439c                	lw	a5,0(a5)
    1686:	fef42423          	sw	a5,-24(s0)

    if((tmpreg & DMAy_FLAG) != (uint32_t)RESET)
    168a:	fe842703          	lw	a4,-24(s0)
    168e:	fdc42783          	lw	a5,-36(s0)
    1692:	8ff9                	and	a5,a5,a4
    1694:	c789                	beqz	a5,169e <DMA_GetFlagStatus+0x30>
    {
        bitstatus = SET;
    1696:	4785                	li	a5,1
    1698:	fef42623          	sw	a5,-20(s0)
    169c:	a019                	j	16a2 <DMA_GetFlagStatus+0x34>
    }
    else
    {
        bitstatus = RESET;
    169e:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    16a2:	fec42783          	lw	a5,-20(s0)
}
    16a6:	853e                	mv	a0,a5
    16a8:	5432                	lw	s0,44(sp)
    16aa:	6145                	addi	sp,sp,48
    16ac:	8082                	ret

000016ae <DMA_ClearFlag>:
 *            DMA1_FLAG_HT8 - DMA1 Channel8 half transfer flag.
 *            DMA1_FLAG_TE8 - DMA1 Channel8 transfer error flag.
 * @return  none
 */
void DMA_ClearFlag(uint32_t DMAy_FLAG)
{
    16ae:	1101                	addi	sp,sp,-32
    16b0:	ce22                	sw	s0,28(sp)
    16b2:	1000                	addi	s0,sp,32
    16b4:	fea42623          	sw	a0,-20(s0)
    DMA1->INTFCR = DMAy_FLAG;
    16b8:	400207b7          	lui	a5,0x40020
    16bc:	fec42703          	lw	a4,-20(s0)
    16c0:	c3d8                	sw	a4,4(a5)
}
    16c2:	0001                	nop
    16c4:	4472                	lw	s0,28(sp)
    16c6:	6105                	addi	sp,sp,32
    16c8:	8082                	ret

000016ca <DMA_GetITStatus>:
 *            DMA1_IT_HT8 - DMA1 Channel8 half transfer flag.
 *            DMA1_IT_TE8 - DMA1 Channel8 transfer error flag.
 * @return  The new state of DMAy_IT (SET or RESET).
 */
ITStatus DMA_GetITStatus(uint32_t DMAy_IT)
{
    16ca:	7179                	addi	sp,sp,-48
    16cc:	d622                	sw	s0,44(sp)
    16ce:	1800                	addi	s0,sp,48
    16d0:	fca42e23          	sw	a0,-36(s0)
    ITStatus bitstatus = RESET;
    16d4:	fe042623          	sw	zero,-20(s0)
    uint32_t tmpreg = 0;
    16d8:	fe042423          	sw	zero,-24(s0)

    tmpreg = DMA1->INTFR;
    16dc:	400207b7          	lui	a5,0x40020
    16e0:	439c                	lw	a5,0(a5)
    16e2:	fef42423          	sw	a5,-24(s0)

    if((tmpreg & DMAy_IT) != (uint32_t)RESET)
    16e6:	fe842703          	lw	a4,-24(s0)
    16ea:	fdc42783          	lw	a5,-36(s0)
    16ee:	8ff9                	and	a5,a5,a4
    16f0:	c789                	beqz	a5,16fa <DMA_GetITStatus+0x30>
    {
        bitstatus = SET;
    16f2:	4785                	li	a5,1
    16f4:	fef42623          	sw	a5,-20(s0)
    16f8:	a019                	j	16fe <DMA_GetITStatus+0x34>
    }
    else
    {
        bitstatus = RESET;
    16fa:	fe042623          	sw	zero,-20(s0)
    }
    return bitstatus;
    16fe:	fec42783          	lw	a5,-20(s0)
}
    1702:	853e                	mv	a0,a5
    1704:	5432                	lw	s0,44(sp)
    1706:	6145                	addi	sp,sp,48
    1708:	8082                	ret

0000170a <DMA_ClearITPendingBit>:
 *            DMA1_IT_HT8 - DMA1 Channel8 half transfer flag.
 *            DMA1_IT_TE8 - DMA1 Channel8 transfer error flag.
 * @return  none
 */
void DMA_ClearITPendingBit(uint32_t DMAy_IT)
{
    170a:	1101                	addi	sp,sp,-32
    170c:	ce22                	sw	s0,28(sp)
    170e:	1000                	addi	s0,sp,32
    1710:	fea42623          	sw	a0,-20(s0)
    DMA1->INTFCR = DMAy_IT;
    1714:	400207b7          	lui	a5,0x40020
    1718:	fec42703          	lw	a4,-20(s0)
    171c:	c3d8                	sw	a4,4(a5)
}
    171e:	0001                	nop
    1720:	4472                	lw	s0,28(sp)
    1722:	6105                	addi	sp,sp,32
    1724:	8082                	ret

00001726 <EXTI_DeInit>:
 *        reset values.
 *
 * @return  none.
 */
void EXTI_DeInit(void)
{
    1726:	1141                	addi	sp,sp,-16
    1728:	c622                	sw	s0,12(sp)
    172a:	0800                	addi	s0,sp,16
    EXTI->INTENR = 0x00000000;
    172c:	400107b7          	lui	a5,0x40010
    1730:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1734:	0007a023          	sw	zero,0(a5)
    EXTI->EVENR = 0x00000000;
    1738:	400107b7          	lui	a5,0x40010
    173c:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1740:	0007a223          	sw	zero,4(a5)
    EXTI->RTENR = 0x00000000;
    1744:	400107b7          	lui	a5,0x40010
    1748:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    174c:	0007a423          	sw	zero,8(a5)
    EXTI->FTENR = 0x00000000;
    1750:	400107b7          	lui	a5,0x40010
    1754:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1758:	0007a623          	sw	zero,12(a5)
    EXTI->INTFR = 0x000FFFFF;
    175c:	400107b7          	lui	a5,0x40010
    1760:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1764:	00100737          	lui	a4,0x100
    1768:	177d                	addi	a4,a4,-1
    176a:	cbd8                	sw	a4,20(a5)
}
    176c:	0001                	nop
    176e:	4432                	lw	s0,12(sp)
    1770:	0141                	addi	sp,sp,16
    1772:	8082                	ret

00001774 <EXTI_Init>:
 * @param   EXTI_InitStruct: pointer to a EXTI_InitTypeDef structure
 *
 * @return  none.
 */
void EXTI_Init(EXTI_InitTypeDef *EXTI_InitStruct)
{
    1774:	7179                	addi	sp,sp,-48
    1776:	d622                	sw	s0,44(sp)
    1778:	1800                	addi	s0,sp,48
    177a:	fca42e23          	sw	a0,-36(s0)
    uint32_t tmp = 0;
    177e:	fe042623          	sw	zero,-20(s0)

    tmp = (uint32_t)EXTI_BASE;
    1782:	400107b7          	lui	a5,0x40010
    1786:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    178a:	fef42623          	sw	a5,-20(s0)
    if(EXTI_InitStruct->EXTI_LineCmd != DISABLE)
    178e:	fdc42783          	lw	a5,-36(s0)
    1792:	47dc                	lw	a5,12(a5)
    1794:	12078063          	beqz	a5,18b4 <EXTI_Init+0x140>
    {
        EXTI->INTENR &= ~EXTI_InitStruct->EXTI_Line;
    1798:	400107b7          	lui	a5,0x40010
    179c:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    17a0:	4394                	lw	a3,0(a5)
    17a2:	fdc42783          	lw	a5,-36(s0)
    17a6:	439c                	lw	a5,0(a5)
    17a8:	fff7c713          	not	a4,a5
    17ac:	400107b7          	lui	a5,0x40010
    17b0:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    17b4:	8f75                	and	a4,a4,a3
    17b6:	c398                	sw	a4,0(a5)
        EXTI->EVENR &= ~EXTI_InitStruct->EXTI_Line;
    17b8:	400107b7          	lui	a5,0x40010
    17bc:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    17c0:	43d4                	lw	a3,4(a5)
    17c2:	fdc42783          	lw	a5,-36(s0)
    17c6:	439c                	lw	a5,0(a5)
    17c8:	fff7c713          	not	a4,a5
    17cc:	400107b7          	lui	a5,0x40010
    17d0:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    17d4:	8f75                	and	a4,a4,a3
    17d6:	c3d8                	sw	a4,4(a5)
        tmp += EXTI_InitStruct->EXTI_Mode;
    17d8:	fdc42783          	lw	a5,-36(s0)
    17dc:	43dc                	lw	a5,4(a5)
    17de:	fec42703          	lw	a4,-20(s0)
    17e2:	97ba                	add	a5,a5,a4
    17e4:	fef42623          	sw	a5,-20(s0)
        *(__IO uint32_t *)tmp |= EXTI_InitStruct->EXTI_Line;
    17e8:	fec42783          	lw	a5,-20(s0)
    17ec:	4394                	lw	a3,0(a5)
    17ee:	fdc42783          	lw	a5,-36(s0)
    17f2:	4398                	lw	a4,0(a5)
    17f4:	fec42783          	lw	a5,-20(s0)
    17f8:	8f55                	or	a4,a4,a3
    17fa:	c398                	sw	a4,0(a5)
        EXTI->RTENR &= ~EXTI_InitStruct->EXTI_Line;
    17fc:	400107b7          	lui	a5,0x40010
    1800:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1804:	4794                	lw	a3,8(a5)
    1806:	fdc42783          	lw	a5,-36(s0)
    180a:	439c                	lw	a5,0(a5)
    180c:	fff7c713          	not	a4,a5
    1810:	400107b7          	lui	a5,0x40010
    1814:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1818:	8f75                	and	a4,a4,a3
    181a:	c798                	sw	a4,8(a5)
        EXTI->FTENR &= ~EXTI_InitStruct->EXTI_Line;
    181c:	400107b7          	lui	a5,0x40010
    1820:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1824:	47d4                	lw	a3,12(a5)
    1826:	fdc42783          	lw	a5,-36(s0)
    182a:	439c                	lw	a5,0(a5)
    182c:	fff7c713          	not	a4,a5
    1830:	400107b7          	lui	a5,0x40010
    1834:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1838:	8f75                	and	a4,a4,a3
    183a:	c7d8                	sw	a4,12(a5)
        if(EXTI_InitStruct->EXTI_Trigger == EXTI_Trigger_Rising_Falling)
    183c:	fdc42783          	lw	a5,-36(s0)
    1840:	4798                	lw	a4,8(a5)
    1842:	47c1                	li	a5,16
    1844:	02f71f63          	bne	a4,a5,1882 <EXTI_Init+0x10e>
        {
            EXTI->RTENR |= EXTI_InitStruct->EXTI_Line;
    1848:	400107b7          	lui	a5,0x40010
    184c:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1850:	4794                	lw	a3,8(a5)
    1852:	fdc42783          	lw	a5,-36(s0)
    1856:	4398                	lw	a4,0(a5)
    1858:	400107b7          	lui	a5,0x40010
    185c:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1860:	8f55                	or	a4,a4,a3
    1862:	c798                	sw	a4,8(a5)
            EXTI->FTENR |= EXTI_InitStruct->EXTI_Line;
    1864:	400107b7          	lui	a5,0x40010
    1868:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    186c:	47d4                	lw	a3,12(a5)
    186e:	fdc42783          	lw	a5,-36(s0)
    1872:	4398                	lw	a4,0(a5)
    1874:	400107b7          	lui	a5,0x40010
    1878:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    187c:	8f55                	or	a4,a4,a3
    187e:	c7d8                	sw	a4,12(a5)
    else
    {
        tmp += EXTI_InitStruct->EXTI_Mode;
        *(__IO uint32_t *)tmp &= ~EXTI_InitStruct->EXTI_Line;
    }
}
    1880:	a8b1                	j	18dc <EXTI_Init+0x168>
            tmp = (uint32_t)EXTI_BASE;
    1882:	400107b7          	lui	a5,0x40010
    1886:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    188a:	fef42623          	sw	a5,-20(s0)
            tmp += EXTI_InitStruct->EXTI_Trigger;
    188e:	fdc42783          	lw	a5,-36(s0)
    1892:	479c                	lw	a5,8(a5)
    1894:	fec42703          	lw	a4,-20(s0)
    1898:	97ba                	add	a5,a5,a4
    189a:	fef42623          	sw	a5,-20(s0)
            *(__IO uint32_t *)tmp |= EXTI_InitStruct->EXTI_Line;
    189e:	fec42783          	lw	a5,-20(s0)
    18a2:	4394                	lw	a3,0(a5)
    18a4:	fdc42783          	lw	a5,-36(s0)
    18a8:	4398                	lw	a4,0(a5)
    18aa:	fec42783          	lw	a5,-20(s0)
    18ae:	8f55                	or	a4,a4,a3
    18b0:	c398                	sw	a4,0(a5)
}
    18b2:	a02d                	j	18dc <EXTI_Init+0x168>
        tmp += EXTI_InitStruct->EXTI_Mode;
    18b4:	fdc42783          	lw	a5,-36(s0)
    18b8:	43dc                	lw	a5,4(a5)
    18ba:	fec42703          	lw	a4,-20(s0)
    18be:	97ba                	add	a5,a5,a4
    18c0:	fef42623          	sw	a5,-20(s0)
        *(__IO uint32_t *)tmp &= ~EXTI_InitStruct->EXTI_Line;
    18c4:	fec42783          	lw	a5,-20(s0)
    18c8:	4394                	lw	a3,0(a5)
    18ca:	fdc42783          	lw	a5,-36(s0)
    18ce:	439c                	lw	a5,0(a5)
    18d0:	fff7c713          	not	a4,a5
    18d4:	fec42783          	lw	a5,-20(s0)
    18d8:	8f75                	and	a4,a4,a3
    18da:	c398                	sw	a4,0(a5)
}
    18dc:	0001                	nop
    18de:	5432                	lw	s0,44(sp)
    18e0:	6145                	addi	sp,sp,48
    18e2:	8082                	ret

000018e4 <EXTI_StructInit>:
 * @param   EXTI_InitStruct - pointer to a EXTI_InitTypeDef structure
 *
 * @return  none.
 */
void EXTI_StructInit(EXTI_InitTypeDef *EXTI_InitStruct)
{
    18e4:	1101                	addi	sp,sp,-32
    18e6:	ce22                	sw	s0,28(sp)
    18e8:	1000                	addi	s0,sp,32
    18ea:	fea42623          	sw	a0,-20(s0)
    EXTI_InitStruct->EXTI_Line = EXTI_LINENONE;
    18ee:	fec42783          	lw	a5,-20(s0)
    18f2:	0007a023          	sw	zero,0(a5)
    EXTI_InitStruct->EXTI_Mode = EXTI_Mode_Interrupt;
    18f6:	fec42783          	lw	a5,-20(s0)
    18fa:	0007a223          	sw	zero,4(a5)
    EXTI_InitStruct->EXTI_Trigger = EXTI_Trigger_Falling;
    18fe:	fec42783          	lw	a5,-20(s0)
    1902:	4731                	li	a4,12
    1904:	c798                	sw	a4,8(a5)
    EXTI_InitStruct->EXTI_LineCmd = DISABLE;
    1906:	fec42783          	lw	a5,-20(s0)
    190a:	0007a623          	sw	zero,12(a5)
}
    190e:	0001                	nop
    1910:	4472                	lw	s0,28(sp)
    1912:	6105                	addi	sp,sp,32
    1914:	8082                	ret

00001916 <EXTI_GenerateSWInterrupt>:
 * @param   EXTI_Line - specifies the EXTI lines to be enabled or disabled.
 *
 * @return  none.
 */
void EXTI_GenerateSWInterrupt(uint32_t EXTI_Line)
{
    1916:	1101                	addi	sp,sp,-32
    1918:	ce22                	sw	s0,28(sp)
    191a:	1000                	addi	s0,sp,32
    191c:	fea42623          	sw	a0,-20(s0)
    EXTI->SWIEVR |= EXTI_Line;
    1920:	400107b7          	lui	a5,0x40010
    1924:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1928:	4b94                	lw	a3,16(a5)
    192a:	400107b7          	lui	a5,0x40010
    192e:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1932:	fec42703          	lw	a4,-20(s0)
    1936:	8f55                	or	a4,a4,a3
    1938:	cb98                	sw	a4,16(a5)
}
    193a:	0001                	nop
    193c:	4472                	lw	s0,28(sp)
    193e:	6105                	addi	sp,sp,32
    1940:	8082                	ret

00001942 <EXTI_GetFlagStatus>:
 * @param   EXTI_Line - specifies the EXTI lines to be enabled or disabled.
 *
 * @return  The new state of EXTI_Line (SET or RESET).
 */
FlagStatus EXTI_GetFlagStatus(uint32_t EXTI_Line)
{
    1942:	7179                	addi	sp,sp,-48
    1944:	d622                	sw	s0,44(sp)
    1946:	1800                	addi	s0,sp,48
    1948:	fca42e23          	sw	a0,-36(s0)
    FlagStatus bitstatus = RESET;
    194c:	fe042623          	sw	zero,-20(s0)
    if((EXTI->INTFR & EXTI_Line) != (uint32_t)RESET)
    1950:	400107b7          	lui	a5,0x40010
    1954:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1958:	4bd8                	lw	a4,20(a5)
    195a:	fdc42783          	lw	a5,-36(s0)
    195e:	8ff9                	and	a5,a5,a4
    1960:	c789                	beqz	a5,196a <EXTI_GetFlagStatus+0x28>
    {
        bitstatus = SET;
    1962:	4785                	li	a5,1
    1964:	fef42623          	sw	a5,-20(s0)
    1968:	a019                	j	196e <EXTI_GetFlagStatus+0x2c>
    }
    else
    {
        bitstatus = RESET;
    196a:	fe042623          	sw	zero,-20(s0)
    }
    return bitstatus;
    196e:	fec42783          	lw	a5,-20(s0)
}
    1972:	853e                	mv	a0,a5
    1974:	5432                	lw	s0,44(sp)
    1976:	6145                	addi	sp,sp,48
    1978:	8082                	ret

0000197a <EXTI_ClearFlag>:
 * @param   EXTI_Line - specifies the EXTI lines to be enabled or disabled.
 *
 * @return  None
 */
void EXTI_ClearFlag(uint32_t EXTI_Line)
{
    197a:	1101                	addi	sp,sp,-32
    197c:	ce22                	sw	s0,28(sp)
    197e:	1000                	addi	s0,sp,32
    1980:	fea42623          	sw	a0,-20(s0)
    EXTI->INTFR = EXTI_Line;
    1984:	400107b7          	lui	a5,0x40010
    1988:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    198c:	fec42703          	lw	a4,-20(s0)
    1990:	cbd8                	sw	a4,20(a5)
}
    1992:	0001                	nop
    1994:	4472                	lw	s0,28(sp)
    1996:	6105                	addi	sp,sp,32
    1998:	8082                	ret

0000199a <EXTI_GetITStatus>:
 * @param   EXTI_Line - specifies the EXTI lines to be enabled or disabled.
 *
 * @return  The new state of EXTI_Line (SET or RESET).
 */
ITStatus EXTI_GetITStatus(uint32_t EXTI_Line)
{
    199a:	7179                	addi	sp,sp,-48
    199c:	d622                	sw	s0,44(sp)
    199e:	1800                	addi	s0,sp,48
    19a0:	fca42e23          	sw	a0,-36(s0)
    ITStatus bitstatus = RESET;
    19a4:	fe042623          	sw	zero,-20(s0)
    uint32_t enablestatus = 0;
    19a8:	fe042423          	sw	zero,-24(s0)

    enablestatus = EXTI->INTENR & EXTI_Line;
    19ac:	400107b7          	lui	a5,0x40010
    19b0:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    19b4:	439c                	lw	a5,0(a5)
    19b6:	fdc42703          	lw	a4,-36(s0)
    19ba:	8ff9                	and	a5,a5,a4
    19bc:	fef42423          	sw	a5,-24(s0)
    if(((EXTI->INTFR & EXTI_Line) != (uint32_t)RESET) && (enablestatus != (uint32_t)RESET))
    19c0:	400107b7          	lui	a5,0x40010
    19c4:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    19c8:	4bd8                	lw	a4,20(a5)
    19ca:	fdc42783          	lw	a5,-36(s0)
    19ce:	8ff9                	and	a5,a5,a4
    19d0:	cb81                	beqz	a5,19e0 <EXTI_GetITStatus+0x46>
    19d2:	fe842783          	lw	a5,-24(s0)
    19d6:	c789                	beqz	a5,19e0 <EXTI_GetITStatus+0x46>
    {
        bitstatus = SET;
    19d8:	4785                	li	a5,1
    19da:	fef42623          	sw	a5,-20(s0)
    19de:	a019                	j	19e4 <EXTI_GetITStatus+0x4a>
    }
    else
    {
        bitstatus = RESET;
    19e0:	fe042623          	sw	zero,-20(s0)
    }
    return bitstatus;
    19e4:	fec42783          	lw	a5,-20(s0)
}
    19e8:	853e                	mv	a0,a5
    19ea:	5432                	lw	s0,44(sp)
    19ec:	6145                	addi	sp,sp,48
    19ee:	8082                	ret

000019f0 <EXTI_ClearITPendingBit>:
 * @param   EXTI_Line - specifies the EXTI lines to be enabled or disabled.
 *
 * @return  none
 */
void EXTI_ClearITPendingBit(uint32_t EXTI_Line)
{
    19f0:	1101                	addi	sp,sp,-32
    19f2:	ce22                	sw	s0,28(sp)
    19f4:	1000                	addi	s0,sp,32
    19f6:	fea42623          	sw	a0,-20(s0)
    EXTI->INTFR = EXTI_Line;
    19fa:	400107b7          	lui	a5,0x40010
    19fe:	40078793          	addi	a5,a5,1024 # 40010400 <_eusrstack+0x2000c400>
    1a02:	fec42703          	lw	a4,-20(s0)
    1a06:	cbd8                	sw	a4,20(a5)
}
    1a08:	0001                	nop
    1a0a:	4472                	lw	s0,28(sp)
    1a0c:	6105                	addi	sp,sp,32
    1a0e:	8082                	ret

00001a10 <FLASH_SetLatency>:
  *                    FLASH_Latency_2 - FLASH Two Latency cycles
  *
  * @return         None
  */
void FLASH_SetLatency(uint32_t FLASH_Latency)
{
    1a10:	7179                	addi	sp,sp,-48
    1a12:	d622                	sw	s0,44(sp)
    1a14:	1800                	addi	s0,sp,48
    1a16:	fca42e23          	sw	a0,-36(s0)
    uint32_t tmpreg = 0;
    1a1a:	fe042623          	sw	zero,-20(s0)

    tmpreg = FLASH->ACTLR;
    1a1e:	400227b7          	lui	a5,0x40022
    1a22:	439c                	lw	a5,0(a5)
    1a24:	fef42623          	sw	a5,-20(s0)
    tmpreg &= ACR_LATENCY_Mask;
    1a28:	fec42783          	lw	a5,-20(s0)
    1a2c:	0387f793          	andi	a5,a5,56
    1a30:	fef42623          	sw	a5,-20(s0)
    tmpreg |= FLASH_Latency;
    1a34:	fec42703          	lw	a4,-20(s0)
    1a38:	fdc42783          	lw	a5,-36(s0)
    1a3c:	8fd9                	or	a5,a5,a4
    1a3e:	fef42623          	sw	a5,-20(s0)
    FLASH->ACTLR = tmpreg;
    1a42:	400227b7          	lui	a5,0x40022
    1a46:	fec42703          	lw	a4,-20(s0)
    1a4a:	c398                	sw	a4,0(a5)
}
    1a4c:	0001                	nop
    1a4e:	5432                	lw	s0,44(sp)
    1a50:	6145                	addi	sp,sp,48
    1a52:	8082                	ret

00001a54 <FLASH_Unlock>:
 * @brief          Unlocks the FLASH Program Erase Controller.
 *
 * @return         None
 */
void FLASH_Unlock(void)
{
    1a54:	1141                	addi	sp,sp,-16
    1a56:	c622                	sw	s0,12(sp)
    1a58:	0800                	addi	s0,sp,16
    /* Authorize the FPEC of Bank1 Access */
    FLASH->KEYR = FLASH_KEY1;
    1a5a:	400227b7          	lui	a5,0x40022
    1a5e:	45670737          	lui	a4,0x45670
    1a62:	12370713          	addi	a4,a4,291 # 45670123 <_eusrstack+0x2566c123>
    1a66:	c3d8                	sw	a4,4(a5)
    FLASH->KEYR = FLASH_KEY2;
    1a68:	400227b7          	lui	a5,0x40022
    1a6c:	cdef9737          	lui	a4,0xcdef9
    1a70:	9ab70713          	addi	a4,a4,-1621 # cdef89ab <_eusrstack+0xadef49ab>
    1a74:	c3d8                	sw	a4,4(a5)
}
    1a76:	0001                	nop
    1a78:	4432                	lw	s0,12(sp)
    1a7a:	0141                	addi	sp,sp,16
    1a7c:	8082                	ret

00001a7e <FLASH_Lock>:
 * @brief          Locks the FLASH Program Erase Controller.
 *
 * @return         None
 */
void FLASH_Lock(void)
{
    1a7e:	1141                	addi	sp,sp,-16
    1a80:	c622                	sw	s0,12(sp)
    1a82:	0800                	addi	s0,sp,16
    FLASH->CTLR |= CR_LOCK_Set;
    1a84:	400227b7          	lui	a5,0x40022
    1a88:	4b98                	lw	a4,16(a5)
    1a8a:	400227b7          	lui	a5,0x40022
    1a8e:	08076713          	ori	a4,a4,128
    1a92:	cb98                	sw	a4,16(a5)
}
    1a94:	0001                	nop
    1a96:	4432                	lw	s0,12(sp)
    1a98:	0141                	addi	sp,sp,16
    1a9a:	8082                	ret

00001a9c <FLASH_ErasePage>:
 *
 * @return         FLASH Status - The returned value can be: FLASH_BUSY, FLASH_ERROR_PG,
 *                 FLASH_ERROR_WRP, FLASH_COMPLETE or FLASH_TIMEOUT.
 */
FLASH_Status FLASH_ErasePage(uint32_t Page_Address)
{
    1a9c:	7179                	addi	sp,sp,-48
    1a9e:	d606                	sw	ra,44(sp)
    1aa0:	d422                	sw	s0,40(sp)
    1aa2:	1800                	addi	s0,sp,48
    1aa4:	fca42e23          	sw	a0,-36(s0)
    FLASH_Status status = FLASH_COMPLETE;
    1aa8:	4791                	li	a5,4
    1aaa:	fef42623          	sw	a5,-20(s0)

    status = FLASH_WaitForLastOperation(EraseTimeout);
    1aae:	000b0537          	lui	a0,0xb0
    1ab2:	2511                	jal	20b6 <FLASH_WaitForLastOperation>
    1ab4:	fea42623          	sw	a0,-20(s0)

    if(status == FLASH_COMPLETE)
    1ab8:	fec42703          	lw	a4,-20(s0)
    1abc:	4791                	li	a5,4
    1abe:	04f71363          	bne	a4,a5,1b04 <FLASH_ErasePage+0x68>
    {
        FLASH->CTLR |= CR_PER_Set;
    1ac2:	400227b7          	lui	a5,0x40022
    1ac6:	4b98                	lw	a4,16(a5)
    1ac8:	400227b7          	lui	a5,0x40022
    1acc:	00276713          	ori	a4,a4,2
    1ad0:	cb98                	sw	a4,16(a5)
        FLASH->ADDR = Page_Address;
    1ad2:	400227b7          	lui	a5,0x40022
    1ad6:	fdc42703          	lw	a4,-36(s0)
    1ada:	cbd8                	sw	a4,20(a5)
        FLASH->CTLR |= CR_STRT_Set;
    1adc:	400227b7          	lui	a5,0x40022
    1ae0:	4b98                	lw	a4,16(a5)
    1ae2:	400227b7          	lui	a5,0x40022
    1ae6:	04076713          	ori	a4,a4,64
    1aea:	cb98                	sw	a4,16(a5)

        status = FLASH_WaitForLastOperation(EraseTimeout);
    1aec:	000b0537          	lui	a0,0xb0
    1af0:	23d9                	jal	20b6 <FLASH_WaitForLastOperation>
    1af2:	fea42623          	sw	a0,-20(s0)

        FLASH->CTLR &= CR_PER_Reset;
    1af6:	400227b7          	lui	a5,0x40022
    1afa:	4b98                	lw	a4,16(a5)
    1afc:	400227b7          	lui	a5,0x40022
    1b00:	9b75                	andi	a4,a4,-3
    1b02:	cb98                	sw	a4,16(a5)
    }

    return status;
    1b04:	fec42783          	lw	a5,-20(s0)
}
    1b08:	853e                	mv	a0,a5
    1b0a:	50b2                	lw	ra,44(sp)
    1b0c:	5422                	lw	s0,40(sp)
    1b0e:	6145                	addi	sp,sp,48
    1b10:	8082                	ret

00001b12 <FLASH_EraseAllPages>:
 *
 * @return         FLASH Status - The returned value can be:FLASH_BUSY, FLASH_ERROR_PG,
 *                 FLASH_ERROR_WRP, FLASH_COMPLETE or FLASH_TIMEOUT.
 */
FLASH_Status FLASH_EraseAllPages(void)
{
    1b12:	1101                	addi	sp,sp,-32
    1b14:	ce06                	sw	ra,28(sp)
    1b16:	cc22                	sw	s0,24(sp)
    1b18:	1000                	addi	s0,sp,32
    FLASH_Status status = FLASH_COMPLETE;
    1b1a:	4791                	li	a5,4
    1b1c:	fef42623          	sw	a5,-20(s0)

    status = FLASH_WaitForLastOperation(EraseTimeout);
    1b20:	000b0537          	lui	a0,0xb0
    1b24:	2b49                	jal	20b6 <FLASH_WaitForLastOperation>
    1b26:	fea42623          	sw	a0,-20(s0)
    if(status == FLASH_COMPLETE)
    1b2a:	fec42703          	lw	a4,-20(s0)
    1b2e:	4791                	li	a5,4
    1b30:	02f71e63          	bne	a4,a5,1b6c <FLASH_EraseAllPages+0x5a>
    {
        FLASH->CTLR |= CR_MER_Set;
    1b34:	400227b7          	lui	a5,0x40022
    1b38:	4b98                	lw	a4,16(a5)
    1b3a:	400227b7          	lui	a5,0x40022
    1b3e:	00476713          	ori	a4,a4,4
    1b42:	cb98                	sw	a4,16(a5)
        FLASH->CTLR |= CR_STRT_Set;
    1b44:	400227b7          	lui	a5,0x40022
    1b48:	4b98                	lw	a4,16(a5)
    1b4a:	400227b7          	lui	a5,0x40022
    1b4e:	04076713          	ori	a4,a4,64
    1b52:	cb98                	sw	a4,16(a5)

        status = FLASH_WaitForLastOperation(EraseTimeout);
    1b54:	000b0537          	lui	a0,0xb0
    1b58:	2bb9                	jal	20b6 <FLASH_WaitForLastOperation>
    1b5a:	fea42623          	sw	a0,-20(s0)

        FLASH->CTLR &= CR_MER_Reset;
    1b5e:	400227b7          	lui	a5,0x40022
    1b62:	4b98                	lw	a4,16(a5)
    1b64:	400227b7          	lui	a5,0x40022
    1b68:	9b6d                	andi	a4,a4,-5
    1b6a:	cb98                	sw	a4,16(a5)
    }

    return status;
    1b6c:	fec42783          	lw	a5,-20(s0)
}
    1b70:	853e                	mv	a0,a5
    1b72:	40f2                	lw	ra,28(sp)
    1b74:	4462                	lw	s0,24(sp)
    1b76:	6105                	addi	sp,sp,32
    1b78:	8082                	ret

00001b7a <FLASH_EraseOptionBytes>:
 *
 * @return         FLASH Status - The returned value can be: FLASH_BUSY, FLASH_ERROR_PG,
 *                 FLASH_ERROR_WRP, FLASH_COMPLETE or FLASH_TIMEOUT.
 */
FLASH_Status FLASH_EraseOptionBytes(void)
{
    1b7a:	1101                	addi	sp,sp,-32
    1b7c:	ce06                	sw	ra,28(sp)
    1b7e:	cc22                	sw	s0,24(sp)
    1b80:	1000                	addi	s0,sp,32
    FLASH_Status status = FLASH_COMPLETE;
    1b82:	4791                	li	a5,4
    1b84:	fef42623          	sw	a5,-20(s0)

    status = FLASH_WaitForLastOperation(EraseTimeout);
    1b88:	000b0537          	lui	a0,0xb0
    1b8c:	232d                	jal	20b6 <FLASH_WaitForLastOperation>
    1b8e:	fea42623          	sw	a0,-20(s0)
    if(status == FLASH_COMPLETE)
    1b92:	fec42703          	lw	a4,-20(s0)
    1b96:	4791                	li	a5,4
    1b98:	04f71f63          	bne	a4,a5,1bf6 <FLASH_EraseOptionBytes+0x7c>
    {
        FLASH_Unlock();
    1b9c:	3d65                	jal	1a54 <FLASH_Unlock>

        FLASH->OBKEYR = FLASH_KEY1;
    1b9e:	400227b7          	lui	a5,0x40022
    1ba2:	45670737          	lui	a4,0x45670
    1ba6:	12370713          	addi	a4,a4,291 # 45670123 <_eusrstack+0x2566c123>
    1baa:	c798                	sw	a4,8(a5)
        FLASH->OBKEYR = FLASH_KEY2;
    1bac:	400227b7          	lui	a5,0x40022
    1bb0:	cdef9737          	lui	a4,0xcdef9
    1bb4:	9ab70713          	addi	a4,a4,-1621 # cdef89ab <_eusrstack+0xadef49ab>
    1bb8:	c798                	sw	a4,8(a5)

        FLASH->CTLR |= CR_OPTER_Set;
    1bba:	400227b7          	lui	a5,0x40022
    1bbe:	4b98                	lw	a4,16(a5)
    1bc0:	400227b7          	lui	a5,0x40022
    1bc4:	02076713          	ori	a4,a4,32
    1bc8:	cb98                	sw	a4,16(a5)
        FLASH->CTLR |= CR_STRT_Set;
    1bca:	400227b7          	lui	a5,0x40022
    1bce:	4b98                	lw	a4,16(a5)
    1bd0:	400227b7          	lui	a5,0x40022
    1bd4:	04076713          	ori	a4,a4,64
    1bd8:	cb98                	sw	a4,16(a5)
        status = FLASH_WaitForLastOperation(EraseTimeout);
    1bda:	000b0537          	lui	a0,0xb0
    1bde:	29e1                	jal	20b6 <FLASH_WaitForLastOperation>
    1be0:	fea42623          	sw	a0,-20(s0)

        FLASH->CTLR &= CR_OPTER_Reset;
    1be4:	400227b7          	lui	a5,0x40022
    1be8:	4b98                	lw	a4,16(a5)
    1bea:	400227b7          	lui	a5,0x40022
    1bee:	fdf77713          	andi	a4,a4,-33
    1bf2:	cb98                	sw	a4,16(a5)

        FLASH_Lock();
    1bf4:	3569                	jal	1a7e <FLASH_Lock>
    }
    return status;
    1bf6:	fec42783          	lw	a5,-20(s0)
}
    1bfa:	853e                	mv	a0,a5
    1bfc:	40f2                	lw	ra,28(sp)
    1bfe:	4462                	lw	s0,24(sp)
    1c00:	6105                	addi	sp,sp,32
    1c02:	8082                	ret

00001c04 <FLASH_OptionBytePR>:
 * @param     pbuf - data.
 *
 * @return    none
 */
void FLASH_OptionBytePR(u32* pbuf)
{
    1c04:	7179                	addi	sp,sp,-48
    1c06:	d606                	sw	ra,44(sp)
    1c08:	d422                	sw	s0,40(sp)
    1c0a:	1800                	addi	s0,sp,48
    1c0c:	fca42e23          	sw	a0,-36(s0)
    uint8_t i;

    FLASH_EraseOptionBytes();
    1c10:	37ad                	jal	1b7a <FLASH_EraseOptionBytes>
    FLASH_Unlock_Fast();
    1c12:	23b1                	jal	215e <FLASH_Unlock_Fast>
    FLASH_BufReset();
    1c14:	237d                	jal	21c2 <FLASH_BufReset>

    for(i=0; i<4; i++)
    1c16:	fe0407a3          	sb	zero,-17(s0)
    1c1a:	a815                	j	1c4e <FLASH_OptionBytePR+0x4a>
    {
        FLASH_BufLoad((OB_BASE + 4*i), *pbuf++);
    1c1c:	fef44783          	lbu	a5,-17(s0)
    1c20:	078a                	slli	a5,a5,0x2
    1c22:	873e                	mv	a4,a5
    1c24:	200007b7          	lui	a5,0x20000
    1c28:	80078793          	addi	a5,a5,-2048 # 1ffff800 <_data_lma+0x1fff354c>
    1c2c:	00f706b3          	add	a3,a4,a5
    1c30:	fdc42783          	lw	a5,-36(s0)
    1c34:	00478713          	addi	a4,a5,4
    1c38:	fce42e23          	sw	a4,-36(s0)
    1c3c:	439c                	lw	a5,0(a5)
    1c3e:	85be                	mv	a1,a5
    1c40:	8536                	mv	a0,a3
    1c42:	23f9                	jal	2210 <FLASH_BufLoad>
    for(i=0; i<4; i++)
    1c44:	fef44783          	lbu	a5,-17(s0)
    1c48:	0785                	addi	a5,a5,1
    1c4a:	fef407a3          	sb	a5,-17(s0)
    1c4e:	fef44703          	lbu	a4,-17(s0)
    1c52:	478d                	li	a5,3
    1c54:	fce7f4e3          	bgeu	a5,a4,1c1c <FLASH_OptionBytePR+0x18>
    }

    FLASH_ProgramPage_Fast(OB_BASE);
    1c58:	200007b7          	lui	a5,0x20000
    1c5c:	80078513          	addi	a0,a5,-2048 # 1ffff800 <_data_lma+0x1fff354c>
    1c60:	2dd9                	jal	2336 <FLASH_ProgramPage_Fast>
    FLASH_Lock_Fast();
    1c62:	2389                	jal	21a4 <FLASH_Lock_Fast>
}
    1c64:	0001                	nop
    1c66:	50b2                	lw	ra,44(sp)
    1c68:	5422                	lw	s0,40(sp)
    1c6a:	6145                	addi	sp,sp,48
    1c6c:	8082                	ret

00001c6e <FLASH_EnableWriteProtection>:
 *
 * @return  FLASH Status - The returned value can be: FLASH_BUSY, FLASH_ERROR_PG,
 *        FLASH_ERROR_WRP, FLASH_COMPLETE , FLASH_TIMEOUT or FLASH_RDP.
 */
FLASH_Status FLASH_EnableWriteProtection(uint32_t FLASH_Pages)
{
    1c6e:	7139                	addi	sp,sp,-64
    1c70:	de06                	sw	ra,60(sp)
    1c72:	dc22                	sw	s0,56(sp)
    1c74:	0080                	addi	s0,sp,64
    1c76:	fca42623          	sw	a0,-52(s0)
    uint8_t     WRP0_Data = 0xFF, WRP1_Data = 0xFF, WRP2_Data = 0xFF, WRP3_Data = 0xFF;
    1c7a:	57fd                	li	a5,-1
    1c7c:	fef403a3          	sb	a5,-25(s0)
    1c80:	57fd                	li	a5,-1
    1c82:	fef40323          	sb	a5,-26(s0)
    1c86:	57fd                	li	a5,-1
    1c88:	fef402a3          	sb	a5,-27(s0)
    1c8c:	57fd                	li	a5,-1
    1c8e:	fef40223          	sb	a5,-28(s0)
    uint32_t buf[4];
    uint8_t i;
    FLASH_Status status = FLASH_COMPLETE;
    1c92:	4791                	li	a5,4
    1c94:	fef42423          	sw	a5,-24(s0)

    if((FLASH->OBR & RDPRT_Mask) != (uint32_t)RESET)
    1c98:	400227b7          	lui	a5,0x40022
    1c9c:	4fdc                	lw	a5,28(a5)
    1c9e:	8b89                	andi	a5,a5,2
    1ca0:	c789                	beqz	a5,1caa <FLASH_EnableWriteProtection+0x3c>
    {
        status = FLASH_RDP;
    1ca2:	4799                	li	a5,6
    1ca4:	fef42423          	sw	a5,-24(s0)
    1ca8:	a0fd                	j	1d96 <FLASH_EnableWriteProtection+0x128>
    }
    else{
        FLASH_Pages = (uint32_t)(~FLASH_Pages);
    1caa:	fcc42783          	lw	a5,-52(s0)
    1cae:	fff7c793          	not	a5,a5
    1cb2:	fcf42623          	sw	a5,-52(s0)
        WRP0_Data = (uint8_t)(FLASH_Pages & WRP0_Mask);
    1cb6:	fcc42783          	lw	a5,-52(s0)
    1cba:	fef403a3          	sb	a5,-25(s0)
        WRP1_Data = (uint8_t)((FLASH_Pages & WRP1_Mask) >> 8);
    1cbe:	fcc42783          	lw	a5,-52(s0)
    1cc2:	83a1                	srli	a5,a5,0x8
    1cc4:	fef40323          	sb	a5,-26(s0)
        WRP2_Data = (uint8_t)((FLASH_Pages & WRP2_Mask) >> 16);
    1cc8:	fcc42783          	lw	a5,-52(s0)
    1ccc:	83c1                	srli	a5,a5,0x10
    1cce:	fef402a3          	sb	a5,-27(s0)
        WRP3_Data = (uint8_t)((FLASH_Pages & WRP3_Mask) >> 24);
    1cd2:	fcc42783          	lw	a5,-52(s0)
    1cd6:	83e1                	srli	a5,a5,0x18
    1cd8:	fef40223          	sb	a5,-28(s0)

        status = FLASH_WaitForLastOperation(ProgramTimeout);
    1cdc:	6515                	lui	a0,0x5
    1cde:	2ee1                	jal	20b6 <FLASH_WaitForLastOperation>
    1ce0:	fea42423          	sw	a0,-24(s0)

        if(status == FLASH_COMPLETE)
    1ce4:	fe842703          	lw	a4,-24(s0)
    1ce8:	4791                	li	a5,4
    1cea:	0af71663          	bne	a4,a5,1d96 <FLASH_EnableWriteProtection+0x128>
        {
            for(i=0; i<4; i++){
    1cee:	fe0407a3          	sb	zero,-17(s0)
    1cf2:	a80d                	j	1d24 <FLASH_EnableWriteProtection+0xb6>
                buf[i] = *(uint32_t*)(OB_BASE + 4*i);
    1cf4:	fef44783          	lbu	a5,-17(s0)
    1cf8:	078a                	slli	a5,a5,0x2
    1cfa:	873e                	mv	a4,a5
    1cfc:	200007b7          	lui	a5,0x20000
    1d00:	80078793          	addi	a5,a5,-2048 # 1ffff800 <_data_lma+0x1fff354c>
    1d04:	97ba                	add	a5,a5,a4
    1d06:	873e                	mv	a4,a5
    1d08:	fef44783          	lbu	a5,-17(s0)
    1d0c:	4318                	lw	a4,0(a4)
    1d0e:	078a                	slli	a5,a5,0x2
    1d10:	ff040693          	addi	a3,s0,-16
    1d14:	97b6                	add	a5,a5,a3
    1d16:	fee7a223          	sw	a4,-28(a5)
            for(i=0; i<4; i++){
    1d1a:	fef44783          	lbu	a5,-17(s0)
    1d1e:	0785                	addi	a5,a5,1
    1d20:	fef407a3          	sb	a5,-17(s0)
    1d24:	fef44703          	lbu	a4,-17(s0)
    1d28:	478d                	li	a5,3
    1d2a:	fce7f5e3          	bgeu	a5,a4,1cf4 <FLASH_EnableWriteProtection+0x86>
            }

            buf[2] = ((uint32_t)(((uint32_t)(WRP0_Data) & 0x00FF) + (((uint32_t)(~WRP0_Data) & 0x00FF) << 8) \
    1d2e:	fe744703          	lbu	a4,-25(s0)
    1d32:	fe744783          	lbu	a5,-25(s0)
    1d36:	fff7c793          	not	a5,a5
    1d3a:	00879693          	slli	a3,a5,0x8
    1d3e:	67c1                	lui	a5,0x10
    1d40:	17fd                	addi	a5,a5,-1
    1d42:	8ff5                	and	a5,a5,a3
    1d44:	973e                	add	a4,a4,a5
                   + (((uint32_t)(WRP1_Data) & 0x00FF) << 16) + (((uint32_t)(~WRP1_Data) & 0x00FF) << 24)));
    1d46:	fe644783          	lbu	a5,-26(s0)
    1d4a:	07c2                	slli	a5,a5,0x10
    1d4c:	973e                	add	a4,a4,a5
    1d4e:	fe644783          	lbu	a5,-26(s0)
    1d52:	fff7c793          	not	a5,a5
    1d56:	07e2                	slli	a5,a5,0x18
            buf[2] = ((uint32_t)(((uint32_t)(WRP0_Data) & 0x00FF) + (((uint32_t)(~WRP0_Data) & 0x00FF) << 8) \
    1d58:	97ba                	add	a5,a5,a4
    1d5a:	fcf42e23          	sw	a5,-36(s0)
            buf[3] = ((uint32_t)(((uint32_t)(WRP2_Data) & 0x00FF) + (((uint32_t)(~WRP2_Data) & 0x00FF) << 8) \
    1d5e:	fe544703          	lbu	a4,-27(s0)
    1d62:	fe544783          	lbu	a5,-27(s0)
    1d66:	fff7c793          	not	a5,a5
    1d6a:	00879693          	slli	a3,a5,0x8
    1d6e:	67c1                	lui	a5,0x10
    1d70:	17fd                	addi	a5,a5,-1
    1d72:	8ff5                	and	a5,a5,a3
    1d74:	973e                	add	a4,a4,a5
                   + (((uint32_t)(WRP3_Data) & 0x00FF) << 16) + (((uint32_t)(~WRP3_Data) & 0x00FF) << 24)));
    1d76:	fe444783          	lbu	a5,-28(s0)
    1d7a:	07c2                	slli	a5,a5,0x10
    1d7c:	973e                	add	a4,a4,a5
    1d7e:	fe444783          	lbu	a5,-28(s0)
    1d82:	fff7c793          	not	a5,a5
    1d86:	07e2                	slli	a5,a5,0x18
            buf[3] = ((uint32_t)(((uint32_t)(WRP2_Data) & 0x00FF) + (((uint32_t)(~WRP2_Data) & 0x00FF) << 8) \
    1d88:	97ba                	add	a5,a5,a4
    1d8a:	fef42023          	sw	a5,-32(s0)

            FLASH_OptionBytePR(buf);
    1d8e:	fd440793          	addi	a5,s0,-44
    1d92:	853e                	mv	a0,a5
    1d94:	3d85                	jal	1c04 <FLASH_OptionBytePR>
        }
    }

    return status;
    1d96:	fe842783          	lw	a5,-24(s0)
}
    1d9a:	853e                	mv	a0,a5
    1d9c:	50f2                	lw	ra,60(sp)
    1d9e:	5462                	lw	s0,56(sp)
    1da0:	6121                	addi	sp,sp,64
    1da2:	8082                	ret

00001da4 <FLASH_EnableReadOutProtection>:
 *
 * @return  FLASH Status - The returned value can be: FLASH_BUSY, FLASH_ERROR_PG,
 *        FLASH_ERROR_WRP, FLASH_COMPLETE, FLASH_TIMEOUT or FLASH_RDP.
 */
FLASH_Status FLASH_EnableReadOutProtection(void)
{
    1da4:	7179                	addi	sp,sp,-48
    1da6:	d606                	sw	ra,44(sp)
    1da8:	d422                	sw	s0,40(sp)
    1daa:	1800                	addi	s0,sp,48
    FLASH_Status status = FLASH_COMPLETE;
    1dac:	4791                	li	a5,4
    1dae:	fef42623          	sw	a5,-20(s0)
    uint32_t buf[4];
    uint8_t i;

    if((FLASH->OBR & RDPRT_Mask) != (uint32_t)RESET)
    1db2:	400227b7          	lui	a5,0x40022
    1db6:	4fdc                	lw	a5,28(a5)
    1db8:	8b89                	andi	a5,a5,2
    1dba:	c789                	beqz	a5,1dc4 <FLASH_EnableReadOutProtection+0x20>
    {
        status = FLASH_RDP;
    1dbc:	4799                	li	a5,6
    1dbe:	fef42623          	sw	a5,-20(s0)
    1dc2:	a0bd                	j	1e30 <FLASH_EnableReadOutProtection+0x8c>
    }
    else{
        status = FLASH_WaitForLastOperation(EraseTimeout);
    1dc4:	000b0537          	lui	a0,0xb0
    1dc8:	24fd                	jal	20b6 <FLASH_WaitForLastOperation>
    1dca:	fea42623          	sw	a0,-20(s0)
        if(status == FLASH_COMPLETE)
    1dce:	fec42703          	lw	a4,-20(s0)
    1dd2:	4791                	li	a5,4
    1dd4:	04f71e63          	bne	a4,a5,1e30 <FLASH_EnableReadOutProtection+0x8c>
        {
            for(i=0; i<4; i++){
    1dd8:	fe0405a3          	sb	zero,-21(s0)
    1ddc:	a80d                	j	1e0e <FLASH_EnableReadOutProtection+0x6a>
                buf[i] = *(uint32_t*)(OB_BASE + 4*i);
    1dde:	feb44783          	lbu	a5,-21(s0)
    1de2:	078a                	slli	a5,a5,0x2
    1de4:	873e                	mv	a4,a5
    1de6:	200007b7          	lui	a5,0x20000
    1dea:	80078793          	addi	a5,a5,-2048 # 1ffff800 <_data_lma+0x1fff354c>
    1dee:	97ba                	add	a5,a5,a4
    1df0:	873e                	mv	a4,a5
    1df2:	feb44783          	lbu	a5,-21(s0)
    1df6:	4318                	lw	a4,0(a4)
    1df8:	078a                	slli	a5,a5,0x2
    1dfa:	ff040693          	addi	a3,s0,-16
    1dfe:	97b6                	add	a5,a5,a3
    1e00:	fee7a423          	sw	a4,-24(a5)
            for(i=0; i<4; i++){
    1e04:	feb44783          	lbu	a5,-21(s0)
    1e08:	0785                	addi	a5,a5,1
    1e0a:	fef405a3          	sb	a5,-21(s0)
    1e0e:	feb44703          	lbu	a4,-21(s0)
    1e12:	478d                	li	a5,3
    1e14:	fce7f5e3          	bgeu	a5,a4,1dde <FLASH_EnableReadOutProtection+0x3a>
            }

            buf[0] = 0x000000FF + (buf[0] & 0xFFFF0000);
    1e18:	fd842703          	lw	a4,-40(s0)
    1e1c:	77c1                	lui	a5,0xffff0
    1e1e:	8ff9                	and	a5,a5,a4
    1e20:	0ff78793          	addi	a5,a5,255 # ffff00ff <_eusrstack+0xdffec0ff>
    1e24:	fcf42c23          	sw	a5,-40(s0)
            FLASH_OptionBytePR(buf);
    1e28:	fd840793          	addi	a5,s0,-40
    1e2c:	853e                	mv	a0,a5
    1e2e:	3bd9                	jal	1c04 <FLASH_OptionBytePR>
        }
    }

    return status;
    1e30:	fec42783          	lw	a5,-20(s0)
}
    1e34:	853e                	mv	a0,a5
    1e36:	50b2                	lw	ra,44(sp)
    1e38:	5422                	lw	s0,40(sp)
    1e3a:	6145                	addi	sp,sp,48
    1e3c:	8082                	ret

00001e3e <FLASH_UserOptionByteConfig>:
 *
 * @return  FLASH Status - The returned value can be: FLASH_BUSY, FLASH_ERROR_PG,
 *        FLASH_ERROR_WRP, FLASH_COMPLETE , FLASH_TIMEOUT or FLASH_RDP.
 */
FLASH_Status FLASH_UserOptionByteConfig(uint8_t OB_IWDG, uint8_t OB_STOP, uint8_t OB_STDBY, uint8_t OB_RST)
{
    1e3e:	7139                	addi	sp,sp,-64
    1e40:	de06                	sw	ra,60(sp)
    1e42:	dc22                	sw	s0,56(sp)
    1e44:	0080                	addi	s0,sp,64
    1e46:	87aa                	mv	a5,a0
    1e48:	8736                	mv	a4,a3
    1e4a:	fcf407a3          	sb	a5,-49(s0)
    1e4e:	87ae                	mv	a5,a1
    1e50:	fcf40723          	sb	a5,-50(s0)
    1e54:	87b2                	mv	a5,a2
    1e56:	fcf406a3          	sb	a5,-51(s0)
    1e5a:	87ba                	mv	a5,a4
    1e5c:	fcf40623          	sb	a5,-52(s0)
    FLASH_Status status = FLASH_COMPLETE;
    1e60:	4791                	li	a5,4
    1e62:	fef42623          	sw	a5,-20(s0)
    uint8_t UserByte;
    uint32_t buf[4];
    uint8_t i;

    if((FLASH->OBR & RDPRT_Mask) != (uint32_t)RESET)
    1e66:	400227b7          	lui	a5,0x40022
    1e6a:	4fdc                	lw	a5,28(a5)
    1e6c:	8b89                	andi	a5,a5,2
    1e6e:	c789                	beqz	a5,1e78 <FLASH_UserOptionByteConfig+0x3a>
    {
        status = FLASH_RDP;
    1e70:	4799                	li	a5,6
    1e72:	fef42623          	sw	a5,-20(s0)
    1e76:	a851                	j	1f0a <FLASH_UserOptionByteConfig+0xcc>
    }
    else{
        UserByte = OB_IWDG | (uint8_t)(OB_STOP | (uint8_t)(OB_STDBY | (uint8_t)(OB_RST | (uint8_t)0xE0)));
    1e78:	fcc44703          	lbu	a4,-52(s0)
    1e7c:	fcd44783          	lbu	a5,-51(s0)
    1e80:	8fd9                	or	a5,a5,a4
    1e82:	0ff7f713          	andi	a4,a5,255
    1e86:	fce44783          	lbu	a5,-50(s0)
    1e8a:	8fd9                	or	a5,a5,a4
    1e8c:	0ff7f713          	andi	a4,a5,255
    1e90:	fcf44783          	lbu	a5,-49(s0)
    1e94:	8fd9                	or	a5,a5,a4
    1e96:	0ff7f793          	andi	a5,a5,255
    1e9a:	fe07e793          	ori	a5,a5,-32
    1e9e:	fef40523          	sb	a5,-22(s0)

        for(i=0; i<4; i++){
    1ea2:	fe0405a3          	sb	zero,-21(s0)
    1ea6:	a80d                	j	1ed8 <FLASH_UserOptionByteConfig+0x9a>
            buf[i] = *(uint32_t*)(OB_BASE + 4*i);
    1ea8:	feb44783          	lbu	a5,-21(s0)
    1eac:	078a                	slli	a5,a5,0x2
    1eae:	873e                	mv	a4,a5
    1eb0:	200007b7          	lui	a5,0x20000
    1eb4:	80078793          	addi	a5,a5,-2048 # 1ffff800 <_data_lma+0x1fff354c>
    1eb8:	97ba                	add	a5,a5,a4
    1eba:	873e                	mv	a4,a5
    1ebc:	feb44783          	lbu	a5,-21(s0)
    1ec0:	4318                	lw	a4,0(a4)
    1ec2:	078a                	slli	a5,a5,0x2
    1ec4:	ff040693          	addi	a3,s0,-16
    1ec8:	97b6                	add	a5,a5,a3
    1eca:	fee7a423          	sw	a4,-24(a5)
        for(i=0; i<4; i++){
    1ece:	feb44783          	lbu	a5,-21(s0)
    1ed2:	0785                	addi	a5,a5,1
    1ed4:	fef405a3          	sb	a5,-21(s0)
    1ed8:	feb44703          	lbu	a4,-21(s0)
    1edc:	478d                	li	a5,3
    1ede:	fce7f5e3          	bgeu	a5,a4,1ea8 <FLASH_UserOptionByteConfig+0x6a>
        }
        buf[0] = ((uint32_t)((((uint32_t)(UserByte) & 0x00FF) << 16) + (((uint32_t)(~UserByte) & 0x00FF) << 24))) + 0x00005AA5;
    1ee2:	fea44783          	lbu	a5,-22(s0)
    1ee6:	01079713          	slli	a4,a5,0x10
    1eea:	fea44783          	lbu	a5,-22(s0)
    1eee:	fff7c793          	not	a5,a5
    1ef2:	07e2                	slli	a5,a5,0x18
    1ef4:	973e                	add	a4,a4,a5
    1ef6:	6799                	lui	a5,0x6
    1ef8:	aa578793          	addi	a5,a5,-1371 # 5aa5 <TIM_OC4Init+0xbb>
    1efc:	97ba                	add	a5,a5,a4
    1efe:	fcf42c23          	sw	a5,-40(s0)

        FLASH_OptionBytePR(buf);
    1f02:	fd840793          	addi	a5,s0,-40
    1f06:	853e                	mv	a0,a5
    1f08:	39f5                	jal	1c04 <FLASH_OptionBytePR>
    }

    return status;
    1f0a:	fec42783          	lw	a5,-20(s0)
}
    1f0e:	853e                	mv	a0,a5
    1f10:	50f2                	lw	ra,60(sp)
    1f12:	5462                	lw	s0,56(sp)
    1f14:	6121                	addi	sp,sp,64
    1f16:	8082                	ret

00001f18 <FLASH_GetUserOptionByte>:
 * @return  The FLASH User Option Bytes values:IWDG_SW(Bit0), RST_STOP(Bit1),
 *          RST_STDBY(Bit2) ,RST_MOD(bit[4:3]) ,DATA0(bit[17:10]) and
 *          DATA1(bit[25:18]).
 */
uint32_t FLASH_GetUserOptionByte(void)
{
    1f18:	1141                	addi	sp,sp,-16
    1f1a:	c622                	sw	s0,12(sp)
    1f1c:	0800                	addi	s0,sp,16
    return (uint32_t)(FLASH->OBR >> 2);
    1f1e:	400227b7          	lui	a5,0x40022
    1f22:	4fdc                	lw	a5,28(a5)
    1f24:	8389                	srli	a5,a5,0x2
}
    1f26:	853e                	mv	a0,a5
    1f28:	4432                	lw	s0,12(sp)
    1f2a:	0141                	addi	sp,sp,16
    1f2c:	8082                	ret

00001f2e <FLASH_GetWriteProtectionOptionByte>:
 * @brief   Returns the FLASH Write Protection Option Bytes Register value.
 *
 * @return  The FLASH Write Protection Option Bytes Register value.
 */
uint32_t FLASH_GetWriteProtectionOptionByte(void)
{
    1f2e:	1141                	addi	sp,sp,-16
    1f30:	c622                	sw	s0,12(sp)
    1f32:	0800                	addi	s0,sp,16
    return (uint32_t)(FLASH->WPR);
    1f34:	400227b7          	lui	a5,0x40022
    1f38:	539c                	lw	a5,32(a5)
}
    1f3a:	853e                	mv	a0,a5
    1f3c:	4432                	lw	s0,12(sp)
    1f3e:	0141                	addi	sp,sp,16
    1f40:	8082                	ret

00001f42 <FLASH_GetReadOutProtectionStatus>:
 * @brief   Checks whether the FLASH Read Out Protection Status is set or not.
 *
 * @return  FLASH ReadOut Protection Status(SET or RESET)
 */
FlagStatus FLASH_GetReadOutProtectionStatus(void)
{
    1f42:	1101                	addi	sp,sp,-32
    1f44:	ce22                	sw	s0,28(sp)
    1f46:	1000                	addi	s0,sp,32
    FlagStatus readoutstatus = RESET;
    1f48:	fe042623          	sw	zero,-20(s0)
    if((FLASH->OBR & RDPRT_Mask) != (uint32_t)RESET)
    1f4c:	400227b7          	lui	a5,0x40022
    1f50:	4fdc                	lw	a5,28(a5)
    1f52:	8b89                	andi	a5,a5,2
    1f54:	c789                	beqz	a5,1f5e <FLASH_GetReadOutProtectionStatus+0x1c>
    {
        readoutstatus = SET;
    1f56:	4785                	li	a5,1
    1f58:	fef42623          	sw	a5,-20(s0)
    1f5c:	a019                	j	1f62 <FLASH_GetReadOutProtectionStatus+0x20>
    }
    else
    {
        readoutstatus = RESET;
    1f5e:	fe042623          	sw	zero,-20(s0)
    }
    return readoutstatus;
    1f62:	fec42783          	lw	a5,-20(s0)
}
    1f66:	853e                	mv	a0,a5
    1f68:	4472                	lw	s0,28(sp)
    1f6a:	6105                	addi	sp,sp,32
    1f6c:	8082                	ret

00001f6e <FLASH_ITConfig>:
 *          NewState - new state of the specified Flash interrupts(ENABLE or DISABLE).
 *
 * @return  FLASH Prefetch Buffer Status (SET or RESET).
 */
void FLASH_ITConfig(uint32_t FLASH_IT, FunctionalState NewState)
{
    1f6e:	1101                	addi	sp,sp,-32
    1f70:	ce22                	sw	s0,28(sp)
    1f72:	1000                	addi	s0,sp,32
    1f74:	fea42623          	sw	a0,-20(s0)
    1f78:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    1f7c:	fe842783          	lw	a5,-24(s0)
    1f80:	cb99                	beqz	a5,1f96 <FLASH_ITConfig+0x28>
    {
        FLASH->CTLR |= FLASH_IT;
    1f82:	400227b7          	lui	a5,0x40022
    1f86:	4b94                	lw	a3,16(a5)
    1f88:	400227b7          	lui	a5,0x40022
    1f8c:	fec42703          	lw	a4,-20(s0)
    1f90:	8f55                	or	a4,a4,a3
    1f92:	cb98                	sw	a4,16(a5)
    }
    else
    {
        FLASH->CTLR &= ~(uint32_t)FLASH_IT;
    }
}
    1f94:	a821                	j	1fac <FLASH_ITConfig+0x3e>
        FLASH->CTLR &= ~(uint32_t)FLASH_IT;
    1f96:	400227b7          	lui	a5,0x40022
    1f9a:	4b94                	lw	a3,16(a5)
    1f9c:	fec42783          	lw	a5,-20(s0)
    1fa0:	fff7c713          	not	a4,a5
    1fa4:	400227b7          	lui	a5,0x40022
    1fa8:	8f75                	and	a4,a4,a3
    1faa:	cb98                	sw	a4,16(a5)
}
    1fac:	0001                	nop
    1fae:	4472                	lw	s0,28(sp)
    1fb0:	6105                	addi	sp,sp,32
    1fb2:	8082                	ret

00001fb4 <FLASH_GetFlagStatus>:
 *            FLASH_FLAG_OPTERR - FLASH Option Byte error flag
 *
 * @return  The new state of FLASH_FLAG (SET or RESET).
 */
FlagStatus FLASH_GetFlagStatus(uint32_t FLASH_FLAG)
{
    1fb4:	7179                	addi	sp,sp,-48
    1fb6:	d622                	sw	s0,44(sp)
    1fb8:	1800                	addi	s0,sp,48
    1fba:	fca42e23          	sw	a0,-36(s0)
    FlagStatus bitstatus = RESET;
    1fbe:	fe042623          	sw	zero,-20(s0)

    if(FLASH_FLAG == FLASH_FLAG_OPTERR)
    1fc2:	fdc42703          	lw	a4,-36(s0)
    1fc6:	4785                	li	a5,1
    1fc8:	00f71e63          	bne	a4,a5,1fe4 <FLASH_GetFlagStatus+0x30>
    {
        if((FLASH->OBR & FLASH_FLAG_OPTERR) != (uint32_t)RESET)
    1fcc:	400227b7          	lui	a5,0x40022
    1fd0:	4fdc                	lw	a5,28(a5)
    1fd2:	8b85                	andi	a5,a5,1
    1fd4:	c789                	beqz	a5,1fde <FLASH_GetFlagStatus+0x2a>
        {
            bitstatus = SET;
    1fd6:	4785                	li	a5,1
    1fd8:	fef42623          	sw	a5,-20(s0)
    1fdc:	a00d                	j	1ffe <FLASH_GetFlagStatus+0x4a>
        }
        else
        {
            bitstatus = RESET;
    1fde:	fe042623          	sw	zero,-20(s0)
    1fe2:	a831                	j	1ffe <FLASH_GetFlagStatus+0x4a>
        }
    }
    else
    {
        if((FLASH->STATR & FLASH_FLAG) != (uint32_t)RESET)
    1fe4:	400227b7          	lui	a5,0x40022
    1fe8:	47d8                	lw	a4,12(a5)
    1fea:	fdc42783          	lw	a5,-36(s0)
    1fee:	8ff9                	and	a5,a5,a4
    1ff0:	c789                	beqz	a5,1ffa <FLASH_GetFlagStatus+0x46>
        {
            bitstatus = SET;
    1ff2:	4785                	li	a5,1
    1ff4:	fef42623          	sw	a5,-20(s0)
    1ff8:	a019                	j	1ffe <FLASH_GetFlagStatus+0x4a>
        }
        else
        {
            bitstatus = RESET;
    1ffa:	fe042623          	sw	zero,-20(s0)
        }
    }
    return bitstatus;
    1ffe:	fec42783          	lw	a5,-20(s0)
}
    2002:	853e                	mv	a0,a5
    2004:	5432                	lw	s0,44(sp)
    2006:	6145                	addi	sp,sp,48
    2008:	8082                	ret

0000200a <FLASH_ClearFlag>:
 *            FLASH_FLAG_EOP - FLASH End of Operation flag
 *
 * @return  none
 */
void FLASH_ClearFlag(uint32_t FLASH_FLAG)
{
    200a:	1101                	addi	sp,sp,-32
    200c:	ce22                	sw	s0,28(sp)
    200e:	1000                	addi	s0,sp,32
    2010:	fea42623          	sw	a0,-20(s0)
    FLASH->STATR = FLASH_FLAG;
    2014:	400227b7          	lui	a5,0x40022
    2018:	fec42703          	lw	a4,-20(s0)
    201c:	c7d8                	sw	a4,12(a5)
}
    201e:	0001                	nop
    2020:	4472                	lw	s0,28(sp)
    2022:	6105                	addi	sp,sp,32
    2024:	8082                	ret

00002026 <FLASH_GetStatus>:
 *
 * @return  FLASH Status - The returned value can be: FLASH_BUSY, FLASH_ERROR_PG,
 *        FLASH_ERROR_WRP or FLASH_COMPLETE.
 */
FLASH_Status FLASH_GetStatus(void)
{
    2026:	1101                	addi	sp,sp,-32
    2028:	ce22                	sw	s0,28(sp)
    202a:	1000                	addi	s0,sp,32
    FLASH_Status flashstatus = FLASH_COMPLETE;
    202c:	4791                	li	a5,4
    202e:	fef42623          	sw	a5,-20(s0)

    if((FLASH->STATR & FLASH_FLAG_BSY) == FLASH_FLAG_BSY)
    2032:	400227b7          	lui	a5,0x40022
    2036:	47dc                	lw	a5,12(a5)
    2038:	0017f713          	andi	a4,a5,1
    203c:	4785                	li	a5,1
    203e:	00f71663          	bne	a4,a5,204a <FLASH_GetStatus+0x24>
    {
        flashstatus = FLASH_BUSY;
    2042:	4785                	li	a5,1
    2044:	fef42623          	sw	a5,-20(s0)
    2048:	a829                	j	2062 <FLASH_GetStatus+0x3c>
    }
    else
    {
        if((FLASH->STATR & FLASH_FLAG_WRPRTERR) != 0)
    204a:	400227b7          	lui	a5,0x40022
    204e:	47dc                	lw	a5,12(a5)
    2050:	8bc1                	andi	a5,a5,16
    2052:	c789                	beqz	a5,205c <FLASH_GetStatus+0x36>
        {
            flashstatus = FLASH_ERROR_WRP;
    2054:	478d                	li	a5,3
    2056:	fef42623          	sw	a5,-20(s0)
    205a:	a021                	j	2062 <FLASH_GetStatus+0x3c>
        }
        else
        {
            flashstatus = FLASH_COMPLETE;
    205c:	4791                	li	a5,4
    205e:	fef42623          	sw	a5,-20(s0)
        }
    }
    return flashstatus;
    2062:	fec42783          	lw	a5,-20(s0)
}
    2066:	853e                	mv	a0,a5
    2068:	4472                	lw	s0,28(sp)
    206a:	6105                	addi	sp,sp,32
    206c:	8082                	ret

0000206e <FLASH_GetBank1Status>:
 *
 * @return  FLASH Status - The returned value can be: FLASH_BUSY, FLASH_ERROR_PG,
 *        FLASH_ERROR_WRP or FLASH_COMPLETE.
 */
FLASH_Status FLASH_GetBank1Status(void)
{
    206e:	1101                	addi	sp,sp,-32
    2070:	ce22                	sw	s0,28(sp)
    2072:	1000                	addi	s0,sp,32
    FLASH_Status flashstatus = FLASH_COMPLETE;
    2074:	4791                	li	a5,4
    2076:	fef42623          	sw	a5,-20(s0)

    if((FLASH->STATR & FLASH_FLAG_BANK1_BSY) == FLASH_FLAG_BSY)
    207a:	400227b7          	lui	a5,0x40022
    207e:	47dc                	lw	a5,12(a5)
    2080:	0017f713          	andi	a4,a5,1
    2084:	4785                	li	a5,1
    2086:	00f71663          	bne	a4,a5,2092 <FLASH_GetBank1Status+0x24>
    {
        flashstatus = FLASH_BUSY;
    208a:	4785                	li	a5,1
    208c:	fef42623          	sw	a5,-20(s0)
    2090:	a829                	j	20aa <FLASH_GetBank1Status+0x3c>
    }
    else
    {
        if((FLASH->STATR & FLASH_FLAG_BANK1_WRPRTERR) != 0)
    2092:	400227b7          	lui	a5,0x40022
    2096:	47dc                	lw	a5,12(a5)
    2098:	8bc1                	andi	a5,a5,16
    209a:	c789                	beqz	a5,20a4 <FLASH_GetBank1Status+0x36>
        {
            flashstatus = FLASH_ERROR_WRP;
    209c:	478d                	li	a5,3
    209e:	fef42623          	sw	a5,-20(s0)
    20a2:	a021                	j	20aa <FLASH_GetBank1Status+0x3c>
        }
        else
        {
            flashstatus = FLASH_COMPLETE;
    20a4:	4791                	li	a5,4
    20a6:	fef42623          	sw	a5,-20(s0)
        }
    }
    return flashstatus;
    20aa:	fec42783          	lw	a5,-20(s0)
}
    20ae:	853e                	mv	a0,a5
    20b0:	4472                	lw	s0,28(sp)
    20b2:	6105                	addi	sp,sp,32
    20b4:	8082                	ret

000020b6 <FLASH_WaitForLastOperation>:
 *
 * @return  FLASH Status - The returned value can be: FLASH_BUSY, FLASH_ERROR_PG,
 *        FLASH_ERROR_WRP or FLASH_COMPLETE.
 */
FLASH_Status FLASH_WaitForLastOperation(uint32_t Timeout)
{
    20b6:	7179                	addi	sp,sp,-48
    20b8:	d606                	sw	ra,44(sp)
    20ba:	d422                	sw	s0,40(sp)
    20bc:	1800                	addi	s0,sp,48
    20be:	fca42e23          	sw	a0,-36(s0)
    FLASH_Status status = FLASH_COMPLETE;
    20c2:	4791                	li	a5,4
    20c4:	fef42623          	sw	a5,-20(s0)

    status = FLASH_GetBank1Status();
    20c8:	375d                	jal	206e <FLASH_GetBank1Status>
    20ca:	fea42623          	sw	a0,-20(s0)
    while((status == FLASH_BUSY) && (Timeout != 0x00))
    20ce:	a809                	j	20e0 <FLASH_WaitForLastOperation+0x2a>
    {
        status = FLASH_GetBank1Status();
    20d0:	3f79                	jal	206e <FLASH_GetBank1Status>
    20d2:	fea42623          	sw	a0,-20(s0)
        Timeout--;
    20d6:	fdc42783          	lw	a5,-36(s0)
    20da:	17fd                	addi	a5,a5,-1
    20dc:	fcf42e23          	sw	a5,-36(s0)
    while((status == FLASH_BUSY) && (Timeout != 0x00))
    20e0:	fec42703          	lw	a4,-20(s0)
    20e4:	4785                	li	a5,1
    20e6:	00f71563          	bne	a4,a5,20f0 <FLASH_WaitForLastOperation+0x3a>
    20ea:	fdc42783          	lw	a5,-36(s0)
    20ee:	f3ed                	bnez	a5,20d0 <FLASH_WaitForLastOperation+0x1a>
    }
    if(Timeout == 0x00)
    20f0:	fdc42783          	lw	a5,-36(s0)
    20f4:	e781                	bnez	a5,20fc <FLASH_WaitForLastOperation+0x46>
    {
        status = FLASH_TIMEOUT;
    20f6:	4795                	li	a5,5
    20f8:	fef42623          	sw	a5,-20(s0)
    }
    return status;
    20fc:	fec42783          	lw	a5,-20(s0)
}
    2100:	853e                	mv	a0,a5
    2102:	50b2                	lw	ra,44(sp)
    2104:	5422                	lw	s0,40(sp)
    2106:	6145                	addi	sp,sp,48
    2108:	8082                	ret

0000210a <FLASH_WaitForLastBank1Operation>:
 *
 * @return  FLASH Status - The returned value can be: FLASH_BUSY, FLASH_ERROR_PG,
 *        FLASH_ERROR_WRP or FLASH_COMPLETE.
 */
FLASH_Status FLASH_WaitForLastBank1Operation(uint32_t Timeout)
{
    210a:	7179                	addi	sp,sp,-48
    210c:	d606                	sw	ra,44(sp)
    210e:	d422                	sw	s0,40(sp)
    2110:	1800                	addi	s0,sp,48
    2112:	fca42e23          	sw	a0,-36(s0)
    FLASH_Status status = FLASH_COMPLETE;
    2116:	4791                	li	a5,4
    2118:	fef42623          	sw	a5,-20(s0)

    status = FLASH_GetBank1Status();
    211c:	3f89                	jal	206e <FLASH_GetBank1Status>
    211e:	fea42623          	sw	a0,-20(s0)
    while((status == FLASH_FLAG_BANK1_BSY) && (Timeout != 0x00))
    2122:	a809                	j	2134 <FLASH_WaitForLastBank1Operation+0x2a>
    {
        status = FLASH_GetBank1Status();
    2124:	37a9                	jal	206e <FLASH_GetBank1Status>
    2126:	fea42623          	sw	a0,-20(s0)
        Timeout--;
    212a:	fdc42783          	lw	a5,-36(s0)
    212e:	17fd                	addi	a5,a5,-1
    2130:	fcf42e23          	sw	a5,-36(s0)
    while((status == FLASH_FLAG_BANK1_BSY) && (Timeout != 0x00))
    2134:	fec42703          	lw	a4,-20(s0)
    2138:	4785                	li	a5,1
    213a:	00f71563          	bne	a4,a5,2144 <FLASH_WaitForLastBank1Operation+0x3a>
    213e:	fdc42783          	lw	a5,-36(s0)
    2142:	f3ed                	bnez	a5,2124 <FLASH_WaitForLastBank1Operation+0x1a>
    }
    if(Timeout == 0x00)
    2144:	fdc42783          	lw	a5,-36(s0)
    2148:	e781                	bnez	a5,2150 <FLASH_WaitForLastBank1Operation+0x46>
    {
        status = FLASH_TIMEOUT;
    214a:	4795                	li	a5,5
    214c:	fef42623          	sw	a5,-20(s0)
    }
    return status;
    2150:	fec42783          	lw	a5,-20(s0)
}
    2154:	853e                	mv	a0,a5
    2156:	50b2                	lw	ra,44(sp)
    2158:	5422                	lw	s0,40(sp)
    215a:	6145                	addi	sp,sp,48
    215c:	8082                	ret

0000215e <FLASH_Unlock_Fast>:
 * @brief   Unlocks the Fast Program Erase Mode.
 *
 * @return  none
 */
void FLASH_Unlock_Fast(void)
{
    215e:	1141                	addi	sp,sp,-16
    2160:	c622                	sw	s0,12(sp)
    2162:	0800                	addi	s0,sp,16
    /* Authorize the FPEC of Bank1 Access */
    FLASH->KEYR = FLASH_KEY1;
    2164:	400227b7          	lui	a5,0x40022
    2168:	45670737          	lui	a4,0x45670
    216c:	12370713          	addi	a4,a4,291 # 45670123 <_eusrstack+0x2566c123>
    2170:	c3d8                	sw	a4,4(a5)
    FLASH->KEYR = FLASH_KEY2;
    2172:	400227b7          	lui	a5,0x40022
    2176:	cdef9737          	lui	a4,0xcdef9
    217a:	9ab70713          	addi	a4,a4,-1621 # cdef89ab <_eusrstack+0xadef49ab>
    217e:	c3d8                	sw	a4,4(a5)

    /* Fast program mode unlock */
    FLASH->MODEKEYR = FLASH_KEY1;
    2180:	400227b7          	lui	a5,0x40022
    2184:	45670737          	lui	a4,0x45670
    2188:	12370713          	addi	a4,a4,291 # 45670123 <_eusrstack+0x2566c123>
    218c:	d3d8                	sw	a4,36(a5)
    FLASH->MODEKEYR = FLASH_KEY2;
    218e:	400227b7          	lui	a5,0x40022
    2192:	cdef9737          	lui	a4,0xcdef9
    2196:	9ab70713          	addi	a4,a4,-1621 # cdef89ab <_eusrstack+0xadef49ab>
    219a:	d3d8                	sw	a4,36(a5)
}
    219c:	0001                	nop
    219e:	4432                	lw	s0,12(sp)
    21a0:	0141                	addi	sp,sp,16
    21a2:	8082                	ret

000021a4 <FLASH_Lock_Fast>:
 * @brief   Locks the Fast Program Erase Mode.
 *
 * @return  none
 */
void FLASH_Lock_Fast(void)
{
    21a4:	1141                	addi	sp,sp,-16
    21a6:	c622                	sw	s0,12(sp)
    21a8:	0800                	addi	s0,sp,16
    FLASH->CTLR |= CR_FLOCK_Set;
    21aa:	400227b7          	lui	a5,0x40022
    21ae:	4b94                	lw	a3,16(a5)
    21b0:	400227b7          	lui	a5,0x40022
    21b4:	6721                	lui	a4,0x8
    21b6:	8f55                	or	a4,a4,a3
    21b8:	cb98                	sw	a4,16(a5)
}
    21ba:	0001                	nop
    21bc:	4432                	lw	s0,12(sp)
    21be:	0141                	addi	sp,sp,16
    21c0:	8082                	ret

000021c2 <FLASH_BufReset>:
 * @brief   Flash Buffer reset.
 *
 * @return  none
 */
void FLASH_BufReset(void)
{
    21c2:	1141                	addi	sp,sp,-16
    21c4:	c622                	sw	s0,12(sp)
    21c6:	0800                	addi	s0,sp,16
    FLASH->CTLR |= CR_PAGE_PG;
    21c8:	400227b7          	lui	a5,0x40022
    21cc:	4b94                	lw	a3,16(a5)
    21ce:	400227b7          	lui	a5,0x40022
    21d2:	6741                	lui	a4,0x10
    21d4:	8f55                	or	a4,a4,a3
    21d6:	cb98                	sw	a4,16(a5)
    FLASH->CTLR |= CR_BUF_RST;
    21d8:	400227b7          	lui	a5,0x40022
    21dc:	4b94                	lw	a3,16(a5)
    21de:	400227b7          	lui	a5,0x40022
    21e2:	00080737          	lui	a4,0x80
    21e6:	8f55                	or	a4,a4,a3
    21e8:	cb98                	sw	a4,16(a5)
    while(FLASH->STATR & SR_BSY)
    21ea:	0001                	nop
    21ec:	400227b7          	lui	a5,0x40022
    21f0:	47dc                	lw	a5,12(a5)
    21f2:	8b85                	andi	a5,a5,1
    21f4:	ffe5                	bnez	a5,21ec <FLASH_BufReset+0x2a>
        ;
    FLASH->CTLR &= ~CR_PAGE_PG;
    21f6:	400227b7          	lui	a5,0x40022
    21fa:	4b94                	lw	a3,16(a5)
    21fc:	400227b7          	lui	a5,0x40022
    2200:	7741                	lui	a4,0xffff0
    2202:	177d                	addi	a4,a4,-1
    2204:	8f75                	and	a4,a4,a3
    2206:	cb98                	sw	a4,16(a5)
}
    2208:	0001                	nop
    220a:	4432                	lw	s0,12(sp)
    220c:	0141                	addi	sp,sp,16
    220e:	8082                	ret

00002210 <FLASH_BufLoad>:
 *          Data0 - specifies the data0 to be programmed.
 *
 * @return  none
 */
void FLASH_BufLoad(uint32_t Address, uint32_t Data0)
{
    2210:	1101                	addi	sp,sp,-32
    2212:	ce22                	sw	s0,28(sp)
    2214:	1000                	addi	s0,sp,32
    2216:	fea42623          	sw	a0,-20(s0)
    221a:	feb42423          	sw	a1,-24(s0)
    FLASH->CTLR |= CR_PAGE_PG;
    221e:	400227b7          	lui	a5,0x40022
    2222:	4b94                	lw	a3,16(a5)
    2224:	400227b7          	lui	a5,0x40022
    2228:	6741                	lui	a4,0x10
    222a:	8f55                	or	a4,a4,a3
    222c:	cb98                	sw	a4,16(a5)
    *(__IO uint32_t *)(Address) = Data0;
    222e:	fec42783          	lw	a5,-20(s0)
    2232:	fe842703          	lw	a4,-24(s0)
    2236:	c398                	sw	a4,0(a5)
    FLASH->CTLR |= CR_BUF_LOAD;
    2238:	400227b7          	lui	a5,0x40022
    223c:	4b94                	lw	a3,16(a5)
    223e:	400227b7          	lui	a5,0x40022
    2242:	00040737          	lui	a4,0x40
    2246:	8f55                	or	a4,a4,a3
    2248:	cb98                	sw	a4,16(a5)
    while(FLASH->STATR & SR_BSY)
    224a:	0001                	nop
    224c:	400227b7          	lui	a5,0x40022
    2250:	47dc                	lw	a5,12(a5)
    2252:	8b85                	andi	a5,a5,1
    2254:	ffe5                	bnez	a5,224c <FLASH_BufLoad+0x3c>
        ;
    FLASH->CTLR &= ~CR_PAGE_PG;
    2256:	400227b7          	lui	a5,0x40022
    225a:	4b94                	lw	a3,16(a5)
    225c:	400227b7          	lui	a5,0x40022
    2260:	7741                	lui	a4,0xffff0
    2262:	177d                	addi	a4,a4,-1
    2264:	8f75                	and	a4,a4,a3
    2266:	cb98                	sw	a4,16(a5)
}
    2268:	0001                	nop
    226a:	4472                	lw	s0,28(sp)
    226c:	6105                	addi	sp,sp,32
    226e:	8082                	ret

00002270 <FLASH_ErasePage_Fast>:
 * @param   Page_Address - The page address to be erased.
 *
 * @return  none
 */
void FLASH_ErasePage_Fast(uint32_t Page_Address)
{
    2270:	1101                	addi	sp,sp,-32
    2272:	ce22                	sw	s0,28(sp)
    2274:	1000                	addi	s0,sp,32
    2276:	fea42623          	sw	a0,-20(s0)
    FLASH->CTLR |= CR_PAGE_ER;
    227a:	400227b7          	lui	a5,0x40022
    227e:	4b94                	lw	a3,16(a5)
    2280:	400227b7          	lui	a5,0x40022
    2284:	00020737          	lui	a4,0x20
    2288:	8f55                	or	a4,a4,a3
    228a:	cb98                	sw	a4,16(a5)
    FLASH->ADDR = Page_Address;
    228c:	400227b7          	lui	a5,0x40022
    2290:	fec42703          	lw	a4,-20(s0)
    2294:	cbd8                	sw	a4,20(a5)
    FLASH->CTLR |= CR_STRT_Set;
    2296:	400227b7          	lui	a5,0x40022
    229a:	4b98                	lw	a4,16(a5)
    229c:	400227b7          	lui	a5,0x40022
    22a0:	04076713          	ori	a4,a4,64
    22a4:	cb98                	sw	a4,16(a5)
    while(FLASH->STATR & SR_BSY)
    22a6:	0001                	nop
    22a8:	400227b7          	lui	a5,0x40022
    22ac:	47dc                	lw	a5,12(a5)
    22ae:	8b85                	andi	a5,a5,1
    22b0:	ffe5                	bnez	a5,22a8 <FLASH_ErasePage_Fast+0x38>
        ;
    FLASH->CTLR &= ~CR_PAGE_ER;
    22b2:	400227b7          	lui	a5,0x40022
    22b6:	4b94                	lw	a3,16(a5)
    22b8:	400227b7          	lui	a5,0x40022
    22bc:	7701                	lui	a4,0xfffe0
    22be:	177d                	addi	a4,a4,-1
    22c0:	8f75                	and	a4,a4,a3
    22c2:	cb98                	sw	a4,16(a5)
}
    22c4:	0001                	nop
    22c6:	4472                	lw	s0,28(sp)
    22c8:	6105                	addi	sp,sp,32
    22ca:	8082                	ret

000022cc <FLASH_EraseBlock_32K_Fast>:
 * @param   Block_Address - The block address to be erased.
 *
 * @return  none
 */
void FLASH_EraseBlock_32K_Fast(uint32_t Block_Address)
{
    22cc:	1101                	addi	sp,sp,-32
    22ce:	ce22                	sw	s0,28(sp)
    22d0:	1000                	addi	s0,sp,32
    22d2:	fea42623          	sw	a0,-20(s0)
    Block_Address &= 0xFFFF8000;
    22d6:	fec42703          	lw	a4,-20(s0)
    22da:	77e1                	lui	a5,0xffff8
    22dc:	8ff9                	and	a5,a5,a4
    22de:	fef42623          	sw	a5,-20(s0)

    FLASH->CTLR |= CR_BER32;
    22e2:	400227b7          	lui	a5,0x40022
    22e6:	4b94                	lw	a3,16(a5)
    22e8:	400227b7          	lui	a5,0x40022
    22ec:	00800737          	lui	a4,0x800
    22f0:	8f55                	or	a4,a4,a3
    22f2:	cb98                	sw	a4,16(a5)
    FLASH->ADDR = Block_Address;
    22f4:	400227b7          	lui	a5,0x40022
    22f8:	fec42703          	lw	a4,-20(s0)
    22fc:	cbd8                	sw	a4,20(a5)
    FLASH->CTLR |= CR_STRT_Set;
    22fe:	400227b7          	lui	a5,0x40022
    2302:	4b98                	lw	a4,16(a5)
    2304:	400227b7          	lui	a5,0x40022
    2308:	04076713          	ori	a4,a4,64
    230c:	cb98                	sw	a4,16(a5)
    while(FLASH->STATR & SR_BSY)
    230e:	0001                	nop
    2310:	400227b7          	lui	a5,0x40022
    2314:	47dc                	lw	a5,12(a5)
    2316:	8b85                	andi	a5,a5,1
    2318:	ffe5                	bnez	a5,2310 <FLASH_EraseBlock_32K_Fast+0x44>
        ;
    FLASH->CTLR &= ~CR_BER32;
    231a:	400227b7          	lui	a5,0x40022
    231e:	4b94                	lw	a3,16(a5)
    2320:	400227b7          	lui	a5,0x40022
    2324:	ff800737          	lui	a4,0xff800
    2328:	177d                	addi	a4,a4,-1
    232a:	8f75                	and	a4,a4,a3
    232c:	cb98                	sw	a4,16(a5)
}
    232e:	0001                	nop
    2330:	4472                	lw	s0,28(sp)
    2332:	6105                	addi	sp,sp,32
    2334:	8082                	ret

00002336 <FLASH_ProgramPage_Fast>:
 * @param   Page_Address - The page address to be programed.
 *
 * @return  none
 */
void FLASH_ProgramPage_Fast(uint32_t Page_Address)
{
    2336:	1101                	addi	sp,sp,-32
    2338:	ce22                	sw	s0,28(sp)
    233a:	1000                	addi	s0,sp,32
    233c:	fea42623          	sw	a0,-20(s0)
    FLASH->CTLR |= CR_PAGE_PG;
    2340:	400227b7          	lui	a5,0x40022
    2344:	4b94                	lw	a3,16(a5)
    2346:	400227b7          	lui	a5,0x40022
    234a:	6741                	lui	a4,0x10
    234c:	8f55                	or	a4,a4,a3
    234e:	cb98                	sw	a4,16(a5)
    FLASH->ADDR = Page_Address;
    2350:	400227b7          	lui	a5,0x40022
    2354:	fec42703          	lw	a4,-20(s0)
    2358:	cbd8                	sw	a4,20(a5)
    FLASH->CTLR |= CR_STRT_Set;
    235a:	400227b7          	lui	a5,0x40022
    235e:	4b98                	lw	a4,16(a5)
    2360:	400227b7          	lui	a5,0x40022
    2364:	04076713          	ori	a4,a4,64
    2368:	cb98                	sw	a4,16(a5)
    while(FLASH->STATR & SR_BSY)
    236a:	0001                	nop
    236c:	400227b7          	lui	a5,0x40022
    2370:	47dc                	lw	a5,12(a5)
    2372:	8b85                	andi	a5,a5,1
    2374:	ffe5                	bnez	a5,236c <FLASH_ProgramPage_Fast+0x36>
        ;
    FLASH->CTLR &= ~CR_PAGE_PG;
    2376:	400227b7          	lui	a5,0x40022
    237a:	4b94                	lw	a3,16(a5)
    237c:	400227b7          	lui	a5,0x40022
    2380:	7741                	lui	a4,0xffff0
    2382:	177d                	addi	a4,a4,-1
    2384:	8f75                	and	a4,a4,a3
    2386:	cb98                	sw	a4,16(a5)
}
    2388:	0001                	nop
    238a:	4472                	lw	s0,28(sp)
    238c:	6105                	addi	sp,sp,32
    238e:	8082                	ret

00002390 <SystemReset_StartMode>:
 *            Start_Mode_USER - USER start after system reset
 *            Start_Mode_BOOT - Boot start after system reset
 * @return  none
 */
void SystemReset_StartMode(uint32_t Mode)
{
    2390:	1101                	addi	sp,sp,-32
    2392:	ce06                	sw	ra,28(sp)
    2394:	cc22                	sw	s0,24(sp)
    2396:	1000                	addi	s0,sp,32
    2398:	fea42623          	sw	a0,-20(s0)
    FLASH_Unlock();
    239c:	eb8ff0ef          	jal	ra,1a54 <FLASH_Unlock>

    FLASH->BOOT_MODEKEYR = FLASH_KEY1;
    23a0:	400227b7          	lui	a5,0x40022
    23a4:	45670737          	lui	a4,0x45670
    23a8:	12370713          	addi	a4,a4,291 # 45670123 <_eusrstack+0x2566c123>
    23ac:	d798                	sw	a4,40(a5)
    FLASH->BOOT_MODEKEYR = FLASH_KEY2;
    23ae:	400227b7          	lui	a5,0x40022
    23b2:	cdef9737          	lui	a4,0xcdef9
    23b6:	9ab70713          	addi	a4,a4,-1621 # cdef89ab <_eusrstack+0xadef49ab>
    23ba:	d798                	sw	a4,40(a5)

    FLASH->STATR &= ~(1<<14);
    23bc:	400227b7          	lui	a5,0x40022
    23c0:	47d4                	lw	a3,12(a5)
    23c2:	400227b7          	lui	a5,0x40022
    23c6:	7771                	lui	a4,0xffffc
    23c8:	177d                	addi	a4,a4,-1
    23ca:	8f75                	and	a4,a4,a3
    23cc:	c7d8                	sw	a4,12(a5)
    if(Mode == Start_Mode_BOOT){
    23ce:	fec42703          	lw	a4,-20(s0)
    23d2:	6791                	lui	a5,0x4
    23d4:	00f71a63          	bne	a4,a5,23e8 <SystemReset_StartMode+0x58>
        FLASH->STATR |= (1<<14);
    23d8:	400227b7          	lui	a5,0x40022
    23dc:	47d4                	lw	a3,12(a5)
    23de:	400227b7          	lui	a5,0x40022
    23e2:	6711                	lui	a4,0x4
    23e4:	8f55                	or	a4,a4,a3
    23e6:	c7d8                	sw	a4,12(a5)
    }

    FLASH_Lock();
    23e8:	e96ff0ef          	jal	ra,1a7e <FLASH_Lock>
}
    23ec:	0001                	nop
    23ee:	40f2                	lw	ra,28(sp)
    23f0:	4462                	lw	s0,24(sp)
    23f2:	6105                	addi	sp,sp,32
    23f4:	8082                	ret

000023f6 <GPIO_DeInit>:
 * @param   GPIOx - where x can be (A..C) to select the GPIO peripheral.
 *
 * @return  none
 */
void GPIO_DeInit(GPIO_TypeDef *GPIOx)
{
    23f6:	1101                	addi	sp,sp,-32
    23f8:	ce06                	sw	ra,28(sp)
    23fa:	cc22                	sw	s0,24(sp)
    23fc:	1000                	addi	s0,sp,32
    23fe:	fea42623          	sw	a0,-20(s0)
    if(GPIOx == GPIOA)
    2402:	fec42703          	lw	a4,-20(s0)
    2406:	400117b7          	lui	a5,0x40011
    240a:	80078793          	addi	a5,a5,-2048 # 40010800 <_eusrstack+0x2000c800>
    240e:	00f71b63          	bne	a4,a5,2424 <GPIO_DeInit+0x2e>
    {
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOA, ENABLE);
    2412:	4585                	li	a1,1
    2414:	4511                	li	a0,4
    2416:	774020ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOA, DISABLE);
    241a:	4581                	li	a1,0
    241c:	4511                	li	a0,4
    241e:	76c020ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
    else if(GPIOx == GPIOC)
    {
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOC, ENABLE);
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOC, DISABLE);
    }
}
    2422:	a081                	j	2462 <GPIO_DeInit+0x6c>
    else if(GPIOx == GPIOB)
    2424:	fec42703          	lw	a4,-20(s0)
    2428:	400117b7          	lui	a5,0x40011
    242c:	c0078793          	addi	a5,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    2430:	00f71b63          	bne	a4,a5,2446 <GPIO_DeInit+0x50>
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOB, ENABLE);
    2434:	4585                	li	a1,1
    2436:	4521                	li	a0,8
    2438:	752020ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOB, DISABLE);
    243c:	4581                	li	a1,0
    243e:	4521                	li	a0,8
    2440:	74a020ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
}
    2444:	a839                	j	2462 <GPIO_DeInit+0x6c>
    else if(GPIOx == GPIOC)
    2446:	fec42703          	lw	a4,-20(s0)
    244a:	400117b7          	lui	a5,0x40011
    244e:	00f71a63          	bne	a4,a5,2462 <GPIO_DeInit+0x6c>
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOC, ENABLE);
    2452:	4585                	li	a1,1
    2454:	4541                	li	a0,16
    2456:	734020ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOC, DISABLE);
    245a:	4581                	li	a1,0
    245c:	4541                	li	a0,16
    245e:	72c020ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
}
    2462:	0001                	nop
    2464:	40f2                	lw	ra,28(sp)
    2466:	4462                	lw	s0,24(sp)
    2468:	6105                	addi	sp,sp,32
    246a:	8082                	ret

0000246c <GPIO_AFIODeInit>:
 *        and EXTI configuration) registers to their default reset values.
 *
 * @return  none
 */
void GPIO_AFIODeInit(void)
{
    246c:	1141                	addi	sp,sp,-16
    246e:	c606                	sw	ra,12(sp)
    2470:	c422                	sw	s0,8(sp)
    2472:	0800                	addi	s0,sp,16
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_AFIO, ENABLE);
    2474:	4585                	li	a1,1
    2476:	4505                	li	a0,1
    2478:	712020ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_AFIO, DISABLE);
    247c:	4581                	li	a1,0
    247e:	4505                	li	a0,1
    2480:	70a020ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
}
    2484:	0001                	nop
    2486:	40b2                	lw	ra,12(sp)
    2488:	4422                	lw	s0,8(sp)
    248a:	0141                	addi	sp,sp,16
    248c:	8082                	ret

0000248e <GPIO_Init>:
 *        contains the configuration information for the specified GPIO peripheral.
 *
 * @return  none
 */
void GPIO_Init(GPIO_TypeDef *GPIOx, GPIO_InitTypeDef *GPIO_InitStruct)
{
    248e:	7139                	addi	sp,sp,-64
    2490:	de22                	sw	s0,60(sp)
    2492:	0080                	addi	s0,sp,64
    2494:	fca42623          	sw	a0,-52(s0)
    2498:	fcb42423          	sw	a1,-56(s0)
    uint32_t currentmode = 0x00, currentpin = 0x00, pinpos = 0x00, pos = 0x00;
    249c:	fe042623          	sw	zero,-20(s0)
    24a0:	fe042023          	sw	zero,-32(s0)
    24a4:	fe042423          	sw	zero,-24(s0)
    24a8:	fc042e23          	sw	zero,-36(s0)
    uint32_t tmpreg = 0x00, pinmask = 0x00;
    24ac:	fe042223          	sw	zero,-28(s0)
    24b0:	fc042c23          	sw	zero,-40(s0)

    currentmode = ((uint32_t)GPIO_InitStruct->GPIO_Mode) & ((uint32_t)0x0F);
    24b4:	fc842783          	lw	a5,-56(s0)
    24b8:	479c                	lw	a5,8(a5)
    24ba:	8bbd                	andi	a5,a5,15
    24bc:	fef42623          	sw	a5,-20(s0)

    if((((uint32_t)GPIO_InitStruct->GPIO_Mode) & ((uint32_t)0x10)) != 0x00)
    24c0:	fc842783          	lw	a5,-56(s0)
    24c4:	479c                	lw	a5,8(a5)
    24c6:	8bc1                	andi	a5,a5,16
    24c8:	cb89                	beqz	a5,24da <GPIO_Init+0x4c>
    {
        currentmode |= (uint32_t)GPIO_InitStruct->GPIO_Speed;
    24ca:	fc842783          	lw	a5,-56(s0)
    24ce:	43dc                	lw	a5,4(a5)
    24d0:	fec42703          	lw	a4,-20(s0)
    24d4:	8fd9                	or	a5,a5,a4
    24d6:	fef42623          	sw	a5,-20(s0)
    }

    if(((uint32_t)GPIO_InitStruct->GPIO_Pin & ((uint32_t)0x0000FF)) != 0x00)
    24da:	fc842783          	lw	a5,-56(s0)
    24de:	439c                	lw	a5,0(a5)
    24e0:	0ff7f793          	andi	a5,a5,255
    24e4:	cfe1                	beqz	a5,25bc <GPIO_Init+0x12e>
    {
        tmpreg = GPIOx->CFGLR;
    24e6:	fcc42783          	lw	a5,-52(s0)
    24ea:	439c                	lw	a5,0(a5)
    24ec:	fef42223          	sw	a5,-28(s0)

        for(pinpos = 0x00; pinpos < 0x08; pinpos++)
    24f0:	fe042423          	sw	zero,-24(s0)
    24f4:	a855                	j	25a8 <GPIO_Init+0x11a>
        {
            pos = ((uint32_t)0x01) << pinpos;
    24f6:	fe842783          	lw	a5,-24(s0)
    24fa:	4705                	li	a4,1
    24fc:	00f717b3          	sll	a5,a4,a5
    2500:	fcf42e23          	sw	a5,-36(s0)
            currentpin = (GPIO_InitStruct->GPIO_Pin) & pos;
    2504:	fc842783          	lw	a5,-56(s0)
    2508:	439c                	lw	a5,0(a5)
    250a:	fdc42703          	lw	a4,-36(s0)
    250e:	8ff9                	and	a5,a5,a4
    2510:	fef42023          	sw	a5,-32(s0)

            if(currentpin == pos)
    2514:	fe042703          	lw	a4,-32(s0)
    2518:	fdc42783          	lw	a5,-36(s0)
    251c:	08f71163          	bne	a4,a5,259e <GPIO_Init+0x110>
            {
                pos = pinpos << 2;
    2520:	fe842783          	lw	a5,-24(s0)
    2524:	078a                	slli	a5,a5,0x2
    2526:	fcf42e23          	sw	a5,-36(s0)
                pinmask = ((uint32_t)0x0F) << pos;
    252a:	fdc42783          	lw	a5,-36(s0)
    252e:	473d                	li	a4,15
    2530:	00f717b3          	sll	a5,a4,a5
    2534:	fcf42c23          	sw	a5,-40(s0)
                tmpreg &= ~pinmask;
    2538:	fd842783          	lw	a5,-40(s0)
    253c:	fff7c793          	not	a5,a5
    2540:	fe442703          	lw	a4,-28(s0)
    2544:	8ff9                	and	a5,a5,a4
    2546:	fef42223          	sw	a5,-28(s0)
                tmpreg |= (currentmode << pos);
    254a:	fdc42783          	lw	a5,-36(s0)
    254e:	fec42703          	lw	a4,-20(s0)
    2552:	00f717b3          	sll	a5,a4,a5
    2556:	fe442703          	lw	a4,-28(s0)
    255a:	8fd9                	or	a5,a5,a4
    255c:	fef42223          	sw	a5,-28(s0)

                if(GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPD)
    2560:	fc842783          	lw	a5,-56(s0)
    2564:	4798                	lw	a4,8(a5)
    2566:	02800793          	li	a5,40
    256a:	00f71b63          	bne	a4,a5,2580 <GPIO_Init+0xf2>
                {
                    GPIOx->BCR = (((uint32_t)0x01) << pinpos);
    256e:	fe842783          	lw	a5,-24(s0)
    2572:	4705                	li	a4,1
    2574:	00f71733          	sll	a4,a4,a5
    2578:	fcc42783          	lw	a5,-52(s0)
    257c:	cbd8                	sw	a4,20(a5)
    257e:	a005                	j	259e <GPIO_Init+0x110>
                }
                else
                {
                    if(GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPU)
    2580:	fc842783          	lw	a5,-56(s0)
    2584:	4798                	lw	a4,8(a5)
    2586:	04800793          	li	a5,72
    258a:	00f71a63          	bne	a4,a5,259e <GPIO_Init+0x110>
                    {
                        GPIOx->BSHR = (((uint32_t)0x01) << pinpos);
    258e:	fe842783          	lw	a5,-24(s0)
    2592:	4705                	li	a4,1
    2594:	00f71733          	sll	a4,a4,a5
    2598:	fcc42783          	lw	a5,-52(s0)
    259c:	cb98                	sw	a4,16(a5)
        for(pinpos = 0x00; pinpos < 0x08; pinpos++)
    259e:	fe842783          	lw	a5,-24(s0)
    25a2:	0785                	addi	a5,a5,1
    25a4:	fef42423          	sw	a5,-24(s0)
    25a8:	fe842703          	lw	a4,-24(s0)
    25ac:	479d                	li	a5,7
    25ae:	f4e7f4e3          	bgeu	a5,a4,24f6 <GPIO_Init+0x68>
                    }
                }
            }
        }
        GPIOx->CFGLR = tmpreg;
    25b2:	fcc42783          	lw	a5,-52(s0)
    25b6:	fe442703          	lw	a4,-28(s0)
    25ba:	c398                	sw	a4,0(a5)
    }

    if(((uint32_t)GPIO_InitStruct->GPIO_Pin & ((uint32_t)0x00FF00)) != 0x00)
    25bc:	fc842783          	lw	a5,-56(s0)
    25c0:	4398                	lw	a4,0(a5)
    25c2:	67c1                	lui	a5,0x10
    25c4:	f0078793          	addi	a5,a5,-256 # ff00 <_data_lma+0x3c4c>
    25c8:	8ff9                	and	a5,a5,a4
    25ca:	16078663          	beqz	a5,2736 <GPIO_Init+0x2a8>
    {
        if(GPIOx == GPIOA)
    25ce:	fcc42703          	lw	a4,-52(s0)
    25d2:	400117b7          	lui	a5,0x40011
    25d6:	80078793          	addi	a5,a5,-2048 # 40010800 <_eusrstack+0x2000c800>
    25da:	00f71963          	bne	a4,a5,25ec <GPIO_Init+0x15e>
        {
            tmpreg = CFGHR_tmpA;
    25de:	200007b7          	lui	a5,0x20000
    25e2:	0247a783          	lw	a5,36(a5) # 20000024 <CFGHR_tmpA>
    25e6:	fef42223          	sw	a5,-28(s0)
    25ea:	a805                	j	261a <GPIO_Init+0x18c>
        }
        else if(GPIOx == GPIOB)
    25ec:	fcc42703          	lw	a4,-52(s0)
    25f0:	400117b7          	lui	a5,0x40011
    25f4:	c0078793          	addi	a5,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    25f8:	00f71763          	bne	a4,a5,2606 <GPIO_Init+0x178>
        {
            tmpreg = CFGHR_tmpB;
    25fc:	8081a783          	lw	a5,-2040(gp) # 20000028 <CFGHR_tmpB>
    2600:	fef42223          	sw	a5,-28(s0)
    2604:	a819                	j	261a <GPIO_Init+0x18c>
        }
        else if(GPIOx == GPIOC)
    2606:	fcc42703          	lw	a4,-52(s0)
    260a:	400117b7          	lui	a5,0x40011
    260e:	00f71663          	bne	a4,a5,261a <GPIO_Init+0x18c>
        {
            tmpreg = CFGHR_tmpC;
    2612:	80c1a783          	lw	a5,-2036(gp) # 2000002c <CFGHR_tmpC>
    2616:	fef42223          	sw	a5,-28(s0)
        }

        for(pinpos = 0x00; pinpos < 0x08; pinpos++)
    261a:	fe042423          	sw	zero,-24(s0)
    261e:	a865                	j	26d6 <GPIO_Init+0x248>
        {
            pos = (((uint32_t)0x01) << (pinpos + 0x08));
    2620:	fe842783          	lw	a5,-24(s0)
    2624:	07a1                	addi	a5,a5,8
    2626:	4705                	li	a4,1
    2628:	00f717b3          	sll	a5,a4,a5
    262c:	fcf42e23          	sw	a5,-36(s0)
            currentpin = ((GPIO_InitStruct->GPIO_Pin) & pos);
    2630:	fc842783          	lw	a5,-56(s0)
    2634:	439c                	lw	a5,0(a5)
    2636:	fdc42703          	lw	a4,-36(s0)
    263a:	8ff9                	and	a5,a5,a4
    263c:	fef42023          	sw	a5,-32(s0)

            if(currentpin == pos)
    2640:	fe042703          	lw	a4,-32(s0)
    2644:	fdc42783          	lw	a5,-36(s0)
    2648:	08f71263          	bne	a4,a5,26cc <GPIO_Init+0x23e>
            {
                pos = pinpos << 2;
    264c:	fe842783          	lw	a5,-24(s0)
    2650:	078a                	slli	a5,a5,0x2
    2652:	fcf42e23          	sw	a5,-36(s0)
                pinmask = ((uint32_t)0x0F) << pos;
    2656:	fdc42783          	lw	a5,-36(s0)
    265a:	473d                	li	a4,15
    265c:	00f717b3          	sll	a5,a4,a5
    2660:	fcf42c23          	sw	a5,-40(s0)
                tmpreg &= ~pinmask;
    2664:	fd842783          	lw	a5,-40(s0)
    2668:	fff7c793          	not	a5,a5
    266c:	fe442703          	lw	a4,-28(s0)
    2670:	8ff9                	and	a5,a5,a4
    2672:	fef42223          	sw	a5,-28(s0)
                tmpreg |= (currentmode << pos);
    2676:	fdc42783          	lw	a5,-36(s0)
    267a:	fec42703          	lw	a4,-20(s0)
    267e:	00f717b3          	sll	a5,a4,a5
    2682:	fe442703          	lw	a4,-28(s0)
    2686:	8fd9                	or	a5,a5,a4
    2688:	fef42223          	sw	a5,-28(s0)

                if(GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPD)
    268c:	fc842783          	lw	a5,-56(s0)
    2690:	4798                	lw	a4,8(a5)
    2692:	02800793          	li	a5,40
    2696:	00f71b63          	bne	a4,a5,26ac <GPIO_Init+0x21e>
                {
                    GPIOx->BCR = (((uint32_t)0x01) << (pinpos + 0x08));
    269a:	fe842783          	lw	a5,-24(s0)
    269e:	07a1                	addi	a5,a5,8
    26a0:	4705                	li	a4,1
    26a2:	00f71733          	sll	a4,a4,a5
    26a6:	fcc42783          	lw	a5,-52(s0)
    26aa:	cbd8                	sw	a4,20(a5)
                }

                if(GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPU)
    26ac:	fc842783          	lw	a5,-56(s0)
    26b0:	4798                	lw	a4,8(a5)
    26b2:	04800793          	li	a5,72
    26b6:	00f71b63          	bne	a4,a5,26cc <GPIO_Init+0x23e>
                {
                    GPIOx->BSHR = (((uint32_t)0x01) << (pinpos + 0x08));
    26ba:	fe842783          	lw	a5,-24(s0)
    26be:	07a1                	addi	a5,a5,8
    26c0:	4705                	li	a4,1
    26c2:	00f71733          	sll	a4,a4,a5
    26c6:	fcc42783          	lw	a5,-52(s0)
    26ca:	cb98                	sw	a4,16(a5)
        for(pinpos = 0x00; pinpos < 0x08; pinpos++)
    26cc:	fe842783          	lw	a5,-24(s0)
    26d0:	0785                	addi	a5,a5,1
    26d2:	fef42423          	sw	a5,-24(s0)
    26d6:	fe842703          	lw	a4,-24(s0)
    26da:	479d                	li	a5,7
    26dc:	f4e7f2e3          	bgeu	a5,a4,2620 <GPIO_Init+0x192>
                }
            }
        }
        GPIOx->CFGHR = tmpreg;
    26e0:	fcc42783          	lw	a5,-52(s0)
    26e4:	fe442703          	lw	a4,-28(s0)
    26e8:	c3d8                	sw	a4,4(a5)

        if(GPIOx == GPIOA)
    26ea:	fcc42703          	lw	a4,-52(s0)
    26ee:	400117b7          	lui	a5,0x40011
    26f2:	80078793          	addi	a5,a5,-2048 # 40010800 <_eusrstack+0x2000c800>
    26f6:	00f71963          	bne	a4,a5,2708 <GPIO_Init+0x27a>
        {
            CFGHR_tmpA = tmpreg;
    26fa:	200007b7          	lui	a5,0x20000
    26fe:	fe442703          	lw	a4,-28(s0)
    2702:	02e7a223          	sw	a4,36(a5) # 20000024 <CFGHR_tmpA>
    2706:	a805                	j	2736 <GPIO_Init+0x2a8>
        }
        else if(GPIOx == GPIOB)
    2708:	fcc42703          	lw	a4,-52(s0)
    270c:	400117b7          	lui	a5,0x40011
    2710:	c0078793          	addi	a5,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    2714:	00f71763          	bne	a4,a5,2722 <GPIO_Init+0x294>
        {
            CFGHR_tmpB = tmpreg;
    2718:	fe442703          	lw	a4,-28(s0)
    271c:	80e1a423          	sw	a4,-2040(gp) # 20000028 <CFGHR_tmpB>
    2720:	a819                	j	2736 <GPIO_Init+0x2a8>
        }
        else if(GPIOx == GPIOC)
    2722:	fcc42703          	lw	a4,-52(s0)
    2726:	400117b7          	lui	a5,0x40011
    272a:	00f71663          	bne	a4,a5,2736 <GPIO_Init+0x2a8>
        {
            CFGHR_tmpC = tmpreg;
    272e:	fe442703          	lw	a4,-28(s0)
    2732:	80e1a623          	sw	a4,-2036(gp) # 2000002c <CFGHR_tmpC>
        }
    }

    if(GPIO_InitStruct->GPIO_Pin > 0x00FFFF)
    2736:	fc842783          	lw	a5,-56(s0)
    273a:	4398                	lw	a4,0(a5)
    273c:	67c1                	lui	a5,0x10
    273e:	0cf76e63          	bltu	a4,a5,281a <GPIO_Init+0x38c>
    {
        tmpreg = GPIOx->CFGXR;
    2742:	fcc42783          	lw	a5,-52(s0)
    2746:	4fdc                	lw	a5,28(a5)
    2748:	fef42223          	sw	a5,-28(s0)

        for(pinpos = 0x00; pinpos < 0x08; pinpos++)
    274c:	fe042423          	sw	zero,-24(s0)
    2750:	a85d                	j	2806 <GPIO_Init+0x378>
        {
            pos = (((uint32_t)0x01) << (pinpos + 0x10));
    2752:	fe842783          	lw	a5,-24(s0)
    2756:	07c1                	addi	a5,a5,16
    2758:	4705                	li	a4,1
    275a:	00f717b3          	sll	a5,a4,a5
    275e:	fcf42e23          	sw	a5,-36(s0)
            currentpin = ((GPIO_InitStruct->GPIO_Pin) & pos);
    2762:	fc842783          	lw	a5,-56(s0)
    2766:	439c                	lw	a5,0(a5)
    2768:	fdc42703          	lw	a4,-36(s0)
    276c:	8ff9                	and	a5,a5,a4
    276e:	fef42023          	sw	a5,-32(s0)

            if(currentpin == pos)
    2772:	fe042703          	lw	a4,-32(s0)
    2776:	fdc42783          	lw	a5,-36(s0)
    277a:	08f71163          	bne	a4,a5,27fc <GPIO_Init+0x36e>
            {
                pos = pinpos << 2;
    277e:	fe842783          	lw	a5,-24(s0)
    2782:	078a                	slli	a5,a5,0x2
    2784:	fcf42e23          	sw	a5,-36(s0)
                pinmask = ((uint32_t)0x0F) << pos;
    2788:	fdc42783          	lw	a5,-36(s0)
    278c:	473d                	li	a4,15
    278e:	00f717b3          	sll	a5,a4,a5
    2792:	fcf42c23          	sw	a5,-40(s0)
                tmpreg &= ~pinmask;
    2796:	fd842783          	lw	a5,-40(s0)
    279a:	fff7c793          	not	a5,a5
    279e:	fe442703          	lw	a4,-28(s0)
    27a2:	8ff9                	and	a5,a5,a4
    27a4:	fef42223          	sw	a5,-28(s0)
                tmpreg |= (currentmode << pos);
    27a8:	fdc42783          	lw	a5,-36(s0)
    27ac:	fec42703          	lw	a4,-20(s0)
    27b0:	00f717b3          	sll	a5,a4,a5
    27b4:	fe442703          	lw	a4,-28(s0)
    27b8:	8fd9                	or	a5,a5,a4
    27ba:	fef42223          	sw	a5,-28(s0)

                if(GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPD)
    27be:	fc842783          	lw	a5,-56(s0)
    27c2:	4798                	lw	a4,8(a5)
    27c4:	02800793          	li	a5,40
    27c8:	00f71b63          	bne	a4,a5,27de <GPIO_Init+0x350>
                {
                    GPIOx->BCR = (((uint32_t)0x01) << (pinpos + 0x10));
    27cc:	fe842783          	lw	a5,-24(s0)
    27d0:	07c1                	addi	a5,a5,16
    27d2:	4705                	li	a4,1
    27d4:	00f71733          	sll	a4,a4,a5
    27d8:	fcc42783          	lw	a5,-52(s0)
    27dc:	cbd8                	sw	a4,20(a5)
                }

                if(GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPU)
    27de:	fc842783          	lw	a5,-56(s0)
    27e2:	4798                	lw	a4,8(a5)
    27e4:	04800793          	li	a5,72
    27e8:	00f71a63          	bne	a4,a5,27fc <GPIO_Init+0x36e>
                {
                    GPIOx->BSXR = (((uint32_t)0x01) << (pinpos));
    27ec:	fe842783          	lw	a5,-24(s0)
    27f0:	4705                	li	a4,1
    27f2:	00f71733          	sll	a4,a4,a5
    27f6:	fcc42783          	lw	a5,-52(s0)
    27fa:	d398                	sw	a4,32(a5)
        for(pinpos = 0x00; pinpos < 0x08; pinpos++)
    27fc:	fe842783          	lw	a5,-24(s0)
    2800:	0785                	addi	a5,a5,1
    2802:	fef42423          	sw	a5,-24(s0)
    2806:	fe842703          	lw	a4,-24(s0)
    280a:	479d                	li	a5,7
    280c:	f4e7f3e3          	bgeu	a5,a4,2752 <GPIO_Init+0x2c4>
                }
            }
        }
        GPIOx->CFGXR = tmpreg;
    2810:	fcc42783          	lw	a5,-52(s0)
    2814:	fe442703          	lw	a4,-28(s0)
    2818:	cfd8                	sw	a4,28(a5)
    }
}
    281a:	0001                	nop
    281c:	5472                	lw	s0,60(sp)
    281e:	6121                	addi	sp,sp,64
    2820:	8082                	ret

00002822 <GPIO_StructInit>:
 *      which will be initialized.
 *
 * @return  none
 */
void GPIO_StructInit(GPIO_InitTypeDef *GPIO_InitStruct)
{
    2822:	1101                	addi	sp,sp,-32
    2824:	ce22                	sw	s0,28(sp)
    2826:	1000                	addi	s0,sp,32
    2828:	fea42623          	sw	a0,-20(s0)
    GPIO_InitStruct->GPIO_Pin = GPIO_Pin_All;
    282c:	fec42783          	lw	a5,-20(s0)
    2830:	01000737          	lui	a4,0x1000
    2834:	177d                	addi	a4,a4,-1
    2836:	c398                	sw	a4,0(a5)
    GPIO_InitStruct->GPIO_Speed = GPIO_Speed_50MHz;
    2838:	fec42783          	lw	a5,-20(s0)
    283c:	4705                	li	a4,1
    283e:	c3d8                	sw	a4,4(a5)
    GPIO_InitStruct->GPIO_Mode = GPIO_Mode_IN_FLOATING;
    2840:	fec42783          	lw	a5,-20(s0)
    2844:	4711                	li	a4,4
    2846:	c798                	sw	a4,8(a5)
}
    2848:	0001                	nop
    284a:	4472                	lw	s0,28(sp)
    284c:	6105                	addi	sp,sp,32
    284e:	8082                	ret

00002850 <GPIO_ReadInputDataBit>:
 *             This parameter can be GPIO_Pin_x where x can be (0..23).
 *
 * @return  The input port pin value.
 */
uint8_t GPIO_ReadInputDataBit(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
    2850:	7179                	addi	sp,sp,-48
    2852:	d622                	sw	s0,44(sp)
    2854:	1800                	addi	s0,sp,48
    2856:	fca42e23          	sw	a0,-36(s0)
    285a:	fcb42c23          	sw	a1,-40(s0)
    uint8_t bitstatus = 0x00;
    285e:	fe0407a3          	sb	zero,-17(s0)

    if((GPIOx->INDR & GPIO_Pin) != (uint32_t)Bit_RESET)
    2862:	fdc42783          	lw	a5,-36(s0)
    2866:	4798                	lw	a4,8(a5)
    2868:	fd842783          	lw	a5,-40(s0)
    286c:	8ff9                	and	a5,a5,a4
    286e:	c789                	beqz	a5,2878 <GPIO_ReadInputDataBit+0x28>
    {
        bitstatus = (uint8_t)Bit_SET;
    2870:	4785                	li	a5,1
    2872:	fef407a3          	sb	a5,-17(s0)
    2876:	a019                	j	287c <GPIO_ReadInputDataBit+0x2c>
    }
    else
    {
        bitstatus = (uint8_t)Bit_RESET;
    2878:	fe0407a3          	sb	zero,-17(s0)
    }

    return bitstatus;
    287c:	fef44783          	lbu	a5,-17(s0)
}
    2880:	853e                	mv	a0,a5
    2882:	5432                	lw	s0,44(sp)
    2884:	6145                	addi	sp,sp,48
    2886:	8082                	ret

00002888 <GPIO_ReadInputData>:
 * @param   GPIOx - where x can be (A..C) to select the GPIO peripheral.
 *
 * @return  The output port pin value.
 */
uint32_t GPIO_ReadInputData(GPIO_TypeDef *GPIOx)
{
    2888:	7179                	addi	sp,sp,-48
    288a:	d622                	sw	s0,44(sp)
    288c:	1800                	addi	s0,sp,48
    288e:	fca42e23          	sw	a0,-36(s0)
    uint32_t val;

    val = ( uint32_t )GPIOx->INDR;
    2892:	fdc42783          	lw	a5,-36(s0)
    2896:	479c                	lw	a5,8(a5)
    2898:	fef42623          	sw	a5,-20(s0)

    return ( val );
    289c:	fec42783          	lw	a5,-20(s0)
}
    28a0:	853e                	mv	a0,a5
    28a2:	5432                	lw	s0,44(sp)
    28a4:	6145                	addi	sp,sp,48
    28a6:	8082                	ret

000028a8 <GPIO_ReadOutputDataBit>:
 *            This parameter can be GPIO_Pin_x where x can be (0..23).
 *
 * @return  none
 */
uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
    28a8:	7179                	addi	sp,sp,-48
    28aa:	d622                	sw	s0,44(sp)
    28ac:	1800                	addi	s0,sp,48
    28ae:	fca42e23          	sw	a0,-36(s0)
    28b2:	fcb42c23          	sw	a1,-40(s0)
    uint8_t bitstatus = 0x00;
    28b6:	fe0407a3          	sb	zero,-17(s0)

    if((GPIOx->OUTDR & GPIO_Pin) != (uint32_t)Bit_RESET)
    28ba:	fdc42783          	lw	a5,-36(s0)
    28be:	47d8                	lw	a4,12(a5)
    28c0:	fd842783          	lw	a5,-40(s0)
    28c4:	8ff9                	and	a5,a5,a4
    28c6:	c789                	beqz	a5,28d0 <GPIO_ReadOutputDataBit+0x28>
    {
        bitstatus = (uint8_t)Bit_SET;
    28c8:	4785                	li	a5,1
    28ca:	fef407a3          	sb	a5,-17(s0)
    28ce:	a019                	j	28d4 <GPIO_ReadOutputDataBit+0x2c>
    }
    else
    {
        bitstatus = (uint8_t)Bit_RESET;
    28d0:	fe0407a3          	sb	zero,-17(s0)
    }

    return bitstatus;
    28d4:	fef44783          	lbu	a5,-17(s0)
}
    28d8:	853e                	mv	a0,a5
    28da:	5432                	lw	s0,44(sp)
    28dc:	6145                	addi	sp,sp,48
    28de:	8082                	ret

000028e0 <GPIO_ReadOutputData>:
 * @param   GPIOx - where x can be (A..C) to select the GPIO peripheral.
 *
 * @return  GPIO output port pin value.
 */
uint32_t GPIO_ReadOutputData(GPIO_TypeDef *GPIOx)
{
    28e0:	7179                	addi	sp,sp,-48
    28e2:	d622                	sw	s0,44(sp)
    28e4:	1800                	addi	s0,sp,48
    28e6:	fca42e23          	sw	a0,-36(s0)
    uint32_t val;

    val = ( uint32_t )GPIOx->OUTDR;
    28ea:	fdc42783          	lw	a5,-36(s0)
    28ee:	47dc                	lw	a5,12(a5)
    28f0:	fef42623          	sw	a5,-20(s0)

    return ( val );
    28f4:	fec42783          	lw	a5,-20(s0)
}
    28f8:	853e                	mv	a0,a5
    28fa:	5432                	lw	s0,44(sp)
    28fc:	6145                	addi	sp,sp,48
    28fe:	8082                	ret

00002900 <GPIO_SetBits>:
 *            This parameter can be any combination of GPIO_Pin_x where x can be (0..23).
 *
 * @return  none
 */
void GPIO_SetBits(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
    2900:	1101                	addi	sp,sp,-32
    2902:	ce22                	sw	s0,28(sp)
    2904:	1000                	addi	s0,sp,32
    2906:	fea42623          	sw	a0,-20(s0)
    290a:	feb42423          	sw	a1,-24(s0)
    if((GPIO_Pin & ((uint32_t)0x00FFFF)) != 0x00)
    290e:	fe842703          	lw	a4,-24(s0)
    2912:	67c1                	lui	a5,0x10
    2914:	17fd                	addi	a5,a5,-1
    2916:	8ff9                	and	a5,a5,a4
    2918:	c791                	beqz	a5,2924 <GPIO_SetBits+0x24>
    {
        GPIOx->BSHR = GPIO_Pin;
    291a:	fec42783          	lw	a5,-20(s0)
    291e:	fe842703          	lw	a4,-24(s0)
    2922:	cb98                	sw	a4,16(a5)
    }

    if(GPIO_Pin > 0x00FFFF)
    2924:	fe842703          	lw	a4,-24(s0)
    2928:	67c1                	lui	a5,0x10
    292a:	00f76963          	bltu	a4,a5,293c <GPIO_SetBits+0x3c>
    {
        GPIOx->BSXR = (GPIO_Pin>>0x10);
    292e:	fe842783          	lw	a5,-24(s0)
    2932:	0107d713          	srli	a4,a5,0x10
    2936:	fec42783          	lw	a5,-20(s0)
    293a:	d398                	sw	a4,32(a5)
    }
}
    293c:	0001                	nop
    293e:	4472                	lw	s0,28(sp)
    2940:	6105                	addi	sp,sp,32
    2942:	8082                	ret

00002944 <GPIO_ResetBits>:
 *            This parameter can be any combination of GPIO_Pin_x where x can be (0..23).
 *
 * @return  none
 */
void GPIO_ResetBits(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
    2944:	1101                	addi	sp,sp,-32
    2946:	ce22                	sw	s0,28(sp)
    2948:	1000                	addi	s0,sp,32
    294a:	fea42623          	sw	a0,-20(s0)
    294e:	feb42423          	sw	a1,-24(s0)
    GPIOx->BCR = GPIO_Pin;
    2952:	fec42783          	lw	a5,-20(s0)
    2956:	fe842703          	lw	a4,-24(s0)
    295a:	cbd8                	sw	a4,20(a5)
}
    295c:	0001                	nop
    295e:	4472                	lw	s0,28(sp)
    2960:	6105                	addi	sp,sp,32
    2962:	8082                	ret

00002964 <GPIO_WriteBit>:
 *            Bit_SET - to set the port pin.
 *
 * @return  none
 */
void GPIO_WriteBit(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin, BitAction BitVal)
{
    2964:	1101                	addi	sp,sp,-32
    2966:	ce22                	sw	s0,28(sp)
    2968:	1000                	addi	s0,sp,32
    296a:	fea42623          	sw	a0,-20(s0)
    296e:	feb42423          	sw	a1,-24(s0)
    2972:	fec42223          	sw	a2,-28(s0)
    if(BitVal != Bit_RESET)
    2976:	fe442783          	lw	a5,-28(s0)
    297a:	cb8d                	beqz	a5,29ac <GPIO_WriteBit+0x48>
    {
        if((GPIO_Pin & ((uint32_t)0x00FFFF)) != 0x00)
    297c:	fe842703          	lw	a4,-24(s0)
    2980:	67c1                	lui	a5,0x10
    2982:	17fd                	addi	a5,a5,-1
    2984:	8ff9                	and	a5,a5,a4
    2986:	c791                	beqz	a5,2992 <GPIO_WriteBit+0x2e>
        {
            GPIOx->BSHR = GPIO_Pin;
    2988:	fec42783          	lw	a5,-20(s0)
    298c:	fe842703          	lw	a4,-24(s0)
    2990:	cb98                	sw	a4,16(a5)
        }

        if(GPIO_Pin > 0x00FFFF)
    2992:	fe842703          	lw	a4,-24(s0)
    2996:	67c1                	lui	a5,0x10
    2998:	00f76f63          	bltu	a4,a5,29b6 <GPIO_WriteBit+0x52>
        {
            GPIOx->BSXR = (GPIO_Pin>>0x10);
    299c:	fe842783          	lw	a5,-24(s0)
    29a0:	0107d713          	srli	a4,a5,0x10
    29a4:	fec42783          	lw	a5,-20(s0)
    29a8:	d398                	sw	a4,32(a5)
    }
    else
    {
        GPIOx->BCR = GPIO_Pin;
    }
}
    29aa:	a031                	j	29b6 <GPIO_WriteBit+0x52>
        GPIOx->BCR = GPIO_Pin;
    29ac:	fec42783          	lw	a5,-20(s0)
    29b0:	fe842703          	lw	a4,-24(s0)
    29b4:	cbd8                	sw	a4,20(a5)
}
    29b6:	0001                	nop
    29b8:	4472                	lw	s0,28(sp)
    29ba:	6105                	addi	sp,sp,32
    29bc:	8082                	ret

000029be <GPIO_Write>:
 *          PortVal - specifies the value to be written to the port output data register.
 *
 * @return  none
 */
void GPIO_Write(GPIO_TypeDef *GPIOx, uint32_t PortVal)
{
    29be:	1101                	addi	sp,sp,-32
    29c0:	ce22                	sw	s0,28(sp)
    29c2:	1000                	addi	s0,sp,32
    29c4:	fea42623          	sw	a0,-20(s0)
    29c8:	feb42423          	sw	a1,-24(s0)
    GPIOx->OUTDR = PortVal;
    29cc:	fec42783          	lw	a5,-20(s0)
    29d0:	fe842703          	lw	a4,-24(s0)
    29d4:	c7d8                	sw	a4,12(a5)
}
    29d6:	0001                	nop
    29d8:	4472                	lw	s0,28(sp)
    29da:	6105                	addi	sp,sp,32
    29dc:	8082                	ret

000029de <GPIO_PinLockConfig>:
 *            This parameter can be any combination of GPIO_Pin_x where x can be (0..23).
 *
 * @return  none
 */
void GPIO_PinLockConfig(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
    29de:	7179                	addi	sp,sp,-48
    29e0:	d622                	sw	s0,44(sp)
    29e2:	1800                	addi	s0,sp,48
    29e4:	fca42e23          	sw	a0,-36(s0)
    29e8:	fcb42c23          	sw	a1,-40(s0)
    uint32_t tmp = 0x01000000;
    29ec:	010007b7          	lui	a5,0x1000
    29f0:	fef42623          	sw	a5,-20(s0)

    tmp |= GPIO_Pin;
    29f4:	fec42703          	lw	a4,-20(s0)
    29f8:	fd842783          	lw	a5,-40(s0)
    29fc:	8fd9                	or	a5,a5,a4
    29fe:	fef42623          	sw	a5,-20(s0)
    GPIOx->LCKR = tmp;
    2a02:	fdc42783          	lw	a5,-36(s0)
    2a06:	fec42703          	lw	a4,-20(s0)
    2a0a:	cf98                	sw	a4,24(a5)
    GPIOx->LCKR = GPIO_Pin;
    2a0c:	fdc42783          	lw	a5,-36(s0)
    2a10:	fd842703          	lw	a4,-40(s0)
    2a14:	cf98                	sw	a4,24(a5)
    GPIOx->LCKR = tmp;
    2a16:	fdc42783          	lw	a5,-36(s0)
    2a1a:	fec42703          	lw	a4,-20(s0)
    2a1e:	cf98                	sw	a4,24(a5)
    tmp = GPIOx->LCKR;
    2a20:	fdc42783          	lw	a5,-36(s0)
    2a24:	4f9c                	lw	a5,24(a5)
    2a26:	fef42623          	sw	a5,-20(s0)
    tmp = GPIOx->LCKR;
    2a2a:	fdc42783          	lw	a5,-36(s0)
    2a2e:	4f9c                	lw	a5,24(a5)
    2a30:	fef42623          	sw	a5,-20(s0)
}
    2a34:	0001                	nop
    2a36:	5432                	lw	s0,44(sp)
    2a38:	6145                	addi	sp,sp,48
    2a3a:	8082                	ret

00002a3c <GPIO_PinRemapConfig>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void GPIO_PinRemapConfig(uint32_t GPIO_Remap, FunctionalState NewState)
{
    2a3c:	7179                	addi	sp,sp,-48
    2a3e:	d622                	sw	s0,44(sp)
    2a40:	1800                	addi	s0,sp,48
    2a42:	fca42e23          	sw	a0,-36(s0)
    2a46:	fcb42c23          	sw	a1,-40(s0)
    uint32_t tmp = 0x00, tmp1 = 0x00, tmpreg = 0x00, tmpmask = 0x00;
    2a4a:	fe042423          	sw	zero,-24(s0)
    2a4e:	fe042223          	sw	zero,-28(s0)
    2a52:	fe042623          	sw	zero,-20(s0)
    2a56:	fe042023          	sw	zero,-32(s0)

    tmpreg = AFIO->PCFR1;
    2a5a:	400107b7          	lui	a5,0x40010
    2a5e:	43dc                	lw	a5,4(a5)
    2a60:	fef42623          	sw	a5,-20(s0)

    tmpmask = (GPIO_Remap & DBGAFR_POSITION_MASK) >> 0x10;
    2a64:	fdc42783          	lw	a5,-36(s0)
    2a68:	83c1                	srli	a5,a5,0x10
    2a6a:	8bbd                	andi	a5,a5,15
    2a6c:	fef42023          	sw	a5,-32(s0)
    tmp = GPIO_Remap & LSB_MASK;
    2a70:	fdc42703          	lw	a4,-36(s0)
    2a74:	67c1                	lui	a5,0x10
    2a76:	17fd                	addi	a5,a5,-1
    2a78:	8ff9                	and	a5,a5,a4
    2a7a:	fef42423          	sw	a5,-24(s0)

    /* Clear bit */
    if((GPIO_Remap & 0x08000000) == 0x08000000) /* 3bit */
    2a7e:	fdc42703          	lw	a4,-36(s0)
    2a82:	080007b7          	lui	a5,0x8000
    2a86:	8ff9                	and	a5,a5,a4
    2a88:	cfe9                	beqz	a5,2b62 <GPIO_PinRemapConfig+0x126>
    {
        if((GPIO_Remap & (DBGAFR_LOCATION_MASK | DBGAFR_NUMBITS_MASK)) == (DBGAFR_LOCATION_MASK | DBGAFR_NUMBITS_MASK)) /* [26:24] SDI */
    2a8a:	fdc42703          	lw	a4,-36(s0)
    2a8e:	003007b7          	lui	a5,0x300
    2a92:	8f7d                	and	a4,a4,a5
    2a94:	003007b7          	lui	a5,0x300
    2a98:	02f71563          	bne	a4,a5,2ac2 <GPIO_PinRemapConfig+0x86>
        {
            tmpreg &= DBGAFR_SWJCFG_MASK;
    2a9c:	fec42703          	lw	a4,-20(s0)
    2aa0:	f10007b7          	lui	a5,0xf1000
    2aa4:	17fd                	addi	a5,a5,-1
    2aa6:	8ff9                	and	a5,a5,a4
    2aa8:	fef42623          	sw	a5,-20(s0)
            AFIO->PCFR1 &= DBGAFR_SWJCFG_MASK;
    2aac:	400107b7          	lui	a5,0x40010
    2ab0:	43d4                	lw	a3,4(a5)
    2ab2:	400107b7          	lui	a5,0x40010
    2ab6:	f1000737          	lui	a4,0xf1000
    2aba:	177d                	addi	a4,a4,-1
    2abc:	8f75                	and	a4,a4,a3
    2abe:	c3d8                	sw	a4,4(a5)
    2ac0:	a21d                	j	2be6 <GPIO_PinRemapConfig+0x1aa>
        }
        else if((GPIO_Remap & DBGAFR_TIM1RP_MASK) == DBGAFR_TIM1RP_MASK) /* [31:16] 3bit */
    2ac2:	fdc42703          	lw	a4,-36(s0)
    2ac6:	004007b7          	lui	a5,0x400
    2aca:	8ff9                	and	a5,a5,a4
    2acc:	cf9d                	beqz	a5,2b0a <GPIO_PinRemapConfig+0xce>
        {
            tmp1 = ((uint32_t)0x07) << 15;
    2ace:	000387b7          	lui	a5,0x38
    2ad2:	fef42223          	sw	a5,-28(s0)
            tmpreg &= ~tmp1;
    2ad6:	fe442783          	lw	a5,-28(s0)
    2ada:	fff7c793          	not	a5,a5
    2ade:	fec42703          	lw	a4,-20(s0)
    2ae2:	8ff9                	and	a5,a5,a4
    2ae4:	fef42623          	sw	a5,-20(s0)

            if(NewState != DISABLE)
    2ae8:	fd842783          	lw	a5,-40(s0)
    2aec:	cb89                	beqz	a5,2afe <GPIO_PinRemapConfig+0xc2>
            {
                tmpreg |= (tmp << 15);
    2aee:	fe842783          	lw	a5,-24(s0)
    2af2:	07be                	slli	a5,a5,0xf
    2af4:	fec42703          	lw	a4,-20(s0)
    2af8:	8fd9                	or	a5,a5,a4
    2afa:	fef42623          	sw	a5,-20(s0)
            }

            AFIO->PCFR1 = tmpreg;
    2afe:	400107b7          	lui	a5,0x40010
    2b02:	fec42703          	lw	a4,-20(s0)
    2b06:	c3d8                	sw	a4,4(a5)
            return;
    2b08:	a229                	j	2c12 <GPIO_PinRemapConfig+0x1d6>
        }
        else if((GPIO_Remap & (DBGAFR_LOCATION_MASK | DBGAFR_NUMBITS_MASK)) == DBGAFR_LOCATION_MASK) /* [31:16] 3bit */
    2b0a:	fdc42703          	lw	a4,-36(s0)
    2b0e:	003007b7          	lui	a5,0x300
    2b12:	8f7d                	and	a4,a4,a5
    2b14:	002007b7          	lui	a5,0x200
    2b18:	02f71463          	bne	a4,a5,2b40 <GPIO_PinRemapConfig+0x104>
        {
            tmp1 = ((uint32_t)0x07) << (tmpmask + 0x10);
    2b1c:	fe042783          	lw	a5,-32(s0)
    2b20:	07c1                	addi	a5,a5,16
    2b22:	471d                	li	a4,7
    2b24:	00f717b3          	sll	a5,a4,a5
    2b28:	fef42223          	sw	a5,-28(s0)
            tmpreg &= ~tmp1;
    2b2c:	fe442783          	lw	a5,-28(s0)
    2b30:	fff7c793          	not	a5,a5
    2b34:	fec42703          	lw	a4,-20(s0)
    2b38:	8ff9                	and	a5,a5,a4
    2b3a:	fef42623          	sw	a5,-20(s0)
    2b3e:	a065                	j	2be6 <GPIO_PinRemapConfig+0x1aa>
        }
        else /* [15:0] 3bit */
        {
            tmp1 = ((uint32_t)0x07) << tmpmask;
    2b40:	fe042783          	lw	a5,-32(s0)
    2b44:	471d                	li	a4,7
    2b46:	00f717b3          	sll	a5,a4,a5
    2b4a:	fef42223          	sw	a5,-28(s0)
            tmpreg &= ~tmp1;
    2b4e:	fe442783          	lw	a5,-28(s0)
    2b52:	fff7c793          	not	a5,a5
    2b56:	fec42703          	lw	a4,-20(s0)
    2b5a:	8ff9                	and	a5,a5,a4
    2b5c:	fef42623          	sw	a5,-20(s0)
    2b60:	a059                	j	2be6 <GPIO_PinRemapConfig+0x1aa>
        }
    }
    else
    {
        if((GPIO_Remap & (DBGAFR_LOCATION_MASK | DBGAFR_NUMBITS_MASK)) == (DBGAFR_LOCATION_MASK | DBGAFR_NUMBITS_MASK)) /* [31:16] 2bit */
    2b62:	fdc42703          	lw	a4,-36(s0)
    2b66:	003007b7          	lui	a5,0x300
    2b6a:	8f7d                	and	a4,a4,a5
    2b6c:	003007b7          	lui	a5,0x300
    2b70:	02f71463          	bne	a4,a5,2b98 <GPIO_PinRemapConfig+0x15c>
        {
            tmp1 = ((uint32_t)0x03) << (tmpmask + 0x10);
    2b74:	fe042783          	lw	a5,-32(s0)
    2b78:	07c1                	addi	a5,a5,16
    2b7a:	470d                	li	a4,3
    2b7c:	00f717b3          	sll	a5,a4,a5
    2b80:	fef42223          	sw	a5,-28(s0)
            tmpreg &= ~tmp1;
    2b84:	fe442783          	lw	a5,-28(s0)
    2b88:	fff7c793          	not	a5,a5
    2b8c:	fec42703          	lw	a4,-20(s0)
    2b90:	8ff9                	and	a5,a5,a4
    2b92:	fef42623          	sw	a5,-20(s0)
    2b96:	a881                	j	2be6 <GPIO_PinRemapConfig+0x1aa>
        }
        else if((GPIO_Remap & DBGAFR_NUMBITS_MASK) == DBGAFR_NUMBITS_MASK) /* [15:0] 2bit */
    2b98:	fdc42703          	lw	a4,-36(s0)
    2b9c:	001007b7          	lui	a5,0x100
    2ba0:	8ff9                	and	a5,a5,a4
    2ba2:	c395                	beqz	a5,2bc6 <GPIO_PinRemapConfig+0x18a>
        {
            tmp1 = ((uint32_t)0x03) << tmpmask;
    2ba4:	fe042783          	lw	a5,-32(s0)
    2ba8:	470d                	li	a4,3
    2baa:	00f717b3          	sll	a5,a4,a5
    2bae:	fef42223          	sw	a5,-28(s0)
            tmpreg &= ~tmp1;
    2bb2:	fe442783          	lw	a5,-28(s0)
    2bb6:	fff7c793          	not	a5,a5
    2bba:	fec42703          	lw	a4,-20(s0)
    2bbe:	8ff9                	and	a5,a5,a4
    2bc0:	fef42623          	sw	a5,-20(s0)
    2bc4:	a00d                	j	2be6 <GPIO_PinRemapConfig+0x1aa>
        }
        else /* [31:0] 1bit */
        {
            tmpreg &= ~(tmp << (((GPIO_Remap & 0x00FFFFFF ) >> 0x15) * 0x10));
    2bc6:	fdc42783          	lw	a5,-36(s0)
    2bca:	83d5                	srli	a5,a5,0x15
    2bcc:	8b9d                	andi	a5,a5,7
    2bce:	0792                	slli	a5,a5,0x4
    2bd0:	fe842703          	lw	a4,-24(s0)
    2bd4:	00f717b3          	sll	a5,a4,a5
    2bd8:	fff7c793          	not	a5,a5
    2bdc:	fec42703          	lw	a4,-20(s0)
    2be0:	8ff9                	and	a5,a5,a4
    2be2:	fef42623          	sw	a5,-20(s0)
        }
    }

    /* Set bit */
    if(NewState != DISABLE)
    2be6:	fd842783          	lw	a5,-40(s0)
    2bea:	cf99                	beqz	a5,2c08 <GPIO_PinRemapConfig+0x1cc>
    {
        tmpreg |= (tmp << (((GPIO_Remap & 0x00FFFFFF )>> 0x15) * 0x10));
    2bec:	fdc42783          	lw	a5,-36(s0)
    2bf0:	83d5                	srli	a5,a5,0x15
    2bf2:	8b9d                	andi	a5,a5,7
    2bf4:	0792                	slli	a5,a5,0x4
    2bf6:	fe842703          	lw	a4,-24(s0)
    2bfa:	00f717b3          	sll	a5,a4,a5
    2bfe:	fec42703          	lw	a4,-20(s0)
    2c02:	8fd9                	or	a5,a5,a4
    2c04:	fef42623          	sw	a5,-20(s0)
    }

    AFIO->PCFR1 = tmpreg;
    2c08:	400107b7          	lui	a5,0x40010
    2c0c:	fec42703          	lw	a4,-20(s0)
    2c10:	c3d8                	sw	a4,4(a5)
}
    2c12:	5432                	lw	s0,44(sp)
    2c14:	6145                	addi	sp,sp,48
    2c16:	8082                	ret

00002c18 <GPIO_EXTILineConfig>:
 *            This parameter can be GPIO_PinSourcex where x can be (0..23).
 *
 * @return  none
 */
void GPIO_EXTILineConfig(uint8_t GPIO_PortSource, uint16_t GPIO_PinSource)
{
    2c18:	7179                	addi	sp,sp,-48
    2c1a:	d622                	sw	s0,44(sp)
    2c1c:	1800                	addi	s0,sp,48
    2c1e:	87aa                	mv	a5,a0
    2c20:	872e                	mv	a4,a1
    2c22:	fcf40fa3          	sb	a5,-33(s0)
    2c26:	87ba                	mv	a5,a4
    2c28:	fcf41e23          	sh	a5,-36(s0)
    uint32_t tmp = 0x00;
    2c2c:	fe042623          	sw	zero,-20(s0)

    tmp = ((uint32_t)0x03) << (0x02 * (GPIO_PinSource & (uint8_t)0x0F));
    2c30:	fdc45783          	lhu	a5,-36(s0)
    2c34:	8bbd                	andi	a5,a5,15
    2c36:	0786                	slli	a5,a5,0x1
    2c38:	470d                	li	a4,3
    2c3a:	00f717b3          	sll	a5,a4,a5
    2c3e:	fef42623          	sw	a5,-20(s0)
    AFIO->EXTICR[GPIO_PinSource >> 0x04] &= ~tmp;
    2c42:	40010737          	lui	a4,0x40010
    2c46:	fdc45783          	lhu	a5,-36(s0)
    2c4a:	8391                	srli	a5,a5,0x4
    2c4c:	07c2                	slli	a5,a5,0x10
    2c4e:	83c1                	srli	a5,a5,0x10
    2c50:	078a                	slli	a5,a5,0x2
    2c52:	97ba                	add	a5,a5,a4
    2c54:	4798                	lw	a4,8(a5)
    2c56:	fec42783          	lw	a5,-20(s0)
    2c5a:	fff7c793          	not	a5,a5
    2c5e:	400106b7          	lui	a3,0x40010
    2c62:	fdc45603          	lhu	a2,-36(s0)
    2c66:	8211                	srli	a2,a2,0x4
    2c68:	0642                	slli	a2,a2,0x10
    2c6a:	8241                	srli	a2,a2,0x10
    2c6c:	8f7d                	and	a4,a4,a5
    2c6e:	00261793          	slli	a5,a2,0x2
    2c72:	97b6                	add	a5,a5,a3
    2c74:	c798                	sw	a4,8(a5)
    AFIO->EXTICR[GPIO_PinSource >> 0x04] |= (((uint32_t)GPIO_PortSource) << (0x02 * (GPIO_PinSource & (uint8_t)0x0F)));
    2c76:	40010737          	lui	a4,0x40010
    2c7a:	fdc45783          	lhu	a5,-36(s0)
    2c7e:	8391                	srli	a5,a5,0x4
    2c80:	07c2                	slli	a5,a5,0x10
    2c82:	83c1                	srli	a5,a5,0x10
    2c84:	078a                	slli	a5,a5,0x2
    2c86:	97ba                	add	a5,a5,a4
    2c88:	4798                	lw	a4,8(a5)
    2c8a:	fdf44683          	lbu	a3,-33(s0)
    2c8e:	fdc45783          	lhu	a5,-36(s0)
    2c92:	8bbd                	andi	a5,a5,15
    2c94:	0786                	slli	a5,a5,0x1
    2c96:	00f697b3          	sll	a5,a3,a5
    2c9a:	400106b7          	lui	a3,0x40010
    2c9e:	fdc45603          	lhu	a2,-36(s0)
    2ca2:	8211                	srli	a2,a2,0x4
    2ca4:	0642                	slli	a2,a2,0x10
    2ca6:	8241                	srli	a2,a2,0x10
    2ca8:	8f5d                	or	a4,a4,a5
    2caa:	00261793          	slli	a5,a2,0x2
    2cae:	97b6                	add	a5,a5,a3
    2cb0:	c798                	sw	a4,8(a5)
}
    2cb2:	0001                	nop
    2cb4:	5432                	lw	s0,44(sp)
    2cb6:	6145                	addi	sp,sp,48
    2cb8:	8082                	ret

00002cba <GPIO_IPD_Unused>:
 * @param   none
 *
 * @return  none
 */
void GPIO_IPD_Unused(void)
{
    2cba:	1101                	addi	sp,sp,-32
    2cbc:	ce06                	sw	ra,28(sp)
    2cbe:	cc22                	sw	s0,24(sp)
    2cc0:	1000                	addi	s0,sp,32
    GPIO_InitTypeDef GPIO_InitStructure = {0};
    2cc2:	fe042023          	sw	zero,-32(s0)
    2cc6:	fe042223          	sw	zero,-28(s0)
    2cca:	fe042423          	sw	zero,-24(s0)
    uint32_t chip = 0;
    2cce:	fe042623          	sw	zero,-20(s0)
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOC, ENABLE);
    2cd2:	4585                	li	a1,1
    2cd4:	4571                	li	a0,28
    2cd6:	5e3010ef          	jal	ra,4ab8 <RCC_APB2PeriphClockCmd>
    chip =  *( uint32_t * )0x1FFFF704 & (~0x00000011);
    2cda:	1ffff7b7          	lui	a5,0x1ffff
    2cde:	70478793          	addi	a5,a5,1796 # 1ffff704 <_data_lma+0x1fff3450>
    2ce2:	439c                	lw	a5,0(a5)
    2ce4:	9bb9                	andi	a5,a5,-18
    2ce6:	fef42623          	sw	a5,-20(s0)
    2cea:	fec42703          	lw	a4,-20(s0)
    2cee:	035607b7          	lui	a5,0x3560
    2cf2:	60078793          	addi	a5,a5,1536 # 3560600 <_data_lma+0x355434c>
    2cf6:	0af70363          	beq	a4,a5,2d9c <GPIO_IPD_Unused+0xe2>
    2cfa:	fec42703          	lw	a4,-20(s0)
    2cfe:	035607b7          	lui	a5,0x3560
    2d02:	60078793          	addi	a5,a5,1536 # 3560600 <_data_lma+0x355434c>
    2d06:	02e7e163          	bltu	a5,a4,2d28 <GPIO_IPD_Unused+0x6e>
    2d0a:	fec42703          	lw	a4,-20(s0)
    2d0e:	031177b7          	lui	a5,0x3117
    2d12:	22f70a63          	beq	a4,a5,2f46 <GPIO_IPD_Unused+0x28c>
    2d16:	fec42703          	lw	a4,-20(s0)
    2d1a:	035107b7          	lui	a5,0x3510
    2d1e:	60078793          	addi	a5,a5,1536 # 3510600 <_data_lma+0x350434c>
    2d22:	02f70c63          	beq	a4,a5,2d5a <GPIO_IPD_Unused+0xa0>
            GPIO_Init(GPIOC, &GPIO_InitStructure);
            break;
        }
        default:
        {
            break;
    2d26:	ac41                	j	2fb6 <GPIO_IPD_Unused+0x2fc>
    2d28:	fec42703          	lw	a4,-20(s0)
    2d2c:	035b07b7          	lui	a5,0x35b0
    2d30:	60078793          	addi	a5,a5,1536 # 35b0600 <_data_lma+0x35a434c>
    2d34:	0cf70963          	beq	a4,a5,2e06 <GPIO_IPD_Unused+0x14c>
    2d38:	fec42703          	lw	a4,-20(s0)
    2d3c:	035e07b7          	lui	a5,0x35e0
    2d40:	60078793          	addi	a5,a5,1536 # 35e0600 <_data_lma+0x35d434c>
    2d44:	12f70663          	beq	a4,a5,2e70 <GPIO_IPD_Unused+0x1b6>
    2d48:	fec42703          	lw	a4,-20(s0)
    2d4c:	035707b7          	lui	a5,0x3570
    2d50:	60078793          	addi	a5,a5,1536 # 3570600 <_data_lma+0x356434c>
    2d54:	18f70463          	beq	a4,a5,2edc <GPIO_IPD_Unused+0x222>
    2d58:	acb9                	j	2fb6 <GPIO_IPD_Unused+0x2fc>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_14|GPIO_Pin_15\
    2d5a:	003fc7b7          	lui	a5,0x3fc
    2d5e:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2d62:	04800793          	li	a5,72
    2d66:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOB, &GPIO_InitStructure);
    2d6a:	fe040793          	addi	a5,s0,-32
    2d6e:	85be                	mv	a1,a5
    2d70:	400117b7          	lui	a5,0x40011
    2d74:	c0078513          	addi	a0,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    2d78:	f16ff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1\
    2d7c:	03f00793          	li	a5,63
    2d80:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2d84:	04800793          	li	a5,72
    2d88:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOC, &GPIO_InitStructure);
    2d8c:	fe040793          	addi	a5,s0,-32
    2d90:	85be                	mv	a1,a5
    2d92:	40011537          	lui	a0,0x40011
    2d96:	ef8ff0ef          	jal	ra,248e <GPIO_Init>
            break;
    2d9a:	ac31                	j	2fb6 <GPIO_IPD_Unused+0x2fc>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_16|GPIO_Pin_15\
    2d9c:	010007b7          	lui	a5,0x1000
    2da0:	f0078793          	addi	a5,a5,-256 # ffff00 <_data_lma+0xff3c4c>
    2da4:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2da8:	04800793          	li	a5,72
    2dac:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOA, &GPIO_InitStructure);
    2db0:	fe040793          	addi	a5,s0,-32
    2db4:	85be                	mv	a1,a5
    2db6:	400117b7          	lui	a5,0x40011
    2dba:	80078513          	addi	a0,a5,-2048 # 40010800 <_eusrstack+0x2000c800>
    2dbe:	ed0ff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2|GPIO_Pin_13\
    2dc2:	003fe7b7          	lui	a5,0x3fe
    2dc6:	0791                	addi	a5,a5,4
    2dc8:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2dcc:	04800793          	li	a5,72
    2dd0:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOB, &GPIO_InitStructure);
    2dd4:	fe040793          	addi	a5,s0,-32
    2dd8:	85be                	mv	a1,a5
    2dda:	400117b7          	lui	a5,0x40011
    2dde:	c0078513          	addi	a0,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    2de2:	eacff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1|GPIO_Pin_2\
    2de6:	0f600793          	li	a5,246
    2dea:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2dee:	04800793          	li	a5,72
    2df2:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOC, &GPIO_InitStructure);
    2df6:	fe040793          	addi	a5,s0,-32
    2dfa:	85be                	mv	a1,a5
    2dfc:	40011537          	lui	a0,0x40011
    2e00:	e8eff0ef          	jal	ra,248e <GPIO_Init>
            break;
    2e04:	aa4d                	j	2fb6 <GPIO_IPD_Unused+0x2fc>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_16|GPIO_Pin_15\
    2e06:	00ffd7b7          	lui	a5,0xffd
    2e0a:	f0078793          	addi	a5,a5,-256 # ffcf00 <_data_lma+0xff0c4c>
    2e0e:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2e12:	04800793          	li	a5,72
    2e16:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOA, &GPIO_InitStructure);
    2e1a:	fe040793          	addi	a5,s0,-32
    2e1e:	85be                	mv	a1,a5
    2e20:	400117b7          	lui	a5,0x40011
    2e24:	80078513          	addi	a0,a5,-2048 # 40010800 <_eusrstack+0x2000c800>
    2e28:	e66ff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2|GPIO_Pin_13\
    2e2c:	003fe7b7          	lui	a5,0x3fe
    2e30:	0791                	addi	a5,a5,4
    2e32:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2e36:	04800793          	li	a5,72
    2e3a:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOB, &GPIO_InitStructure);
    2e3e:	fe040793          	addi	a5,s0,-32
    2e42:	85be                	mv	a1,a5
    2e44:	400117b7          	lui	a5,0x40011
    2e48:	c0078513          	addi	a0,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    2e4c:	e42ff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_4|GPIO_Pin_5\
    2e50:	0f700793          	li	a5,247
    2e54:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2e58:	04800793          	li	a5,72
    2e5c:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOC, &GPIO_InitStructure);
    2e60:	fe040793          	addi	a5,s0,-32
    2e64:	85be                	mv	a1,a5
    2e66:	40011537          	lui	a0,0x40011
    2e6a:	e24ff0ef          	jal	ra,248e <GPIO_Init>
            break;
    2e6e:	a2a1                	j	2fb6 <GPIO_IPD_Unused+0x2fc>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_16|GPIO_Pin_15\
    2e70:	010007b7          	lui	a5,0x1000
    2e74:	f0078793          	addi	a5,a5,-256 # ffff00 <_data_lma+0xff3c4c>
    2e78:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2e7c:	04800793          	li	a5,72
    2e80:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOA, &GPIO_InitStructure);
    2e84:	fe040793          	addi	a5,s0,-32
    2e88:	85be                	mv	a1,a5
    2e8a:	400117b7          	lui	a5,0x40011
    2e8e:	80078513          	addi	a0,a5,-2048 # 40010800 <_eusrstack+0x2000c800>
    2e92:	dfcff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2|GPIO_Pin_9\
    2e96:	003fe7b7          	lui	a5,0x3fe
    2e9a:	7f478793          	addi	a5,a5,2036 # 3fe7f4 <_data_lma+0x3f2540>
    2e9e:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2ea2:	04800793          	li	a5,72
    2ea6:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOB, &GPIO_InitStructure);
    2eaa:	fe040793          	addi	a5,s0,-32
    2eae:	85be                	mv	a1,a5
    2eb0:	400117b7          	lui	a5,0x40011
    2eb4:	c0078513          	addi	a0,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    2eb8:	dd6ff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1\
    2ebc:	0ff00793          	li	a5,255
    2ec0:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2ec4:	04800793          	li	a5,72
    2ec8:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOC, &GPIO_InitStructure);
    2ecc:	fe040793          	addi	a5,s0,-32
    2ed0:	85be                	mv	a1,a5
    2ed2:	40011537          	lui	a0,0x40011
    2ed6:	db8ff0ef          	jal	ra,248e <GPIO_Init>
            break;
    2eda:	a8f1                	j	2fb6 <GPIO_IPD_Unused+0x2fc>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8|GPIO_Pin_9\
    2edc:	010007b7          	lui	a5,0x1000
    2ee0:	f0078793          	addi	a5,a5,-256 # ffff00 <_data_lma+0xff3c4c>
    2ee4:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2ee8:	04800793          	li	a5,72
    2eec:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOA, &GPIO_InitStructure);
    2ef0:	fe040793          	addi	a5,s0,-32
    2ef4:	85be                	mv	a1,a5
    2ef6:	400117b7          	lui	a5,0x40011
    2efa:	80078513          	addi	a0,a5,-2048 # 40010800 <_eusrstack+0x2000c800>
    2efe:	d90ff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_2\
    2f02:	003ff7b7          	lui	a5,0x3ff
    2f06:	17f5                	addi	a5,a5,-3
    2f08:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2f0c:	04800793          	li	a5,72
    2f10:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOB, &GPIO_InitStructure);
    2f14:	fe040793          	addi	a5,s0,-32
    2f18:	85be                	mv	a1,a5
    2f1a:	400117b7          	lui	a5,0x40011
    2f1e:	c0078513          	addi	a0,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    2f22:	d6cff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0\
    2f26:	0fd00793          	li	a5,253
    2f2a:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2f2e:	04800793          	li	a5,72
    2f32:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOC, &GPIO_InitStructure);
    2f36:	fe040793          	addi	a5,s0,-32
    2f3a:	85be                	mv	a1,a5
    2f3c:	40011537          	lui	a0,0x40011
    2f40:	d4eff0ef          	jal	ra,248e <GPIO_Init>
            break;
    2f44:	a88d                	j	2fb6 <GPIO_IPD_Unused+0x2fc>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_16|GPIO_Pin_15\
    2f46:	00fff7b7          	lui	a5,0xfff
    2f4a:	10078793          	addi	a5,a5,256 # fff100 <_data_lma+0xff2e4c>
    2f4e:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2f52:	04800793          	li	a5,72
    2f56:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOA, &GPIO_InitStructure);
    2f5a:	fe040793          	addi	a5,s0,-32
    2f5e:	85be                	mv	a1,a5
    2f60:	400117b7          	lui	a5,0x40011
    2f64:	80078513          	addi	a0,a5,-2048 # 40010800 <_eusrstack+0x2000c800>
    2f68:	d26ff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2|GPIO_Pin_3\
    2f6c:	010007b7          	lui	a5,0x1000
    2f70:	f7c78793          	addi	a5,a5,-132 # ffff7c <_data_lma+0xff3cc8>
    2f74:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2f78:	04800793          	li	a5,72
    2f7c:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOB, &GPIO_InitStructure);
    2f80:	fe040793          	addi	a5,s0,-32
    2f84:	85be                	mv	a1,a5
    2f86:	400117b7          	lui	a5,0x40011
    2f8a:	c0078513          	addi	a0,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    2f8e:	d00ff0ef          	jal	ra,248e <GPIO_Init>
            GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2\
    2f92:	00f0f7b7          	lui	a5,0xf0f
    2f96:	3f778793          	addi	a5,a5,1015 # f0f3f7 <_data_lma+0xf03143>
    2f9a:	fef42023          	sw	a5,-32(s0)
            GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    2f9e:	04800793          	li	a5,72
    2fa2:	fef42423          	sw	a5,-24(s0)
            GPIO_Init(GPIOC, &GPIO_InitStructure);
    2fa6:	fe040793          	addi	a5,s0,-32
    2faa:	85be                	mv	a1,a5
    2fac:	40011537          	lui	a0,0x40011
    2fb0:	cdeff0ef          	jal	ra,248e <GPIO_Init>
            break;
    2fb4:	0001                	nop
        }

    }

}
    2fb6:	0001                	nop
    2fb8:	40f2                	lw	ra,28(sp)
    2fba:	4462                	lw	s0,24(sp)
    2fbc:	6105                	addi	sp,sp,32
    2fbe:	8082                	ret

00002fc0 <I2C_DeInit>:
 * @param   I2Cx - where x can be 1 to select the I2C peripheral.
 *
 * @return  none
 */
void I2C_DeInit(I2C_TypeDef *I2Cx)
{
    2fc0:	1101                	addi	sp,sp,-32
    2fc2:	ce06                	sw	ra,28(sp)
    2fc4:	cc22                	sw	s0,24(sp)
    2fc6:	1000                	addi	s0,sp,32
    2fc8:	fea42623          	sw	a0,-20(s0)
    if(I2Cx == I2C1)
    2fcc:	fec42703          	lw	a4,-20(s0)
    2fd0:	400057b7          	lui	a5,0x40005
    2fd4:	40078793          	addi	a5,a5,1024 # 40005400 <_eusrstack+0x20001400>
    2fd8:	00f71c63          	bne	a4,a5,2ff0 <I2C_DeInit+0x30>
    {
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, ENABLE);
    2fdc:	4585                	li	a1,1
    2fde:	00200537          	lui	a0,0x200
    2fe2:	3ef010ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, DISABLE);
    2fe6:	4581                	li	a1,0
    2fe8:	00200537          	lui	a0,0x200
    2fec:	3e5010ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
    }
}
    2ff0:	0001                	nop
    2ff2:	40f2                	lw	ra,28(sp)
    2ff4:	4462                	lw	s0,24(sp)
    2ff6:	6105                	addi	sp,sp,32
    2ff8:	8082                	ret

00002ffa <I2C_Init>:
 *        contains the configuration information for the specified I2C peripheral.
 *
 * @return  none
 */
void I2C_Init(I2C_TypeDef *I2Cx, I2C_InitTypeDef *I2C_InitStruct)
{
    2ffa:	7139                	addi	sp,sp,-64
    2ffc:	de06                	sw	ra,60(sp)
    2ffe:	dc22                	sw	s0,56(sp)
    3000:	0080                	addi	s0,sp,64
    3002:	fca42623          	sw	a0,-52(s0)
    3006:	fcb42423          	sw	a1,-56(s0)
    uint16_t tmpreg = 0, freqrange = 0;
    300a:	fe041723          	sh	zero,-18(s0)
    300e:	fe041523          	sh	zero,-22(s0)
    uint16_t result = 0x04;
    3012:	4791                	li	a5,4
    3014:	fef41623          	sh	a5,-20(s0)
    uint32_t pclk1 = 8000000;
    3018:	007a17b7          	lui	a5,0x7a1
    301c:	20078793          	addi	a5,a5,512 # 7a1200 <_data_lma+0x794f4c>
    3020:	fef42223          	sw	a5,-28(s0)

    RCC_ClocksTypeDef rcc_clocks;

    tmpreg = I2Cx->CTLR2;
    3024:	fcc42783          	lw	a5,-52(s0)
    3028:	0047d783          	lhu	a5,4(a5)
    302c:	fef41723          	sh	a5,-18(s0)
    tmpreg &= CTLR2_FREQ_Reset;
    3030:	fee45783          	lhu	a5,-18(s0)
    3034:	fc07f793          	andi	a5,a5,-64
    3038:	fef41723          	sh	a5,-18(s0)
    RCC_GetClocksFreq(&rcc_clocks);
    303c:	fd440793          	addi	a5,s0,-44
    3040:	853e                	mv	a0,a5
    3042:	189010ef          	jal	ra,49ca <RCC_GetClocksFreq>
    pclk1 = rcc_clocks.PCLK1_Frequency;
    3046:	fdc42783          	lw	a5,-36(s0)
    304a:	fef42223          	sw	a5,-28(s0)
    freqrange = (uint16_t)(pclk1 / 1000000);
    304e:	fe442703          	lw	a4,-28(s0)
    3052:	000f47b7          	lui	a5,0xf4
    3056:	24078793          	addi	a5,a5,576 # f4240 <_data_lma+0xe7f8c>
    305a:	02f757b3          	divu	a5,a4,a5
    305e:	fef41523          	sh	a5,-22(s0)
    tmpreg |= freqrange;
    3062:	fee45703          	lhu	a4,-18(s0)
    3066:	fea45783          	lhu	a5,-22(s0)
    306a:	8fd9                	or	a5,a5,a4
    306c:	fef41723          	sh	a5,-18(s0)
    I2Cx->CTLR2 = tmpreg;
    3070:	fcc42783          	lw	a5,-52(s0)
    3074:	fee45703          	lhu	a4,-18(s0)
    3078:	00e79223          	sh	a4,4(a5)

    I2Cx->CTLR1 &= CTLR1_PE_Reset;
    307c:	fcc42783          	lw	a5,-52(s0)
    3080:	0007d783          	lhu	a5,0(a5)
    3084:	07c2                	slli	a5,a5,0x10
    3086:	83c1                	srli	a5,a5,0x10
    3088:	9bf9                	andi	a5,a5,-2
    308a:	01079713          	slli	a4,a5,0x10
    308e:	8341                	srli	a4,a4,0x10
    3090:	fcc42783          	lw	a5,-52(s0)
    3094:	00e79023          	sh	a4,0(a5)
    tmpreg = 0;
    3098:	fe041723          	sh	zero,-18(s0)

    if(I2C_InitStruct->I2C_ClockSpeed <= 100000)
    309c:	fc842783          	lw	a5,-56(s0)
    30a0:	4398                	lw	a4,0(a5)
    30a2:	67e1                	lui	a5,0x18
    30a4:	6a078793          	addi	a5,a5,1696 # 186a0 <_data_lma+0xc3ec>
    30a8:	02e7ec63          	bltu	a5,a4,30e0 <I2C_Init+0xe6>
    {
        result = (uint16_t)(pclk1 / (I2C_InitStruct->I2C_ClockSpeed << 1));
    30ac:	fc842783          	lw	a5,-56(s0)
    30b0:	439c                	lw	a5,0(a5)
    30b2:	0786                	slli	a5,a5,0x1
    30b4:	fe442703          	lw	a4,-28(s0)
    30b8:	02f757b3          	divu	a5,a4,a5
    30bc:	fef41623          	sh	a5,-20(s0)

        if(result < 0x04)
    30c0:	fec45703          	lhu	a4,-20(s0)
    30c4:	478d                	li	a5,3
    30c6:	00e7e563          	bltu	a5,a4,30d0 <I2C_Init+0xd6>
        {
            result = 0x04;
    30ca:	4791                	li	a5,4
    30cc:	fef41623          	sh	a5,-20(s0)
        }

        tmpreg |= result;
    30d0:	fee45703          	lhu	a4,-18(s0)
    30d4:	fec45783          	lhu	a5,-20(s0)
    30d8:	8fd9                	or	a5,a5,a4
    30da:	fef41723          	sh	a5,-18(s0)
    30de:	a051                	j	3162 <I2C_Init+0x168>
    }
    else
    {
        if(I2C_InitStruct->I2C_DutyCycle == I2C_DutyCycle_2)
    30e0:	fc842783          	lw	a5,-56(s0)
    30e4:	0067d703          	lhu	a4,6(a5)
    30e8:	67b1                	lui	a5,0xc
    30ea:	17fd                	addi	a5,a5,-1
    30ec:	00f71f63          	bne	a4,a5,310a <I2C_Init+0x110>
        {
            result = (uint16_t)(pclk1 / (I2C_InitStruct->I2C_ClockSpeed * 3));
    30f0:	fc842783          	lw	a5,-56(s0)
    30f4:	4398                	lw	a4,0(a5)
    30f6:	87ba                	mv	a5,a4
    30f8:	0786                	slli	a5,a5,0x1
    30fa:	97ba                	add	a5,a5,a4
    30fc:	fe442703          	lw	a4,-28(s0)
    3100:	02f757b3          	divu	a5,a4,a5
    3104:	fef41623          	sh	a5,-20(s0)
    3108:	a02d                	j	3132 <I2C_Init+0x138>
        }
        else
        {
            result = (uint16_t)(pclk1 / (I2C_InitStruct->I2C_ClockSpeed * 25));
    310a:	fc842783          	lw	a5,-56(s0)
    310e:	4398                	lw	a4,0(a5)
    3110:	87ba                	mv	a5,a4
    3112:	0786                	slli	a5,a5,0x1
    3114:	97ba                	add	a5,a5,a4
    3116:	078e                	slli	a5,a5,0x3
    3118:	97ba                	add	a5,a5,a4
    311a:	fe442703          	lw	a4,-28(s0)
    311e:	02f757b3          	divu	a5,a4,a5
    3122:	fef41623          	sh	a5,-20(s0)
            result |= I2C_DutyCycle_16_9;
    3126:	fec45703          	lhu	a4,-20(s0)
    312a:	6791                	lui	a5,0x4
    312c:	8fd9                	or	a5,a5,a4
    312e:	fef41623          	sh	a5,-20(s0)
        }

        if((result & CKCFGR_CCR_Set) == 0)
    3132:	fec45703          	lhu	a4,-20(s0)
    3136:	6785                	lui	a5,0x1
    3138:	17fd                	addi	a5,a5,-1
    313a:	8ff9                	and	a5,a5,a4
    313c:	e799                	bnez	a5,314a <I2C_Init+0x150>
        {
            result |= (uint16_t)0x0001;
    313e:	fec45783          	lhu	a5,-20(s0)
    3142:	0017e793          	ori	a5,a5,1
    3146:	fef41623          	sh	a5,-20(s0)
        }

        tmpreg |= (uint16_t)(result | CKCFGR_FS_Set);
    314a:	fec45703          	lhu	a4,-20(s0)
    314e:	fee45783          	lhu	a5,-18(s0)
    3152:	8fd9                	or	a5,a5,a4
    3154:	01079713          	slli	a4,a5,0x10
    3158:	8341                	srli	a4,a4,0x10
    315a:	77e1                	lui	a5,0xffff8
    315c:	8fd9                	or	a5,a5,a4
    315e:	fef41723          	sh	a5,-18(s0)
    }

    I2Cx->CKCFGR = tmpreg;
    3162:	fcc42783          	lw	a5,-52(s0)
    3166:	fee45703          	lhu	a4,-18(s0)
    316a:	00e79e23          	sh	a4,28(a5) # ffff801c <_eusrstack+0xdfff401c>
    I2Cx->CTLR1 |= CTLR1_PE_Set;
    316e:	fcc42783          	lw	a5,-52(s0)
    3172:	0007d783          	lhu	a5,0(a5)
    3176:	07c2                	slli	a5,a5,0x10
    3178:	83c1                	srli	a5,a5,0x10
    317a:	0017e793          	ori	a5,a5,1
    317e:	01079713          	slli	a4,a5,0x10
    3182:	8341                	srli	a4,a4,0x10
    3184:	fcc42783          	lw	a5,-52(s0)
    3188:	00e79023          	sh	a4,0(a5)

    tmpreg = I2Cx->CTLR1;
    318c:	fcc42783          	lw	a5,-52(s0)
    3190:	0007d783          	lhu	a5,0(a5)
    3194:	fef41723          	sh	a5,-18(s0)
    tmpreg &= CTLR1_CLEAR_Mask;
    3198:	fee45783          	lhu	a5,-18(s0)
    319c:	bf57f793          	andi	a5,a5,-1035
    31a0:	fef41723          	sh	a5,-18(s0)
    tmpreg |= (uint16_t)((uint32_t)I2C_InitStruct->I2C_Mode | I2C_InitStruct->I2C_Ack);
    31a4:	fc842783          	lw	a5,-56(s0)
    31a8:	0047d703          	lhu	a4,4(a5)
    31ac:	fc842783          	lw	a5,-56(s0)
    31b0:	00a7d783          	lhu	a5,10(a5)
    31b4:	8fd9                	or	a5,a5,a4
    31b6:	01079713          	slli	a4,a5,0x10
    31ba:	8341                	srli	a4,a4,0x10
    31bc:	fee45783          	lhu	a5,-18(s0)
    31c0:	8fd9                	or	a5,a5,a4
    31c2:	fef41723          	sh	a5,-18(s0)
    I2Cx->CTLR1 = tmpreg;
    31c6:	fcc42783          	lw	a5,-52(s0)
    31ca:	fee45703          	lhu	a4,-18(s0)
    31ce:	00e79023          	sh	a4,0(a5)

    I2Cx->OADDR1 = (I2C_InitStruct->I2C_AcknowledgedAddress | I2C_InitStruct->I2C_OwnAddress1);
    31d2:	fc842783          	lw	a5,-56(s0)
    31d6:	00c7d703          	lhu	a4,12(a5)
    31da:	fc842783          	lw	a5,-56(s0)
    31de:	0087d783          	lhu	a5,8(a5)
    31e2:	8fd9                	or	a5,a5,a4
    31e4:	01079713          	slli	a4,a5,0x10
    31e8:	8341                	srli	a4,a4,0x10
    31ea:	fcc42783          	lw	a5,-52(s0)
    31ee:	00e79423          	sh	a4,8(a5)
}
    31f2:	0001                	nop
    31f4:	50f2                	lw	ra,60(sp)
    31f6:	5462                	lw	s0,56(sp)
    31f8:	6121                	addi	sp,sp,64
    31fa:	8082                	ret

000031fc <I2C_StructInit>:
 *        will be initialized.
 *
 * @return  none
 */
void I2C_StructInit(I2C_InitTypeDef *I2C_InitStruct)
{
    31fc:	1101                	addi	sp,sp,-32
    31fe:	ce22                	sw	s0,28(sp)
    3200:	1000                	addi	s0,sp,32
    3202:	fea42623          	sw	a0,-20(s0)
    I2C_InitStruct->I2C_ClockSpeed = 5000;
    3206:	fec42783          	lw	a5,-20(s0)
    320a:	6705                	lui	a4,0x1
    320c:	38870713          	addi	a4,a4,904 # 1388 <DMA_DeInit+0x4e>
    3210:	c398                	sw	a4,0(a5)
    I2C_InitStruct->I2C_Mode = I2C_Mode_I2C;
    3212:	fec42783          	lw	a5,-20(s0)
    3216:	00079223          	sh	zero,4(a5)
    I2C_InitStruct->I2C_DutyCycle = I2C_DutyCycle_2;
    321a:	fec42783          	lw	a5,-20(s0)
    321e:	7771                	lui	a4,0xffffc
    3220:	177d                	addi	a4,a4,-1
    3222:	00e79323          	sh	a4,6(a5)
    I2C_InitStruct->I2C_OwnAddress1 = 0;
    3226:	fec42783          	lw	a5,-20(s0)
    322a:	00079423          	sh	zero,8(a5)
    I2C_InitStruct->I2C_Ack = I2C_Ack_Disable;
    322e:	fec42783          	lw	a5,-20(s0)
    3232:	00079523          	sh	zero,10(a5)
    I2C_InitStruct->I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
    3236:	fec42783          	lw	a5,-20(s0)
    323a:	6711                	lui	a4,0x4
    323c:	00e79623          	sh	a4,12(a5)
}
    3240:	0001                	nop
    3242:	4472                	lw	s0,28(sp)
    3244:	6105                	addi	sp,sp,32
    3246:	8082                	ret

00003248 <I2C_Cmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_Cmd(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    3248:	1101                	addi	sp,sp,-32
    324a:	ce22                	sw	s0,28(sp)
    324c:	1000                	addi	s0,sp,32
    324e:	fea42623          	sw	a0,-20(s0)
    3252:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    3256:	fe842783          	lw	a5,-24(s0)
    325a:	c38d                	beqz	a5,327c <I2C_Cmd+0x34>
    {
        I2Cx->CTLR1 |= CTLR1_PE_Set;
    325c:	fec42783          	lw	a5,-20(s0)
    3260:	0007d783          	lhu	a5,0(a5)
    3264:	07c2                	slli	a5,a5,0x10
    3266:	83c1                	srli	a5,a5,0x10
    3268:	0017e793          	ori	a5,a5,1
    326c:	01079713          	slli	a4,a5,0x10
    3270:	8341                	srli	a4,a4,0x10
    3272:	fec42783          	lw	a5,-20(s0)
    3276:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_PE_Reset;
    }
}
    327a:	a839                	j	3298 <I2C_Cmd+0x50>
        I2Cx->CTLR1 &= CTLR1_PE_Reset;
    327c:	fec42783          	lw	a5,-20(s0)
    3280:	0007d783          	lhu	a5,0(a5)
    3284:	07c2                	slli	a5,a5,0x10
    3286:	83c1                	srli	a5,a5,0x10
    3288:	9bf9                	andi	a5,a5,-2
    328a:	01079713          	slli	a4,a5,0x10
    328e:	8341                	srli	a4,a4,0x10
    3290:	fec42783          	lw	a5,-20(s0)
    3294:	00e79023          	sh	a4,0(a5)
}
    3298:	0001                	nop
    329a:	4472                	lw	s0,28(sp)
    329c:	6105                	addi	sp,sp,32
    329e:	8082                	ret

000032a0 <I2C_DMACmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_DMACmd(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    32a0:	1101                	addi	sp,sp,-32
    32a2:	ce22                	sw	s0,28(sp)
    32a4:	1000                	addi	s0,sp,32
    32a6:	fea42623          	sw	a0,-20(s0)
    32aa:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    32ae:	fe842783          	lw	a5,-24(s0)
    32b2:	c785                	beqz	a5,32da <I2C_DMACmd+0x3a>
    {
        I2Cx->CTLR2 |= CTLR2_DMAEN_Set;
    32b4:	fec42783          	lw	a5,-20(s0)
    32b8:	0047d783          	lhu	a5,4(a5)
    32bc:	01079713          	slli	a4,a5,0x10
    32c0:	8341                	srli	a4,a4,0x10
    32c2:	6785                	lui	a5,0x1
    32c4:	80078793          	addi	a5,a5,-2048 # 800 <__stack_size>
    32c8:	8fd9                	or	a5,a5,a4
    32ca:	01079713          	slli	a4,a5,0x10
    32ce:	8341                	srli	a4,a4,0x10
    32d0:	fec42783          	lw	a5,-20(s0)
    32d4:	00e79223          	sh	a4,4(a5)
    }
    else
    {
        I2Cx->CTLR2 &= CTLR2_DMAEN_Reset;
    }
}
    32d8:	a01d                	j	32fe <I2C_DMACmd+0x5e>
        I2Cx->CTLR2 &= CTLR2_DMAEN_Reset;
    32da:	fec42783          	lw	a5,-20(s0)
    32de:	0047d783          	lhu	a5,4(a5)
    32e2:	01079713          	slli	a4,a5,0x10
    32e6:	8341                	srli	a4,a4,0x10
    32e8:	77fd                	lui	a5,0xfffff
    32ea:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    32ee:	8ff9                	and	a5,a5,a4
    32f0:	01079713          	slli	a4,a5,0x10
    32f4:	8341                	srli	a4,a4,0x10
    32f6:	fec42783          	lw	a5,-20(s0)
    32fa:	00e79223          	sh	a4,4(a5)
}
    32fe:	0001                	nop
    3300:	4472                	lw	s0,28(sp)
    3302:	6105                	addi	sp,sp,32
    3304:	8082                	ret

00003306 <I2C_DMALastTransferCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_DMALastTransferCmd(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    3306:	1101                	addi	sp,sp,-32
    3308:	ce22                	sw	s0,28(sp)
    330a:	1000                	addi	s0,sp,32
    330c:	fea42623          	sw	a0,-20(s0)
    3310:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    3314:	fe842783          	lw	a5,-24(s0)
    3318:	c395                	beqz	a5,333c <I2C_DMALastTransferCmd+0x36>
    {
        I2Cx->CTLR2 |= CTLR2_LAST_Set;
    331a:	fec42783          	lw	a5,-20(s0)
    331e:	0047d783          	lhu	a5,4(a5)
    3322:	01079713          	slli	a4,a5,0x10
    3326:	8341                	srli	a4,a4,0x10
    3328:	6785                	lui	a5,0x1
    332a:	8fd9                	or	a5,a5,a4
    332c:	01079713          	slli	a4,a5,0x10
    3330:	8341                	srli	a4,a4,0x10
    3332:	fec42783          	lw	a5,-20(s0)
    3336:	00e79223          	sh	a4,4(a5) # 1004 <ADC_GetFlagStatus+0x36>
    }
    else
    {
        I2Cx->CTLR2 &= CTLR2_LAST_Reset;
    }
}
    333a:	a015                	j	335e <I2C_DMALastTransferCmd+0x58>
        I2Cx->CTLR2 &= CTLR2_LAST_Reset;
    333c:	fec42783          	lw	a5,-20(s0)
    3340:	0047d783          	lhu	a5,4(a5)
    3344:	01079713          	slli	a4,a5,0x10
    3348:	8341                	srli	a4,a4,0x10
    334a:	77fd                	lui	a5,0xfffff
    334c:	17fd                	addi	a5,a5,-1
    334e:	8ff9                	and	a5,a5,a4
    3350:	01079713          	slli	a4,a5,0x10
    3354:	8341                	srli	a4,a4,0x10
    3356:	fec42783          	lw	a5,-20(s0)
    335a:	00e79223          	sh	a4,4(a5) # fffff004 <_eusrstack+0xdfffb004>
}
    335e:	0001                	nop
    3360:	4472                	lw	s0,28(sp)
    3362:	6105                	addi	sp,sp,32
    3364:	8082                	ret

00003366 <I2C_GenerateSTART>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_GenerateSTART(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    3366:	1101                	addi	sp,sp,-32
    3368:	ce22                	sw	s0,28(sp)
    336a:	1000                	addi	s0,sp,32
    336c:	fea42623          	sw	a0,-20(s0)
    3370:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    3374:	fe842783          	lw	a5,-24(s0)
    3378:	c38d                	beqz	a5,339a <I2C_GenerateSTART+0x34>
    {
        I2Cx->CTLR1 |= CTLR1_START_Set;
    337a:	fec42783          	lw	a5,-20(s0)
    337e:	0007d783          	lhu	a5,0(a5)
    3382:	07c2                	slli	a5,a5,0x10
    3384:	83c1                	srli	a5,a5,0x10
    3386:	1007e793          	ori	a5,a5,256
    338a:	01079713          	slli	a4,a5,0x10
    338e:	8341                	srli	a4,a4,0x10
    3390:	fec42783          	lw	a5,-20(s0)
    3394:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_START_Reset;
    }
}
    3398:	a005                	j	33b8 <I2C_GenerateSTART+0x52>
        I2Cx->CTLR1 &= CTLR1_START_Reset;
    339a:	fec42783          	lw	a5,-20(s0)
    339e:	0007d783          	lhu	a5,0(a5)
    33a2:	07c2                	slli	a5,a5,0x10
    33a4:	83c1                	srli	a5,a5,0x10
    33a6:	eff7f793          	andi	a5,a5,-257
    33aa:	01079713          	slli	a4,a5,0x10
    33ae:	8341                	srli	a4,a4,0x10
    33b0:	fec42783          	lw	a5,-20(s0)
    33b4:	00e79023          	sh	a4,0(a5)
}
    33b8:	0001                	nop
    33ba:	4472                	lw	s0,28(sp)
    33bc:	6105                	addi	sp,sp,32
    33be:	8082                	ret

000033c0 <I2C_GenerateSTOP>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_GenerateSTOP(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    33c0:	1101                	addi	sp,sp,-32
    33c2:	ce22                	sw	s0,28(sp)
    33c4:	1000                	addi	s0,sp,32
    33c6:	fea42623          	sw	a0,-20(s0)
    33ca:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    33ce:	fe842783          	lw	a5,-24(s0)
    33d2:	c38d                	beqz	a5,33f4 <I2C_GenerateSTOP+0x34>
    {
        I2Cx->CTLR1 |= CTLR1_STOP_Set;
    33d4:	fec42783          	lw	a5,-20(s0)
    33d8:	0007d783          	lhu	a5,0(a5)
    33dc:	07c2                	slli	a5,a5,0x10
    33de:	83c1                	srli	a5,a5,0x10
    33e0:	2007e793          	ori	a5,a5,512
    33e4:	01079713          	slli	a4,a5,0x10
    33e8:	8341                	srli	a4,a4,0x10
    33ea:	fec42783          	lw	a5,-20(s0)
    33ee:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_STOP_Reset;
    }
}
    33f2:	a005                	j	3412 <I2C_GenerateSTOP+0x52>
        I2Cx->CTLR1 &= CTLR1_STOP_Reset;
    33f4:	fec42783          	lw	a5,-20(s0)
    33f8:	0007d783          	lhu	a5,0(a5)
    33fc:	07c2                	slli	a5,a5,0x10
    33fe:	83c1                	srli	a5,a5,0x10
    3400:	dff7f793          	andi	a5,a5,-513
    3404:	01079713          	slli	a4,a5,0x10
    3408:	8341                	srli	a4,a4,0x10
    340a:	fec42783          	lw	a5,-20(s0)
    340e:	00e79023          	sh	a4,0(a5)
}
    3412:	0001                	nop
    3414:	4472                	lw	s0,28(sp)
    3416:	6105                	addi	sp,sp,32
    3418:	8082                	ret

0000341a <I2C_AcknowledgeConfig>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_AcknowledgeConfig(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    341a:	1101                	addi	sp,sp,-32
    341c:	ce22                	sw	s0,28(sp)
    341e:	1000                	addi	s0,sp,32
    3420:	fea42623          	sw	a0,-20(s0)
    3424:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    3428:	fe842783          	lw	a5,-24(s0)
    342c:	c38d                	beqz	a5,344e <I2C_AcknowledgeConfig+0x34>
    {
        I2Cx->CTLR1 |= CTLR1_ACK_Set;
    342e:	fec42783          	lw	a5,-20(s0)
    3432:	0007d783          	lhu	a5,0(a5)
    3436:	07c2                	slli	a5,a5,0x10
    3438:	83c1                	srli	a5,a5,0x10
    343a:	4007e793          	ori	a5,a5,1024
    343e:	01079713          	slli	a4,a5,0x10
    3442:	8341                	srli	a4,a4,0x10
    3444:	fec42783          	lw	a5,-20(s0)
    3448:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_ACK_Reset;
    }
}
    344c:	a005                	j	346c <I2C_AcknowledgeConfig+0x52>
        I2Cx->CTLR1 &= CTLR1_ACK_Reset;
    344e:	fec42783          	lw	a5,-20(s0)
    3452:	0007d783          	lhu	a5,0(a5)
    3456:	07c2                	slli	a5,a5,0x10
    3458:	83c1                	srli	a5,a5,0x10
    345a:	bff7f793          	andi	a5,a5,-1025
    345e:	01079713          	slli	a4,a5,0x10
    3462:	8341                	srli	a4,a4,0x10
    3464:	fec42783          	lw	a5,-20(s0)
    3468:	00e79023          	sh	a4,0(a5)
}
    346c:	0001                	nop
    346e:	4472                	lw	s0,28(sp)
    3470:	6105                	addi	sp,sp,32
    3472:	8082                	ret

00003474 <I2C_OwnAddress2Config>:
 *          Address - specifies the 7bit I2C own address2.
 *
 * @return  none
 */
void I2C_OwnAddress2Config(I2C_TypeDef *I2Cx, uint8_t Address)
{
    3474:	7179                	addi	sp,sp,-48
    3476:	d622                	sw	s0,44(sp)
    3478:	1800                	addi	s0,sp,48
    347a:	fca42e23          	sw	a0,-36(s0)
    347e:	87ae                	mv	a5,a1
    3480:	fcf40da3          	sb	a5,-37(s0)
    uint16_t tmpreg = 0;
    3484:	fe041723          	sh	zero,-18(s0)

    tmpreg = I2Cx->OADDR2;
    3488:	fdc42783          	lw	a5,-36(s0)
    348c:	00c7d783          	lhu	a5,12(a5)
    3490:	fef41723          	sh	a5,-18(s0)
    tmpreg &= OADDR2_ADD2_Reset;
    3494:	fee45783          	lhu	a5,-18(s0)
    3498:	f017f793          	andi	a5,a5,-255
    349c:	fef41723          	sh	a5,-18(s0)
    tmpreg |= (uint16_t)((uint16_t)Address & (uint16_t)0x00FE);
    34a0:	fdb44783          	lbu	a5,-37(s0)
    34a4:	07c2                	slli	a5,a5,0x10
    34a6:	87c1                	srai	a5,a5,0x10
    34a8:	0fe7f793          	andi	a5,a5,254
    34ac:	01079713          	slli	a4,a5,0x10
    34b0:	8741                	srai	a4,a4,0x10
    34b2:	fee41783          	lh	a5,-18(s0)
    34b6:	8fd9                	or	a5,a5,a4
    34b8:	07c2                	slli	a5,a5,0x10
    34ba:	87c1                	srai	a5,a5,0x10
    34bc:	fef41723          	sh	a5,-18(s0)
    I2Cx->OADDR2 = tmpreg;
    34c0:	fdc42783          	lw	a5,-36(s0)
    34c4:	fee45703          	lhu	a4,-18(s0)
    34c8:	00e79623          	sh	a4,12(a5)
}
    34cc:	0001                	nop
    34ce:	5432                	lw	s0,44(sp)
    34d0:	6145                	addi	sp,sp,48
    34d2:	8082                	ret

000034d4 <I2C_DualAddressCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_DualAddressCmd(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    34d4:	1101                	addi	sp,sp,-32
    34d6:	ce22                	sw	s0,28(sp)
    34d8:	1000                	addi	s0,sp,32
    34da:	fea42623          	sw	a0,-20(s0)
    34de:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    34e2:	fe842783          	lw	a5,-24(s0)
    34e6:	c38d                	beqz	a5,3508 <I2C_DualAddressCmd+0x34>
    {
        I2Cx->OADDR2 |= OADDR2_ENDUAL_Set;
    34e8:	fec42783          	lw	a5,-20(s0)
    34ec:	00c7d783          	lhu	a5,12(a5)
    34f0:	07c2                	slli	a5,a5,0x10
    34f2:	83c1                	srli	a5,a5,0x10
    34f4:	0017e793          	ori	a5,a5,1
    34f8:	01079713          	slli	a4,a5,0x10
    34fc:	8341                	srli	a4,a4,0x10
    34fe:	fec42783          	lw	a5,-20(s0)
    3502:	00e79623          	sh	a4,12(a5)
    }
    else
    {
        I2Cx->OADDR2 &= OADDR2_ENDUAL_Reset;
    }
}
    3506:	a839                	j	3524 <I2C_DualAddressCmd+0x50>
        I2Cx->OADDR2 &= OADDR2_ENDUAL_Reset;
    3508:	fec42783          	lw	a5,-20(s0)
    350c:	00c7d783          	lhu	a5,12(a5)
    3510:	07c2                	slli	a5,a5,0x10
    3512:	83c1                	srli	a5,a5,0x10
    3514:	9bf9                	andi	a5,a5,-2
    3516:	01079713          	slli	a4,a5,0x10
    351a:	8341                	srli	a4,a4,0x10
    351c:	fec42783          	lw	a5,-20(s0)
    3520:	00e79623          	sh	a4,12(a5)
}
    3524:	0001                	nop
    3526:	4472                	lw	s0,28(sp)
    3528:	6105                	addi	sp,sp,32
    352a:	8082                	ret

0000352c <I2C_GeneralCallCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_GeneralCallCmd(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    352c:	1101                	addi	sp,sp,-32
    352e:	ce22                	sw	s0,28(sp)
    3530:	1000                	addi	s0,sp,32
    3532:	fea42623          	sw	a0,-20(s0)
    3536:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    353a:	fe842783          	lw	a5,-24(s0)
    353e:	c38d                	beqz	a5,3560 <I2C_GeneralCallCmd+0x34>
    {
        I2Cx->CTLR1 |= CTLR1_ENGC_Set;
    3540:	fec42783          	lw	a5,-20(s0)
    3544:	0007d783          	lhu	a5,0(a5)
    3548:	07c2                	slli	a5,a5,0x10
    354a:	83c1                	srli	a5,a5,0x10
    354c:	0407e793          	ori	a5,a5,64
    3550:	01079713          	slli	a4,a5,0x10
    3554:	8341                	srli	a4,a4,0x10
    3556:	fec42783          	lw	a5,-20(s0)
    355a:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_ENGC_Reset;
    }
}
    355e:	a005                	j	357e <I2C_GeneralCallCmd+0x52>
        I2Cx->CTLR1 &= CTLR1_ENGC_Reset;
    3560:	fec42783          	lw	a5,-20(s0)
    3564:	0007d783          	lhu	a5,0(a5)
    3568:	07c2                	slli	a5,a5,0x10
    356a:	83c1                	srli	a5,a5,0x10
    356c:	fbf7f793          	andi	a5,a5,-65
    3570:	01079713          	slli	a4,a5,0x10
    3574:	8341                	srli	a4,a4,0x10
    3576:	fec42783          	lw	a5,-20(s0)
    357a:	00e79023          	sh	a4,0(a5)
}
    357e:	0001                	nop
    3580:	4472                	lw	s0,28(sp)
    3582:	6105                	addi	sp,sp,32
    3584:	8082                	ret

00003586 <I2C_ITConfig>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_ITConfig(I2C_TypeDef *I2Cx, uint16_t I2C_IT, FunctionalState NewState)
{
    3586:	1101                	addi	sp,sp,-32
    3588:	ce22                	sw	s0,28(sp)
    358a:	1000                	addi	s0,sp,32
    358c:	fea42623          	sw	a0,-20(s0)
    3590:	87ae                	mv	a5,a1
    3592:	fec42223          	sw	a2,-28(s0)
    3596:	fef41523          	sh	a5,-22(s0)
    if(NewState != DISABLE)
    359a:	fe442783          	lw	a5,-28(s0)
    359e:	c39d                	beqz	a5,35c4 <I2C_ITConfig+0x3e>
    {
        I2Cx->CTLR2 |= I2C_IT;
    35a0:	fec42783          	lw	a5,-20(s0)
    35a4:	0047d783          	lhu	a5,4(a5)
    35a8:	01079713          	slli	a4,a5,0x10
    35ac:	8341                	srli	a4,a4,0x10
    35ae:	fea45783          	lhu	a5,-22(s0)
    35b2:	8fd9                	or	a5,a5,a4
    35b4:	01079713          	slli	a4,a5,0x10
    35b8:	8341                	srli	a4,a4,0x10
    35ba:	fec42783          	lw	a5,-20(s0)
    35be:	00e79223          	sh	a4,4(a5)
    }
    else
    {
        I2Cx->CTLR2 &= (uint16_t)~I2C_IT;
    }
}
    35c2:	a035                	j	35ee <I2C_ITConfig+0x68>
        I2Cx->CTLR2 &= (uint16_t)~I2C_IT;
    35c4:	fec42783          	lw	a5,-20(s0)
    35c8:	0047d783          	lhu	a5,4(a5)
    35cc:	01079713          	slli	a4,a5,0x10
    35d0:	8341                	srli	a4,a4,0x10
    35d2:	fea45783          	lhu	a5,-22(s0)
    35d6:	fff7c793          	not	a5,a5
    35da:	07c2                	slli	a5,a5,0x10
    35dc:	83c1                	srli	a5,a5,0x10
    35de:	8ff9                	and	a5,a5,a4
    35e0:	01079713          	slli	a4,a5,0x10
    35e4:	8341                	srli	a4,a4,0x10
    35e6:	fec42783          	lw	a5,-20(s0)
    35ea:	00e79223          	sh	a4,4(a5)
}
    35ee:	0001                	nop
    35f0:	4472                	lw	s0,28(sp)
    35f2:	6105                	addi	sp,sp,32
    35f4:	8082                	ret

000035f6 <I2C_SendData>:
 *          Data - Byte to be transmitted.
 *
 * @return  none
 */
void I2C_SendData(I2C_TypeDef *I2Cx, uint8_t Data)
{
    35f6:	1101                	addi	sp,sp,-32
    35f8:	ce22                	sw	s0,28(sp)
    35fa:	1000                	addi	s0,sp,32
    35fc:	fea42623          	sw	a0,-20(s0)
    3600:	87ae                	mv	a5,a1
    3602:	fef405a3          	sb	a5,-21(s0)
    I2Cx->DATAR = Data;
    3606:	feb44783          	lbu	a5,-21(s0)
    360a:	01079713          	slli	a4,a5,0x10
    360e:	8341                	srli	a4,a4,0x10
    3610:	fec42783          	lw	a5,-20(s0)
    3614:	00e79823          	sh	a4,16(a5)
}
    3618:	0001                	nop
    361a:	4472                	lw	s0,28(sp)
    361c:	6105                	addi	sp,sp,32
    361e:	8082                	ret

00003620 <I2C_ReceiveData>:
 * @param   I2Cx - where x can be 1 to select the I2C peripheral.
 *
 * @return  The value of the received data.
 */
uint8_t I2C_ReceiveData(I2C_TypeDef *I2Cx)
{
    3620:	1101                	addi	sp,sp,-32
    3622:	ce22                	sw	s0,28(sp)
    3624:	1000                	addi	s0,sp,32
    3626:	fea42623          	sw	a0,-20(s0)
    return (uint8_t)I2Cx->DATAR;
    362a:	fec42783          	lw	a5,-20(s0)
    362e:	0107d783          	lhu	a5,16(a5)
    3632:	07c2                	slli	a5,a5,0x10
    3634:	83c1                	srli	a5,a5,0x10
    3636:	0ff7f793          	andi	a5,a5,255
}
    363a:	853e                	mv	a0,a5
    363c:	4472                	lw	s0,28(sp)
    363e:	6105                	addi	sp,sp,32
    3640:	8082                	ret

00003642 <I2C_Send7bitAddress>:
 *            I2C_Direction_Receiver - Receiver mode.
 *
 * @return  none
 */
void I2C_Send7bitAddress(I2C_TypeDef *I2Cx, uint8_t Address, uint8_t I2C_Direction)
{
    3642:	1101                	addi	sp,sp,-32
    3644:	ce22                	sw	s0,28(sp)
    3646:	1000                	addi	s0,sp,32
    3648:	fea42623          	sw	a0,-20(s0)
    364c:	87ae                	mv	a5,a1
    364e:	8732                	mv	a4,a2
    3650:	fef405a3          	sb	a5,-21(s0)
    3654:	87ba                	mv	a5,a4
    3656:	fef40523          	sb	a5,-22(s0)
    if(I2C_Direction != I2C_Direction_Transmitter)
    365a:	fea44783          	lbu	a5,-22(s0)
    365e:	cb81                	beqz	a5,366e <I2C_Send7bitAddress+0x2c>
    {
        Address |= OADDR1_ADD0_Set;
    3660:	feb44783          	lbu	a5,-21(s0)
    3664:	0017e793          	ori	a5,a5,1
    3668:	fef405a3          	sb	a5,-21(s0)
    366c:	a031                	j	3678 <I2C_Send7bitAddress+0x36>
    }
    else
    {
        Address &= OADDR1_ADD0_Reset;
    366e:	feb44783          	lbu	a5,-21(s0)
    3672:	9bf9                	andi	a5,a5,-2
    3674:	fef405a3          	sb	a5,-21(s0)
    }

    I2Cx->DATAR = Address;
    3678:	feb44783          	lbu	a5,-21(s0)
    367c:	01079713          	slli	a4,a5,0x10
    3680:	8341                	srli	a4,a4,0x10
    3682:	fec42783          	lw	a5,-20(s0)
    3686:	00e79823          	sh	a4,16(a5)
}
    368a:	0001                	nop
    368c:	4472                	lw	s0,28(sp)
    368e:	6105                	addi	sp,sp,32
    3690:	8082                	ret

00003692 <I2C_ReadRegister>:
 *            I2C_Register_RTR.
 *
 * @return  none
 */
uint16_t I2C_ReadRegister(I2C_TypeDef *I2Cx, uint8_t I2C_Register)
{
    3692:	7179                	addi	sp,sp,-48
    3694:	d622                	sw	s0,44(sp)
    3696:	1800                	addi	s0,sp,48
    3698:	fca42e23          	sw	a0,-36(s0)
    369c:	87ae                	mv	a5,a1
    369e:	fcf40da3          	sb	a5,-37(s0)
    __IO uint32_t tmp = 0;
    36a2:	fe042623          	sw	zero,-20(s0)

    tmp = (uint32_t)I2Cx;
    36a6:	fdc42783          	lw	a5,-36(s0)
    36aa:	fef42623          	sw	a5,-20(s0)
    tmp += I2C_Register;
    36ae:	fdb44703          	lbu	a4,-37(s0)
    36b2:	fec42783          	lw	a5,-20(s0)
    36b6:	97ba                	add	a5,a5,a4
    36b8:	fef42623          	sw	a5,-20(s0)

    return (*(__IO uint16_t *)tmp);
    36bc:	fec42783          	lw	a5,-20(s0)
    36c0:	0007d783          	lhu	a5,0(a5)
    36c4:	07c2                	slli	a5,a5,0x10
    36c6:	83c1                	srli	a5,a5,0x10
}
    36c8:	853e                	mv	a0,a5
    36ca:	5432                	lw	s0,44(sp)
    36cc:	6145                	addi	sp,sp,48
    36ce:	8082                	ret

000036d0 <I2C_SoftwareResetCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_SoftwareResetCmd(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    36d0:	1101                	addi	sp,sp,-32
    36d2:	ce22                	sw	s0,28(sp)
    36d4:	1000                	addi	s0,sp,32
    36d6:	fea42623          	sw	a0,-20(s0)
    36da:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    36de:	fe842783          	lw	a5,-24(s0)
    36e2:	c395                	beqz	a5,3706 <I2C_SoftwareResetCmd+0x36>
    {
        I2Cx->CTLR1 |= CTLR1_SWRST_Set;
    36e4:	fec42783          	lw	a5,-20(s0)
    36e8:	0007d783          	lhu	a5,0(a5)
    36ec:	01079713          	slli	a4,a5,0x10
    36f0:	8341                	srli	a4,a4,0x10
    36f2:	77e1                	lui	a5,0xffff8
    36f4:	8fd9                	or	a5,a5,a4
    36f6:	01079713          	slli	a4,a5,0x10
    36fa:	8341                	srli	a4,a4,0x10
    36fc:	fec42783          	lw	a5,-20(s0)
    3700:	00e79023          	sh	a4,0(a5) # ffff8000 <_eusrstack+0xdfff4000>
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_SWRST_Reset;
    }
}
    3704:	a015                	j	3728 <I2C_SoftwareResetCmd+0x58>
        I2Cx->CTLR1 &= CTLR1_SWRST_Reset;
    3706:	fec42783          	lw	a5,-20(s0)
    370a:	0007d783          	lhu	a5,0(a5)
    370e:	01079713          	slli	a4,a5,0x10
    3712:	8341                	srli	a4,a4,0x10
    3714:	67a1                	lui	a5,0x8
    3716:	17fd                	addi	a5,a5,-1
    3718:	8ff9                	and	a5,a5,a4
    371a:	01079713          	slli	a4,a5,0x10
    371e:	8341                	srli	a4,a4,0x10
    3720:	fec42783          	lw	a5,-20(s0)
    3724:	00e79023          	sh	a4,0(a5) # 8000 <USART_StructInit+0x1a>
}
    3728:	0001                	nop
    372a:	4472                	lw	s0,28(sp)
    372c:	6105                	addi	sp,sp,32
    372e:	8082                	ret

00003730 <I2C_NACKPositionConfig>:
 *          but is intended to be used in I2C mode while I2C_PECPositionConfig() 
 *          is intended to used in SMBUS mode. 
 * @return  none
 */
void I2C_NACKPositionConfig(I2C_TypeDef *I2Cx, uint16_t I2C_NACKPosition)
{
    3730:	1101                	addi	sp,sp,-32
    3732:	ce22                	sw	s0,28(sp)
    3734:	1000                	addi	s0,sp,32
    3736:	fea42623          	sw	a0,-20(s0)
    373a:	87ae                	mv	a5,a1
    373c:	fef41523          	sh	a5,-22(s0)
    if(I2C_NACKPosition == I2C_NACKPosition_Next)
    3740:	fea45783          	lhu	a5,-22(s0)
    3744:	80078793          	addi	a5,a5,-2048
    3748:	e785                	bnez	a5,3770 <I2C_NACKPositionConfig+0x40>
    {
        I2Cx->CTLR1 |= I2C_NACKPosition_Next;
    374a:	fec42783          	lw	a5,-20(s0)
    374e:	0007d783          	lhu	a5,0(a5)
    3752:	01079713          	slli	a4,a5,0x10
    3756:	8341                	srli	a4,a4,0x10
    3758:	6785                	lui	a5,0x1
    375a:	80078793          	addi	a5,a5,-2048 # 800 <__stack_size>
    375e:	8fd9                	or	a5,a5,a4
    3760:	01079713          	slli	a4,a5,0x10
    3764:	8341                	srli	a4,a4,0x10
    3766:	fec42783          	lw	a5,-20(s0)
    376a:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= I2C_NACKPosition_Current;
    }
}
    376e:	a01d                	j	3794 <I2C_NACKPositionConfig+0x64>
        I2Cx->CTLR1 &= I2C_NACKPosition_Current;
    3770:	fec42783          	lw	a5,-20(s0)
    3774:	0007d783          	lhu	a5,0(a5)
    3778:	01079713          	slli	a4,a5,0x10
    377c:	8341                	srli	a4,a4,0x10
    377e:	77fd                	lui	a5,0xfffff
    3780:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    3784:	8ff9                	and	a5,a5,a4
    3786:	01079713          	slli	a4,a5,0x10
    378a:	8341                	srli	a4,a4,0x10
    378c:	fec42783          	lw	a5,-20(s0)
    3790:	00e79023          	sh	a4,0(a5)
}
    3794:	0001                	nop
    3796:	4472                	lw	s0,28(sp)
    3798:	6105                	addi	sp,sp,32
    379a:	8082                	ret

0000379c <I2C_TransmitPEC>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_TransmitPEC(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    379c:	1101                	addi	sp,sp,-32
    379e:	ce22                	sw	s0,28(sp)
    37a0:	1000                	addi	s0,sp,32
    37a2:	fea42623          	sw	a0,-20(s0)
    37a6:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    37aa:	fe842783          	lw	a5,-24(s0)
    37ae:	c395                	beqz	a5,37d2 <I2C_TransmitPEC+0x36>
    {
        I2Cx->CTLR1 |= CTLR1_PEC_Set;
    37b0:	fec42783          	lw	a5,-20(s0)
    37b4:	0007d783          	lhu	a5,0(a5)
    37b8:	01079713          	slli	a4,a5,0x10
    37bc:	8341                	srli	a4,a4,0x10
    37be:	6785                	lui	a5,0x1
    37c0:	8fd9                	or	a5,a5,a4
    37c2:	01079713          	slli	a4,a5,0x10
    37c6:	8341                	srli	a4,a4,0x10
    37c8:	fec42783          	lw	a5,-20(s0)
    37cc:	00e79023          	sh	a4,0(a5) # 1000 <ADC_GetFlagStatus+0x32>
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_PEC_Reset;
    }
}
    37d0:	a015                	j	37f4 <I2C_TransmitPEC+0x58>
        I2Cx->CTLR1 &= CTLR1_PEC_Reset;
    37d2:	fec42783          	lw	a5,-20(s0)
    37d6:	0007d783          	lhu	a5,0(a5)
    37da:	01079713          	slli	a4,a5,0x10
    37de:	8341                	srli	a4,a4,0x10
    37e0:	77fd                	lui	a5,0xfffff
    37e2:	17fd                	addi	a5,a5,-1
    37e4:	8ff9                	and	a5,a5,a4
    37e6:	01079713          	slli	a4,a5,0x10
    37ea:	8341                	srli	a4,a4,0x10
    37ec:	fec42783          	lw	a5,-20(s0)
    37f0:	00e79023          	sh	a4,0(a5) # fffff000 <_eusrstack+0xdfffb000>
}
    37f4:	0001                	nop
    37f6:	4472                	lw	s0,28(sp)
    37f8:	6105                	addi	sp,sp,32
    37fa:	8082                	ret

000037fc <I2C_PECPositionConfig>:
 *            I2C_PECPosition_Current - indicates that current byte is PEC.
 *
 * @return  none
 */
void I2C_PECPositionConfig(I2C_TypeDef *I2Cx, uint16_t I2C_PECPosition)
{
    37fc:	1101                	addi	sp,sp,-32
    37fe:	ce22                	sw	s0,28(sp)
    3800:	1000                	addi	s0,sp,32
    3802:	fea42623          	sw	a0,-20(s0)
    3806:	87ae                	mv	a5,a1
    3808:	fef41523          	sh	a5,-22(s0)
    if(I2C_PECPosition == I2C_PECPosition_Next)
    380c:	fea45783          	lhu	a5,-22(s0)
    3810:	80078793          	addi	a5,a5,-2048
    3814:	e785                	bnez	a5,383c <I2C_PECPositionConfig+0x40>
    {
        I2Cx->CTLR1 |= I2C_PECPosition_Next;
    3816:	fec42783          	lw	a5,-20(s0)
    381a:	0007d783          	lhu	a5,0(a5)
    381e:	01079713          	slli	a4,a5,0x10
    3822:	8341                	srli	a4,a4,0x10
    3824:	6785                	lui	a5,0x1
    3826:	80078793          	addi	a5,a5,-2048 # 800 <__stack_size>
    382a:	8fd9                	or	a5,a5,a4
    382c:	01079713          	slli	a4,a5,0x10
    3830:	8341                	srli	a4,a4,0x10
    3832:	fec42783          	lw	a5,-20(s0)
    3836:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= I2C_PECPosition_Current;
    }
}
    383a:	a01d                	j	3860 <I2C_PECPositionConfig+0x64>
        I2Cx->CTLR1 &= I2C_PECPosition_Current;
    383c:	fec42783          	lw	a5,-20(s0)
    3840:	0007d783          	lhu	a5,0(a5)
    3844:	01079713          	slli	a4,a5,0x10
    3848:	8341                	srli	a4,a4,0x10
    384a:	77fd                	lui	a5,0xfffff
    384c:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    3850:	8ff9                	and	a5,a5,a4
    3852:	01079713          	slli	a4,a5,0x10
    3856:	8341                	srli	a4,a4,0x10
    3858:	fec42783          	lw	a5,-20(s0)
    385c:	00e79023          	sh	a4,0(a5)
}
    3860:	0001                	nop
    3862:	4472                	lw	s0,28(sp)
    3864:	6105                	addi	sp,sp,32
    3866:	8082                	ret

00003868 <I2C_CalculatePEC>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_CalculatePEC(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    3868:	1101                	addi	sp,sp,-32
    386a:	ce22                	sw	s0,28(sp)
    386c:	1000                	addi	s0,sp,32
    386e:	fea42623          	sw	a0,-20(s0)
    3872:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    3876:	fe842783          	lw	a5,-24(s0)
    387a:	c38d                	beqz	a5,389c <I2C_CalculatePEC+0x34>
    {
        I2Cx->CTLR1 |= CTLR1_ENPEC_Set;
    387c:	fec42783          	lw	a5,-20(s0)
    3880:	0007d783          	lhu	a5,0(a5)
    3884:	07c2                	slli	a5,a5,0x10
    3886:	83c1                	srli	a5,a5,0x10
    3888:	0207e793          	ori	a5,a5,32
    388c:	01079713          	slli	a4,a5,0x10
    3890:	8341                	srli	a4,a4,0x10
    3892:	fec42783          	lw	a5,-20(s0)
    3896:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_ENPEC_Reset;
    }
}
    389a:	a005                	j	38ba <I2C_CalculatePEC+0x52>
        I2Cx->CTLR1 &= CTLR1_ENPEC_Reset;
    389c:	fec42783          	lw	a5,-20(s0)
    38a0:	0007d783          	lhu	a5,0(a5)
    38a4:	07c2                	slli	a5,a5,0x10
    38a6:	83c1                	srli	a5,a5,0x10
    38a8:	fdf7f793          	andi	a5,a5,-33
    38ac:	01079713          	slli	a4,a5,0x10
    38b0:	8341                	srli	a4,a4,0x10
    38b2:	fec42783          	lw	a5,-20(s0)
    38b6:	00e79023          	sh	a4,0(a5)
}
    38ba:	0001                	nop
    38bc:	4472                	lw	s0,28(sp)
    38be:	6105                	addi	sp,sp,32
    38c0:	8082                	ret

000038c2 <I2C_GetPEC>:
 * @param   I2Cx - where x can be 1 to select the I2C peripheral.
 *
 * @return  The PEC value.
 */
uint8_t I2C_GetPEC(I2C_TypeDef *I2Cx)
{
    38c2:	1101                	addi	sp,sp,-32
    38c4:	ce22                	sw	s0,28(sp)
    38c6:	1000                	addi	s0,sp,32
    38c8:	fea42623          	sw	a0,-20(s0)
    return ((I2Cx->STAR2) >> 8);
    38cc:	fec42783          	lw	a5,-20(s0)
    38d0:	0187d783          	lhu	a5,24(a5)
    38d4:	07c2                	slli	a5,a5,0x10
    38d6:	83c1                	srli	a5,a5,0x10
    38d8:	83a1                	srli	a5,a5,0x8
    38da:	07c2                	slli	a5,a5,0x10
    38dc:	83c1                	srli	a5,a5,0x10
    38de:	0ff7f793          	andi	a5,a5,255
}
    38e2:	853e                	mv	a0,a5
    38e4:	4472                	lw	s0,28(sp)
    38e6:	6105                	addi	sp,sp,32
    38e8:	8082                	ret

000038ea <I2C_ARPCmd>:
 *            NewState - ENABLE or DISABLE.
 *
 * @return  The PEC value.
 */
void I2C_ARPCmd(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    38ea:	1101                	addi	sp,sp,-32
    38ec:	ce22                	sw	s0,28(sp)
    38ee:	1000                	addi	s0,sp,32
    38f0:	fea42623          	sw	a0,-20(s0)
    38f4:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    38f8:	fe842783          	lw	a5,-24(s0)
    38fc:	c38d                	beqz	a5,391e <I2C_ARPCmd+0x34>
    {
        I2Cx->CTLR1 |= CTLR1_ENARP_Set;
    38fe:	fec42783          	lw	a5,-20(s0)
    3902:	0007d783          	lhu	a5,0(a5)
    3906:	07c2                	slli	a5,a5,0x10
    3908:	83c1                	srli	a5,a5,0x10
    390a:	0107e793          	ori	a5,a5,16
    390e:	01079713          	slli	a4,a5,0x10
    3912:	8341                	srli	a4,a4,0x10
    3914:	fec42783          	lw	a5,-20(s0)
    3918:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_ENARP_Reset;
    }
}
    391c:	a839                	j	393a <I2C_ARPCmd+0x50>
        I2Cx->CTLR1 &= CTLR1_ENARP_Reset;
    391e:	fec42783          	lw	a5,-20(s0)
    3922:	0007d783          	lhu	a5,0(a5)
    3926:	07c2                	slli	a5,a5,0x10
    3928:	83c1                	srli	a5,a5,0x10
    392a:	9bbd                	andi	a5,a5,-17
    392c:	01079713          	slli	a4,a5,0x10
    3930:	8341                	srli	a4,a4,0x10
    3932:	fec42783          	lw	a5,-20(s0)
    3936:	00e79023          	sh	a4,0(a5)
}
    393a:	0001                	nop
    393c:	4472                	lw	s0,28(sp)
    393e:	6105                	addi	sp,sp,32
    3940:	8082                	ret

00003942 <I2C_StretchClockCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void I2C_StretchClockCmd(I2C_TypeDef *I2Cx, FunctionalState NewState)
{
    3942:	1101                	addi	sp,sp,-32
    3944:	ce22                	sw	s0,28(sp)
    3946:	1000                	addi	s0,sp,32
    3948:	fea42623          	sw	a0,-20(s0)
    394c:	feb42423          	sw	a1,-24(s0)
    if(NewState == DISABLE)
    3950:	fe842783          	lw	a5,-24(s0)
    3954:	e38d                	bnez	a5,3976 <I2C_StretchClockCmd+0x34>
    {
        I2Cx->CTLR1 |= CTLR1_NOSTRETCH_Set;
    3956:	fec42783          	lw	a5,-20(s0)
    395a:	0007d783          	lhu	a5,0(a5)
    395e:	07c2                	slli	a5,a5,0x10
    3960:	83c1                	srli	a5,a5,0x10
    3962:	0807e793          	ori	a5,a5,128
    3966:	01079713          	slli	a4,a5,0x10
    396a:	8341                	srli	a4,a4,0x10
    396c:	fec42783          	lw	a5,-20(s0)
    3970:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        I2Cx->CTLR1 &= CTLR1_NOSTRETCH_Reset;
    }
}
    3974:	a005                	j	3994 <I2C_StretchClockCmd+0x52>
        I2Cx->CTLR1 &= CTLR1_NOSTRETCH_Reset;
    3976:	fec42783          	lw	a5,-20(s0)
    397a:	0007d783          	lhu	a5,0(a5)
    397e:	07c2                	slli	a5,a5,0x10
    3980:	83c1                	srli	a5,a5,0x10
    3982:	f7f7f793          	andi	a5,a5,-129
    3986:	01079713          	slli	a4,a5,0x10
    398a:	8341                	srli	a4,a4,0x10
    398c:	fec42783          	lw	a5,-20(s0)
    3990:	00e79023          	sh	a4,0(a5)
}
    3994:	0001                	nop
    3996:	4472                	lw	s0,28(sp)
    3998:	6105                	addi	sp,sp,32
    399a:	8082                	ret

0000399c <I2C_FastModeDutyCycleConfig>:
 *            I2C_DutyCycle_16_9 - I2C fast mode Tlow/Thigh = 16/9.
 *
 * @return  none
 */
void I2C_FastModeDutyCycleConfig(I2C_TypeDef *I2Cx, uint16_t I2C_DutyCycle)
{
    399c:	1101                	addi	sp,sp,-32
    399e:	ce22                	sw	s0,28(sp)
    39a0:	1000                	addi	s0,sp,32
    39a2:	fea42623          	sw	a0,-20(s0)
    39a6:	87ae                	mv	a5,a1
    39a8:	fef41523          	sh	a5,-22(s0)
    if(I2C_DutyCycle != I2C_DutyCycle_16_9)
    39ac:	fea45703          	lhu	a4,-22(s0)
    39b0:	6791                	lui	a5,0x4
    39b2:	02f70463          	beq	a4,a5,39da <I2C_FastModeDutyCycleConfig+0x3e>
    {
        I2Cx->CKCFGR &= I2C_DutyCycle_2;
    39b6:	fec42783          	lw	a5,-20(s0)
    39ba:	01c7d783          	lhu	a5,28(a5) # 401c <NVIC_Init+0x2cc>
    39be:	01079713          	slli	a4,a5,0x10
    39c2:	8341                	srli	a4,a4,0x10
    39c4:	77f1                	lui	a5,0xffffc
    39c6:	17fd                	addi	a5,a5,-1
    39c8:	8ff9                	and	a5,a5,a4
    39ca:	01079713          	slli	a4,a5,0x10
    39ce:	8341                	srli	a4,a4,0x10
    39d0:	fec42783          	lw	a5,-20(s0)
    39d4:	00e79e23          	sh	a4,28(a5) # ffffc01c <_eusrstack+0xdfff801c>
    }
    else
    {
        I2Cx->CKCFGR |= I2C_DutyCycle_16_9;
    }
}
    39d8:	a00d                	j	39fa <I2C_FastModeDutyCycleConfig+0x5e>
        I2Cx->CKCFGR |= I2C_DutyCycle_16_9;
    39da:	fec42783          	lw	a5,-20(s0)
    39de:	01c7d783          	lhu	a5,28(a5)
    39e2:	01079713          	slli	a4,a5,0x10
    39e6:	8341                	srli	a4,a4,0x10
    39e8:	6791                	lui	a5,0x4
    39ea:	8fd9                	or	a5,a5,a4
    39ec:	01079713          	slli	a4,a5,0x10
    39f0:	8341                	srli	a4,a4,0x10
    39f2:	fec42783          	lw	a5,-20(s0)
    39f6:	00e79e23          	sh	a4,28(a5) # 401c <NVIC_Init+0x2cc>
}
    39fa:	0001                	nop
    39fc:	4472                	lw	s0,28(sp)
    39fe:	6105                	addi	sp,sp,32
    3a00:	8082                	ret

00003a02 <I2C_CheckEvent>:
 *             I2C_EVENT_MASTER_MODE_ADDRESS10 - EVT9.
 *
 * @return  ErrorStatus - READY or NoREADY.
 */
ErrorStatus I2C_CheckEvent(I2C_TypeDef *I2Cx, uint32_t I2C_EVENT)
{
    3a02:	7179                	addi	sp,sp,-48
    3a04:	d622                	sw	s0,44(sp)
    3a06:	1800                	addi	s0,sp,48
    3a08:	fca42e23          	sw	a0,-36(s0)
    3a0c:	fcb42c23          	sw	a1,-40(s0)
    uint32_t    lastevent = 0;
    3a10:	fe042423          	sw	zero,-24(s0)
    uint32_t    flag1 = 0, flag2 = 0;
    3a14:	fe042223          	sw	zero,-28(s0)
    3a18:	fe042023          	sw	zero,-32(s0)
    ErrorStatus status = NoREADY;
    3a1c:	fe042623          	sw	zero,-20(s0)

    flag1 = I2Cx->STAR1;
    3a20:	fdc42783          	lw	a5,-36(s0)
    3a24:	0147d783          	lhu	a5,20(a5)
    3a28:	07c2                	slli	a5,a5,0x10
    3a2a:	83c1                	srli	a5,a5,0x10
    3a2c:	fef42223          	sw	a5,-28(s0)
    flag2 = I2Cx->STAR2;
    3a30:	fdc42783          	lw	a5,-36(s0)
    3a34:	0187d783          	lhu	a5,24(a5)
    3a38:	07c2                	slli	a5,a5,0x10
    3a3a:	83c1                	srli	a5,a5,0x10
    3a3c:	fef42023          	sw	a5,-32(s0)
    flag2 = flag2 << 16;
    3a40:	fe042783          	lw	a5,-32(s0)
    3a44:	07c2                	slli	a5,a5,0x10
    3a46:	fef42023          	sw	a5,-32(s0)

    lastevent = (flag1 | flag2) & FLAG_Mask;
    3a4a:	fe442703          	lw	a4,-28(s0)
    3a4e:	fe042783          	lw	a5,-32(s0)
    3a52:	8f5d                	or	a4,a4,a5
    3a54:	010007b7          	lui	a5,0x1000
    3a58:	17fd                	addi	a5,a5,-1
    3a5a:	8ff9                	and	a5,a5,a4
    3a5c:	fef42423          	sw	a5,-24(s0)

    if((lastevent & I2C_EVENT) == I2C_EVENT)
    3a60:	fe842703          	lw	a4,-24(s0)
    3a64:	fd842783          	lw	a5,-40(s0)
    3a68:	8ff9                	and	a5,a5,a4
    3a6a:	fd842703          	lw	a4,-40(s0)
    3a6e:	00f71663          	bne	a4,a5,3a7a <I2C_CheckEvent+0x78>
    {
        status = READY;
    3a72:	4785                	li	a5,1
    3a74:	fef42623          	sw	a5,-20(s0)
    3a78:	a019                	j	3a7e <I2C_CheckEvent+0x7c>
    }
    else
    {
        status = NoREADY;
    3a7a:	fe042623          	sw	zero,-20(s0)
    }

    return status;
    3a7e:	fec42783          	lw	a5,-20(s0)
}
    3a82:	853e                	mv	a0,a5
    3a84:	5432                	lw	s0,44(sp)
    3a86:	6145                	addi	sp,sp,48
    3a88:	8082                	ret

00003a8a <I2C_GetLastEvent>:
 * @param   I2Cx - where x can be 1 to select the I2C peripheral.
 *
 * @return  none
 */
uint32_t I2C_GetLastEvent(I2C_TypeDef *I2Cx)
{
    3a8a:	7179                	addi	sp,sp,-48
    3a8c:	d622                	sw	s0,44(sp)
    3a8e:	1800                	addi	s0,sp,48
    3a90:	fca42e23          	sw	a0,-36(s0)
    uint32_t lastevent = 0;
    3a94:	fe042623          	sw	zero,-20(s0)
    uint32_t flag1 = 0, flag2 = 0;
    3a98:	fe042423          	sw	zero,-24(s0)
    3a9c:	fe042223          	sw	zero,-28(s0)

    flag1 = I2Cx->STAR1;
    3aa0:	fdc42783          	lw	a5,-36(s0)
    3aa4:	0147d783          	lhu	a5,20(a5) # 1000014 <_data_lma+0xff3d60>
    3aa8:	07c2                	slli	a5,a5,0x10
    3aaa:	83c1                	srli	a5,a5,0x10
    3aac:	fef42423          	sw	a5,-24(s0)
    flag2 = I2Cx->STAR2;
    3ab0:	fdc42783          	lw	a5,-36(s0)
    3ab4:	0187d783          	lhu	a5,24(a5)
    3ab8:	07c2                	slli	a5,a5,0x10
    3aba:	83c1                	srli	a5,a5,0x10
    3abc:	fef42223          	sw	a5,-28(s0)
    flag2 = flag2 << 16;
    3ac0:	fe442783          	lw	a5,-28(s0)
    3ac4:	07c2                	slli	a5,a5,0x10
    3ac6:	fef42223          	sw	a5,-28(s0)
    lastevent = (flag1 | flag2) & FLAG_Mask;
    3aca:	fe842703          	lw	a4,-24(s0)
    3ace:	fe442783          	lw	a5,-28(s0)
    3ad2:	8f5d                	or	a4,a4,a5
    3ad4:	010007b7          	lui	a5,0x1000
    3ad8:	17fd                	addi	a5,a5,-1
    3ada:	8ff9                	and	a5,a5,a4
    3adc:	fef42623          	sw	a5,-20(s0)

    return lastevent;
    3ae0:	fec42783          	lw	a5,-20(s0)
}
    3ae4:	853e                	mv	a0,a5
    3ae6:	5432                	lw	s0,44(sp)
    3ae8:	6145                	addi	sp,sp,48
    3aea:	8082                	ret

00003aec <I2C_GetFlagStatus>:
 *            I2C_FLAG_SB - Start bit flag (Master mode).
 *
 * @return  FlagStatus - SET or RESET.
 */
FlagStatus I2C_GetFlagStatus(I2C_TypeDef *I2Cx, uint32_t I2C_FLAG)
{
    3aec:	7179                	addi	sp,sp,-48
    3aee:	d622                	sw	s0,44(sp)
    3af0:	1800                	addi	s0,sp,48
    3af2:	fca42e23          	sw	a0,-36(s0)
    3af6:	fcb42c23          	sw	a1,-40(s0)
    FlagStatus    bitstatus = RESET;
    3afa:	fe042623          	sw	zero,-20(s0)
    __IO uint32_t i2creg = 0, i2cxbase = 0;
    3afe:	fe042423          	sw	zero,-24(s0)
    3b02:	fe042223          	sw	zero,-28(s0)

    i2cxbase = (uint32_t)I2Cx;
    3b06:	fdc42783          	lw	a5,-36(s0)
    3b0a:	fef42223          	sw	a5,-28(s0)
    i2creg = I2C_FLAG >> 28;
    3b0e:	fd842783          	lw	a5,-40(s0)
    3b12:	83f1                	srli	a5,a5,0x1c
    3b14:	fef42423          	sw	a5,-24(s0)
    I2C_FLAG &= FLAG_Mask;
    3b18:	fd842703          	lw	a4,-40(s0)
    3b1c:	010007b7          	lui	a5,0x1000
    3b20:	17fd                	addi	a5,a5,-1
    3b22:	8ff9                	and	a5,a5,a4
    3b24:	fcf42c23          	sw	a5,-40(s0)

    if(i2creg != 0)
    3b28:	fe842783          	lw	a5,-24(s0)
    3b2c:	c799                	beqz	a5,3b3a <I2C_GetFlagStatus+0x4e>
    {
        i2cxbase += 0x14;
    3b2e:	fe442783          	lw	a5,-28(s0)
    3b32:	07d1                	addi	a5,a5,20
    3b34:	fef42223          	sw	a5,-28(s0)
    3b38:	a819                	j	3b4e <I2C_GetFlagStatus+0x62>
    }
    else
    {
        I2C_FLAG = (uint32_t)(I2C_FLAG >> 16);
    3b3a:	fd842783          	lw	a5,-40(s0)
    3b3e:	83c1                	srli	a5,a5,0x10
    3b40:	fcf42c23          	sw	a5,-40(s0)
        i2cxbase += 0x18;
    3b44:	fe442783          	lw	a5,-28(s0)
    3b48:	07e1                	addi	a5,a5,24
    3b4a:	fef42223          	sw	a5,-28(s0)
    }

    if(((*(__IO uint32_t *)i2cxbase) & I2C_FLAG) != (uint32_t)RESET)
    3b4e:	fe442783          	lw	a5,-28(s0)
    3b52:	4398                	lw	a4,0(a5)
    3b54:	fd842783          	lw	a5,-40(s0)
    3b58:	8ff9                	and	a5,a5,a4
    3b5a:	c789                	beqz	a5,3b64 <I2C_GetFlagStatus+0x78>
    {
        bitstatus = SET;
    3b5c:	4785                	li	a5,1
    3b5e:	fef42623          	sw	a5,-20(s0)
    3b62:	a019                	j	3b68 <I2C_GetFlagStatus+0x7c>
    }
    else
    {
        bitstatus = RESET;
    3b64:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    3b68:	fec42783          	lw	a5,-20(s0)
}
    3b6c:	853e                	mv	a0,a5
    3b6e:	5432                	lw	s0,44(sp)
    3b70:	6145                	addi	sp,sp,48
    3b72:	8082                	ret

00003b74 <I2C_ClearFlag>:
 *             register (I2C_GetFlagStatus()) followed by a write operation to I2C_DATAR
 *             register  (I2C_SendData()). 
 * @return  none
 */
void I2C_ClearFlag(I2C_TypeDef *I2Cx, uint32_t I2C_FLAG)
{
    3b74:	7179                	addi	sp,sp,-48
    3b76:	d622                	sw	s0,44(sp)
    3b78:	1800                	addi	s0,sp,48
    3b7a:	fca42e23          	sw	a0,-36(s0)
    3b7e:	fcb42c23          	sw	a1,-40(s0)
    uint32_t flagpos = 0;
    3b82:	fe042623          	sw	zero,-20(s0)

    flagpos = I2C_FLAG & FLAG_Mask;
    3b86:	fd842703          	lw	a4,-40(s0)
    3b8a:	010007b7          	lui	a5,0x1000
    3b8e:	17fd                	addi	a5,a5,-1
    3b90:	8ff9                	and	a5,a5,a4
    3b92:	fef42623          	sw	a5,-20(s0)
    I2Cx->STAR1 = (uint16_t)~flagpos;
    3b96:	fec42783          	lw	a5,-20(s0)
    3b9a:	07c2                	slli	a5,a5,0x10
    3b9c:	83c1                	srli	a5,a5,0x10
    3b9e:	fff7c793          	not	a5,a5
    3ba2:	01079713          	slli	a4,a5,0x10
    3ba6:	8341                	srli	a4,a4,0x10
    3ba8:	fdc42783          	lw	a5,-36(s0)
    3bac:	00e79a23          	sh	a4,20(a5) # 1000014 <_data_lma+0xff3d60>
}
    3bb0:	0001                	nop
    3bb2:	5432                	lw	s0,44(sp)
    3bb4:	6145                	addi	sp,sp,48
    3bb6:	8082                	ret

00003bb8 <I2C_GetITStatus>:
 *            I2C_IT_SB - Start bit flag (Master mode).
 *
 * @return  none
 */
ITStatus I2C_GetITStatus(I2C_TypeDef *I2Cx, uint32_t I2C_IT)
{
    3bb8:	7179                	addi	sp,sp,-48
    3bba:	d622                	sw	s0,44(sp)
    3bbc:	1800                	addi	s0,sp,48
    3bbe:	fca42e23          	sw	a0,-36(s0)
    3bc2:	fcb42c23          	sw	a1,-40(s0)
    ITStatus bitstatus = RESET;
    3bc6:	fe042623          	sw	zero,-20(s0)
    uint32_t enablestatus = 0;
    3bca:	fe042423          	sw	zero,-24(s0)

    enablestatus = (uint32_t)(((I2C_IT & ITEN_Mask) >> 16) & (I2Cx->CTLR2));
    3bce:	fd842783          	lw	a5,-40(s0)
    3bd2:	83c1                	srli	a5,a5,0x10
    3bd4:	fdc42703          	lw	a4,-36(s0)
    3bd8:	00475703          	lhu	a4,4(a4) # 4004 <NVIC_Init+0x2b4>
    3bdc:	0742                	slli	a4,a4,0x10
    3bde:	8341                	srli	a4,a4,0x10
    3be0:	8ff9                	and	a5,a5,a4
    3be2:	7007f793          	andi	a5,a5,1792
    3be6:	fef42423          	sw	a5,-24(s0)
    I2C_IT &= FLAG_Mask;
    3bea:	fd842703          	lw	a4,-40(s0)
    3bee:	010007b7          	lui	a5,0x1000
    3bf2:	17fd                	addi	a5,a5,-1
    3bf4:	8ff9                	and	a5,a5,a4
    3bf6:	fcf42c23          	sw	a5,-40(s0)

    if(((I2Cx->STAR1 & I2C_IT) != (uint32_t)RESET) && enablestatus)
    3bfa:	fdc42783          	lw	a5,-36(s0)
    3bfe:	0147d783          	lhu	a5,20(a5) # 1000014 <_data_lma+0xff3d60>
    3c02:	07c2                	slli	a5,a5,0x10
    3c04:	83c1                	srli	a5,a5,0x10
    3c06:	873e                	mv	a4,a5
    3c08:	fd842783          	lw	a5,-40(s0)
    3c0c:	8ff9                	and	a5,a5,a4
    3c0e:	cb81                	beqz	a5,3c1e <I2C_GetITStatus+0x66>
    3c10:	fe842783          	lw	a5,-24(s0)
    3c14:	c789                	beqz	a5,3c1e <I2C_GetITStatus+0x66>
    {
        bitstatus = SET;
    3c16:	4785                	li	a5,1
    3c18:	fef42623          	sw	a5,-20(s0)
    3c1c:	a019                	j	3c22 <I2C_GetITStatus+0x6a>
    }
    else
    {
        bitstatus = RESET;
    3c1e:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    3c22:	fec42783          	lw	a5,-20(s0)
}
    3c26:	853e                	mv	a0,a5
    3c28:	5432                	lw	s0,44(sp)
    3c2a:	6145                	addi	sp,sp,48
    3c2c:	8082                	ret

00003c2e <I2C_ClearITPendingBit>:
 *             I2C_DATAR register (I2C_SendData()).
 *
 * @return  none
 */
void I2C_ClearITPendingBit(I2C_TypeDef *I2Cx, uint32_t I2C_IT)
{
    3c2e:	7179                	addi	sp,sp,-48
    3c30:	d622                	sw	s0,44(sp)
    3c32:	1800                	addi	s0,sp,48
    3c34:	fca42e23          	sw	a0,-36(s0)
    3c38:	fcb42c23          	sw	a1,-40(s0)
    uint32_t flagpos = 0;
    3c3c:	fe042623          	sw	zero,-20(s0)

    flagpos = I2C_IT & FLAG_Mask;
    3c40:	fd842703          	lw	a4,-40(s0)
    3c44:	010007b7          	lui	a5,0x1000
    3c48:	17fd                	addi	a5,a5,-1
    3c4a:	8ff9                	and	a5,a5,a4
    3c4c:	fef42623          	sw	a5,-20(s0)
    I2Cx->STAR1 = (uint16_t)~flagpos;
    3c50:	fec42783          	lw	a5,-20(s0)
    3c54:	07c2                	slli	a5,a5,0x10
    3c56:	83c1                	srli	a5,a5,0x10
    3c58:	fff7c793          	not	a5,a5
    3c5c:	01079713          	slli	a4,a5,0x10
    3c60:	8341                	srli	a4,a4,0x10
    3c62:	fdc42783          	lw	a5,-36(s0)
    3c66:	00e79a23          	sh	a4,20(a5) # 1000014 <_data_lma+0xff3d60>
}
    3c6a:	0001                	nop
    3c6c:	5432                	lw	s0,44(sp)
    3c6e:	6145                	addi	sp,sp,48
    3c70:	8082                	ret

00003c72 <IWDG_WriteAccessCmd>:
 *        and IWDG_RLDR registers.
 *
 * @return  none
 */
void IWDG_WriteAccessCmd(uint16_t IWDG_WriteAccess)
{
    3c72:	1101                	addi	sp,sp,-32
    3c74:	ce22                	sw	s0,28(sp)
    3c76:	1000                	addi	s0,sp,32
    3c78:	87aa                	mv	a5,a0
    3c7a:	fef41723          	sh	a5,-18(s0)
    IWDG->CTLR = IWDG_WriteAccess;
    3c7e:	400037b7          	lui	a5,0x40003
    3c82:	fee45703          	lhu	a4,-18(s0)
    3c86:	c398                	sw	a4,0(a5)
}
    3c88:	0001                	nop
    3c8a:	4472                	lw	s0,28(sp)
    3c8c:	6105                	addi	sp,sp,32
    3c8e:	8082                	ret

00003c90 <IWDG_SetPrescaler>:
 *             IWDG_Prescaler_256 - IWDG prescaler set to 256.
 *
 * @return  none
 */
void IWDG_SetPrescaler(uint8_t IWDG_Prescaler)
{
    3c90:	1101                	addi	sp,sp,-32
    3c92:	ce22                	sw	s0,28(sp)
    3c94:	1000                	addi	s0,sp,32
    3c96:	87aa                	mv	a5,a0
    3c98:	fef407a3          	sb	a5,-17(s0)
    IWDG->PSCR = IWDG_Prescaler;
    3c9c:	400037b7          	lui	a5,0x40003
    3ca0:	fef44703          	lbu	a4,-17(s0)
    3ca4:	c3d8                	sw	a4,4(a5)
}
    3ca6:	0001                	nop
    3ca8:	4472                	lw	s0,28(sp)
    3caa:	6105                	addi	sp,sp,32
    3cac:	8082                	ret

00003cae <IWDG_SetReload>:
 *            This parameter must be a number between 0 and 0x0FFF.
 *
 * @return  none
 */
void IWDG_SetReload(uint16_t Reload)
{
    3cae:	1101                	addi	sp,sp,-32
    3cb0:	ce22                	sw	s0,28(sp)
    3cb2:	1000                	addi	s0,sp,32
    3cb4:	87aa                	mv	a5,a0
    3cb6:	fef41723          	sh	a5,-18(s0)
    IWDG->RLDR = Reload;
    3cba:	400037b7          	lui	a5,0x40003
    3cbe:	fee45703          	lhu	a4,-18(s0)
    3cc2:	c798                	sw	a4,8(a5)
}
    3cc4:	0001                	nop
    3cc6:	4472                	lw	s0,28(sp)
    3cc8:	6105                	addi	sp,sp,32
    3cca:	8082                	ret

00003ccc <IWDG_ReloadCounter>:
 * @brief   Reloads IWDG counter with value defined in the reload register.
 *
 * @return  none
 */
void IWDG_ReloadCounter(void)
{
    3ccc:	1141                	addi	sp,sp,-16
    3cce:	c622                	sw	s0,12(sp)
    3cd0:	0800                	addi	s0,sp,16
    IWDG->CTLR = CTLR_KEY_Reload;
    3cd2:	400037b7          	lui	a5,0x40003
    3cd6:	672d                	lui	a4,0xb
    3cd8:	aaa70713          	addi	a4,a4,-1366 # aaaa <__divdf3+0x5e>
    3cdc:	c398                	sw	a4,0(a5)
}
    3cde:	0001                	nop
    3ce0:	4432                	lw	s0,12(sp)
    3ce2:	0141                	addi	sp,sp,16
    3ce4:	8082                	ret

00003ce6 <IWDG_Enable>:
 * @brief   Enables IWDG (write access to IWDG_PSCR and IWDG_RLDR registers disabled).
 *
 * @return  none
 */
void IWDG_Enable(void)
{
    3ce6:	1141                	addi	sp,sp,-16
    3ce8:	c622                	sw	s0,12(sp)
    3cea:	0800                	addi	s0,sp,16
    IWDG->CTLR = CTLR_KEY_Enable;
    3cec:	400037b7          	lui	a5,0x40003
    3cf0:	6735                	lui	a4,0xd
    3cf2:	ccc70713          	addi	a4,a4,-820 # cccc <_data_lma+0xa18>
    3cf6:	c398                	sw	a4,0(a5)
}
    3cf8:	0001                	nop
    3cfa:	4432                	lw	s0,12(sp)
    3cfc:	0141                	addi	sp,sp,16
    3cfe:	8082                	ret

00003d00 <IWDG_GetFlagStatus>:
 *            IWDG_FLAG_RVU - Reload Value Update on going.
 *
 * @return  none
 */
FlagStatus IWDG_GetFlagStatus(uint16_t IWDG_FLAG)
{
    3d00:	7179                	addi	sp,sp,-48
    3d02:	d622                	sw	s0,44(sp)
    3d04:	1800                	addi	s0,sp,48
    3d06:	87aa                	mv	a5,a0
    3d08:	fcf41f23          	sh	a5,-34(s0)
    FlagStatus bitstatus = RESET;
    3d0c:	fe042623          	sw	zero,-20(s0)

    if((IWDG->STATR & IWDG_FLAG) != (uint32_t)RESET)
    3d10:	400037b7          	lui	a5,0x40003
    3d14:	47d8                	lw	a4,12(a5)
    3d16:	fde45783          	lhu	a5,-34(s0)
    3d1a:	8ff9                	and	a5,a5,a4
    3d1c:	c789                	beqz	a5,3d26 <IWDG_GetFlagStatus+0x26>
    {
        bitstatus = SET;
    3d1e:	4785                	li	a5,1
    3d20:	fef42623          	sw	a5,-20(s0)
    3d24:	a019                	j	3d2a <IWDG_GetFlagStatus+0x2a>
    }
    else
    {
        bitstatus = RESET;
    3d26:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    3d2a:	fec42783          	lw	a5,-20(s0)
}
    3d2e:	853e                	mv	a0,a5
    3d30:	5432                	lw	s0,44(sp)
    3d32:	6145                	addi	sp,sp,48
    3d34:	8082                	ret

00003d36 <NVIC_PriorityGroupConfig>:
 *                                   0 bits for subpriority
 *
 * @return  none
 */
void NVIC_PriorityGroupConfig(uint32_t NVIC_PriorityGroup)
{
    3d36:	1101                	addi	sp,sp,-32
    3d38:	ce22                	sw	s0,28(sp)
    3d3a:	1000                	addi	s0,sp,32
    3d3c:	fea42623          	sw	a0,-20(s0)
    NVIC_Priority_Group = NVIC_PriorityGroup;
    3d40:	fec42703          	lw	a4,-20(s0)
    3d44:	80e1ac23          	sw	a4,-2024(gp) # 20000038 <_edata>
}
    3d48:	0001                	nop
    3d4a:	4472                	lw	s0,28(sp)
    3d4c:	6105                	addi	sp,sp,32
    3d4e:	8082                	ret

00003d50 <NVIC_Init>:
 *        configuration information for the specified NVIC peripheral.
 *
 * @return  none
 */
void NVIC_Init(NVIC_InitTypeDef *NVIC_InitStruct)
{
    3d50:	7159                	addi	sp,sp,-112
    3d52:	d6a2                	sw	s0,108(sp)
    3d54:	1880                	addi	s0,sp,112
    3d56:	f8a42e23          	sw	a0,-100(s0)
    uint8_t tmppre = 0;
    3d5a:	fe0407a3          	sb	zero,-17(s0)

    if(NVIC_Priority_Group == NVIC_PriorityGroup_0)
    3d5e:	8181a783          	lw	a5,-2024(gp) # 20000038 <_edata>
    3d62:	eb9d                	bnez	a5,3d98 <NVIC_Init+0x48>
    {
        NVIC_SetPriority(NVIC_InitStruct->NVIC_IRQChannel, NVIC_InitStruct->NVIC_IRQChannelSubPriority << 4);
    3d64:	f9c42783          	lw	a5,-100(s0)
    3d68:	0007c783          	lbu	a5,0(a5) # 40003000 <_eusrstack+0x1ffff000>
    3d6c:	873e                	mv	a4,a5
    3d6e:	f9c42783          	lw	a5,-100(s0)
    3d72:	0027c783          	lbu	a5,2(a5)
    3d76:	0792                	slli	a5,a5,0x4
    3d78:	0ff7f793          	andi	a5,a5,255
    3d7c:	fee42423          	sw	a4,-24(s0)
    3d80:	fef403a3          	sb	a5,-25(s0)
 *
 * @return  none
 */
__attribute__( ( always_inline ) ) RV_STATIC_INLINE void NVIC_SetPriority(IRQn_Type IRQn, uint8_t priority)
{
  NVIC->IPRIOR[(uint32_t)(IRQn)] = priority;
    3d84:	e000e737          	lui	a4,0xe000e
    3d88:	fe842783          	lw	a5,-24(s0)
    3d8c:	97ba                	add	a5,a5,a4
    3d8e:	fe744703          	lbu	a4,-25(s0)
    3d92:	40e78023          	sb	a4,1024(a5)
    3d96:	ac89                	j	3fe8 <NVIC_Init+0x298>
    }
    else if(NVIC_Priority_Group == NVIC_PriorityGroup_1)
    3d98:	8181a703          	lw	a4,-2024(gp) # 20000038 <_edata>
    3d9c:	4785                	li	a5,1
    3d9e:	08f71363          	bne	a4,a5,3e24 <NVIC_Init+0xd4>
    {
        if(NVIC_InitStruct->NVIC_IRQChannelPreemptionPriority == 1)
    3da2:	f9c42783          	lw	a5,-100(s0)
    3da6:	0017c703          	lbu	a4,1(a5)
    3daa:	4785                	li	a5,1
    3dac:	04f71263          	bne	a4,a5,3df0 <NVIC_Init+0xa0>
        {
            NVIC_SetPriority(NVIC_InitStruct->NVIC_IRQChannel, (1 << 7) | (NVIC_InitStruct->NVIC_IRQChannelSubPriority << 4));
    3db0:	f9c42783          	lw	a5,-100(s0)
    3db4:	0007c783          	lbu	a5,0(a5)
    3db8:	873e                	mv	a4,a5
    3dba:	f9c42783          	lw	a5,-100(s0)
    3dbe:	0027c783          	lbu	a5,2(a5)
    3dc2:	0792                	slli	a5,a5,0x4
    3dc4:	07e2                	slli	a5,a5,0x18
    3dc6:	87e1                	srai	a5,a5,0x18
    3dc8:	f807e793          	ori	a5,a5,-128
    3dcc:	07e2                	slli	a5,a5,0x18
    3dce:	87e1                	srai	a5,a5,0x18
    3dd0:	0ff7f793          	andi	a5,a5,255
    3dd4:	fee42023          	sw	a4,-32(s0)
    3dd8:	fcf40fa3          	sb	a5,-33(s0)
    3ddc:	e000e737          	lui	a4,0xe000e
    3de0:	fe042783          	lw	a5,-32(s0)
    3de4:	97ba                	add	a5,a5,a4
    3de6:	fdf44703          	lbu	a4,-33(s0)
    3dea:	40e78023          	sb	a4,1024(a5)
    3dee:	aaed                	j	3fe8 <NVIC_Init+0x298>
        }
        else
        {
            NVIC_SetPriority(NVIC_InitStruct->NVIC_IRQChannel, (0 << 7) | (NVIC_InitStruct->NVIC_IRQChannelSubPriority << 4));
    3df0:	f9c42783          	lw	a5,-100(s0)
    3df4:	0007c783          	lbu	a5,0(a5)
    3df8:	873e                	mv	a4,a5
    3dfa:	f9c42783          	lw	a5,-100(s0)
    3dfe:	0027c783          	lbu	a5,2(a5)
    3e02:	0792                	slli	a5,a5,0x4
    3e04:	0ff7f793          	andi	a5,a5,255
    3e08:	fce42c23          	sw	a4,-40(s0)
    3e0c:	fcf40ba3          	sb	a5,-41(s0)
    3e10:	e000e737          	lui	a4,0xe000e
    3e14:	fd842783          	lw	a5,-40(s0)
    3e18:	97ba                	add	a5,a5,a4
    3e1a:	fd744703          	lbu	a4,-41(s0)
    3e1e:	40e78023          	sb	a4,1024(a5)
    3e22:	a2d9                	j	3fe8 <NVIC_Init+0x298>
        }
    }
    else if(NVIC_Priority_Group == NVIC_PriorityGroup_2)
    3e24:	8181a703          	lw	a4,-2024(gp) # 20000038 <_edata>
    3e28:	4789                	li	a5,2
    3e2a:	0af71f63          	bne	a4,a5,3ee8 <NVIC_Init+0x198>
    {
        if(NVIC_InitStruct->NVIC_IRQChannelPreemptionPriority <= 1)
    3e2e:	f9c42783          	lw	a5,-100(s0)
    3e32:	0017c703          	lbu	a4,1(a5)
    3e36:	4785                	li	a5,1
    3e38:	04e7e863          	bltu	a5,a4,3e88 <NVIC_Init+0x138>
        {
            tmppre = NVIC_InitStruct->NVIC_IRQChannelSubPriority + (4 * NVIC_InitStruct->NVIC_IRQChannelPreemptionPriority);
    3e3c:	f9c42783          	lw	a5,-100(s0)
    3e40:	0027c703          	lbu	a4,2(a5)
    3e44:	f9c42783          	lw	a5,-100(s0)
    3e48:	0017c783          	lbu	a5,1(a5)
    3e4c:	078a                	slli	a5,a5,0x2
    3e4e:	0ff7f793          	andi	a5,a5,255
    3e52:	97ba                	add	a5,a5,a4
    3e54:	fef407a3          	sb	a5,-17(s0)
            NVIC_SetPriority(NVIC_InitStruct->NVIC_IRQChannel, (0 << 7) | (tmppre << 4));
    3e58:	f9c42783          	lw	a5,-100(s0)
    3e5c:	0007c783          	lbu	a5,0(a5)
    3e60:	873e                	mv	a4,a5
    3e62:	fef44783          	lbu	a5,-17(s0)
    3e66:	0792                	slli	a5,a5,0x4
    3e68:	0ff7f793          	andi	a5,a5,255
    3e6c:	fce42823          	sw	a4,-48(s0)
    3e70:	fcf407a3          	sb	a5,-49(s0)
    3e74:	e000e737          	lui	a4,0xe000e
    3e78:	fd042783          	lw	a5,-48(s0)
    3e7c:	97ba                	add	a5,a5,a4
    3e7e:	fcf44703          	lbu	a4,-49(s0)
    3e82:	40e78023          	sb	a4,1024(a5)
    3e86:	a28d                	j	3fe8 <NVIC_Init+0x298>
        }
        else
        {
            tmppre = NVIC_InitStruct->NVIC_IRQChannelSubPriority + (4 * (NVIC_InitStruct->NVIC_IRQChannelPreemptionPriority - 2));
    3e88:	f9c42783          	lw	a5,-100(s0)
    3e8c:	0027c703          	lbu	a4,2(a5)
    3e90:	f9c42783          	lw	a5,-100(s0)
    3e94:	0017c783          	lbu	a5,1(a5)
    3e98:	03e78793          	addi	a5,a5,62
    3e9c:	0ff7f793          	andi	a5,a5,255
    3ea0:	078a                	slli	a5,a5,0x2
    3ea2:	0ff7f793          	andi	a5,a5,255
    3ea6:	97ba                	add	a5,a5,a4
    3ea8:	fef407a3          	sb	a5,-17(s0)
            NVIC_SetPriority(NVIC_InitStruct->NVIC_IRQChannel, (1 << 7) | (tmppre << 4));
    3eac:	f9c42783          	lw	a5,-100(s0)
    3eb0:	0007c783          	lbu	a5,0(a5)
    3eb4:	873e                	mv	a4,a5
    3eb6:	fef44783          	lbu	a5,-17(s0)
    3eba:	0792                	slli	a5,a5,0x4
    3ebc:	07e2                	slli	a5,a5,0x18
    3ebe:	87e1                	srai	a5,a5,0x18
    3ec0:	f807e793          	ori	a5,a5,-128
    3ec4:	07e2                	slli	a5,a5,0x18
    3ec6:	87e1                	srai	a5,a5,0x18
    3ec8:	0ff7f793          	andi	a5,a5,255
    3ecc:	fce42423          	sw	a4,-56(s0)
    3ed0:	fcf403a3          	sb	a5,-57(s0)
    3ed4:	e000e737          	lui	a4,0xe000e
    3ed8:	fc842783          	lw	a5,-56(s0)
    3edc:	97ba                	add	a5,a5,a4
    3ede:	fc744703          	lbu	a4,-57(s0)
    3ee2:	40e78023          	sb	a4,1024(a5)
    3ee6:	a209                	j	3fe8 <NVIC_Init+0x298>
        }
    }
    else if(NVIC_Priority_Group == NVIC_PriorityGroup_3)
    3ee8:	8181a703          	lw	a4,-2024(gp) # 20000038 <_edata>
    3eec:	478d                	li	a5,3
    3eee:	0af71f63          	bne	a4,a5,3fac <NVIC_Init+0x25c>
    {
        if(NVIC_InitStruct->NVIC_IRQChannelPreemptionPriority <= 3)
    3ef2:	f9c42783          	lw	a5,-100(s0)
    3ef6:	0017c703          	lbu	a4,1(a5)
    3efa:	478d                	li	a5,3
    3efc:	04e7e863          	bltu	a5,a4,3f4c <NVIC_Init+0x1fc>
        {
            tmppre = NVIC_InitStruct->NVIC_IRQChannelSubPriority + (2 * NVIC_InitStruct->NVIC_IRQChannelPreemptionPriority);
    3f00:	f9c42783          	lw	a5,-100(s0)
    3f04:	0027c703          	lbu	a4,2(a5)
    3f08:	f9c42783          	lw	a5,-100(s0)
    3f0c:	0017c783          	lbu	a5,1(a5)
    3f10:	0786                	slli	a5,a5,0x1
    3f12:	0ff7f793          	andi	a5,a5,255
    3f16:	97ba                	add	a5,a5,a4
    3f18:	fef407a3          	sb	a5,-17(s0)
            NVIC_SetPriority(NVIC_InitStruct->NVIC_IRQChannel, (0 << 7) | (tmppre << 4));
    3f1c:	f9c42783          	lw	a5,-100(s0)
    3f20:	0007c783          	lbu	a5,0(a5)
    3f24:	873e                	mv	a4,a5
    3f26:	fef44783          	lbu	a5,-17(s0)
    3f2a:	0792                	slli	a5,a5,0x4
    3f2c:	0ff7f793          	andi	a5,a5,255
    3f30:	fce42023          	sw	a4,-64(s0)
    3f34:	faf40fa3          	sb	a5,-65(s0)
    3f38:	e000e737          	lui	a4,0xe000e
    3f3c:	fc042783          	lw	a5,-64(s0)
    3f40:	97ba                	add	a5,a5,a4
    3f42:	fbf44703          	lbu	a4,-65(s0)
    3f46:	40e78023          	sb	a4,1024(a5)
    3f4a:	a879                	j	3fe8 <NVIC_Init+0x298>
        }
        else
        {
            tmppre = NVIC_InitStruct->NVIC_IRQChannelSubPriority + (2 * (NVIC_InitStruct->NVIC_IRQChannelPreemptionPriority - 4));
    3f4c:	f9c42783          	lw	a5,-100(s0)
    3f50:	0027c703          	lbu	a4,2(a5)
    3f54:	f9c42783          	lw	a5,-100(s0)
    3f58:	0017c783          	lbu	a5,1(a5)
    3f5c:	07c78793          	addi	a5,a5,124
    3f60:	0ff7f793          	andi	a5,a5,255
    3f64:	0786                	slli	a5,a5,0x1
    3f66:	0ff7f793          	andi	a5,a5,255
    3f6a:	97ba                	add	a5,a5,a4
    3f6c:	fef407a3          	sb	a5,-17(s0)
            NVIC_SetPriority(NVIC_InitStruct->NVIC_IRQChannel, (1 << 7) | (tmppre << 4));
    3f70:	f9c42783          	lw	a5,-100(s0)
    3f74:	0007c783          	lbu	a5,0(a5)
    3f78:	873e                	mv	a4,a5
    3f7a:	fef44783          	lbu	a5,-17(s0)
    3f7e:	0792                	slli	a5,a5,0x4
    3f80:	07e2                	slli	a5,a5,0x18
    3f82:	87e1                	srai	a5,a5,0x18
    3f84:	f807e793          	ori	a5,a5,-128
    3f88:	07e2                	slli	a5,a5,0x18
    3f8a:	87e1                	srai	a5,a5,0x18
    3f8c:	0ff7f793          	andi	a5,a5,255
    3f90:	fae42c23          	sw	a4,-72(s0)
    3f94:	faf40ba3          	sb	a5,-73(s0)
    3f98:	e000e737          	lui	a4,0xe000e
    3f9c:	fb842783          	lw	a5,-72(s0)
    3fa0:	97ba                	add	a5,a5,a4
    3fa2:	fb744703          	lbu	a4,-73(s0)
    3fa6:	40e78023          	sb	a4,1024(a5)
    3faa:	a83d                	j	3fe8 <NVIC_Init+0x298>
        }
    }
    else if(NVIC_Priority_Group == NVIC_PriorityGroup_4)
    3fac:	8181a703          	lw	a4,-2024(gp) # 20000038 <_edata>
    3fb0:	4791                	li	a5,4
    3fb2:	02f71b63          	bne	a4,a5,3fe8 <NVIC_Init+0x298>
    {
        NVIC_SetPriority(NVIC_InitStruct->NVIC_IRQChannel, NVIC_InitStruct->NVIC_IRQChannelPreemptionPriority << 4);
    3fb6:	f9c42783          	lw	a5,-100(s0)
    3fba:	0007c783          	lbu	a5,0(a5)
    3fbe:	873e                	mv	a4,a5
    3fc0:	f9c42783          	lw	a5,-100(s0)
    3fc4:	0017c783          	lbu	a5,1(a5)
    3fc8:	0792                	slli	a5,a5,0x4
    3fca:	0ff7f793          	andi	a5,a5,255
    3fce:	fae42823          	sw	a4,-80(s0)
    3fd2:	faf407a3          	sb	a5,-81(s0)
    3fd6:	e000e737          	lui	a4,0xe000e
    3fda:	fb042783          	lw	a5,-80(s0)
    3fde:	97ba                	add	a5,a5,a4
    3fe0:	faf44703          	lbu	a4,-81(s0)
    3fe4:	40e78023          	sb	a4,1024(a5)
    }

    if(NVIC_InitStruct->NVIC_IRQChannelCmd != DISABLE)
    3fe8:	f9c42783          	lw	a5,-100(s0)
    3fec:	43dc                	lw	a5,4(a5)
    3fee:	cb85                	beqz	a5,401e <NVIC_Init+0x2ce>
    {
        NVIC_EnableIRQ(NVIC_InitStruct->NVIC_IRQChannel);
    3ff0:	f9c42783          	lw	a5,-100(s0)
    3ff4:	0007c783          	lbu	a5,0(a5)
    3ff8:	faf42423          	sw	a5,-88(s0)
  NVIC->IENR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));
    3ffc:	fa842783          	lw	a5,-88(s0)
    4000:	8bfd                	andi	a5,a5,31
    4002:	4705                	li	a4,1
    4004:	00f716b3          	sll	a3,a4,a5
    4008:	e000e737          	lui	a4,0xe000e
    400c:	fa842783          	lw	a5,-88(s0)
    4010:	8395                	srli	a5,a5,0x5
    4012:	04078793          	addi	a5,a5,64
    4016:	078a                	slli	a5,a5,0x2
    4018:	97ba                	add	a5,a5,a4
    401a:	c394                	sw	a3,0(a5)
    }
    else
    {
        NVIC_DisableIRQ(NVIC_InitStruct->NVIC_IRQChannel);
    }
}
    401c:	a03d                	j	404a <NVIC_Init+0x2fa>
        NVIC_DisableIRQ(NVIC_InitStruct->NVIC_IRQChannel);
    401e:	f9c42783          	lw	a5,-100(s0)
    4022:	0007c783          	lbu	a5,0(a5)
    4026:	faf42223          	sw	a5,-92(s0)
  NVIC->IRER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));
    402a:	fa442783          	lw	a5,-92(s0)
    402e:	8bfd                	andi	a5,a5,31
    4030:	4705                	li	a4,1
    4032:	00f716b3          	sll	a3,a4,a5
    4036:	e000e737          	lui	a4,0xe000e
    403a:	fa442783          	lw	a5,-92(s0)
    403e:	8395                	srli	a5,a5,0x5
    4040:	06078793          	addi	a5,a5,96
    4044:	078a                	slli	a5,a5,0x2
    4046:	97ba                	add	a5,a5,a4
    4048:	c394                	sw	a3,0(a5)
}
    404a:	0001                	nop
    404c:	5436                	lw	s0,108(sp)
    404e:	6165                	addi	sp,sp,112
    4050:	8082                	ret

00004052 <OPA_Unlock>:
 * @brief          Unlocks the OPA Controller.
 *
 * @return         None
 */
void OPA_Unlock(void)
{
    4052:	1141                	addi	sp,sp,-16
    4054:	c622                	sw	s0,12(sp)
    4056:	0800                	addi	s0,sp,16
    OPA->OPAKEY = OPA_KEY1;
    4058:	400267b7          	lui	a5,0x40026
    405c:	45670737          	lui	a4,0x45670
    4060:	12370713          	addi	a4,a4,291 # 45670123 <_eusrstack+0x2566c123>
    4064:	c7d8                	sw	a4,12(a5)
    OPA->OPAKEY = OPA_KEY2;
    4066:	400267b7          	lui	a5,0x40026
    406a:	cdef9737          	lui	a4,0xcdef9
    406e:	9ab70713          	addi	a4,a4,-1621 # cdef89ab <_eusrstack+0xadef49ab>
    4072:	c7d8                	sw	a4,12(a5)
}
    4074:	0001                	nop
    4076:	4432                	lw	s0,12(sp)
    4078:	0141                	addi	sp,sp,16
    407a:	8082                	ret

0000407c <OPA_Lock>:
 * @brief          Locks the OPA Controller.
 *
 * @return         None
 */
void OPA_Lock(void)
{
    407c:	1141                	addi	sp,sp,-16
    407e:	c622                	sw	s0,12(sp)
    4080:	0800                	addi	s0,sp,16
    OPA->CTLR1 |= (1<<31);
    4082:	400267b7          	lui	a5,0x40026
    4086:	43d4                	lw	a3,4(a5)
    4088:	400267b7          	lui	a5,0x40026
    408c:	80000737          	lui	a4,0x80000
    4090:	8f55                	or	a4,a4,a3
    4092:	c3d8                	sw	a4,4(a5)
}
    4094:	0001                	nop
    4096:	4432                	lw	s0,12(sp)
    4098:	0141                	addi	sp,sp,16
    409a:	8082                	ret

0000409c <OPA_POLL_Unlock>:
 * @brief          Unlocks the OPA POLL Controller.
 *
 * @return         None
 */
void OPA_POLL_Unlock(void)
{
    409c:	1141                	addi	sp,sp,-16
    409e:	c622                	sw	s0,12(sp)
    40a0:	0800                	addi	s0,sp,16
    OPA->POLLKEY = OPA_KEY1;
    40a2:	400267b7          	lui	a5,0x40026
    40a6:	45670737          	lui	a4,0x45670
    40aa:	12370713          	addi	a4,a4,291 # 45670123 <_eusrstack+0x2566c123>
    40ae:	cbd8                	sw	a4,20(a5)
    OPA->POLLKEY = OPA_KEY2;
    40b0:	400267b7          	lui	a5,0x40026
    40b4:	cdef9737          	lui	a4,0xcdef9
    40b8:	9ab70713          	addi	a4,a4,-1621 # cdef89ab <_eusrstack+0xadef49ab>
    40bc:	cbd8                	sw	a4,20(a5)
}
    40be:	0001                	nop
    40c0:	4432                	lw	s0,12(sp)
    40c2:	0141                	addi	sp,sp,16
    40c4:	8082                	ret

000040c6 <OPA_POLL_Lock>:
 * @brief          Locks the OPA POLL Controller.
 *
 * @return         None
 */
void OPA_POLL_Lock(void)
{
    40c6:	1141                	addi	sp,sp,-16
    40c8:	c622                	sw	s0,12(sp)
    40ca:	0800                	addi	s0,sp,16
    OPA->CFGR1 |= (1<<7);
    40cc:	400267b7          	lui	a5,0x40026
    40d0:	0007d783          	lhu	a5,0(a5) # 40026000 <_eusrstack+0x20022000>
    40d4:	01079713          	slli	a4,a5,0x10
    40d8:	8341                	srli	a4,a4,0x10
    40da:	400267b7          	lui	a5,0x40026
    40de:	08076713          	ori	a4,a4,128
    40e2:	0742                	slli	a4,a4,0x10
    40e4:	8341                	srli	a4,a4,0x10
    40e6:	00e79023          	sh	a4,0(a5) # 40026000 <_eusrstack+0x20022000>
}
    40ea:	0001                	nop
    40ec:	4432                	lw	s0,12(sp)
    40ee:	0141                	addi	sp,sp,16
    40f0:	8082                	ret

000040f2 <OPA_CMP_Unlock>:
 * @brief          Unlocks the CMP Controller.
 *
 * @return         None
 */
void OPA_CMP_Unlock(void)
{
    40f2:	1141                	addi	sp,sp,-16
    40f4:	c622                	sw	s0,12(sp)
    40f6:	0800                	addi	s0,sp,16
    OPA->CMPKEY = OPA_KEY1;
    40f8:	400267b7          	lui	a5,0x40026
    40fc:	45670737          	lui	a4,0x45670
    4100:	12370713          	addi	a4,a4,291 # 45670123 <_eusrstack+0x2566c123>
    4104:	cb98                	sw	a4,16(a5)
    OPA->CMPKEY = OPA_KEY2;
    4106:	400267b7          	lui	a5,0x40026
    410a:	cdef9737          	lui	a4,0xcdef9
    410e:	9ab70713          	addi	a4,a4,-1621 # cdef89ab <_eusrstack+0xadef49ab>
    4112:	cb98                	sw	a4,16(a5)
}
    4114:	0001                	nop
    4116:	4432                	lw	s0,12(sp)
    4118:	0141                	addi	sp,sp,16
    411a:	8082                	ret

0000411c <OPA_CMP_Lock>:
 * @brief          Locks the CMP Controller.
 *
 * @return         None
 */
void OPA_CMP_Lock(void)
{
    411c:	1141                	addi	sp,sp,-16
    411e:	c622                	sw	s0,12(sp)
    4120:	0800                	addi	s0,sp,16
    CTLR2_tmp |= (1<<31);
    4122:	81c1a703          	lw	a4,-2020(gp) # 2000003c <CTLR2_tmp>
    4126:	800007b7          	lui	a5,0x80000
    412a:	8f5d                	or	a4,a4,a5
    412c:	80e1ae23          	sw	a4,-2020(gp) # 2000003c <CTLR2_tmp>
    OPA->CTLR2 = CTLR2_tmp;
    4130:	400267b7          	lui	a5,0x40026
    4134:	81c1a703          	lw	a4,-2020(gp) # 2000003c <CTLR2_tmp>
    4138:	c798                	sw	a4,8(a5)
    CTLR2_tmp &= ~(1<<31);
    413a:	81c1a703          	lw	a4,-2020(gp) # 2000003c <CTLR2_tmp>
    413e:	800007b7          	lui	a5,0x80000
    4142:	fff7c793          	not	a5,a5
    4146:	8f7d                	and	a4,a4,a5
    4148:	80e1ae23          	sw	a4,-2020(gp) # 2000003c <CTLR2_tmp>
}
    414c:	0001                	nop
    414e:	4432                	lw	s0,12(sp)
    4150:	0141                	addi	sp,sp,16
    4152:	8082                	ret

00004154 <OPA_Init>:
 * @param   OPA_InitStruct - pointer to a OPA_InitTypeDef structure
 *
 * @return  none
 */
void OPA_Init(OPA_InitTypeDef *OPA_InitStruct)
{
    4154:	7179                	addi	sp,sp,-48
    4156:	d622                	sw	s0,44(sp)
    4158:	1800                	addi	s0,sp,48
    415a:	fca42e23          	sw	a0,-36(s0)
    uint16_t tmp0 = 0, tmp1 = 0;
    415e:	fe041323          	sh	zero,-26(s0)
    4162:	fe041723          	sh	zero,-18(s0)
    uint32_t tmp2 = 0;
    4166:	fe042423          	sw	zero,-24(s0)

    tmp0 = OPA->CFGR1;
    416a:	400267b7          	lui	a5,0x40026
    416e:	0007d783          	lhu	a5,0(a5) # 40026000 <_eusrstack+0x20022000>
    4172:	fef41323          	sh	a5,-26(s0)
    tmp1 = OPA->CFGR2;
    4176:	400267b7          	lui	a5,0x40026
    417a:	0027d783          	lhu	a5,2(a5) # 40026002 <_eusrstack+0x20022002>
    417e:	fef41723          	sh	a5,-18(s0)
    tmp2 = OPA->CTLR1;
    4182:	400267b7          	lui	a5,0x40026
    4186:	43dc                	lw	a5,4(a5)
    4188:	fef42423          	sw	a5,-24(s0)

    if(OPA_InitStruct->OPA_NUM == OPA1)
    418c:	fdc42783          	lw	a5,-36(s0)
    4190:	43dc                	lw	a5,4(a5)
    4192:	e7b5                	bnez	a5,41fe <OPA_Init+0xaa>
    {
        tmp1 &= 0xFCFF;
    4194:	fee45783          	lhu	a5,-18(s0)
    4198:	cff7f793          	andi	a5,a5,-769
    419c:	fef41723          	sh	a5,-18(s0)
        tmp2 &= 0xFFFF0001;
    41a0:	fe842703          	lw	a4,-24(s0)
    41a4:	77c1                	lui	a5,0xffff0
    41a6:	0785                	addi	a5,a5,1
    41a8:	8ff9                	and	a5,a5,a4
    41aa:	fef42423          	sw	a5,-24(s0)

        tmp1 |= (OPA_InitStruct->POLL_NUM << 9);
    41ae:	fdc42783          	lw	a5,-36(s0)
    41b2:	5bdc                	lw	a5,52(a5)
    41b4:	07c2                	slli	a5,a5,0x10
    41b6:	83c1                	srli	a5,a5,0x10
    41b8:	07a6                	slli	a5,a5,0x9
    41ba:	01079713          	slli	a4,a5,0x10
    41be:	8341                	srli	a4,a4,0x10
    41c0:	fee45783          	lhu	a5,-18(s0)
    41c4:	8fd9                	or	a5,a5,a4
    41c6:	fef41723          	sh	a5,-18(s0)
        tmp2 |= (OPA_InitStruct->Mode << 1) | (OPA_InitStruct->PSEL << 3)
    41ca:	fdc42783          	lw	a5,-36(s0)
    41ce:	479c                	lw	a5,8(a5)
    41d0:	00179713          	slli	a4,a5,0x1
    41d4:	fdc42783          	lw	a5,-36(s0)
    41d8:	47dc                	lw	a5,12(a5)
    41da:	078e                	slli	a5,a5,0x3
    41dc:	8f5d                	or	a4,a4,a5
                | (OPA_InitStruct->FB << 5) | (OPA_InitStruct->NSEL << 6);
    41de:	fdc42783          	lw	a5,-36(s0)
    41e2:	4b9c                	lw	a5,16(a5)
    41e4:	0796                	slli	a5,a5,0x5
    41e6:	8f5d                	or	a4,a4,a5
    41e8:	fdc42783          	lw	a5,-36(s0)
    41ec:	4bdc                	lw	a5,20(a5)
    41ee:	079a                	slli	a5,a5,0x6
    41f0:	8fd9                	or	a5,a5,a4
        tmp2 |= (OPA_InitStruct->Mode << 1) | (OPA_InitStruct->PSEL << 3)
    41f2:	fe842703          	lw	a4,-24(s0)
    41f6:	8fd9                	or	a5,a5,a4
    41f8:	fef42423          	sw	a5,-24(s0)
    41fc:	a8b5                	j	4278 <OPA_Init+0x124>
    }
    else if(OPA_InitStruct->OPA_NUM == OPA2)
    41fe:	fdc42783          	lw	a5,-36(s0)
    4202:	43d8                	lw	a4,4(a5)
    4204:	4785                	li	a5,1
    4206:	06f71963          	bne	a4,a5,4278 <OPA_Init+0x124>
    {
        tmp1 &= 0xF3FF;
    420a:	fee45703          	lhu	a4,-18(s0)
    420e:	77fd                	lui	a5,0xfffff
    4210:	3ff78793          	addi	a5,a5,1023 # fffff3ff <_eusrstack+0xdfffb3ff>
    4214:	8ff9                	and	a5,a5,a4
    4216:	fef41723          	sh	a5,-18(s0)
        tmp2 &= 0x0001FFFF;
    421a:	fe842703          	lw	a4,-24(s0)
    421e:	000207b7          	lui	a5,0x20
    4222:	17fd                	addi	a5,a5,-1
    4224:	8ff9                	and	a5,a5,a4
    4226:	fef42423          	sw	a5,-24(s0)

        tmp1 |= (OPA_InitStruct->POLL_NUM << 11);
    422a:	fdc42783          	lw	a5,-36(s0)
    422e:	5bdc                	lw	a5,52(a5)
    4230:	07c2                	slli	a5,a5,0x10
    4232:	83c1                	srli	a5,a5,0x10
    4234:	07ae                	slli	a5,a5,0xb
    4236:	01079713          	slli	a4,a5,0x10
    423a:	8341                	srli	a4,a4,0x10
    423c:	fee45783          	lhu	a5,-18(s0)
    4240:	8fd9                	or	a5,a5,a4
    4242:	fef41723          	sh	a5,-18(s0)
        tmp2 |= (OPA_InitStruct->Mode << 17) | (OPA_InitStruct->PSEL << 19)
    4246:	fdc42783          	lw	a5,-36(s0)
    424a:	479c                	lw	a5,8(a5)
    424c:	01179713          	slli	a4,a5,0x11
    4250:	fdc42783          	lw	a5,-36(s0)
    4254:	47dc                	lw	a5,12(a5)
    4256:	07ce                	slli	a5,a5,0x13
    4258:	8f5d                	or	a4,a4,a5
                | (OPA_InitStruct->FB << 21) | (OPA_InitStruct->NSEL << 22);
    425a:	fdc42783          	lw	a5,-36(s0)
    425e:	4b9c                	lw	a5,16(a5)
    4260:	07d6                	slli	a5,a5,0x15
    4262:	8f5d                	or	a4,a4,a5
    4264:	fdc42783          	lw	a5,-36(s0)
    4268:	4bdc                	lw	a5,20(a5)
    426a:	07da                	slli	a5,a5,0x16
    426c:	8fd9                	or	a5,a5,a4
        tmp2 |= (OPA_InitStruct->Mode << 17) | (OPA_InitStruct->PSEL << 19)
    426e:	fe842703          	lw	a4,-24(s0)
    4272:	8fd9                	or	a5,a5,a4
    4274:	fef42423          	sw	a5,-24(s0)
    }

    tmp0 |= (OPA_InitStruct->PSEL_POLL) | (OPA_InitStruct->BKIN_EN << 2)
    4278:	fdc42783          	lw	a5,-36(s0)
    427c:	4f9c                	lw	a5,24(a5)
    427e:	01079713          	slli	a4,a5,0x10
    4282:	8341                	srli	a4,a4,0x10
    4284:	fdc42783          	lw	a5,-36(s0)
    4288:	4fdc                	lw	a5,28(a5)
    428a:	07c2                	slli	a5,a5,0x10
    428c:	83c1                	srli	a5,a5,0x10
    428e:	078a                	slli	a5,a5,0x2
    4290:	07c2                	slli	a5,a5,0x10
    4292:	83c1                	srli	a5,a5,0x10
    4294:	8fd9                	or	a5,a5,a4
    4296:	01079713          	slli	a4,a5,0x10
    429a:	8341                	srli	a4,a4,0x10
                     | (OPA_InitStruct->RST_EN << 4) | (OPA_InitStruct->BKIN_SEL << 6)
    429c:	fdc42783          	lw	a5,-36(s0)
    42a0:	539c                	lw	a5,32(a5)
    42a2:	07c2                	slli	a5,a5,0x10
    42a4:	83c1                	srli	a5,a5,0x10
    42a6:	0792                	slli	a5,a5,0x4
    42a8:	07c2                	slli	a5,a5,0x10
    42aa:	83c1                	srli	a5,a5,0x10
    42ac:	8fd9                	or	a5,a5,a4
    42ae:	01079713          	slli	a4,a5,0x10
    42b2:	8341                	srli	a4,a4,0x10
    42b4:	fdc42783          	lw	a5,-36(s0)
    42b8:	53dc                	lw	a5,36(a5)
    42ba:	07c2                	slli	a5,a5,0x10
    42bc:	83c1                	srli	a5,a5,0x10
    42be:	079a                	slli	a5,a5,0x6
    42c0:	07c2                	slli	a5,a5,0x10
    42c2:	83c1                	srli	a5,a5,0x10
    42c4:	8fd9                	or	a5,a5,a4
    42c6:	01079713          	slli	a4,a5,0x10
    42ca:	8341                	srli	a4,a4,0x10
                     | (OPA_InitStruct->OUT_IE << 8) | (OPA_InitStruct->CNT_IE << 10)
    42cc:	fdc42783          	lw	a5,-36(s0)
    42d0:	579c                	lw	a5,40(a5)
    42d2:	07c2                	slli	a5,a5,0x10
    42d4:	83c1                	srli	a5,a5,0x10
    42d6:	07a2                	slli	a5,a5,0x8
    42d8:	07c2                	slli	a5,a5,0x10
    42da:	83c1                	srli	a5,a5,0x10
    42dc:	8fd9                	or	a5,a5,a4
    42de:	01079713          	slli	a4,a5,0x10
    42e2:	8341                	srli	a4,a4,0x10
    42e4:	fdc42783          	lw	a5,-36(s0)
    42e8:	57dc                	lw	a5,44(a5)
    42ea:	07c2                	slli	a5,a5,0x10
    42ec:	83c1                	srli	a5,a5,0x10
    42ee:	07aa                	slli	a5,a5,0xa
    42f0:	07c2                	slli	a5,a5,0x10
    42f2:	83c1                	srli	a5,a5,0x10
    42f4:	8fd9                	or	a5,a5,a4
    42f6:	01079713          	slli	a4,a5,0x10
    42fa:	8341                	srli	a4,a4,0x10
                     | (OPA_InitStruct->NMI_IE << 11);
    42fc:	fdc42783          	lw	a5,-36(s0)
    4300:	5b9c                	lw	a5,48(a5)
    4302:	07c2                	slli	a5,a5,0x10
    4304:	83c1                	srli	a5,a5,0x10
    4306:	07ae                	slli	a5,a5,0xb
    4308:	07c2                	slli	a5,a5,0x10
    430a:	83c1                	srli	a5,a5,0x10
    430c:	8fd9                	or	a5,a5,a4
    430e:	01079713          	slli	a4,a5,0x10
    4312:	8341                	srli	a4,a4,0x10
    tmp0 |= (OPA_InitStruct->PSEL_POLL) | (OPA_InitStruct->BKIN_EN << 2)
    4314:	fe645783          	lhu	a5,-26(s0)
    4318:	8fd9                	or	a5,a5,a4
    431a:	fef41323          	sh	a5,-26(s0)
    tmp1 &= 0xFF00;
    431e:	fee45783          	lhu	a5,-18(s0)
    4322:	f007f793          	andi	a5,a5,-256
    4326:	fef41723          	sh	a5,-18(s0)
    tmp1 |= OPA_InitStruct->OPA_POLL_Interval;
    432a:	fdc42783          	lw	a5,-36(s0)
    432e:	0007d703          	lhu	a4,0(a5) # 20000 <_data_lma+0x13d4c>
    4332:	fee45783          	lhu	a5,-18(s0)
    4336:	8fd9                	or	a5,a5,a4
    4338:	fef41723          	sh	a5,-18(s0)

    OPA->CFGR1 = tmp0;
    433c:	400267b7          	lui	a5,0x40026
    4340:	fe645703          	lhu	a4,-26(s0)
    4344:	00e79023          	sh	a4,0(a5) # 40026000 <_eusrstack+0x20022000>
    OPA->CFGR2 = tmp1;
    4348:	400267b7          	lui	a5,0x40026
    434c:	fee45703          	lhu	a4,-18(s0)
    4350:	00e79123          	sh	a4,2(a5) # 40026002 <_eusrstack+0x20022002>
    OPA->CTLR1 = tmp2;
    4354:	400267b7          	lui	a5,0x40026
    4358:	fe842703          	lw	a4,-24(s0)
    435c:	c3d8                	sw	a4,4(a5)
}
    435e:	0001                	nop
    4360:	5432                	lw	s0,44(sp)
    4362:	6145                	addi	sp,sp,48
    4364:	8082                	ret

00004366 <OPA_StructInit>:
 * @param   OPA_StructInit - pointer to a OPA_InitTypeDef structure
 *
 * @return  none
 */
void OPA_StructInit(OPA_InitTypeDef *OPA_InitStruct)
{
    4366:	1101                	addi	sp,sp,-32
    4368:	ce22                	sw	s0,28(sp)
    436a:	1000                	addi	s0,sp,32
    436c:	fea42623          	sw	a0,-20(s0)
    OPA_InitStruct->OPA_POLL_Interval = 0;
    4370:	fec42783          	lw	a5,-20(s0)
    4374:	00079023          	sh	zero,0(a5) # 40026000 <_eusrstack+0x20022000>
    OPA_InitStruct->OPA_NUM = OPA1;
    4378:	fec42783          	lw	a5,-20(s0)
    437c:	0007a223          	sw	zero,4(a5)
    OPA_InitStruct->Mode = OUT_IO_OUT0;
    4380:	fec42783          	lw	a5,-20(s0)
    4384:	0007a423          	sw	zero,8(a5)
    OPA_InitStruct->PSEL = CHP0;
    4388:	fec42783          	lw	a5,-20(s0)
    438c:	0007a623          	sw	zero,12(a5)
    OPA_InitStruct->FB = FB_OFF;
    4390:	fec42783          	lw	a5,-20(s0)
    4394:	0007a823          	sw	zero,16(a5)
    OPA_InitStruct->NSEL = CHN0;
    4398:	fec42783          	lw	a5,-20(s0)
    439c:	0007aa23          	sw	zero,20(a5)
    OPA_InitStruct->PSEL_POLL = CHP_OPA1_OFF_OPA2_OFF;
    43a0:	fec42783          	lw	a5,-20(s0)
    43a4:	0007ac23          	sw	zero,24(a5)
    OPA_InitStruct->BKIN_EN = BKIN_OPA1_OFF_OPA2_OFF;
    43a8:	fec42783          	lw	a5,-20(s0)
    43ac:	0007ae23          	sw	zero,28(a5)
    OPA_InitStruct->RST_EN = RST_OPA1_OFF_OPA2_OFF;
    43b0:	fec42783          	lw	a5,-20(s0)
    43b4:	0207a023          	sw	zero,32(a5)
    OPA_InitStruct->BKIN_SEL = BKIN_OPA1_TIM1_OPA2_TIM2;
    43b8:	fec42783          	lw	a5,-20(s0)
    43bc:	0207a223          	sw	zero,36(a5)
    OPA_InitStruct->OUT_IE = OUT_IE_OPA1_OFF_OPA2_OFF;
    43c0:	fec42783          	lw	a5,-20(s0)
    43c4:	0207a423          	sw	zero,40(a5)
    OPA_InitStruct->CNT_IE = CNT_IE_OFF;
    43c8:	fec42783          	lw	a5,-20(s0)
    43cc:	0207a623          	sw	zero,44(a5)
    OPA_InitStruct->NMI_IE = NMI_IE_OFF;
    43d0:	fec42783          	lw	a5,-20(s0)
    43d4:	0207a823          	sw	zero,48(a5)
    OPA_InitStruct->POLL_NUM = CHP_POLL_NUM_1;
    43d8:	fec42783          	lw	a5,-20(s0)
    43dc:	0207aa23          	sw	zero,52(a5)
}
    43e0:	0001                	nop
    43e2:	4472                	lw	s0,28(sp)
    43e4:	6105                	addi	sp,sp,32
    43e6:	8082                	ret

000043e8 <OPA_Cmd>:
 *            NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void OPA_Cmd(OPA_Num_TypeDef OPA_NUM, FunctionalState NewState)
{
    43e8:	1101                	addi	sp,sp,-32
    43ea:	ce22                	sw	s0,28(sp)
    43ec:	1000                	addi	s0,sp,32
    43ee:	fea42623          	sw	a0,-20(s0)
    43f2:	feb42423          	sw	a1,-24(s0)
    if(NewState == ENABLE)
    43f6:	fe842703          	lw	a4,-24(s0)
    43fa:	4785                	li	a5,1
    43fc:	02f71163          	bne	a4,a5,441e <OPA_Cmd+0x36>
    {
        OPA->CTLR1 |= (uint32_t)(1 << (OPA_NUM*16));
    4400:	400267b7          	lui	a5,0x40026
    4404:	43d8                	lw	a4,4(a5)
    4406:	fec42783          	lw	a5,-20(s0)
    440a:	0792                	slli	a5,a5,0x4
    440c:	4685                	li	a3,1
    440e:	00f697b3          	sll	a5,a3,a5
    4412:	86be                	mv	a3,a5
    4414:	400267b7          	lui	a5,0x40026
    4418:	8f55                	or	a4,a4,a3
    441a:	c3d8                	sw	a4,4(a5)
    }
    else
    {
        OPA->CTLR1 &= ~(uint32_t)(1 << (OPA_NUM*16));
    }
}
    441c:	a005                	j	443c <OPA_Cmd+0x54>
        OPA->CTLR1 &= ~(uint32_t)(1 << (OPA_NUM*16));
    441e:	400267b7          	lui	a5,0x40026
    4422:	43d4                	lw	a3,4(a5)
    4424:	fec42783          	lw	a5,-20(s0)
    4428:	0792                	slli	a5,a5,0x4
    442a:	4705                	li	a4,1
    442c:	00f717b3          	sll	a5,a4,a5
    4430:	fff7c713          	not	a4,a5
    4434:	400267b7          	lui	a5,0x40026
    4438:	8f75                	and	a4,a4,a3
    443a:	c3d8                	sw	a4,4(a5)
}
    443c:	0001                	nop
    443e:	4472                	lw	s0,28(sp)
    4440:	6105                	addi	sp,sp,32
    4442:	8082                	ret

00004444 <OPA_CMP_Init>:
 * @param   CMP_InitStruct - pointer to a CMP_InitTypeDef structure
 *
 * @return  none
 */
void OPA_CMP_Init(CMP_InitTypeDef *CMP_InitStruct)
{
    4444:	7179                	addi	sp,sp,-48
    4446:	d622                	sw	s0,44(sp)
    4448:	1800                	addi	s0,sp,48
    444a:	fca42e23          	sw	a0,-36(s0)
    uint32_t tmp1 = 0;
    444e:	fe042623          	sw	zero,-20(s0)

    tmp1 = CTLR2_tmp;
    4452:	81c1a783          	lw	a5,-2020(gp) # 2000003c <CTLR2_tmp>
    4456:	fef42623          	sw	a5,-20(s0)

    if(CMP_InitStruct->CMP_NUM == CMP1)
    445a:	fdc42783          	lw	a5,-36(s0)
    445e:	439c                	lw	a5,0(a5)
    4460:	e3a1                	bnez	a5,44a0 <OPA_CMP_Init+0x5c>
    {
        tmp1 &= 0xFFFFFFE1;
    4462:	fec42783          	lw	a5,-20(s0)
    4466:	9b85                	andi	a5,a5,-31
    4468:	fef42623          	sw	a5,-20(s0)
        tmp1 |= (CMP_InitStruct->Mode << 1) | (CMP_InitStruct->NSEL << 2)
    446c:	fdc42783          	lw	a5,-36(s0)
    4470:	43dc                	lw	a5,4(a5)
    4472:	00179713          	slli	a4,a5,0x1
    4476:	fdc42783          	lw	a5,-36(s0)
    447a:	479c                	lw	a5,8(a5)
    447c:	078a                	slli	a5,a5,0x2
    447e:	8f5d                	or	a4,a4,a5
                | (CMP_InitStruct->PSEL << 3) | (CMP_InitStruct->HYEN << 4);
    4480:	fdc42783          	lw	a5,-36(s0)
    4484:	47dc                	lw	a5,12(a5)
    4486:	078e                	slli	a5,a5,0x3
    4488:	8f5d                	or	a4,a4,a5
    448a:	fdc42783          	lw	a5,-36(s0)
    448e:	4b9c                	lw	a5,16(a5)
    4490:	0792                	slli	a5,a5,0x4
    4492:	8fd9                	or	a5,a5,a4
        tmp1 |= (CMP_InitStruct->Mode << 1) | (CMP_InitStruct->NSEL << 2)
    4494:	fec42703          	lw	a4,-20(s0)
    4498:	8fd9                	or	a5,a5,a4
    449a:	fef42623          	sw	a5,-20(s0)
    449e:	a871                	j	453a <OPA_CMP_Init+0xf6>
    }
    else if(CMP_InitStruct->CMP_NUM == CMP2)
    44a0:	fdc42783          	lw	a5,-36(s0)
    44a4:	4398                	lw	a4,0(a5)
    44a6:	4785                	li	a5,1
    44a8:	04f71263          	bne	a4,a5,44ec <OPA_CMP_Init+0xa8>
    {
        tmp1 &= 0xFFFFFC3F;
    44ac:	fec42783          	lw	a5,-20(s0)
    44b0:	c3f7f793          	andi	a5,a5,-961
    44b4:	fef42623          	sw	a5,-20(s0)
        tmp1 |= (CMP_InitStruct->Mode << 6) | (CMP_InitStruct->NSEL << 7)
    44b8:	fdc42783          	lw	a5,-36(s0)
    44bc:	43dc                	lw	a5,4(a5)
    44be:	00679713          	slli	a4,a5,0x6
    44c2:	fdc42783          	lw	a5,-36(s0)
    44c6:	479c                	lw	a5,8(a5)
    44c8:	079e                	slli	a5,a5,0x7
    44ca:	8f5d                	or	a4,a4,a5
                | (CMP_InitStruct->PSEL << 8) | (CMP_InitStruct->HYEN << 9);
    44cc:	fdc42783          	lw	a5,-36(s0)
    44d0:	47dc                	lw	a5,12(a5)
    44d2:	07a2                	slli	a5,a5,0x8
    44d4:	8f5d                	or	a4,a4,a5
    44d6:	fdc42783          	lw	a5,-36(s0)
    44da:	4b9c                	lw	a5,16(a5)
    44dc:	07a6                	slli	a5,a5,0x9
    44de:	8fd9                	or	a5,a5,a4
        tmp1 |= (CMP_InitStruct->Mode << 6) | (CMP_InitStruct->NSEL << 7)
    44e0:	fec42703          	lw	a4,-20(s0)
    44e4:	8fd9                	or	a5,a5,a4
    44e6:	fef42623          	sw	a5,-20(s0)
    44ea:	a881                	j	453a <OPA_CMP_Init+0xf6>
    }
    else if(CMP_InitStruct->CMP_NUM == CMP3)
    44ec:	fdc42783          	lw	a5,-36(s0)
    44f0:	4398                	lw	a4,0(a5)
    44f2:	4789                	li	a5,2
    44f4:	04f71363          	bne	a4,a5,453a <OPA_CMP_Init+0xf6>
    {
        tmp1 &= 0xFFFF87FF;
    44f8:	fec42703          	lw	a4,-20(s0)
    44fc:	77e1                	lui	a5,0xffff8
    44fe:	7ff78793          	addi	a5,a5,2047 # ffff87ff <_eusrstack+0xdfff47ff>
    4502:	8ff9                	and	a5,a5,a4
    4504:	fef42623          	sw	a5,-20(s0)
        tmp1 |= (CMP_InitStruct->Mode << 11) | (CMP_InitStruct->NSEL << 12)
    4508:	fdc42783          	lw	a5,-36(s0)
    450c:	43dc                	lw	a5,4(a5)
    450e:	00b79713          	slli	a4,a5,0xb
    4512:	fdc42783          	lw	a5,-36(s0)
    4516:	479c                	lw	a5,8(a5)
    4518:	07b2                	slli	a5,a5,0xc
    451a:	8f5d                	or	a4,a4,a5
                | (CMP_InitStruct->PSEL << 13) | (CMP_InitStruct->HYEN << 14);
    451c:	fdc42783          	lw	a5,-36(s0)
    4520:	47dc                	lw	a5,12(a5)
    4522:	07b6                	slli	a5,a5,0xd
    4524:	8f5d                	or	a4,a4,a5
    4526:	fdc42783          	lw	a5,-36(s0)
    452a:	4b9c                	lw	a5,16(a5)
    452c:	07ba                	slli	a5,a5,0xe
    452e:	8fd9                	or	a5,a5,a4
        tmp1 |= (CMP_InitStruct->Mode << 11) | (CMP_InitStruct->NSEL << 12)
    4530:	fec42703          	lw	a4,-20(s0)
    4534:	8fd9                	or	a5,a5,a4
    4536:	fef42623          	sw	a5,-20(s0)
    }

    CTLR2_tmp = tmp1;
    453a:	fec42703          	lw	a4,-20(s0)
    453e:	80e1ae23          	sw	a4,-2020(gp) # 2000003c <CTLR2_tmp>
    OPA->CTLR2 = tmp1;
    4542:	400267b7          	lui	a5,0x40026
    4546:	fec42703          	lw	a4,-20(s0)
    454a:	c798                	sw	a4,8(a5)
}
    454c:	0001                	nop
    454e:	5432                	lw	s0,44(sp)
    4550:	6145                	addi	sp,sp,48
    4552:	8082                	ret

00004554 <OPA_CMP_StructInit>:
 * @param   CMP_StructInit - pointer to a OPA_CMP_StructInit structure
 *
 * @return  none
 */
void OPA_CMP_StructInit(CMP_InitTypeDef *CMP_InitStruct)
{
    4554:	1101                	addi	sp,sp,-32
    4556:	ce22                	sw	s0,28(sp)
    4558:	1000                	addi	s0,sp,32
    455a:	fea42623          	sw	a0,-20(s0)
    CMP_InitStruct->CMP_NUM = CMP1;
    455e:	fec42783          	lw	a5,-20(s0)
    4562:	0007a023          	sw	zero,0(a5) # 40026000 <_eusrstack+0x20022000>
    CMP_InitStruct->Mode = OUT_IO_TIM2;
    4566:	fec42783          	lw	a5,-20(s0)
    456a:	0007a223          	sw	zero,4(a5)
    CMP_InitStruct->NSEL = CMP_CHN0;
    456e:	fec42783          	lw	a5,-20(s0)
    4572:	0007a423          	sw	zero,8(a5)
    CMP_InitStruct->PSEL = CMP_CHP1;
    4576:	fec42783          	lw	a5,-20(s0)
    457a:	0007a623          	sw	zero,12(a5)
    CMP_InitStruct->HYEN = CMP_HYEN1;
    457e:	fec42783          	lw	a5,-20(s0)
    4582:	0007a823          	sw	zero,16(a5)
}
    4586:	0001                	nop
    4588:	4472                	lw	s0,28(sp)
    458a:	6105                	addi	sp,sp,32
    458c:	8082                	ret

0000458e <OPA_CMP_Cmd>:
 *            NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void OPA_CMP_Cmd(CMP_Num_TypeDef CMP_NUM, FunctionalState NewState)
{
    458e:	1101                	addi	sp,sp,-32
    4590:	ce22                	sw	s0,28(sp)
    4592:	1000                	addi	s0,sp,32
    4594:	fea42623          	sw	a0,-20(s0)
    4598:	feb42423          	sw	a1,-24(s0)
    if(NewState == ENABLE)
    459c:	fe842703          	lw	a4,-24(s0)
    45a0:	4785                	li	a5,1
    45a2:	02f71163          	bne	a4,a5,45c4 <OPA_CMP_Cmd+0x36>
    {
        CTLR2_tmp |= (uint32_t)(1 << (CMP_NUM*5));
    45a6:	fec42703          	lw	a4,-20(s0)
    45aa:	87ba                	mv	a5,a4
    45ac:	078a                	slli	a5,a5,0x2
    45ae:	97ba                	add	a5,a5,a4
    45b0:	4705                	li	a4,1
    45b2:	00f717b3          	sll	a5,a4,a5
    45b6:	873e                	mv	a4,a5
    45b8:	81c1a783          	lw	a5,-2020(gp) # 2000003c <CTLR2_tmp>
    45bc:	8f5d                	or	a4,a4,a5
    45be:	80e1ae23          	sw	a4,-2020(gp) # 2000003c <CTLR2_tmp>
    45c2:	a005                	j	45e2 <OPA_CMP_Cmd+0x54>
    }
    else
    {
        CTLR2_tmp &= ~(uint32_t)(1 << (CMP_NUM*5));
    45c4:	fec42703          	lw	a4,-20(s0)
    45c8:	87ba                	mv	a5,a4
    45ca:	078a                	slli	a5,a5,0x2
    45cc:	97ba                	add	a5,a5,a4
    45ce:	4705                	li	a4,1
    45d0:	00f717b3          	sll	a5,a4,a5
    45d4:	fff7c713          	not	a4,a5
    45d8:	81c1a783          	lw	a5,-2020(gp) # 2000003c <CTLR2_tmp>
    45dc:	8f7d                	and	a4,a4,a5
    45de:	80e1ae23          	sw	a4,-2020(gp) # 2000003c <CTLR2_tmp>
    }

    OPA->CTLR2 = CTLR2_tmp;
    45e2:	400267b7          	lui	a5,0x40026
    45e6:	81c1a703          	lw	a4,-2020(gp) # 2000003c <CTLR2_tmp>
    45ea:	c798                	sw	a4,8(a5)
}
    45ec:	0001                	nop
    45ee:	4472                	lw	s0,28(sp)
    45f0:	6105                	addi	sp,sp,32
    45f2:	8082                	ret

000045f4 <OPA_GetFlagStatus>:
 *            OPA_FLAG_OUT_CNT - OPA out flag rising edge of sampling data
 *
 * @return  FlagStatus: SET or RESET.
 */
FlagStatus OPA_GetFlagStatus(uint16_t OPA_FLAG)
{
    45f4:	7179                	addi	sp,sp,-48
    45f6:	d622                	sw	s0,44(sp)
    45f8:	1800                	addi	s0,sp,48
    45fa:	87aa                	mv	a5,a0
    45fc:	fcf41f23          	sh	a5,-34(s0)
    FlagStatus bitstatus = RESET;
    4600:	fe042623          	sw	zero,-20(s0)

    if((OPA->CFGR1 & OPA_FLAG) != (uint16_t)RESET)
    4604:	400267b7          	lui	a5,0x40026
    4608:	0007d783          	lhu	a5,0(a5) # 40026000 <_eusrstack+0x20022000>
    460c:	01079713          	slli	a4,a5,0x10
    4610:	8341                	srli	a4,a4,0x10
    4612:	fde45783          	lhu	a5,-34(s0)
    4616:	8ff9                	and	a5,a5,a4
    4618:	07c2                	slli	a5,a5,0x10
    461a:	83c1                	srli	a5,a5,0x10
    461c:	c789                	beqz	a5,4626 <OPA_GetFlagStatus+0x32>
    {
        bitstatus = SET;
    461e:	4785                	li	a5,1
    4620:	fef42623          	sw	a5,-20(s0)
    4624:	a019                	j	462a <OPA_GetFlagStatus+0x36>
    }
    else
    {
        bitstatus = RESET;
    4626:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    462a:	fec42783          	lw	a5,-20(s0)
}
    462e:	853e                	mv	a0,a5
    4630:	5432                	lw	s0,44(sp)
    4632:	6145                	addi	sp,sp,48
    4634:	8082                	ret

00004636 <OPA_ClearFlag>:
 *            OPA_FLAG_OUT_OPA2 - OPA2 out flag
 *            OPA_FLAG_OUT_CNT - OPA out flag rising edge of sampling data
 * @return  none
 */
void OPA_ClearFlag(uint16_t OPA_FLAG)
{
    4636:	1101                	addi	sp,sp,-32
    4638:	ce22                	sw	s0,28(sp)
    463a:	1000                	addi	s0,sp,32
    463c:	87aa                	mv	a5,a0
    463e:	fef41723          	sh	a5,-18(s0)
    OPA->CFGR1 &= (uint16_t)~OPA_FLAG;
    4642:	400267b7          	lui	a5,0x40026
    4646:	0007d783          	lhu	a5,0(a5) # 40026000 <_eusrstack+0x20022000>
    464a:	01079693          	slli	a3,a5,0x10
    464e:	82c1                	srli	a3,a3,0x10
    4650:	fee45783          	lhu	a5,-18(s0)
    4654:	fff7c793          	not	a5,a5
    4658:	01079713          	slli	a4,a5,0x10
    465c:	8341                	srli	a4,a4,0x10
    465e:	400267b7          	lui	a5,0x40026
    4662:	8f75                	and	a4,a4,a3
    4664:	0742                	slli	a4,a4,0x10
    4666:	8341                	srli	a4,a4,0x10
    4668:	00e79023          	sh	a4,0(a5) # 40026000 <_eusrstack+0x20022000>
}
    466c:	0001                	nop
    466e:	4472                	lw	s0,28(sp)
    4670:	6105                	addi	sp,sp,32
    4672:	8082                	ret

00004674 <PWR_DeInit>:
 *        reset values.
 *
 * @return  none
 */
void PWR_DeInit(void)
{
    4674:	1141                	addi	sp,sp,-16
    4676:	c606                	sw	ra,12(sp)
    4678:	c422                	sw	s0,8(sp)
    467a:	0800                	addi	s0,sp,16
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_PWR, ENABLE);
    467c:	4585                	li	a1,1
    467e:	10000537          	lui	a0,0x10000
    4682:	23b9                	jal	4bd0 <RCC_APB1PeriphResetCmd>
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_PWR, DISABLE);
    4684:	4581                	li	a1,0
    4686:	10000537          	lui	a0,0x10000
    468a:	2399                	jal	4bd0 <RCC_APB1PeriphResetCmd>
}
    468c:	0001                	nop
    468e:	40b2                	lw	ra,12(sp)
    4690:	4422                	lw	s0,8(sp)
    4692:	0141                	addi	sp,sp,16
    4694:	8082                	ret

00004696 <PWR_PVDLevelConfig>:
 *            PWR_PVDLevel_4V0 - PVD detection level set to 4.0V
 *
 * @return  none
 */
void PWR_PVDLevelConfig(uint32_t PWR_PVDLevel)
{
    4696:	7179                	addi	sp,sp,-48
    4698:	d622                	sw	s0,44(sp)
    469a:	1800                	addi	s0,sp,48
    469c:	fca42e23          	sw	a0,-36(s0)
    uint32_t tmpreg = 0;
    46a0:	fe042623          	sw	zero,-20(s0)
    tmpreg = PWR->CTLR;
    46a4:	400077b7          	lui	a5,0x40007
    46a8:	439c                	lw	a5,0(a5)
    46aa:	fef42623          	sw	a5,-20(s0)
    tmpreg &= CTLR_PLS_MASK;
    46ae:	fec42783          	lw	a5,-20(s0)
    46b2:	f9f7f793          	andi	a5,a5,-97
    46b6:	fef42623          	sw	a5,-20(s0)
    tmpreg |= PWR_PVDLevel;
    46ba:	fec42703          	lw	a4,-20(s0)
    46be:	fdc42783          	lw	a5,-36(s0)
    46c2:	8fd9                	or	a5,a5,a4
    46c4:	fef42623          	sw	a5,-20(s0)
    PWR->CTLR = tmpreg;
    46c8:	400077b7          	lui	a5,0x40007
    46cc:	fec42703          	lw	a4,-20(s0)
    46d0:	c398                	sw	a4,0(a5)
}
    46d2:	0001                	nop
    46d4:	5432                	lw	s0,44(sp)
    46d6:	6145                	addi	sp,sp,48
    46d8:	8082                	ret

000046da <PWR_EnterSTOPMode>:
 *            PWR_STOPEntry_WFE - enter STOP mode with WFE instruction
 *
 * @return  none
 */
void PWR_EnterSTOPMode(uint8_t PWR_STOPEntry)
{
    46da:	7179                	addi	sp,sp,-48
    46dc:	d622                	sw	s0,44(sp)
    46de:	1800                	addi	s0,sp,48
    46e0:	87aa                	mv	a5,a0
    46e2:	fcf40fa3          	sb	a5,-33(s0)
    uint32_t tmpreg = 0;
    46e6:	fe042623          	sw	zero,-20(s0)
    tmpreg = PWR->CTLR;
    46ea:	400077b7          	lui	a5,0x40007
    46ee:	439c                	lw	a5,0(a5)
    46f0:	fef42623          	sw	a5,-20(s0)
    tmpreg &= CTLR_DS_MASK;
    46f4:	fec42783          	lw	a5,-20(s0)
    46f8:	9bf5                	andi	a5,a5,-3
    46fa:	fef42623          	sw	a5,-20(s0)
    PWR->CTLR = tmpreg;
    46fe:	400077b7          	lui	a5,0x40007
    4702:	fec42703          	lw	a4,-20(s0)
    4706:	c398                	sw	a4,0(a5)

    NVIC->SCTLR |= (1 << 2);
    4708:	e000e737          	lui	a4,0xe000e
    470c:	6785                	lui	a5,0x1
    470e:	97ba                	add	a5,a5,a4
    4710:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    4714:	e000e6b7          	lui	a3,0xe000e
    4718:	0047e713          	ori	a4,a5,4
    471c:	6785                	lui	a5,0x1
    471e:	97b6                	add	a5,a5,a3
    4720:	d0e7a823          	sw	a4,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>

    if(PWR_STOPEntry == PWR_STOPEntry_WFI)
    4724:	fdf44703          	lbu	a4,-33(s0)
    4728:	4785                	li	a5,1
    472a:	02f71363          	bne	a4,a5,4750 <PWR_EnterSTOPMode+0x76>
 *
 * @return  none
 */
__attribute__( ( always_inline ) ) RV_STATIC_INLINE void __WFI(void)
{
  NVIC->SCTLR &= ~(1<<3);	// wfi
    472e:	e000e737          	lui	a4,0xe000e
    4732:	6785                	lui	a5,0x1
    4734:	97ba                	add	a5,a5,a4
    4736:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    473a:	e000e6b7          	lui	a3,0xe000e
    473e:	ff77f713          	andi	a4,a5,-9
    4742:	6785                	lui	a5,0x1
    4744:	97b6                	add	a5,a5,a3
    4746:	d0e7a823          	sw	a4,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
  __asm volatile ("wfi");
    474a:	10500073          	wfi
    474e:	a851                	j	47e2 <PWR_EnterSTOPMode+0x108>
 */
__attribute__( ( always_inline ) ) RV_STATIC_INLINE void _SEV(void)
{
  uint32_t t;

  t = NVIC->SCTLR;
    4750:	e000e737          	lui	a4,0xe000e
    4754:	6785                	lui	a5,0x1
    4756:	97ba                	add	a5,a5,a4
    4758:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    475c:	fef42423          	sw	a5,-24(s0)
  NVIC->SCTLR |= (1<<3)|(1<<5);
    4760:	e000e737          	lui	a4,0xe000e
    4764:	6785                	lui	a5,0x1
    4766:	97ba                	add	a5,a5,a4
    4768:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    476c:	e000e6b7          	lui	a3,0xe000e
    4770:	0287e713          	ori	a4,a5,40
    4774:	6785                	lui	a5,0x1
    4776:	97b6                	add	a5,a5,a3
    4778:	d0e7a823          	sw	a4,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
  NVIC->SCTLR = (NVIC->SCTLR & ~(1<<5)) | ( t & (1<<5));
    477c:	e000e737          	lui	a4,0xe000e
    4780:	6785                	lui	a5,0x1
    4782:	97ba                	add	a5,a5,a4
    4784:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    4788:	fdf7f713          	andi	a4,a5,-33
    478c:	fe842783          	lw	a5,-24(s0)
    4790:	0207f793          	andi	a5,a5,32
    4794:	e000e6b7          	lui	a3,0xe000e
    4798:	8f5d                	or	a4,a4,a5
    479a:	6785                	lui	a5,0x1
    479c:	97b6                	add	a5,a5,a3
    479e:	d0e7a823          	sw	a4,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
 *
 * @return  none
 */
__attribute__( ( always_inline ) ) RV_STATIC_INLINE void _WFE(void)
{
  NVIC->SCTLR |= (1<<3);
    47a2:	e000e737          	lui	a4,0xe000e
    47a6:	6785                	lui	a5,0x1
    47a8:	97ba                	add	a5,a5,a4
    47aa:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    47ae:	e000e6b7          	lui	a3,0xe000e
    47b2:	0087e713          	ori	a4,a5,8
    47b6:	6785                	lui	a5,0x1
    47b8:	97b6                	add	a5,a5,a3
    47ba:	d0e7a823          	sw	a4,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
  __asm volatile ("wfi");
    47be:	10500073          	wfi
  NVIC->SCTLR |= (1<<3);
    47c2:	e000e737          	lui	a4,0xe000e
    47c6:	6785                	lui	a5,0x1
    47c8:	97ba                	add	a5,a5,a4
    47ca:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    47ce:	e000e6b7          	lui	a3,0xe000e
    47d2:	0087e713          	ori	a4,a5,8
    47d6:	6785                	lui	a5,0x1
    47d8:	97b6                	add	a5,a5,a3
    47da:	d0e7a823          	sw	a4,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
  __asm volatile ("wfi");
    47de:	10500073          	wfi
    else
    {
        __WFE();
    }

    NVIC->SCTLR &= ~(1 << 2);
    47e2:	e000e737          	lui	a4,0xe000e
    47e6:	6785                	lui	a5,0x1
    47e8:	97ba                	add	a5,a5,a4
    47ea:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    47ee:	e000e6b7          	lui	a3,0xe000e
    47f2:	ffb7f713          	andi	a4,a5,-5
    47f6:	6785                	lui	a5,0x1
    47f8:	97b6                	add	a5,a5,a3
    47fa:	d0e7a823          	sw	a4,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
}
    47fe:	0001                	nop
    4800:	5432                	lw	s0,44(sp)
    4802:	6145                	addi	sp,sp,48
    4804:	8082                	ret

00004806 <PWR_EnterSTANDBYMode>:
 * @brief   Enters STANDBY mode.
 *
 * @return  none
 */
void PWR_EnterSTANDBYMode(void)
{
    4806:	1141                	addi	sp,sp,-16
    4808:	c622                	sw	s0,12(sp)
    480a:	0800                	addi	s0,sp,16
    PWR->CTLR |= PWR_CTLR_PDDS;
    480c:	400077b7          	lui	a5,0x40007
    4810:	4398                	lw	a4,0(a5)
    4812:	400077b7          	lui	a5,0x40007
    4816:	00276713          	ori	a4,a4,2
    481a:	c398                	sw	a4,0(a5)
    NVIC->SCTLR |= (1 << 2);
    481c:	e000e737          	lui	a4,0xe000e
    4820:	6785                	lui	a5,0x1
    4822:	97ba                	add	a5,a5,a4
    4824:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    4828:	e000e6b7          	lui	a3,0xe000e
    482c:	0047e713          	ori	a4,a5,4
    4830:	6785                	lui	a5,0x1
    4832:	97b6                	add	a5,a5,a3
    4834:	d0e7a823          	sw	a4,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
  NVIC->SCTLR &= ~(1<<3);	// wfi
    4838:	e000e737          	lui	a4,0xe000e
    483c:	6785                	lui	a5,0x1
    483e:	97ba                	add	a5,a5,a4
    4840:	d107a783          	lw	a5,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
    4844:	e000e6b7          	lui	a3,0xe000e
    4848:	ff77f713          	andi	a4,a5,-9
    484c:	6785                	lui	a5,0x1
    484e:	97b6                	add	a5,a5,a3
    4850:	d0e7a823          	sw	a4,-752(a5) # d10 <ADC_InjectedChannelConfig+0x14c>
  __asm volatile ("wfi");
    4854:	10500073          	wfi

    __WFI();
}
    4858:	0001                	nop
    485a:	4432                	lw	s0,12(sp)
    485c:	0141                	addi	sp,sp,16
    485e:	8082                	ret

00004860 <PWR_GetFlagStatus>:
 *            PWR_FLAG_FLASH - Flash low power flag
 *
 * @return  The new state of PWR_FLAG (SET or RESET).
 */
FlagStatus PWR_GetFlagStatus(uint32_t PWR_FLAG)
{
    4860:	7179                	addi	sp,sp,-48
    4862:	d622                	sw	s0,44(sp)
    4864:	1800                	addi	s0,sp,48
    4866:	fca42e23          	sw	a0,-36(s0)
    FlagStatus bitstatus = RESET;
    486a:	fe042623          	sw	zero,-20(s0)

    if((PWR->CSR & PWR_FLAG) != (uint32_t)RESET)
    486e:	400077b7          	lui	a5,0x40007
    4872:	43d8                	lw	a4,4(a5)
    4874:	fdc42783          	lw	a5,-36(s0)
    4878:	8ff9                	and	a5,a5,a4
    487a:	c789                	beqz	a5,4884 <PWR_GetFlagStatus+0x24>
    {
        bitstatus = SET;
    487c:	4785                	li	a5,1
    487e:	fef42623          	sw	a5,-20(s0)
    4882:	a019                	j	4888 <PWR_GetFlagStatus+0x28>
    }
    else
    {
        bitstatus = RESET;
    4884:	fe042623          	sw	zero,-20(s0)
    }
    return bitstatus;
    4888:	fec42783          	lw	a5,-20(s0)
}
    488c:	853e                	mv	a0,a5
    488e:	5432                	lw	s0,44(sp)
    4890:	6145                	addi	sp,sp,48
    4892:	8082                	ret

00004894 <PWR_VDD_SupplyVoltage>:
 * @return  PWR_VDD - VDD Supply Voltage.
 *            PWR_VDD_5V - VDD = 5V
 *            PWR_VDD_3V3 - VDD = 3.3V
 */
PWR_VDD PWR_VDD_SupplyVoltage(void)
{
    4894:	1101                	addi	sp,sp,-32
    4896:	ce22                	sw	s0,28(sp)
    4898:	1000                	addi	s0,sp,32
    PWR_VDD VDD_Voltage = PWR_VDD_5V;
    489a:	fe042623          	sw	zero,-20(s0)

    if((*((uint32_t*)0x08000014)) == 0x0057FFFF)
    489e:	080007b7          	lui	a5,0x8000
    48a2:	07d1                	addi	a5,a5,20
    48a4:	4398                	lw	a4,0(a5)
    48a6:	005807b7          	lui	a5,0x580
    48aa:	17fd                	addi	a5,a5,-1
    48ac:	00f71563          	bne	a4,a5,48b6 <PWR_VDD_SupplyVoltage+0x22>
    {
        VDD_Voltage = PWR_VDD_3V3;
    48b0:	4785                	li	a5,1
    48b2:	fef42623          	sw	a5,-20(s0)
    }

    return VDD_Voltage;
    48b6:	fec42783          	lw	a5,-20(s0)
}
    48ba:	853e                	mv	a0,a5
    48bc:	4472                	lw	s0,28(sp)
    48be:	6105                	addi	sp,sp,32
    48c0:	8082                	ret

000048c2 <RCC_DeInit>:
 *          Note-
 *          HSE can not be stopped if it is used directly or through the PLL as system clock.
 * @return  none
 */
void RCC_DeInit(void)
{
    48c2:	1141                	addi	sp,sp,-16
    48c4:	c622                	sw	s0,12(sp)
    48c6:	0800                	addi	s0,sp,16
    RCC->CTLR |= (uint32_t)0x00000001;
    48c8:	400217b7          	lui	a5,0x40021
    48cc:	4398                	lw	a4,0(a5)
    48ce:	400217b7          	lui	a5,0x40021
    48d2:	00176713          	ori	a4,a4,1
    48d6:	c398                	sw	a4,0(a5)
    RCC->CFGR0 |= (uint32_t)0x00000050;
    48d8:	400217b7          	lui	a5,0x40021
    48dc:	43d8                	lw	a4,4(a5)
    48de:	400217b7          	lui	a5,0x40021
    48e2:	05076713          	ori	a4,a4,80
    48e6:	c3d8                	sw	a4,4(a5)
    RCC->CFGR0 &= (uint32_t)0xF8FFFF5F;
    48e8:	400217b7          	lui	a5,0x40021
    48ec:	43d4                	lw	a3,4(a5)
    48ee:	400217b7          	lui	a5,0x40021
    48f2:	f9000737          	lui	a4,0xf9000
    48f6:	f5f70713          	addi	a4,a4,-161 # f8ffff5f <_eusrstack+0xd8ffbf5f>
    48fa:	8f75                	and	a4,a4,a3
    48fc:	c3d8                	sw	a4,4(a5)
}
    48fe:	0001                	nop
    4900:	4432                	lw	s0,12(sp)
    4902:	0141                	addi	sp,sp,16
    4904:	8082                	ret

00004906 <RCC_AdjustHSICalibrationValue>:
 *                    This parameter must be a number between 0 and 0x1F.
 *
 * @return  none
 */
void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue)
{
    4906:	7179                	addi	sp,sp,-48
    4908:	d622                	sw	s0,44(sp)
    490a:	1800                	addi	s0,sp,48
    490c:	87aa                	mv	a5,a0
    490e:	fcf40fa3          	sb	a5,-33(s0)
  uint32_t tmpreg = 0;
    4912:	fe042623          	sw	zero,-20(s0)

  tmpreg = RCC->CTLR;
    4916:	400217b7          	lui	a5,0x40021
    491a:	439c                	lw	a5,0(a5)
    491c:	fef42623          	sw	a5,-20(s0)
  tmpreg &= CTLR_HSITRIM_Mask;
    4920:	fec42783          	lw	a5,-20(s0)
    4924:	f077f793          	andi	a5,a5,-249
    4928:	fef42623          	sw	a5,-20(s0)
  tmpreg |= (uint32_t)HSICalibrationValue << 3;
    492c:	fdf44783          	lbu	a5,-33(s0)
    4930:	078e                	slli	a5,a5,0x3
    4932:	fec42703          	lw	a4,-20(s0)
    4936:	8fd9                	or	a5,a5,a4
    4938:	fef42623          	sw	a5,-20(s0)
  RCC->CTLR = tmpreg;
    493c:	400217b7          	lui	a5,0x40021
    4940:	fec42703          	lw	a4,-20(s0)
    4944:	c398                	sw	a4,0(a5)
}
    4946:	0001                	nop
    4948:	5432                	lw	s0,44(sp)
    494a:	6145                	addi	sp,sp,48
    494c:	8082                	ret

0000494e <RCC_HSICmd>:
 * @param   NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void RCC_HSICmd(FunctionalState NewState)
{
    494e:	1101                	addi	sp,sp,-32
    4950:	ce22                	sw	s0,28(sp)
    4952:	1000                	addi	s0,sp,32
    4954:	fea42623          	sw	a0,-20(s0)
	if(NewState)
    4958:	fec42783          	lw	a5,-20(s0)
    495c:	cb91                	beqz	a5,4970 <RCC_HSICmd+0x22>
	{
		RCC->CTLR |= (1<<0);
    495e:	400217b7          	lui	a5,0x40021
    4962:	4398                	lw	a4,0(a5)
    4964:	400217b7          	lui	a5,0x40021
    4968:	00176713          	ori	a4,a4,1
    496c:	c398                	sw	a4,0(a5)
	}
	else{
		RCC->CTLR &= ~(1<<0);		
	}
}
    496e:	a801                	j	497e <RCC_HSICmd+0x30>
		RCC->CTLR &= ~(1<<0);		
    4970:	400217b7          	lui	a5,0x40021
    4974:	4398                	lw	a4,0(a5)
    4976:	400217b7          	lui	a5,0x40021
    497a:	9b79                	andi	a4,a4,-2
    497c:	c398                	sw	a4,0(a5)
}
    497e:	0001                	nop
    4980:	4472                	lw	s0,28(sp)
    4982:	6105                	addi	sp,sp,32
    4984:	8082                	ret

00004986 <RCC_HCLKConfig>:
 *            RCC_SYSCLK_Div256 - AHB clock = SYSCLK/256.
 *
 * @return  none
 */
void RCC_HCLKConfig(uint32_t RCC_SYSCLK)
{
    4986:	7179                	addi	sp,sp,-48
    4988:	d622                	sw	s0,44(sp)
    498a:	1800                	addi	s0,sp,48
    498c:	fca42e23          	sw	a0,-36(s0)
  uint32_t tmpreg = 0;
    4990:	fe042623          	sw	zero,-20(s0)

  tmpreg = RCC->CFGR0;
    4994:	400217b7          	lui	a5,0x40021
    4998:	43dc                	lw	a5,4(a5)
    499a:	fef42623          	sw	a5,-20(s0)
  tmpreg &= CFGR0_HPRE_Reset_Mask;
    499e:	fec42783          	lw	a5,-20(s0)
    49a2:	f0f7f793          	andi	a5,a5,-241
    49a6:	fef42623          	sw	a5,-20(s0)
  tmpreg |= RCC_SYSCLK;
    49aa:	fec42703          	lw	a4,-20(s0)
    49ae:	fdc42783          	lw	a5,-36(s0)
    49b2:	8fd9                	or	a5,a5,a4
    49b4:	fef42623          	sw	a5,-20(s0)
  RCC->CFGR0 = tmpreg;
    49b8:	400217b7          	lui	a5,0x40021
    49bc:	fec42703          	lw	a4,-20(s0)
    49c0:	c3d8                	sw	a4,4(a5)
}
    49c2:	0001                	nop
    49c4:	5432                	lw	s0,44(sp)
    49c6:	6145                	addi	sp,sp,48
    49c8:	8082                	ret

000049ca <RCC_GetClocksFreq>:
 *        the clocks frequencies.
 *
 * @return  none
 */
void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks)
{
    49ca:	7179                	addi	sp,sp,-48
    49cc:	d622                	sw	s0,44(sp)
    49ce:	1800                	addi	s0,sp,48
    49d0:	fca42e23          	sw	a0,-36(s0)
    uint32_t tmp = 0, presc = 0;
    49d4:	fe042623          	sw	zero,-20(s0)
    49d8:	fe042423          	sw	zero,-24(s0)

    RCC_Clocks->SYSCLK_Frequency = HSI_VALUE;
    49dc:	fdc42783          	lw	a5,-36(s0)
    49e0:	02dc7737          	lui	a4,0x2dc7
    49e4:	c0070713          	addi	a4,a4,-1024 # 2dc6c00 <_data_lma+0x2dba94c>
    49e8:	c398                	sw	a4,0(a5)

    tmp = RCC->CFGR0 & CFGR0_HPRE_Set_Mask;
    49ea:	400217b7          	lui	a5,0x40021
    49ee:	43dc                	lw	a5,4(a5)
    49f0:	0f07f793          	andi	a5,a5,240
    49f4:	fef42623          	sw	a5,-20(s0)
    tmp = tmp >> 4;
    49f8:	fec42783          	lw	a5,-20(s0)
    49fc:	8391                	srli	a5,a5,0x4
    49fe:	fef42623          	sw	a5,-20(s0)
    presc = APBAHBPrescTable[tmp];
    4a02:	200007b7          	lui	a5,0x20000
    4a06:	01078713          	addi	a4,a5,16 # 20000010 <APBAHBPrescTable>
    4a0a:	fec42783          	lw	a5,-20(s0)
    4a0e:	97ba                	add	a5,a5,a4
    4a10:	0007c783          	lbu	a5,0(a5)
    4a14:	0ff7f793          	andi	a5,a5,255
    4a18:	fef42423          	sw	a5,-24(s0)

    if(((RCC->CFGR0 & CFGR0_HPRE_Set_Mask) >> 4) < 8)
    4a1c:	400217b7          	lui	a5,0x40021
    4a20:	43dc                	lw	a5,4(a5)
    4a22:	0807f793          	andi	a5,a5,128
    4a26:	ef81                	bnez	a5,4a3e <RCC_GetClocksFreq+0x74>
    {
        RCC_Clocks->HCLK_Frequency = RCC_Clocks->SYSCLK_Frequency / presc;
    4a28:	fdc42783          	lw	a5,-36(s0)
    4a2c:	4398                	lw	a4,0(a5)
    4a2e:	fe842783          	lw	a5,-24(s0)
    4a32:	02f75733          	divu	a4,a4,a5
    4a36:	fdc42783          	lw	a5,-36(s0)
    4a3a:	c3d8                	sw	a4,4(a5)
    4a3c:	a819                	j	4a52 <RCC_GetClocksFreq+0x88>
    }
    else
    {
        RCC_Clocks->HCLK_Frequency = RCC_Clocks->SYSCLK_Frequency >> presc;
    4a3e:	fdc42783          	lw	a5,-36(s0)
    4a42:	4398                	lw	a4,0(a5)
    4a44:	fe842783          	lw	a5,-24(s0)
    4a48:	00f75733          	srl	a4,a4,a5
    4a4c:	fdc42783          	lw	a5,-36(s0)
    4a50:	c3d8                	sw	a4,4(a5)
    }

    RCC_Clocks->PCLK1_Frequency = RCC_Clocks->HCLK_Frequency;
    4a52:	fdc42783          	lw	a5,-36(s0)
    4a56:	43d8                	lw	a4,4(a5)
    4a58:	fdc42783          	lw	a5,-36(s0)
    4a5c:	c798                	sw	a4,8(a5)
    RCC_Clocks->PCLK2_Frequency = RCC_Clocks->HCLK_Frequency;
    4a5e:	fdc42783          	lw	a5,-36(s0)
    4a62:	43d8                	lw	a4,4(a5)
    4a64:	fdc42783          	lw	a5,-36(s0)
    4a68:	c7d8                	sw	a4,12(a5)
}
    4a6a:	0001                	nop
    4a6c:	5432                	lw	s0,44(sp)
    4a6e:	6145                	addi	sp,sp,48
    4a70:	8082                	ret

00004a72 <RCC_AHBPeriphClockCmd>:
 *          NewState: ENABLE or DISABLE.
 *
 * @return  none
 */
void RCC_AHBPeriphClockCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState)
{
    4a72:	1101                	addi	sp,sp,-32
    4a74:	ce22                	sw	s0,28(sp)
    4a76:	1000                	addi	s0,sp,32
    4a78:	fea42623          	sw	a0,-20(s0)
    4a7c:	feb42423          	sw	a1,-24(s0)
  if (NewState != DISABLE)
    4a80:	fe842783          	lw	a5,-24(s0)
    4a84:	cb99                	beqz	a5,4a9a <RCC_AHBPeriphClockCmd+0x28>
  {
    RCC->AHBPCENR |= RCC_AHBPeriph;
    4a86:	400217b7          	lui	a5,0x40021
    4a8a:	4bd4                	lw	a3,20(a5)
    4a8c:	400217b7          	lui	a5,0x40021
    4a90:	fec42703          	lw	a4,-20(s0)
    4a94:	8f55                	or	a4,a4,a3
    4a96:	cbd8                	sw	a4,20(a5)
  }
  else
  {
    RCC->AHBPCENR &= ~RCC_AHBPeriph;
  }
}
    4a98:	a821                	j	4ab0 <RCC_AHBPeriphClockCmd+0x3e>
    RCC->AHBPCENR &= ~RCC_AHBPeriph;
    4a9a:	400217b7          	lui	a5,0x40021
    4a9e:	4bd4                	lw	a3,20(a5)
    4aa0:	fec42783          	lw	a5,-20(s0)
    4aa4:	fff7c713          	not	a4,a5
    4aa8:	400217b7          	lui	a5,0x40021
    4aac:	8f75                	and	a4,a4,a3
    4aae:	cbd8                	sw	a4,20(a5)
}
    4ab0:	0001                	nop
    4ab2:	4472                	lw	s0,28(sp)
    4ab4:	6105                	addi	sp,sp,32
    4ab6:	8082                	ret

00004ab8 <RCC_APB2PeriphClockCmd>:
 *          NewState - ENABLE or DISABLE
 *
 * @return  none
 */
void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
{
    4ab8:	1101                	addi	sp,sp,-32
    4aba:	ce22                	sw	s0,28(sp)
    4abc:	1000                	addi	s0,sp,32
    4abe:	fea42623          	sw	a0,-20(s0)
    4ac2:	feb42423          	sw	a1,-24(s0)
  if (NewState != DISABLE)
    4ac6:	fe842783          	lw	a5,-24(s0)
    4aca:	cb99                	beqz	a5,4ae0 <RCC_APB2PeriphClockCmd+0x28>
  {
    RCC->APB2PCENR |= RCC_APB2Periph;
    4acc:	400217b7          	lui	a5,0x40021
    4ad0:	4f94                	lw	a3,24(a5)
    4ad2:	400217b7          	lui	a5,0x40021
    4ad6:	fec42703          	lw	a4,-20(s0)
    4ada:	8f55                	or	a4,a4,a3
    4adc:	cf98                	sw	a4,24(a5)
  }
  else
  {
    RCC->APB2PCENR &= ~RCC_APB2Periph;
  }
}
    4ade:	a821                	j	4af6 <RCC_APB2PeriphClockCmd+0x3e>
    RCC->APB2PCENR &= ~RCC_APB2Periph;
    4ae0:	400217b7          	lui	a5,0x40021
    4ae4:	4f94                	lw	a3,24(a5)
    4ae6:	fec42783          	lw	a5,-20(s0)
    4aea:	fff7c713          	not	a4,a5
    4aee:	400217b7          	lui	a5,0x40021
    4af2:	8f75                	and	a4,a4,a3
    4af4:	cf98                	sw	a4,24(a5)
}
    4af6:	0001                	nop
    4af8:	4472                	lw	s0,28(sp)
    4afa:	6105                	addi	sp,sp,32
    4afc:	8082                	ret

00004afe <RCC_APB1PeriphClockCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
{
    4afe:	1101                	addi	sp,sp,-32
    4b00:	ce22                	sw	s0,28(sp)
    4b02:	1000                	addi	s0,sp,32
    4b04:	fea42623          	sw	a0,-20(s0)
    4b08:	feb42423          	sw	a1,-24(s0)
  if (NewState != DISABLE)
    4b0c:	fe842783          	lw	a5,-24(s0)
    4b10:	cb99                	beqz	a5,4b26 <RCC_APB1PeriphClockCmd+0x28>
  {
    RCC->APB1PCENR |= RCC_APB1Periph;
    4b12:	400217b7          	lui	a5,0x40021
    4b16:	4fd4                	lw	a3,28(a5)
    4b18:	400217b7          	lui	a5,0x40021
    4b1c:	fec42703          	lw	a4,-20(s0)
    4b20:	8f55                	or	a4,a4,a3
    4b22:	cfd8                	sw	a4,28(a5)
  }
  else
  {
    RCC->APB1PCENR &= ~RCC_APB1Periph;
  }
}
    4b24:	a821                	j	4b3c <RCC_APB1PeriphClockCmd+0x3e>
    RCC->APB1PCENR &= ~RCC_APB1Periph;
    4b26:	400217b7          	lui	a5,0x40021
    4b2a:	4fd4                	lw	a3,28(a5)
    4b2c:	fec42783          	lw	a5,-20(s0)
    4b30:	fff7c713          	not	a4,a5
    4b34:	400217b7          	lui	a5,0x40021
    4b38:	8f75                	and	a4,a4,a3
    4b3a:	cfd8                	sw	a4,28(a5)
}
    4b3c:	0001                	nop
    4b3e:	4472                	lw	s0,28(sp)
    4b40:	6105                	addi	sp,sp,32
    4b42:	8082                	ret

00004b44 <RCC_AHBPeriphResetCmd>:
 *          NewState: ENABLE or DISABLE.
 *
 * @return  none
 */
void RCC_AHBPeriphResetCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState)
{
    4b44:	1101                	addi	sp,sp,-32
    4b46:	ce22                	sw	s0,28(sp)
    4b48:	1000                	addi	s0,sp,32
    4b4a:	fea42623          	sw	a0,-20(s0)
    4b4e:	feb42423          	sw	a1,-24(s0)
  if (NewState != DISABLE)
    4b52:	fe842783          	lw	a5,-24(s0)
    4b56:	cb99                	beqz	a5,4b6c <RCC_AHBPeriphResetCmd+0x28>
  {
    RCC->AHBPCENR |= RCC_AHBPeriph;
    4b58:	400217b7          	lui	a5,0x40021
    4b5c:	4bd4                	lw	a3,20(a5)
    4b5e:	400217b7          	lui	a5,0x40021
    4b62:	fec42703          	lw	a4,-20(s0)
    4b66:	8f55                	or	a4,a4,a3
    4b68:	cbd8                	sw	a4,20(a5)
  }
  else
  {
    RCC->AHBPCENR &= ~RCC_AHBPeriph;
  }
}
    4b6a:	a821                	j	4b82 <RCC_AHBPeriphResetCmd+0x3e>
    RCC->AHBPCENR &= ~RCC_AHBPeriph;
    4b6c:	400217b7          	lui	a5,0x40021
    4b70:	4bd4                	lw	a3,20(a5)
    4b72:	fec42783          	lw	a5,-20(s0)
    4b76:	fff7c713          	not	a4,a5
    4b7a:	400217b7          	lui	a5,0x40021
    4b7e:	8f75                	and	a4,a4,a3
    4b80:	cbd8                	sw	a4,20(a5)
}
    4b82:	0001                	nop
    4b84:	4472                	lw	s0,28(sp)
    4b86:	6105                	addi	sp,sp,32
    4b88:	8082                	ret

00004b8a <RCC_APB2PeriphResetCmd>:
 *          NewState - ENABLE or DISABLE
 *
 * @return  none
 */
void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
{
    4b8a:	1101                	addi	sp,sp,-32
    4b8c:	ce22                	sw	s0,28(sp)
    4b8e:	1000                	addi	s0,sp,32
    4b90:	fea42623          	sw	a0,-20(s0)
    4b94:	feb42423          	sw	a1,-24(s0)
  if (NewState != DISABLE)
    4b98:	fe842783          	lw	a5,-24(s0)
    4b9c:	cb99                	beqz	a5,4bb2 <RCC_APB2PeriphResetCmd+0x28>
  {
    RCC->APB2PRSTR |= RCC_APB2Periph;
    4b9e:	400217b7          	lui	a5,0x40021
    4ba2:	47d4                	lw	a3,12(a5)
    4ba4:	400217b7          	lui	a5,0x40021
    4ba8:	fec42703          	lw	a4,-20(s0)
    4bac:	8f55                	or	a4,a4,a3
    4bae:	c7d8                	sw	a4,12(a5)
  }
  else
  {
    RCC->APB2PRSTR &= ~RCC_APB2Periph;
  }
}
    4bb0:	a821                	j	4bc8 <RCC_APB2PeriphResetCmd+0x3e>
    RCC->APB2PRSTR &= ~RCC_APB2Periph;
    4bb2:	400217b7          	lui	a5,0x40021
    4bb6:	47d4                	lw	a3,12(a5)
    4bb8:	fec42783          	lw	a5,-20(s0)
    4bbc:	fff7c713          	not	a4,a5
    4bc0:	400217b7          	lui	a5,0x40021
    4bc4:	8f75                	and	a4,a4,a3
    4bc6:	c7d8                	sw	a4,12(a5)
}
    4bc8:	0001                	nop
    4bca:	4472                	lw	s0,28(sp)
    4bcc:	6105                	addi	sp,sp,32
    4bce:	8082                	ret

00004bd0 <RCC_APB1PeriphResetCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
{
    4bd0:	1101                	addi	sp,sp,-32
    4bd2:	ce22                	sw	s0,28(sp)
    4bd4:	1000                	addi	s0,sp,32
    4bd6:	fea42623          	sw	a0,-20(s0)
    4bda:	feb42423          	sw	a1,-24(s0)
  if (NewState != DISABLE)
    4bde:	fe842783          	lw	a5,-24(s0)
    4be2:	cb99                	beqz	a5,4bf8 <RCC_APB1PeriphResetCmd+0x28>
  {
    RCC->APB1PRSTR |= RCC_APB1Periph;
    4be4:	400217b7          	lui	a5,0x40021
    4be8:	4b94                	lw	a3,16(a5)
    4bea:	400217b7          	lui	a5,0x40021
    4bee:	fec42703          	lw	a4,-20(s0)
    4bf2:	8f55                	or	a4,a4,a3
    4bf4:	cb98                	sw	a4,16(a5)
  }
  else
  {
    RCC->APB1PRSTR &= ~RCC_APB1Periph;
  }
}
    4bf6:	a821                	j	4c0e <RCC_APB1PeriphResetCmd+0x3e>
    RCC->APB1PRSTR &= ~RCC_APB1Periph;
    4bf8:	400217b7          	lui	a5,0x40021
    4bfc:	4b94                	lw	a3,16(a5)
    4bfe:	fec42783          	lw	a5,-20(s0)
    4c02:	fff7c713          	not	a4,a5
    4c06:	400217b7          	lui	a5,0x40021
    4c0a:	8f75                	and	a4,a4,a3
    4c0c:	cb98                	sw	a4,16(a5)
}
    4c0e:	0001                	nop
    4c10:	4472                	lw	s0,28(sp)
    4c12:	6105                	addi	sp,sp,32
    4c14:	8082                	ret

00004c16 <RCC_MCOConfig>:
 *            RCC_MCO_HSI - HSI oscillator clock selected.
 *
 * @return  none
 */
void RCC_MCOConfig(uint8_t RCC_MCO)
{
    4c16:	1101                	addi	sp,sp,-32
    4c18:	ce22                	sw	s0,28(sp)
    4c1a:	1000                	addi	s0,sp,32
    4c1c:	87aa                	mv	a5,a0
    4c1e:	fef407a3          	sb	a5,-17(s0)
  *(__IO uint8_t *) CFGR0_BYTE4_ADDRESS = RCC_MCO;
    4c22:	400217b7          	lui	a5,0x40021
    4c26:	079d                	addi	a5,a5,7
    4c28:	fef44703          	lbu	a4,-17(s0)
    4c2c:	00e78023          	sb	a4,0(a5) # 40021000 <_eusrstack+0x2001d000>
}
    4c30:	0001                	nop
    4c32:	4472                	lw	s0,28(sp)
    4c34:	6105                	addi	sp,sp,32
    4c36:	8082                	ret

00004c38 <RCC_GetFlagStatus>:
 *            RCC_FLAG_LPWRRST - Low Power reset.
 *
 * @return  FlagStatus - SET or RESET.
 */
FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG)
{
    4c38:	7179                	addi	sp,sp,-48
    4c3a:	d622                	sw	s0,44(sp)
    4c3c:	1800                	addi	s0,sp,48
    4c3e:	87aa                	mv	a5,a0
    4c40:	fcf40fa3          	sb	a5,-33(s0)
  uint32_t tmp = 0;
    4c44:	fe042223          	sw	zero,-28(s0)
  uint32_t statusreg = 0;
    4c48:	fe042623          	sw	zero,-20(s0)
	
  FlagStatus bitstatus = RESET;
    4c4c:	fe042423          	sw	zero,-24(s0)
  tmp = RCC_FLAG >> 5;
    4c50:	fdf44783          	lbu	a5,-33(s0)
    4c54:	8395                	srli	a5,a5,0x5
    4c56:	0ff7f793          	andi	a5,a5,255
    4c5a:	fef42223          	sw	a5,-28(s0)
	
  if (tmp == 1)            
    4c5e:	fe442703          	lw	a4,-28(s0)
    4c62:	4785                	li	a5,1
    4c64:	00f71863          	bne	a4,a5,4c74 <RCC_GetFlagStatus+0x3c>
  {
    statusreg = RCC->CTLR;
    4c68:	400217b7          	lui	a5,0x40021
    4c6c:	439c                	lw	a5,0(a5)
    4c6e:	fef42623          	sw	a5,-20(s0)
    4c72:	a031                	j	4c7e <RCC_GetFlagStatus+0x46>
  }
  else                    
  {
    statusreg = RCC->RSTSCKR;
    4c74:	400217b7          	lui	a5,0x40021
    4c78:	53dc                	lw	a5,36(a5)
    4c7a:	fef42623          	sw	a5,-20(s0)
  }

  tmp = RCC_FLAG & FLAG_Mask;
    4c7e:	fdf44783          	lbu	a5,-33(s0)
    4c82:	8bfd                	andi	a5,a5,31
    4c84:	fef42223          	sw	a5,-28(s0)
	
  if ((statusreg & ((uint32_t)1 << tmp)) != (uint32_t)RESET)
    4c88:	fe442783          	lw	a5,-28(s0)
    4c8c:	fec42703          	lw	a4,-20(s0)
    4c90:	00f757b3          	srl	a5,a4,a5
    4c94:	8b85                	andi	a5,a5,1
    4c96:	c789                	beqz	a5,4ca0 <RCC_GetFlagStatus+0x68>
  {
    bitstatus = SET;
    4c98:	4785                	li	a5,1
    4c9a:	fef42423          	sw	a5,-24(s0)
    4c9e:	a019                	j	4ca4 <RCC_GetFlagStatus+0x6c>
  }
  else
  {
    bitstatus = RESET;
    4ca0:	fe042423          	sw	zero,-24(s0)
  }

  return bitstatus;
    4ca4:	fe842783          	lw	a5,-24(s0)
}
    4ca8:	853e                	mv	a0,a5
    4caa:	5432                	lw	s0,44(sp)
    4cac:	6145                	addi	sp,sp,48
    4cae:	8082                	ret

00004cb0 <RCC_ClearFlag>:
 *          The reset flags are: RCC_FLAG_PINRST, RCC_FLAG_PORRST, RCC_FLAG_SFTRST,
 *          RCC_FLAG_IWDGRST, RCC_FLAG_WWDGRST, RCC_FLAG_LPWRRST
 * @return  none
 */
void RCC_ClearFlag(void)
{
    4cb0:	1141                	addi	sp,sp,-16
    4cb2:	c622                	sw	s0,12(sp)
    4cb4:	0800                	addi	s0,sp,16
  RCC->RSTSCKR |= RSTSCKR_RMVF_Set;
    4cb6:	400217b7          	lui	a5,0x40021
    4cba:	53d4                	lw	a3,36(a5)
    4cbc:	400217b7          	lui	a5,0x40021
    4cc0:	01000737          	lui	a4,0x1000
    4cc4:	8f55                	or	a4,a4,a3
    4cc6:	d3d8                	sw	a4,36(a5)
}
    4cc8:	0001                	nop
    4cca:	4432                	lw	s0,12(sp)
    4ccc:	0141                	addi	sp,sp,16
    4cce:	8082                	ret

00004cd0 <SPI_I2S_DeInit>:
 * @param   SPIx - where x can be 1 to select the SPI peripheral.
 *
 * @return  none
 */
void SPI_I2S_DeInit(SPI_TypeDef *SPIx)
{
    4cd0:	1101                	addi	sp,sp,-32
    4cd2:	ce06                	sw	ra,28(sp)
    4cd4:	cc22                	sw	s0,24(sp)
    4cd6:	1000                	addi	s0,sp,32
    4cd8:	fea42623          	sw	a0,-20(s0)
    if(SPIx == SPI1)
    4cdc:	fec42703          	lw	a4,-20(s0)
    4ce0:	400137b7          	lui	a5,0x40013
    4ce4:	00f71863          	bne	a4,a5,4cf4 <SPI_I2S_DeInit+0x24>
    {
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_SPI1, ENABLE);
    4ce8:	4585                	li	a1,1
    4cea:	6505                	lui	a0,0x1
    4cec:	3d79                	jal	4b8a <RCC_APB2PeriphResetCmd>
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_SPI1, DISABLE);
    4cee:	4581                	li	a1,0
    4cf0:	6505                	lui	a0,0x1
    4cf2:	3d61                	jal	4b8a <RCC_APB2PeriphResetCmd>
    }
}
    4cf4:	0001                	nop
    4cf6:	40f2                	lw	ra,28(sp)
    4cf8:	4462                	lw	s0,24(sp)
    4cfa:	6105                	addi	sp,sp,32
    4cfc:	8082                	ret

00004cfe <SPI_Init>:
 *        contains the configuration information for the specified SPI peripheral.
 *
 * @return  none
 */
void SPI_Init(SPI_TypeDef *SPIx, SPI_InitTypeDef *SPI_InitStruct)
{
    4cfe:	7179                	addi	sp,sp,-48
    4d00:	d622                	sw	s0,44(sp)
    4d02:	1800                	addi	s0,sp,48
    4d04:	fca42e23          	sw	a0,-36(s0)
    4d08:	fcb42c23          	sw	a1,-40(s0)
    uint16_t tmpreg = 0;
    4d0c:	fe041723          	sh	zero,-18(s0)

    tmpreg = SPIx->CTLR1;
    4d10:	fdc42783          	lw	a5,-36(s0)
    4d14:	0007d783          	lhu	a5,0(a5) # 40013000 <_eusrstack+0x2000f000>
    4d18:	fef41723          	sh	a5,-18(s0)
    tmpreg &= CTLR1_CLEAR_Mask;
    4d1c:	fee45703          	lhu	a4,-18(s0)
    4d20:	678d                	lui	a5,0x3
    4d22:	04078793          	addi	a5,a5,64 # 3040 <I2C_Init+0x46>
    4d26:	8ff9                	and	a5,a5,a4
    4d28:	fef41723          	sh	a5,-18(s0)
    tmpreg |= (uint16_t)((uint32_t)SPI_InitStruct->SPI_Direction | SPI_InitStruct->SPI_Mode |
    4d2c:	fd842783          	lw	a5,-40(s0)
    4d30:	0007d703          	lhu	a4,0(a5)
    4d34:	fd842783          	lw	a5,-40(s0)
    4d38:	0027d783          	lhu	a5,2(a5)
    4d3c:	8fd9                	or	a5,a5,a4
    4d3e:	01079713          	slli	a4,a5,0x10
    4d42:	8341                	srli	a4,a4,0x10
                         SPI_InitStruct->SPI_DataSize | SPI_InitStruct->SPI_CPOL |
    4d44:	fd842783          	lw	a5,-40(s0)
    4d48:	0047d783          	lhu	a5,4(a5)
    tmpreg |= (uint16_t)((uint32_t)SPI_InitStruct->SPI_Direction | SPI_InitStruct->SPI_Mode |
    4d4c:	8fd9                	or	a5,a5,a4
    4d4e:	01079713          	slli	a4,a5,0x10
    4d52:	8341                	srli	a4,a4,0x10
                         SPI_InitStruct->SPI_DataSize | SPI_InitStruct->SPI_CPOL |
    4d54:	fd842783          	lw	a5,-40(s0)
    4d58:	0067d783          	lhu	a5,6(a5)
    tmpreg |= (uint16_t)((uint32_t)SPI_InitStruct->SPI_Direction | SPI_InitStruct->SPI_Mode |
    4d5c:	8fd9                	or	a5,a5,a4
    4d5e:	01079713          	slli	a4,a5,0x10
    4d62:	8341                	srli	a4,a4,0x10
                         SPI_InitStruct->SPI_CPHA | SPI_InitStruct->SPI_NSS |
    4d64:	fd842783          	lw	a5,-40(s0)
    4d68:	0087d783          	lhu	a5,8(a5)
    tmpreg |= (uint16_t)((uint32_t)SPI_InitStruct->SPI_Direction | SPI_InitStruct->SPI_Mode |
    4d6c:	8fd9                	or	a5,a5,a4
    4d6e:	01079713          	slli	a4,a5,0x10
    4d72:	8341                	srli	a4,a4,0x10
                         SPI_InitStruct->SPI_CPHA | SPI_InitStruct->SPI_NSS |
    4d74:	fd842783          	lw	a5,-40(s0)
    4d78:	00a7d783          	lhu	a5,10(a5)
    tmpreg |= (uint16_t)((uint32_t)SPI_InitStruct->SPI_Direction | SPI_InitStruct->SPI_Mode |
    4d7c:	8fd9                	or	a5,a5,a4
    4d7e:	01079713          	slli	a4,a5,0x10
    4d82:	8341                	srli	a4,a4,0x10
                         SPI_InitStruct->SPI_BaudRatePrescaler | SPI_InitStruct->SPI_FirstBit);
    4d84:	fd842783          	lw	a5,-40(s0)
    4d88:	00c7d783          	lhu	a5,12(a5)
    tmpreg |= (uint16_t)((uint32_t)SPI_InitStruct->SPI_Direction | SPI_InitStruct->SPI_Mode |
    4d8c:	8fd9                	or	a5,a5,a4
    4d8e:	01079713          	slli	a4,a5,0x10
    4d92:	8341                	srli	a4,a4,0x10
                         SPI_InitStruct->SPI_BaudRatePrescaler | SPI_InitStruct->SPI_FirstBit);
    4d94:	fd842783          	lw	a5,-40(s0)
    4d98:	00e7d783          	lhu	a5,14(a5)
    tmpreg |= (uint16_t)((uint32_t)SPI_InitStruct->SPI_Direction | SPI_InitStruct->SPI_Mode |
    4d9c:	8fd9                	or	a5,a5,a4
    4d9e:	01079713          	slli	a4,a5,0x10
    4da2:	8341                	srli	a4,a4,0x10
    4da4:	fee45783          	lhu	a5,-18(s0)
    4da8:	8fd9                	or	a5,a5,a4
    4daa:	fef41723          	sh	a5,-18(s0)

    SPIx->CTLR1 = tmpreg;
    4dae:	fdc42783          	lw	a5,-36(s0)
    4db2:	fee45703          	lhu	a4,-18(s0)
    4db6:	00e79023          	sh	a4,0(a5)
    SPIx->CRCR = SPI_InitStruct->SPI_CRCPolynomial;
    4dba:	fd842783          	lw	a5,-40(s0)
    4dbe:	0107d703          	lhu	a4,16(a5)
    4dc2:	fdc42783          	lw	a5,-36(s0)
    4dc6:	00e79823          	sh	a4,16(a5)
}
    4dca:	0001                	nop
    4dcc:	5432                	lw	s0,44(sp)
    4dce:	6145                	addi	sp,sp,48
    4dd0:	8082                	ret

00004dd2 <SPI_StructInit>:
 *        will be initialized.
 *
 * @return  none
 */
void SPI_StructInit(SPI_InitTypeDef *SPI_InitStruct)
{
    4dd2:	1101                	addi	sp,sp,-32
    4dd4:	ce22                	sw	s0,28(sp)
    4dd6:	1000                	addi	s0,sp,32
    4dd8:	fea42623          	sw	a0,-20(s0)
    SPI_InitStruct->SPI_Direction = SPI_Direction_2Lines_FullDuplex;
    4ddc:	fec42783          	lw	a5,-20(s0)
    4de0:	00079023          	sh	zero,0(a5)
    SPI_InitStruct->SPI_Mode = SPI_Mode_Slave;
    4de4:	fec42783          	lw	a5,-20(s0)
    4de8:	00079123          	sh	zero,2(a5)
    SPI_InitStruct->SPI_DataSize = SPI_DataSize_8b;
    4dec:	fec42783          	lw	a5,-20(s0)
    4df0:	00079223          	sh	zero,4(a5)
    SPI_InitStruct->SPI_CPOL = SPI_CPOL_Low;
    4df4:	fec42783          	lw	a5,-20(s0)
    4df8:	00079323          	sh	zero,6(a5)
    SPI_InitStruct->SPI_CPHA = SPI_CPHA_1Edge;
    4dfc:	fec42783          	lw	a5,-20(s0)
    4e00:	00079423          	sh	zero,8(a5)
    SPI_InitStruct->SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2;
    4e04:	fec42783          	lw	a5,-20(s0)
    4e08:	00079623          	sh	zero,12(a5)
    /*"SPI_FirstBit_LSB" not support SPI slave mode*/
    SPI_InitStruct->SPI_FirstBit = SPI_FirstBit_MSB;
    4e0c:	fec42783          	lw	a5,-20(s0)
    4e10:	00079723          	sh	zero,14(a5)
    SPI_InitStruct->SPI_CRCPolynomial = 7;
    4e14:	fec42783          	lw	a5,-20(s0)
    4e18:	471d                	li	a4,7
    4e1a:	00e79823          	sh	a4,16(a5)
}
    4e1e:	0001                	nop
    4e20:	4472                	lw	s0,28(sp)
    4e22:	6105                	addi	sp,sp,32
    4e24:	8082                	ret

00004e26 <SPI_Cmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void SPI_Cmd(SPI_TypeDef *SPIx, FunctionalState NewState)
{
    4e26:	1101                	addi	sp,sp,-32
    4e28:	ce22                	sw	s0,28(sp)
    4e2a:	1000                	addi	s0,sp,32
    4e2c:	fea42623          	sw	a0,-20(s0)
    4e30:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    4e34:	fe842783          	lw	a5,-24(s0)
    4e38:	c38d                	beqz	a5,4e5a <SPI_Cmd+0x34>
    {
        SPIx->CTLR1 |= CTLR1_SPE_Set;
    4e3a:	fec42783          	lw	a5,-20(s0)
    4e3e:	0007d783          	lhu	a5,0(a5)
    4e42:	07c2                	slli	a5,a5,0x10
    4e44:	83c1                	srli	a5,a5,0x10
    4e46:	0407e793          	ori	a5,a5,64
    4e4a:	01079713          	slli	a4,a5,0x10
    4e4e:	8341                	srli	a4,a4,0x10
    4e50:	fec42783          	lw	a5,-20(s0)
    4e54:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        SPIx->CTLR1 &= CTLR1_SPE_Reset;
    }
}
    4e58:	a005                	j	4e78 <SPI_Cmd+0x52>
        SPIx->CTLR1 &= CTLR1_SPE_Reset;
    4e5a:	fec42783          	lw	a5,-20(s0)
    4e5e:	0007d783          	lhu	a5,0(a5)
    4e62:	07c2                	slli	a5,a5,0x10
    4e64:	83c1                	srli	a5,a5,0x10
    4e66:	fbf7f793          	andi	a5,a5,-65
    4e6a:	01079713          	slli	a4,a5,0x10
    4e6e:	8341                	srli	a4,a4,0x10
    4e70:	fec42783          	lw	a5,-20(s0)
    4e74:	00e79023          	sh	a4,0(a5)
}
    4e78:	0001                	nop
    4e7a:	4472                	lw	s0,28(sp)
    4e7c:	6105                	addi	sp,sp,32
    4e7e:	8082                	ret

00004e80 <SPI_I2S_ITConfig>:
 *            SPI_I2S_IT_ERR - Error interrupt mask.
 *          NewState: ENABLE or DISABLE.
 * @return  none
 */
void SPI_I2S_ITConfig(SPI_TypeDef *SPIx, uint8_t SPI_I2S_IT, FunctionalState NewState)
{
    4e80:	7179                	addi	sp,sp,-48
    4e82:	d622                	sw	s0,44(sp)
    4e84:	1800                	addi	s0,sp,48
    4e86:	fca42e23          	sw	a0,-36(s0)
    4e8a:	87ae                	mv	a5,a1
    4e8c:	fcc42a23          	sw	a2,-44(s0)
    4e90:	fcf40da3          	sb	a5,-37(s0)
    uint16_t itpos = 0, itmask = 0;
    4e94:	fe041723          	sh	zero,-18(s0)
    4e98:	fe041623          	sh	zero,-20(s0)

    itpos = SPI_I2S_IT >> 4;
    4e9c:	fdb44783          	lbu	a5,-37(s0)
    4ea0:	8391                	srli	a5,a5,0x4
    4ea2:	0ff7f793          	andi	a5,a5,255
    4ea6:	fef41723          	sh	a5,-18(s0)
    itmask = (uint16_t)1 << (uint16_t)itpos;
    4eaa:	fee45783          	lhu	a5,-18(s0)
    4eae:	4705                	li	a4,1
    4eb0:	00f717b3          	sll	a5,a4,a5
    4eb4:	fef41623          	sh	a5,-20(s0)

    if(NewState != DISABLE)
    4eb8:	fd442783          	lw	a5,-44(s0)
    4ebc:	c39d                	beqz	a5,4ee2 <SPI_I2S_ITConfig+0x62>
    {
        SPIx->CTLR2 |= itmask;
    4ebe:	fdc42783          	lw	a5,-36(s0)
    4ec2:	0047d783          	lhu	a5,4(a5)
    4ec6:	01079713          	slli	a4,a5,0x10
    4eca:	8341                	srli	a4,a4,0x10
    4ecc:	fec45783          	lhu	a5,-20(s0)
    4ed0:	8fd9                	or	a5,a5,a4
    4ed2:	01079713          	slli	a4,a5,0x10
    4ed6:	8341                	srli	a4,a4,0x10
    4ed8:	fdc42783          	lw	a5,-36(s0)
    4edc:	00e79223          	sh	a4,4(a5)
    }
    else
    {
        SPIx->CTLR2 &= (uint16_t)~itmask;
    }
}
    4ee0:	a035                	j	4f0c <SPI_I2S_ITConfig+0x8c>
        SPIx->CTLR2 &= (uint16_t)~itmask;
    4ee2:	fdc42783          	lw	a5,-36(s0)
    4ee6:	0047d783          	lhu	a5,4(a5)
    4eea:	01079713          	slli	a4,a5,0x10
    4eee:	8341                	srli	a4,a4,0x10
    4ef0:	fec45783          	lhu	a5,-20(s0)
    4ef4:	fff7c793          	not	a5,a5
    4ef8:	07c2                	slli	a5,a5,0x10
    4efa:	83c1                	srli	a5,a5,0x10
    4efc:	8ff9                	and	a5,a5,a4
    4efe:	01079713          	slli	a4,a5,0x10
    4f02:	8341                	srli	a4,a4,0x10
    4f04:	fdc42783          	lw	a5,-36(s0)
    4f08:	00e79223          	sh	a4,4(a5)
}
    4f0c:	0001                	nop
    4f0e:	5432                	lw	s0,44(sp)
    4f10:	6145                	addi	sp,sp,48
    4f12:	8082                	ret

00004f14 <SPI_I2S_DMACmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void SPI_I2S_DMACmd(SPI_TypeDef *SPIx, uint16_t SPI_I2S_DMAReq, FunctionalState NewState)
{
    4f14:	1101                	addi	sp,sp,-32
    4f16:	ce22                	sw	s0,28(sp)
    4f18:	1000                	addi	s0,sp,32
    4f1a:	fea42623          	sw	a0,-20(s0)
    4f1e:	87ae                	mv	a5,a1
    4f20:	fec42223          	sw	a2,-28(s0)
    4f24:	fef41523          	sh	a5,-22(s0)
    if(NewState != DISABLE)
    4f28:	fe442783          	lw	a5,-28(s0)
    4f2c:	c39d                	beqz	a5,4f52 <SPI_I2S_DMACmd+0x3e>
    {
        SPIx->CTLR2 |= SPI_I2S_DMAReq;
    4f2e:	fec42783          	lw	a5,-20(s0)
    4f32:	0047d783          	lhu	a5,4(a5)
    4f36:	01079713          	slli	a4,a5,0x10
    4f3a:	8341                	srli	a4,a4,0x10
    4f3c:	fea45783          	lhu	a5,-22(s0)
    4f40:	8fd9                	or	a5,a5,a4
    4f42:	01079713          	slli	a4,a5,0x10
    4f46:	8341                	srli	a4,a4,0x10
    4f48:	fec42783          	lw	a5,-20(s0)
    4f4c:	00e79223          	sh	a4,4(a5)
    }
    else
    {
        SPIx->CTLR2 &= (uint16_t)~SPI_I2S_DMAReq;
    }
}
    4f50:	a035                	j	4f7c <SPI_I2S_DMACmd+0x68>
        SPIx->CTLR2 &= (uint16_t)~SPI_I2S_DMAReq;
    4f52:	fec42783          	lw	a5,-20(s0)
    4f56:	0047d783          	lhu	a5,4(a5)
    4f5a:	01079713          	slli	a4,a5,0x10
    4f5e:	8341                	srli	a4,a4,0x10
    4f60:	fea45783          	lhu	a5,-22(s0)
    4f64:	fff7c793          	not	a5,a5
    4f68:	07c2                	slli	a5,a5,0x10
    4f6a:	83c1                	srli	a5,a5,0x10
    4f6c:	8ff9                	and	a5,a5,a4
    4f6e:	01079713          	slli	a4,a5,0x10
    4f72:	8341                	srli	a4,a4,0x10
    4f74:	fec42783          	lw	a5,-20(s0)
    4f78:	00e79223          	sh	a4,4(a5)
}
    4f7c:	0001                	nop
    4f7e:	4472                	lw	s0,28(sp)
    4f80:	6105                	addi	sp,sp,32
    4f82:	8082                	ret

00004f84 <SPI_I2S_SendData>:
 *          Data - Data to be transmitted.
 *
 * @return  none
 */
void SPI_I2S_SendData(SPI_TypeDef *SPIx, uint16_t Data)
{
    4f84:	1101                	addi	sp,sp,-32
    4f86:	ce22                	sw	s0,28(sp)
    4f88:	1000                	addi	s0,sp,32
    4f8a:	fea42623          	sw	a0,-20(s0)
    4f8e:	87ae                	mv	a5,a1
    4f90:	fef41523          	sh	a5,-22(s0)
    SPIx->DATAR = Data;
    4f94:	fec42783          	lw	a5,-20(s0)
    4f98:	fea45703          	lhu	a4,-22(s0)
    4f9c:	00e79623          	sh	a4,12(a5)
}
    4fa0:	0001                	nop
    4fa2:	4472                	lw	s0,28(sp)
    4fa4:	6105                	addi	sp,sp,32
    4fa6:	8082                	ret

00004fa8 <SPI_I2S_ReceiveData>:
 *          Data - Data to be transmitted.
 *
 * @return  SPIx->DATAR - The value of the received data.
 */
uint16_t SPI_I2S_ReceiveData(SPI_TypeDef *SPIx)
{
    4fa8:	1101                	addi	sp,sp,-32
    4faa:	ce22                	sw	s0,28(sp)
    4fac:	1000                	addi	s0,sp,32
    4fae:	fea42623          	sw	a0,-20(s0)
    return SPIx->DATAR;
    4fb2:	fec42783          	lw	a5,-20(s0)
    4fb6:	00c7d783          	lhu	a5,12(a5)
    4fba:	07c2                	slli	a5,a5,0x10
    4fbc:	83c1                	srli	a5,a5,0x10
}
    4fbe:	853e                	mv	a0,a5
    4fc0:	4472                	lw	s0,28(sp)
    4fc2:	6105                	addi	sp,sp,32
    4fc4:	8082                	ret

00004fc6 <SPI_NSSInternalSoftwareConfig>:
 *            SPI_NSSInternalSoft_Reset - Reset NSS pin internally.
 *
 * @return  none
 */
void SPI_NSSInternalSoftwareConfig(SPI_TypeDef *SPIx, uint16_t SPI_NSSInternalSoft)
{
    4fc6:	1101                	addi	sp,sp,-32
    4fc8:	ce22                	sw	s0,28(sp)
    4fca:	1000                	addi	s0,sp,32
    4fcc:	fea42623          	sw	a0,-20(s0)
    4fd0:	87ae                	mv	a5,a1
    4fd2:	fef41523          	sh	a5,-22(s0)
    if(SPI_NSSInternalSoft != SPI_NSSInternalSoft_Reset)
    4fd6:	fea45703          	lhu	a4,-22(s0)
    4fda:	67c1                	lui	a5,0x10
    4fdc:	eff78793          	addi	a5,a5,-257 # feff <_data_lma+0x3c4b>
    4fe0:	02f70263          	beq	a4,a5,5004 <SPI_NSSInternalSoftwareConfig+0x3e>
    {
        SPIx->CTLR1 |= SPI_NSSInternalSoft_Set;
    4fe4:	fec42783          	lw	a5,-20(s0)
    4fe8:	0007d783          	lhu	a5,0(a5)
    4fec:	07c2                	slli	a5,a5,0x10
    4fee:	83c1                	srli	a5,a5,0x10
    4ff0:	1007e793          	ori	a5,a5,256
    4ff4:	01079713          	slli	a4,a5,0x10
    4ff8:	8341                	srli	a4,a4,0x10
    4ffa:	fec42783          	lw	a5,-20(s0)
    4ffe:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        SPIx->CTLR1 &= SPI_NSSInternalSoft_Reset;
    }
}
    5002:	a005                	j	5022 <SPI_NSSInternalSoftwareConfig+0x5c>
        SPIx->CTLR1 &= SPI_NSSInternalSoft_Reset;
    5004:	fec42783          	lw	a5,-20(s0)
    5008:	0007d783          	lhu	a5,0(a5)
    500c:	07c2                	slli	a5,a5,0x10
    500e:	83c1                	srli	a5,a5,0x10
    5010:	eff7f793          	andi	a5,a5,-257
    5014:	01079713          	slli	a4,a5,0x10
    5018:	8341                	srli	a4,a4,0x10
    501a:	fec42783          	lw	a5,-20(s0)
    501e:	00e79023          	sh	a4,0(a5)
}
    5022:	0001                	nop
    5024:	4472                	lw	s0,28(sp)
    5026:	6105                	addi	sp,sp,32
    5028:	8082                	ret

0000502a <SPI_SSOutputCmd>:
 *          NewState - new state of the SPIx SS output.
 *
 * @return  none
 */
void SPI_SSOutputCmd(SPI_TypeDef *SPIx, FunctionalState NewState)
{
    502a:	1101                	addi	sp,sp,-32
    502c:	ce22                	sw	s0,28(sp)
    502e:	1000                	addi	s0,sp,32
    5030:	fea42623          	sw	a0,-20(s0)
    5034:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    5038:	fe842783          	lw	a5,-24(s0)
    503c:	c38d                	beqz	a5,505e <SPI_SSOutputCmd+0x34>
    {
        SPIx->CTLR2 |= CTLR2_SSOE_Set;
    503e:	fec42783          	lw	a5,-20(s0)
    5042:	0047d783          	lhu	a5,4(a5)
    5046:	07c2                	slli	a5,a5,0x10
    5048:	83c1                	srli	a5,a5,0x10
    504a:	0047e793          	ori	a5,a5,4
    504e:	01079713          	slli	a4,a5,0x10
    5052:	8341                	srli	a4,a4,0x10
    5054:	fec42783          	lw	a5,-20(s0)
    5058:	00e79223          	sh	a4,4(a5)
    }
    else
    {
        SPIx->CTLR2 &= CTLR2_SSOE_Reset;
    }
}
    505c:	a839                	j	507a <SPI_SSOutputCmd+0x50>
        SPIx->CTLR2 &= CTLR2_SSOE_Reset;
    505e:	fec42783          	lw	a5,-20(s0)
    5062:	0047d783          	lhu	a5,4(a5)
    5066:	07c2                	slli	a5,a5,0x10
    5068:	83c1                	srli	a5,a5,0x10
    506a:	9bed                	andi	a5,a5,-5
    506c:	01079713          	slli	a4,a5,0x10
    5070:	8341                	srli	a4,a4,0x10
    5072:	fec42783          	lw	a5,-20(s0)
    5076:	00e79223          	sh	a4,4(a5)
}
    507a:	0001                	nop
    507c:	4472                	lw	s0,28(sp)
    507e:	6105                	addi	sp,sp,32
    5080:	8082                	ret

00005082 <SPI_DataSizeConfig>:
 *            SPI_DataSize_8b - Set data frame format to 8bit.
 *
 * @return  none
 */
void SPI_DataSizeConfig(SPI_TypeDef *SPIx, uint16_t SPI_DataSize)
{
    5082:	1101                	addi	sp,sp,-32
    5084:	ce22                	sw	s0,28(sp)
    5086:	1000                	addi	s0,sp,32
    5088:	fea42623          	sw	a0,-20(s0)
    508c:	87ae                	mv	a5,a1
    508e:	fef41523          	sh	a5,-22(s0)
    SPIx->CTLR1 &= (uint16_t)~SPI_DataSize_16b;
    5092:	fec42783          	lw	a5,-20(s0)
    5096:	0007d783          	lhu	a5,0(a5)
    509a:	01079713          	slli	a4,a5,0x10
    509e:	8341                	srli	a4,a4,0x10
    50a0:	77fd                	lui	a5,0xfffff
    50a2:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    50a6:	8ff9                	and	a5,a5,a4
    50a8:	01079713          	slli	a4,a5,0x10
    50ac:	8341                	srli	a4,a4,0x10
    50ae:	fec42783          	lw	a5,-20(s0)
    50b2:	00e79023          	sh	a4,0(a5)
    SPIx->CTLR1 |= SPI_DataSize;
    50b6:	fec42783          	lw	a5,-20(s0)
    50ba:	0007d783          	lhu	a5,0(a5)
    50be:	01079713          	slli	a4,a5,0x10
    50c2:	8341                	srli	a4,a4,0x10
    50c4:	fea45783          	lhu	a5,-22(s0)
    50c8:	8fd9                	or	a5,a5,a4
    50ca:	01079713          	slli	a4,a5,0x10
    50ce:	8341                	srli	a4,a4,0x10
    50d0:	fec42783          	lw	a5,-20(s0)
    50d4:	00e79023          	sh	a4,0(a5)
}
    50d8:	0001                	nop
    50da:	4472                	lw	s0,28(sp)
    50dc:	6105                	addi	sp,sp,32
    50de:	8082                	ret

000050e0 <SPI_TransmitCRC>:
 * @param   SPIx - where x can be 1 to select the SPI peripheral.
 *
 * @return  none
 */
void SPI_TransmitCRC(SPI_TypeDef *SPIx)
{
    50e0:	1101                	addi	sp,sp,-32
    50e2:	ce22                	sw	s0,28(sp)
    50e4:	1000                	addi	s0,sp,32
    50e6:	fea42623          	sw	a0,-20(s0)
    SPIx->CTLR1 |= CTLR1_CRCNext_Set;
    50ea:	fec42783          	lw	a5,-20(s0)
    50ee:	0007d783          	lhu	a5,0(a5)
    50f2:	01079713          	slli	a4,a5,0x10
    50f6:	8341                	srli	a4,a4,0x10
    50f8:	6785                	lui	a5,0x1
    50fa:	8fd9                	or	a5,a5,a4
    50fc:	01079713          	slli	a4,a5,0x10
    5100:	8341                	srli	a4,a4,0x10
    5102:	fec42783          	lw	a5,-20(s0)
    5106:	00e79023          	sh	a4,0(a5) # 1000 <ADC_GetFlagStatus+0x32>
}
    510a:	0001                	nop
    510c:	4472                	lw	s0,28(sp)
    510e:	6105                	addi	sp,sp,32
    5110:	8082                	ret

00005112 <SPI_CalculateCRC>:
 *          NewState - new state of the SPIx CRC value calculation.
 *
 * @return  none
 */
void SPI_CalculateCRC(SPI_TypeDef *SPIx, FunctionalState NewState)
{
    5112:	1101                	addi	sp,sp,-32
    5114:	ce22                	sw	s0,28(sp)
    5116:	1000                	addi	s0,sp,32
    5118:	fea42623          	sw	a0,-20(s0)
    511c:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    5120:	fe842783          	lw	a5,-24(s0)
    5124:	c395                	beqz	a5,5148 <SPI_CalculateCRC+0x36>
    {
        SPIx->CTLR1 |= CTLR1_CRCEN_Set;
    5126:	fec42783          	lw	a5,-20(s0)
    512a:	0007d783          	lhu	a5,0(a5)
    512e:	01079713          	slli	a4,a5,0x10
    5132:	8341                	srli	a4,a4,0x10
    5134:	6789                	lui	a5,0x2
    5136:	8fd9                	or	a5,a5,a4
    5138:	01079713          	slli	a4,a5,0x10
    513c:	8341                	srli	a4,a4,0x10
    513e:	fec42783          	lw	a5,-20(s0)
    5142:	00e79023          	sh	a4,0(a5) # 2000 <FLASH_GetFlagStatus+0x4c>
    }
    else
    {
        SPIx->CTLR1 &= CTLR1_CRCEN_Reset;
    }
}
    5146:	a015                	j	516a <SPI_CalculateCRC+0x58>
        SPIx->CTLR1 &= CTLR1_CRCEN_Reset;
    5148:	fec42783          	lw	a5,-20(s0)
    514c:	0007d783          	lhu	a5,0(a5)
    5150:	01079713          	slli	a4,a5,0x10
    5154:	8341                	srli	a4,a4,0x10
    5156:	77f9                	lui	a5,0xffffe
    5158:	17fd                	addi	a5,a5,-1
    515a:	8ff9                	and	a5,a5,a4
    515c:	01079713          	slli	a4,a5,0x10
    5160:	8341                	srli	a4,a4,0x10
    5162:	fec42783          	lw	a5,-20(s0)
    5166:	00e79023          	sh	a4,0(a5) # ffffe000 <_eusrstack+0xdfffa000>
}
    516a:	0001                	nop
    516c:	4472                	lw	s0,28(sp)
    516e:	6105                	addi	sp,sp,32
    5170:	8082                	ret

00005172 <SPI_GetCRC>:
 *            SPI_CRC_Rx - Selects Rx CRC register.
 *
 * @return  crcreg: The selected CRC register value.
 */
uint16_t SPI_GetCRC(SPI_TypeDef *SPIx, uint8_t SPI_CRC)
{
    5172:	7179                	addi	sp,sp,-48
    5174:	d622                	sw	s0,44(sp)
    5176:	1800                	addi	s0,sp,48
    5178:	fca42e23          	sw	a0,-36(s0)
    517c:	87ae                	mv	a5,a1
    517e:	fcf40da3          	sb	a5,-37(s0)
    uint16_t crcreg = 0;
    5182:	fe041723          	sh	zero,-18(s0)

    if(SPI_CRC != SPI_CRC_Rx)
    5186:	fdb44703          	lbu	a4,-37(s0)
    518a:	4785                	li	a5,1
    518c:	00f70963          	beq	a4,a5,519e <SPI_GetCRC+0x2c>
    {
        crcreg = SPIx->TCRCR;
    5190:	fdc42783          	lw	a5,-36(s0)
    5194:	0187d783          	lhu	a5,24(a5)
    5198:	fef41723          	sh	a5,-18(s0)
    519c:	a039                	j	51aa <SPI_GetCRC+0x38>
    }
    else
    {
        crcreg = SPIx->RCRCR;
    519e:	fdc42783          	lw	a5,-36(s0)
    51a2:	0147d783          	lhu	a5,20(a5)
    51a6:	fef41723          	sh	a5,-18(s0)
    }

    return crcreg;
    51aa:	fee45783          	lhu	a5,-18(s0)
}
    51ae:	853e                	mv	a0,a5
    51b0:	5432                	lw	s0,44(sp)
    51b2:	6145                	addi	sp,sp,48
    51b4:	8082                	ret

000051b6 <SPI_GetCRCPolynomial>:
 * @param   SPIx - where x can be 1 to select the SPI peripheral.
 *
 * @return  SPIx->CRCR - The CRC Polynomial register value.
 */
uint16_t SPI_GetCRCPolynomial(SPI_TypeDef *SPIx)
{
    51b6:	1101                	addi	sp,sp,-32
    51b8:	ce22                	sw	s0,28(sp)
    51ba:	1000                	addi	s0,sp,32
    51bc:	fea42623          	sw	a0,-20(s0)
    return SPIx->CRCR;
    51c0:	fec42783          	lw	a5,-20(s0)
    51c4:	0107d783          	lhu	a5,16(a5)
    51c8:	07c2                	slli	a5,a5,0x10
    51ca:	83c1                	srli	a5,a5,0x10
}
    51cc:	853e                	mv	a0,a5
    51ce:	4472                	lw	s0,28(sp)
    51d0:	6105                	addi	sp,sp,32
    51d2:	8082                	ret

000051d4 <SPI_BiDirectionalLineConfig>:
 *            SPI_Direction_Rx - Selects Rx receive direction.
 *
 * @return  none
 */
void SPI_BiDirectionalLineConfig(SPI_TypeDef *SPIx, uint16_t SPI_Direction)
{
    51d4:	1101                	addi	sp,sp,-32
    51d6:	ce22                	sw	s0,28(sp)
    51d8:	1000                	addi	s0,sp,32
    51da:	fea42623          	sw	a0,-20(s0)
    51de:	87ae                	mv	a5,a1
    51e0:	fef41523          	sh	a5,-22(s0)
    if(SPI_Direction == SPI_Direction_Tx)
    51e4:	fea45703          	lhu	a4,-22(s0)
    51e8:	6791                	lui	a5,0x4
    51ea:	02f71363          	bne	a4,a5,5210 <SPI_BiDirectionalLineConfig+0x3c>
    {
        SPIx->CTLR1 |= SPI_Direction_Tx;
    51ee:	fec42783          	lw	a5,-20(s0)
    51f2:	0007d783          	lhu	a5,0(a5) # 4000 <NVIC_Init+0x2b0>
    51f6:	01079713          	slli	a4,a5,0x10
    51fa:	8341                	srli	a4,a4,0x10
    51fc:	6791                	lui	a5,0x4
    51fe:	8fd9                	or	a5,a5,a4
    5200:	01079713          	slli	a4,a5,0x10
    5204:	8341                	srli	a4,a4,0x10
    5206:	fec42783          	lw	a5,-20(s0)
    520a:	00e79023          	sh	a4,0(a5) # 4000 <NVIC_Init+0x2b0>
    }
    else
    {
        SPIx->CTLR1 &= SPI_Direction_Rx;
    }
}
    520e:	a015                	j	5232 <SPI_BiDirectionalLineConfig+0x5e>
        SPIx->CTLR1 &= SPI_Direction_Rx;
    5210:	fec42783          	lw	a5,-20(s0)
    5214:	0007d783          	lhu	a5,0(a5)
    5218:	01079713          	slli	a4,a5,0x10
    521c:	8341                	srli	a4,a4,0x10
    521e:	77f1                	lui	a5,0xffffc
    5220:	17fd                	addi	a5,a5,-1
    5222:	8ff9                	and	a5,a5,a4
    5224:	01079713          	slli	a4,a5,0x10
    5228:	8341                	srli	a4,a4,0x10
    522a:	fec42783          	lw	a5,-20(s0)
    522e:	00e79023          	sh	a4,0(a5) # ffffc000 <_eusrstack+0xdfff8000>
}
    5232:	0001                	nop
    5234:	4472                	lw	s0,28(sp)
    5236:	6105                	addi	sp,sp,32
    5238:	8082                	ret

0000523a <SPI_I2S_GetFlagStatus>:
 *            SPI_FLAG_CRCERR - CRC Error flag.
 *
 * @return  FlagStatus: SET or RESET.
 */
FlagStatus SPI_I2S_GetFlagStatus(SPI_TypeDef *SPIx, uint16_t SPI_I2S_FLAG)
{
    523a:	7179                	addi	sp,sp,-48
    523c:	d622                	sw	s0,44(sp)
    523e:	1800                	addi	s0,sp,48
    5240:	fca42e23          	sw	a0,-36(s0)
    5244:	87ae                	mv	a5,a1
    5246:	fcf41d23          	sh	a5,-38(s0)
    FlagStatus bitstatus = RESET;
    524a:	fe042623          	sw	zero,-20(s0)

    if((SPIx->STATR & SPI_I2S_FLAG) != (uint16_t)RESET)
    524e:	fdc42783          	lw	a5,-36(s0)
    5252:	0087d783          	lhu	a5,8(a5)
    5256:	01079713          	slli	a4,a5,0x10
    525a:	8341                	srli	a4,a4,0x10
    525c:	fda45783          	lhu	a5,-38(s0)
    5260:	8ff9                	and	a5,a5,a4
    5262:	07c2                	slli	a5,a5,0x10
    5264:	83c1                	srli	a5,a5,0x10
    5266:	c789                	beqz	a5,5270 <SPI_I2S_GetFlagStatus+0x36>
    {
        bitstatus = SET;
    5268:	4785                	li	a5,1
    526a:	fef42623          	sw	a5,-20(s0)
    526e:	a019                	j	5274 <SPI_I2S_GetFlagStatus+0x3a>
    }
    else
    {
        bitstatus = RESET;
    5270:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    5274:	fec42783          	lw	a5,-20(s0)
}
    5278:	853e                	mv	a0,a5
    527a:	5432                	lw	s0,44(sp)
    527c:	6145                	addi	sp,sp,48
    527e:	8082                	ret

00005280 <SPI_I2S_ClearFlag>:
 *          operation to SPI_STATR register (SPI_I2S_GetFlagStatus()) followed by a 
 *          write operation to SPI_CTLR1 register (SPI_Cmd() to enable the SPI).
 * @return  FlagStatus: SET or RESET.
 */
void SPI_I2S_ClearFlag(SPI_TypeDef *SPIx, uint16_t SPI_I2S_FLAG)
{
    5280:	1101                	addi	sp,sp,-32
    5282:	ce22                	sw	s0,28(sp)
    5284:	1000                	addi	s0,sp,32
    5286:	fea42623          	sw	a0,-20(s0)
    528a:	87ae                	mv	a5,a1
    528c:	fef41523          	sh	a5,-22(s0)
    SPIx->STATR = (uint16_t)~SPI_I2S_FLAG;
    5290:	fea45783          	lhu	a5,-22(s0)
    5294:	fff7c793          	not	a5,a5
    5298:	01079713          	slli	a4,a5,0x10
    529c:	8341                	srli	a4,a4,0x10
    529e:	fec42783          	lw	a5,-20(s0)
    52a2:	00e79423          	sh	a4,8(a5)
}
    52a6:	0001                	nop
    52a8:	4472                	lw	s0,28(sp)
    52aa:	6105                	addi	sp,sp,32
    52ac:	8082                	ret

000052ae <SPI_I2S_GetITStatus>:
 *            SPI_IT_CRCERR - CRC Error interrupt.
 *
 * @return  FlagStatus: SET or RESET.
 */
ITStatus SPI_I2S_GetITStatus(SPI_TypeDef *SPIx, uint8_t SPI_I2S_IT)
{
    52ae:	7179                	addi	sp,sp,-48
    52b0:	d622                	sw	s0,44(sp)
    52b2:	1800                	addi	s0,sp,48
    52b4:	fca42e23          	sw	a0,-36(s0)
    52b8:	87ae                	mv	a5,a1
    52ba:	fcf40da3          	sb	a5,-37(s0)
    ITStatus bitstatus = RESET;
    52be:	fe042623          	sw	zero,-20(s0)
    uint16_t itpos = 0, itmask = 0, enablestatus = 0;
    52c2:	fe041523          	sh	zero,-22(s0)
    52c6:	fe041423          	sh	zero,-24(s0)
    52ca:	fe041323          	sh	zero,-26(s0)

    itpos = 0x01 << (SPI_I2S_IT & 0x0F);
    52ce:	fdb44783          	lbu	a5,-37(s0)
    52d2:	8bbd                	andi	a5,a5,15
    52d4:	4705                	li	a4,1
    52d6:	00f717b3          	sll	a5,a4,a5
    52da:	fef41523          	sh	a5,-22(s0)
    itmask = SPI_I2S_IT >> 4;
    52de:	fdb44783          	lbu	a5,-37(s0)
    52e2:	8391                	srli	a5,a5,0x4
    52e4:	0ff7f793          	andi	a5,a5,255
    52e8:	fef41423          	sh	a5,-24(s0)
    itmask = 0x01 << itmask;
    52ec:	fe845783          	lhu	a5,-24(s0)
    52f0:	4705                	li	a4,1
    52f2:	00f717b3          	sll	a5,a4,a5
    52f6:	fef41423          	sh	a5,-24(s0)
    enablestatus = (SPIx->CTLR2 & itmask);
    52fa:	fdc42783          	lw	a5,-36(s0)
    52fe:	0047d783          	lhu	a5,4(a5)
    5302:	01079713          	slli	a4,a5,0x10
    5306:	8341                	srli	a4,a4,0x10
    5308:	fe845783          	lhu	a5,-24(s0)
    530c:	8ff9                	and	a5,a5,a4
    530e:	fef41323          	sh	a5,-26(s0)

    if(((SPIx->STATR & itpos) != (uint16_t)RESET) && enablestatus)
    5312:	fdc42783          	lw	a5,-36(s0)
    5316:	0087d783          	lhu	a5,8(a5)
    531a:	01079713          	slli	a4,a5,0x10
    531e:	8341                	srli	a4,a4,0x10
    5320:	fea45783          	lhu	a5,-22(s0)
    5324:	8ff9                	and	a5,a5,a4
    5326:	07c2                	slli	a5,a5,0x10
    5328:	83c1                	srli	a5,a5,0x10
    532a:	cb81                	beqz	a5,533a <SPI_I2S_GetITStatus+0x8c>
    532c:	fe645783          	lhu	a5,-26(s0)
    5330:	c789                	beqz	a5,533a <SPI_I2S_GetITStatus+0x8c>
    {
        bitstatus = SET;
    5332:	4785                	li	a5,1
    5334:	fef42623          	sw	a5,-20(s0)
    5338:	a019                	j	533e <SPI_I2S_GetITStatus+0x90>
    }
    else
    {
        bitstatus = RESET;
    533a:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    533e:	fec42783          	lw	a5,-20(s0)
}
    5342:	853e                	mv	a0,a5
    5344:	5432                	lw	s0,44(sp)
    5346:	6145                	addi	sp,sp,48
    5348:	8082                	ret

0000534a <SPI_I2S_ClearITPendingBit>:
 *         followed by a write operation to SPI_CTLR1 register (SPI_Cmd() to enable 
 *         the SPI).      
 * @return  none
 */
void SPI_I2S_ClearITPendingBit(SPI_TypeDef *SPIx, uint8_t SPI_I2S_IT)
{
    534a:	7179                	addi	sp,sp,-48
    534c:	d622                	sw	s0,44(sp)
    534e:	1800                	addi	s0,sp,48
    5350:	fca42e23          	sw	a0,-36(s0)
    5354:	87ae                	mv	a5,a1
    5356:	fcf40da3          	sb	a5,-37(s0)
    uint16_t itpos = 0;
    535a:	fe041723          	sh	zero,-18(s0)

    itpos = 0x01 << (SPI_I2S_IT & 0x0F);
    535e:	fdb44783          	lbu	a5,-37(s0)
    5362:	8bbd                	andi	a5,a5,15
    5364:	4705                	li	a4,1
    5366:	00f717b3          	sll	a5,a4,a5
    536a:	fef41723          	sh	a5,-18(s0)
    SPIx->STATR = (uint16_t)~itpos;
    536e:	fee45783          	lhu	a5,-18(s0)
    5372:	fff7c793          	not	a5,a5
    5376:	01079713          	slli	a4,a5,0x10
    537a:	8341                	srli	a4,a4,0x10
    537c:	fdc42783          	lw	a5,-36(s0)
    5380:	00e79423          	sh	a4,8(a5)
}
    5384:	0001                	nop
    5386:	5432                	lw	s0,44(sp)
    5388:	6145                	addi	sp,sp,48
    538a:	8082                	ret

0000538c <TIM_DeInit>:
 * @param   TIMx - where x can be 1 to 3 to select the TIM peripheral.
 *
 * @return  none
 */
void TIM_DeInit(TIM_TypeDef *TIMx)
{
    538c:	1101                	addi	sp,sp,-32
    538e:	ce06                	sw	ra,28(sp)
    5390:	cc22                	sw	s0,24(sp)
    5392:	1000                	addi	s0,sp,32
    5394:	fea42623          	sw	a0,-20(s0)
    if(TIMx == TIM1)
    5398:	fec42703          	lw	a4,-20(s0)
    539c:	400137b7          	lui	a5,0x40013
    53a0:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    53a4:	00f71f63          	bne	a4,a5,53c2 <TIM_DeInit+0x36>
    {
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, ENABLE);
    53a8:	4585                	li	a1,1
    53aa:	6785                	lui	a5,0x1
    53ac:	80078513          	addi	a0,a5,-2048 # 800 <__stack_size>
    53b0:	fdaff0ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, DISABLE);
    53b4:	4581                	li	a1,0
    53b6:	6785                	lui	a5,0x1
    53b8:	80078513          	addi	a0,a5,-2048 # 800 <__stack_size>
    53bc:	fceff0ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
    else if(TIMx == TIM3)
    {
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, ENABLE);
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, DISABLE);
    }
}
    53c0:	a081                	j	5400 <TIM_DeInit+0x74>
    else if(TIMx == TIM2)
    53c2:	fec42703          	lw	a4,-20(s0)
    53c6:	400007b7          	lui	a5,0x40000
    53ca:	00f71b63          	bne	a4,a5,53e0 <TIM_DeInit+0x54>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, ENABLE);
    53ce:	4585                	li	a1,1
    53d0:	4505                	li	a0,1
    53d2:	ffeff0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, DISABLE);
    53d6:	4581                	li	a1,0
    53d8:	4505                	li	a0,1
    53da:	ff6ff0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
}
    53de:	a00d                	j	5400 <TIM_DeInit+0x74>
    else if(TIMx == TIM3)
    53e0:	fec42703          	lw	a4,-20(s0)
    53e4:	400007b7          	lui	a5,0x40000
    53e8:	40078793          	addi	a5,a5,1024 # 40000400 <_eusrstack+0x1fffc400>
    53ec:	00f71a63          	bne	a4,a5,5400 <TIM_DeInit+0x74>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, ENABLE);
    53f0:	4585                	li	a1,1
    53f2:	4509                	li	a0,2
    53f4:	fdcff0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, DISABLE);
    53f8:	4581                	li	a1,0
    53fa:	4509                	li	a0,2
    53fc:	fd4ff0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
}
    5400:	0001                	nop
    5402:	40f2                	lw	ra,28(sp)
    5404:	4462                	lw	s0,24(sp)
    5406:	6105                	addi	sp,sp,32
    5408:	8082                	ret

0000540a <TIM_TimeBaseInit>:
 *        structure.
 *
 * @return  none
 */
void TIM_TimeBaseInit(TIM_TypeDef *TIMx, TIM_TimeBaseInitTypeDef *TIM_TimeBaseInitStruct)
{
    540a:	7179                	addi	sp,sp,-48
    540c:	d622                	sw	s0,44(sp)
    540e:	1800                	addi	s0,sp,48
    5410:	fca42e23          	sw	a0,-36(s0)
    5414:	fcb42c23          	sw	a1,-40(s0)
    uint16_t tmpcr1 = 0;
    5418:	fe041723          	sh	zero,-18(s0)

    tmpcr1 = TIMx->CTLR1;
    541c:	fdc42783          	lw	a5,-36(s0)
    5420:	0007d783          	lhu	a5,0(a5)
    5424:	fef41723          	sh	a5,-18(s0)

    if((TIMx == TIM1) || (TIMx == TIM2))
    5428:	fdc42703          	lw	a4,-36(s0)
    542c:	400137b7          	lui	a5,0x40013
    5430:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    5434:	00f70863          	beq	a4,a5,5444 <TIM_TimeBaseInit+0x3a>
    5438:	fdc42703          	lw	a4,-36(s0)
    543c:	400007b7          	lui	a5,0x40000
    5440:	02f71163          	bne	a4,a5,5462 <TIM_TimeBaseInit+0x58>
    {
        tmpcr1 &= (uint16_t)(~((uint16_t)(TIM_DIR | TIM_CMS)));
    5444:	fee45783          	lhu	a5,-18(s0)
    5448:	f8f7f793          	andi	a5,a5,-113
    544c:	fef41723          	sh	a5,-18(s0)
        tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode;
    5450:	fd842783          	lw	a5,-40(s0)
    5454:	0027d703          	lhu	a4,2(a5) # 40000002 <_eusrstack+0x1fffc002>
    5458:	fee45783          	lhu	a5,-18(s0)
    545c:	8fd9                	or	a5,a5,a4
    545e:	fef41723          	sh	a5,-18(s0)
    }

    tmpcr1 &= (uint16_t)(~((uint16_t)TIM_CTLR1_CKD));
    5462:	fee45783          	lhu	a5,-18(s0)
    5466:	cff7f793          	andi	a5,a5,-769
    546a:	fef41723          	sh	a5,-18(s0)
    tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_ClockDivision;
    546e:	fd842783          	lw	a5,-40(s0)
    5472:	0067d703          	lhu	a4,6(a5)
    5476:	fee45783          	lhu	a5,-18(s0)
    547a:	8fd9                	or	a5,a5,a4
    547c:	fef41723          	sh	a5,-18(s0)

    TIMx->CTLR1 = tmpcr1;
    5480:	fdc42783          	lw	a5,-36(s0)
    5484:	fee45703          	lhu	a4,-18(s0)
    5488:	00e79023          	sh	a4,0(a5)
    TIMx->ATRLR = TIM_TimeBaseInitStruct->TIM_Period;
    548c:	fd842783          	lw	a5,-40(s0)
    5490:	0047d703          	lhu	a4,4(a5)
    5494:	fdc42783          	lw	a5,-36(s0)
    5498:	02e79623          	sh	a4,44(a5)
    TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;
    549c:	fd842783          	lw	a5,-40(s0)
    54a0:	0007d703          	lhu	a4,0(a5)
    54a4:	fdc42783          	lw	a5,-36(s0)
    54a8:	02e79423          	sh	a4,40(a5)

    if((TIMx == TIM1) || (TIMx == TIM2))
    54ac:	fdc42703          	lw	a4,-36(s0)
    54b0:	400137b7          	lui	a5,0x40013
    54b4:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    54b8:	00f70863          	beq	a4,a5,54c8 <TIM_TimeBaseInit+0xbe>
    54bc:	fdc42703          	lw	a4,-36(s0)
    54c0:	400007b7          	lui	a5,0x40000
    54c4:	00f71d63          	bne	a4,a5,54de <TIM_TimeBaseInit+0xd4>
    {
        TIMx->RPTCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
    54c8:	fd842783          	lw	a5,-40(s0)
    54cc:	0087c783          	lbu	a5,8(a5) # 40000008 <_eusrstack+0x1fffc008>
    54d0:	01079713          	slli	a4,a5,0x10
    54d4:	8341                	srli	a4,a4,0x10
    54d6:	fdc42783          	lw	a5,-36(s0)
    54da:	02e79823          	sh	a4,48(a5)
    }

    TIMx->SWEVGR = TIM_PSCReloadMode_Immediate;
    54de:	fdc42783          	lw	a5,-36(s0)
    54e2:	4705                	li	a4,1
    54e4:	00e79a23          	sh	a4,20(a5)
}
    54e8:	0001                	nop
    54ea:	5432                	lw	s0,44(sp)
    54ec:	6145                	addi	sp,sp,48
    54ee:	8082                	ret

000054f0 <TIM_OC1Init>:
 *          TIM_OCInitStruct - pointer to a TIM_OCInitTypeDef structure.
 *
 * @return  none
 */
void TIM_OC1Init(TIM_TypeDef *TIMx, TIM_OCInitTypeDef *TIM_OCInitStruct)
{
    54f0:	7179                	addi	sp,sp,-48
    54f2:	d622                	sw	s0,44(sp)
    54f4:	1800                	addi	s0,sp,48
    54f6:	fca42e23          	sw	a0,-36(s0)
    54fa:	fcb42c23          	sw	a1,-40(s0)
    uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
    54fe:	fe041523          	sh	zero,-22(s0)
    5502:	fe041723          	sh	zero,-18(s0)
    5506:	fe041623          	sh	zero,-20(s0)

    TIMx->CCER &= (uint16_t)(~(uint16_t)TIM_CC1E);
    550a:	fdc42783          	lw	a5,-36(s0)
    550e:	0207d783          	lhu	a5,32(a5)
    5512:	07c2                	slli	a5,a5,0x10
    5514:	83c1                	srli	a5,a5,0x10
    5516:	9bf9                	andi	a5,a5,-2
    5518:	01079713          	slli	a4,a5,0x10
    551c:	8341                	srli	a4,a4,0x10
    551e:	fdc42783          	lw	a5,-36(s0)
    5522:	02e79023          	sh	a4,32(a5)
    tmpccer = TIMx->CCER;
    5526:	fdc42783          	lw	a5,-36(s0)
    552a:	0207d783          	lhu	a5,32(a5)
    552e:	fef41723          	sh	a5,-18(s0)
    tmpcr2 = TIMx->CTLR2;
    5532:	fdc42783          	lw	a5,-36(s0)
    5536:	0047d783          	lhu	a5,4(a5)
    553a:	fef41623          	sh	a5,-20(s0)
    tmpccmrx = TIMx->CHCTLR1;
    553e:	fdc42783          	lw	a5,-36(s0)
    5542:	0187d783          	lhu	a5,24(a5)
    5546:	fef41523          	sh	a5,-22(s0)
    tmpccmrx &= (uint16_t)(~((uint16_t)TIM_OC1M));
    554a:	fea45783          	lhu	a5,-22(s0)
    554e:	f8f7f793          	andi	a5,a5,-113
    5552:	fef41523          	sh	a5,-22(s0)
    tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CC1S));
    5556:	fea45783          	lhu	a5,-22(s0)
    555a:	9bf1                	andi	a5,a5,-4
    555c:	fef41523          	sh	a5,-22(s0)
    tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
    5560:	fd842783          	lw	a5,-40(s0)
    5564:	0007d703          	lhu	a4,0(a5)
    5568:	fea45783          	lhu	a5,-22(s0)
    556c:	8fd9                	or	a5,a5,a4
    556e:	fef41523          	sh	a5,-22(s0)
    tmpccer &= (uint16_t)(~((uint16_t)TIM_CC1P));
    5572:	fee45783          	lhu	a5,-18(s0)
    5576:	9bf5                	andi	a5,a5,-3
    5578:	fef41723          	sh	a5,-18(s0)
    tmpccer |= TIM_OCInitStruct->TIM_OCPolarity;
    557c:	fd842783          	lw	a5,-40(s0)
    5580:	0087d703          	lhu	a4,8(a5)
    5584:	fee45783          	lhu	a5,-18(s0)
    5588:	8fd9                	or	a5,a5,a4
    558a:	fef41723          	sh	a5,-18(s0)
    tmpccer |= TIM_OCInitStruct->TIM_OutputState;
    558e:	fd842783          	lw	a5,-40(s0)
    5592:	0027d703          	lhu	a4,2(a5)
    5596:	fee45783          	lhu	a5,-18(s0)
    559a:	8fd9                	or	a5,a5,a4
    559c:	fef41723          	sh	a5,-18(s0)

    if((TIMx == TIM1)  || (TIMx == TIM2))
    55a0:	fdc42703          	lw	a4,-36(s0)
    55a4:	400137b7          	lui	a5,0x40013
    55a8:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    55ac:	00f70863          	beq	a4,a5,55bc <TIM_OC1Init+0xcc>
    55b0:	fdc42703          	lw	a4,-36(s0)
    55b4:	400007b7          	lui	a5,0x40000
    55b8:	06f71c63          	bne	a4,a5,5630 <TIM_OC1Init+0x140>
    {
        tmpccer &= (uint16_t)(~((uint16_t)TIM_CC1NP));
    55bc:	fee45783          	lhu	a5,-18(s0)
    55c0:	9bdd                	andi	a5,a5,-9
    55c2:	fef41723          	sh	a5,-18(s0)
        tmpccer |= TIM_OCInitStruct->TIM_OCNPolarity;
    55c6:	fd842783          	lw	a5,-40(s0)
    55ca:	00a7d703          	lhu	a4,10(a5) # 4000000a <_eusrstack+0x1fffc00a>
    55ce:	fee45783          	lhu	a5,-18(s0)
    55d2:	8fd9                	or	a5,a5,a4
    55d4:	fef41723          	sh	a5,-18(s0)

        tmpccer &= (uint16_t)(~((uint16_t)TIM_CC1NE));
    55d8:	fee45783          	lhu	a5,-18(s0)
    55dc:	9bed                	andi	a5,a5,-5
    55de:	fef41723          	sh	a5,-18(s0)
        tmpccer |= TIM_OCInitStruct->TIM_OutputNState;
    55e2:	fd842783          	lw	a5,-40(s0)
    55e6:	0047d703          	lhu	a4,4(a5)
    55ea:	fee45783          	lhu	a5,-18(s0)
    55ee:	8fd9                	or	a5,a5,a4
    55f0:	fef41723          	sh	a5,-18(s0)

        tmpcr2 &= (uint16_t)(~((uint16_t)TIM_OIS1));
    55f4:	fec45783          	lhu	a5,-20(s0)
    55f8:	eff7f793          	andi	a5,a5,-257
    55fc:	fef41623          	sh	a5,-20(s0)
        tmpcr2 &= (uint16_t)(~((uint16_t)TIM_OIS1N));
    5600:	fec45783          	lhu	a5,-20(s0)
    5604:	dff7f793          	andi	a5,a5,-513
    5608:	fef41623          	sh	a5,-20(s0)

        tmpcr2 |= TIM_OCInitStruct->TIM_OCIdleState;
    560c:	fd842783          	lw	a5,-40(s0)
    5610:	00c7d703          	lhu	a4,12(a5)
    5614:	fec45783          	lhu	a5,-20(s0)
    5618:	8fd9                	or	a5,a5,a4
    561a:	fef41623          	sh	a5,-20(s0)
        tmpcr2 |= TIM_OCInitStruct->TIM_OCNIdleState;
    561e:	fd842783          	lw	a5,-40(s0)
    5622:	00e7d703          	lhu	a4,14(a5)
    5626:	fec45783          	lhu	a5,-20(s0)
    562a:	8fd9                	or	a5,a5,a4
    562c:	fef41623          	sh	a5,-20(s0)
    }

    TIMx->CTLR2 = tmpcr2;
    5630:	fdc42783          	lw	a5,-36(s0)
    5634:	fec45703          	lhu	a4,-20(s0)
    5638:	00e79223          	sh	a4,4(a5)
    TIMx->CHCTLR1 = tmpccmrx;
    563c:	fdc42783          	lw	a5,-36(s0)
    5640:	fea45703          	lhu	a4,-22(s0)
    5644:	00e79c23          	sh	a4,24(a5)
    TIMx->CH1CVR = TIM_OCInitStruct->TIM_Pulse;
    5648:	fd842783          	lw	a5,-40(s0)
    564c:	0067d703          	lhu	a4,6(a5)
    5650:	fdc42783          	lw	a5,-36(s0)
    5654:	02e79a23          	sh	a4,52(a5)
    TIMx->CCER = tmpccer;
    5658:	fdc42783          	lw	a5,-36(s0)
    565c:	fee45703          	lhu	a4,-18(s0)
    5660:	02e79023          	sh	a4,32(a5)
}
    5664:	0001                	nop
    5666:	5432                	lw	s0,44(sp)
    5668:	6145                	addi	sp,sp,48
    566a:	8082                	ret

0000566c <TIM_OC2Init>:
 *          TIM_OCInitStruct - pointer to a TIM_OCInitTypeDef structure.
 *
 * @return  none
 */
void TIM_OC2Init(TIM_TypeDef *TIMx, TIM_OCInitTypeDef *TIM_OCInitStruct)
{
    566c:	7179                	addi	sp,sp,-48
    566e:	d622                	sw	s0,44(sp)
    5670:	1800                	addi	s0,sp,48
    5672:	fca42e23          	sw	a0,-36(s0)
    5676:	fcb42c23          	sw	a1,-40(s0)
    uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
    567a:	fe041523          	sh	zero,-22(s0)
    567e:	fe041723          	sh	zero,-18(s0)
    5682:	fe041623          	sh	zero,-20(s0)

    TIMx->CCER &= (uint16_t)(~((uint16_t)TIM_CC2E));
    5686:	fdc42783          	lw	a5,-36(s0)
    568a:	0207d783          	lhu	a5,32(a5)
    568e:	07c2                	slli	a5,a5,0x10
    5690:	83c1                	srli	a5,a5,0x10
    5692:	9bbd                	andi	a5,a5,-17
    5694:	01079713          	slli	a4,a5,0x10
    5698:	8341                	srli	a4,a4,0x10
    569a:	fdc42783          	lw	a5,-36(s0)
    569e:	02e79023          	sh	a4,32(a5)
    tmpccer = TIMx->CCER;
    56a2:	fdc42783          	lw	a5,-36(s0)
    56a6:	0207d783          	lhu	a5,32(a5)
    56aa:	fef41723          	sh	a5,-18(s0)
    tmpcr2 = TIMx->CTLR2;
    56ae:	fdc42783          	lw	a5,-36(s0)
    56b2:	0047d783          	lhu	a5,4(a5)
    56b6:	fef41623          	sh	a5,-20(s0)
    tmpccmrx = TIMx->CHCTLR1;
    56ba:	fdc42783          	lw	a5,-36(s0)
    56be:	0187d783          	lhu	a5,24(a5)
    56c2:	fef41523          	sh	a5,-22(s0)
    tmpccmrx &= (uint16_t)(~((uint16_t)TIM_OC2M));
    56c6:	fea45703          	lhu	a4,-22(s0)
    56ca:	77e5                	lui	a5,0xffff9
    56cc:	17fd                	addi	a5,a5,-1
    56ce:	8ff9                	and	a5,a5,a4
    56d0:	fef41523          	sh	a5,-22(s0)
    tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CC2S));
    56d4:	fea45783          	lhu	a5,-22(s0)
    56d8:	cff7f793          	andi	a5,a5,-769
    56dc:	fef41523          	sh	a5,-22(s0)
    tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
    56e0:	fd842783          	lw	a5,-40(s0)
    56e4:	0007d783          	lhu	a5,0(a5) # ffff9000 <_eusrstack+0xdfff5000>
    56e8:	07a2                	slli	a5,a5,0x8
    56ea:	01079713          	slli	a4,a5,0x10
    56ee:	8341                	srli	a4,a4,0x10
    56f0:	fea45783          	lhu	a5,-22(s0)
    56f4:	8fd9                	or	a5,a5,a4
    56f6:	fef41523          	sh	a5,-22(s0)
    tmpccer &= (uint16_t)(~((uint16_t)TIM_CC2P));
    56fa:	fee45783          	lhu	a5,-18(s0)
    56fe:	fdf7f793          	andi	a5,a5,-33
    5702:	fef41723          	sh	a5,-18(s0)
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 4);
    5706:	fd842783          	lw	a5,-40(s0)
    570a:	0087d783          	lhu	a5,8(a5)
    570e:	0792                	slli	a5,a5,0x4
    5710:	01079713          	slli	a4,a5,0x10
    5714:	8341                	srli	a4,a4,0x10
    5716:	fee45783          	lhu	a5,-18(s0)
    571a:	8fd9                	or	a5,a5,a4
    571c:	fef41723          	sh	a5,-18(s0)
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 4);
    5720:	fd842783          	lw	a5,-40(s0)
    5724:	0027d783          	lhu	a5,2(a5)
    5728:	0792                	slli	a5,a5,0x4
    572a:	01079713          	slli	a4,a5,0x10
    572e:	8341                	srli	a4,a4,0x10
    5730:	fee45783          	lhu	a5,-18(s0)
    5734:	8fd9                	or	a5,a5,a4
    5736:	fef41723          	sh	a5,-18(s0)

    if((TIMx == TIM1) || (TIMx == TIM2))
    573a:	fdc42703          	lw	a4,-36(s0)
    573e:	400137b7          	lui	a5,0x40013
    5742:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    5746:	00f70863          	beq	a4,a5,5756 <TIM_OC2Init+0xea>
    574a:	fdc42703          	lw	a4,-36(s0)
    574e:	400007b7          	lui	a5,0x40000
    5752:	0af71063          	bne	a4,a5,57f2 <TIM_OC2Init+0x186>
    {
        tmpccer &= (uint16_t)(~((uint16_t)TIM_CC2NP));
    5756:	fee45783          	lhu	a5,-18(s0)
    575a:	f7f7f793          	andi	a5,a5,-129
    575e:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 4);
    5762:	fd842783          	lw	a5,-40(s0)
    5766:	00a7d783          	lhu	a5,10(a5) # 4000000a <_eusrstack+0x1fffc00a>
    576a:	0792                	slli	a5,a5,0x4
    576c:	01079713          	slli	a4,a5,0x10
    5770:	8341                	srli	a4,a4,0x10
    5772:	fee45783          	lhu	a5,-18(s0)
    5776:	8fd9                	or	a5,a5,a4
    5778:	fef41723          	sh	a5,-18(s0)
        tmpccer &= (uint16_t)(~((uint16_t)TIM_CC2NE));
    577c:	fee45783          	lhu	a5,-18(s0)
    5780:	fbf7f793          	andi	a5,a5,-65
    5784:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 4);
    5788:	fd842783          	lw	a5,-40(s0)
    578c:	0047d783          	lhu	a5,4(a5)
    5790:	0792                	slli	a5,a5,0x4
    5792:	01079713          	slli	a4,a5,0x10
    5796:	8341                	srli	a4,a4,0x10
    5798:	fee45783          	lhu	a5,-18(s0)
    579c:	8fd9                	or	a5,a5,a4
    579e:	fef41723          	sh	a5,-18(s0)

        tmpcr2 &= (uint16_t)(~((uint16_t)TIM_OIS2));
    57a2:	fec45783          	lhu	a5,-20(s0)
    57a6:	bff7f793          	andi	a5,a5,-1025
    57aa:	fef41623          	sh	a5,-20(s0)
        tmpcr2 &= (uint16_t)(~((uint16_t)TIM_OIS2N));
    57ae:	fec45703          	lhu	a4,-20(s0)
    57b2:	77fd                	lui	a5,0xfffff
    57b4:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    57b8:	8ff9                	and	a5,a5,a4
    57ba:	fef41623          	sh	a5,-20(s0)
        tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 2);
    57be:	fd842783          	lw	a5,-40(s0)
    57c2:	00c7d783          	lhu	a5,12(a5)
    57c6:	078a                	slli	a5,a5,0x2
    57c8:	01079713          	slli	a4,a5,0x10
    57cc:	8341                	srli	a4,a4,0x10
    57ce:	fec45783          	lhu	a5,-20(s0)
    57d2:	8fd9                	or	a5,a5,a4
    57d4:	fef41623          	sh	a5,-20(s0)
        tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 2);
    57d8:	fd842783          	lw	a5,-40(s0)
    57dc:	00e7d783          	lhu	a5,14(a5)
    57e0:	078a                	slli	a5,a5,0x2
    57e2:	01079713          	slli	a4,a5,0x10
    57e6:	8341                	srli	a4,a4,0x10
    57e8:	fec45783          	lhu	a5,-20(s0)
    57ec:	8fd9                	or	a5,a5,a4
    57ee:	fef41623          	sh	a5,-20(s0)
    }

    TIMx->CTLR2 = tmpcr2;
    57f2:	fdc42783          	lw	a5,-36(s0)
    57f6:	fec45703          	lhu	a4,-20(s0)
    57fa:	00e79223          	sh	a4,4(a5)
    TIMx->CHCTLR1 = tmpccmrx;
    57fe:	fdc42783          	lw	a5,-36(s0)
    5802:	fea45703          	lhu	a4,-22(s0)
    5806:	00e79c23          	sh	a4,24(a5)
    TIMx->CH2CVR = TIM_OCInitStruct->TIM_Pulse;
    580a:	fd842783          	lw	a5,-40(s0)
    580e:	0067d703          	lhu	a4,6(a5)
    5812:	fdc42783          	lw	a5,-36(s0)
    5816:	02e79c23          	sh	a4,56(a5)
    TIMx->CCER = tmpccer;
    581a:	fdc42783          	lw	a5,-36(s0)
    581e:	fee45703          	lhu	a4,-18(s0)
    5822:	02e79023          	sh	a4,32(a5)
}
    5826:	0001                	nop
    5828:	5432                	lw	s0,44(sp)
    582a:	6145                	addi	sp,sp,48
    582c:	8082                	ret

0000582e <TIM_OC3Init>:
 *          TIM_OCInitStruct - pointer to a TIM_OCInitTypeDef structure.
 *
 * @return  none
 */
void TIM_OC3Init(TIM_TypeDef *TIMx, TIM_OCInitTypeDef *TIM_OCInitStruct)
{
    582e:	7179                	addi	sp,sp,-48
    5830:	d622                	sw	s0,44(sp)
    5832:	1800                	addi	s0,sp,48
    5834:	fca42e23          	sw	a0,-36(s0)
    5838:	fcb42c23          	sw	a1,-40(s0)
    uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
    583c:	fe041523          	sh	zero,-22(s0)
    5840:	fe041723          	sh	zero,-18(s0)
    5844:	fe041623          	sh	zero,-20(s0)

    TIMx->CCER &= (uint16_t)(~((uint16_t)TIM_CC3E));
    5848:	fdc42783          	lw	a5,-36(s0)
    584c:	0207d783          	lhu	a5,32(a5)
    5850:	07c2                	slli	a5,a5,0x10
    5852:	83c1                	srli	a5,a5,0x10
    5854:	eff7f793          	andi	a5,a5,-257
    5858:	01079713          	slli	a4,a5,0x10
    585c:	8341                	srli	a4,a4,0x10
    585e:	fdc42783          	lw	a5,-36(s0)
    5862:	02e79023          	sh	a4,32(a5)
    tmpccer = TIMx->CCER;
    5866:	fdc42783          	lw	a5,-36(s0)
    586a:	0207d783          	lhu	a5,32(a5)
    586e:	fef41723          	sh	a5,-18(s0)
    tmpcr2 = TIMx->CTLR2;
    5872:	fdc42783          	lw	a5,-36(s0)
    5876:	0047d783          	lhu	a5,4(a5)
    587a:	fef41623          	sh	a5,-20(s0)
    tmpccmrx = TIMx->CHCTLR2;
    587e:	fdc42783          	lw	a5,-36(s0)
    5882:	01c7d783          	lhu	a5,28(a5)
    5886:	fef41523          	sh	a5,-22(s0)
    tmpccmrx &= (uint16_t)(~((uint16_t)TIM_OC3M));
    588a:	fea45783          	lhu	a5,-22(s0)
    588e:	f8f7f793          	andi	a5,a5,-113
    5892:	fef41523          	sh	a5,-22(s0)
    tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CC3S));
    5896:	fea45783          	lhu	a5,-22(s0)
    589a:	9bf1                	andi	a5,a5,-4
    589c:	fef41523          	sh	a5,-22(s0)
    tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
    58a0:	fd842783          	lw	a5,-40(s0)
    58a4:	0007d703          	lhu	a4,0(a5)
    58a8:	fea45783          	lhu	a5,-22(s0)
    58ac:	8fd9                	or	a5,a5,a4
    58ae:	fef41523          	sh	a5,-22(s0)
    tmpccer &= (uint16_t)(~((uint16_t)TIM_CC3P));
    58b2:	fee45783          	lhu	a5,-18(s0)
    58b6:	dff7f793          	andi	a5,a5,-513
    58ba:	fef41723          	sh	a5,-18(s0)
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 8);
    58be:	fd842783          	lw	a5,-40(s0)
    58c2:	0087d783          	lhu	a5,8(a5)
    58c6:	07a2                	slli	a5,a5,0x8
    58c8:	01079713          	slli	a4,a5,0x10
    58cc:	8341                	srli	a4,a4,0x10
    58ce:	fee45783          	lhu	a5,-18(s0)
    58d2:	8fd9                	or	a5,a5,a4
    58d4:	fef41723          	sh	a5,-18(s0)
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 8);
    58d8:	fd842783          	lw	a5,-40(s0)
    58dc:	0027d783          	lhu	a5,2(a5)
    58e0:	07a2                	slli	a5,a5,0x8
    58e2:	01079713          	slli	a4,a5,0x10
    58e6:	8341                	srli	a4,a4,0x10
    58e8:	fee45783          	lhu	a5,-18(s0)
    58ec:	8fd9                	or	a5,a5,a4
    58ee:	fef41723          	sh	a5,-18(s0)

    if((TIMx == TIM1) || (TIMx == TIM2))
    58f2:	fdc42703          	lw	a4,-36(s0)
    58f6:	400137b7          	lui	a5,0x40013
    58fa:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    58fe:	00f70863          	beq	a4,a5,590e <TIM_OC3Init+0xe0>
    5902:	fdc42703          	lw	a4,-36(s0)
    5906:	400007b7          	lui	a5,0x40000
    590a:	0af71263          	bne	a4,a5,59ae <TIM_OC3Init+0x180>
    {
        tmpccer &= (uint16_t)(~((uint16_t)TIM_CC3NP));
    590e:	fee45703          	lhu	a4,-18(s0)
    5912:	77fd                	lui	a5,0xfffff
    5914:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    5918:	8ff9                	and	a5,a5,a4
    591a:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 8);
    591e:	fd842783          	lw	a5,-40(s0)
    5922:	00a7d783          	lhu	a5,10(a5)
    5926:	07a2                	slli	a5,a5,0x8
    5928:	01079713          	slli	a4,a5,0x10
    592c:	8341                	srli	a4,a4,0x10
    592e:	fee45783          	lhu	a5,-18(s0)
    5932:	8fd9                	or	a5,a5,a4
    5934:	fef41723          	sh	a5,-18(s0)
        tmpccer &= (uint16_t)(~((uint16_t)TIM_CC3NE));
    5938:	fee45783          	lhu	a5,-18(s0)
    593c:	bff7f793          	andi	a5,a5,-1025
    5940:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 8);
    5944:	fd842783          	lw	a5,-40(s0)
    5948:	0047d783          	lhu	a5,4(a5)
    594c:	07a2                	slli	a5,a5,0x8
    594e:	01079713          	slli	a4,a5,0x10
    5952:	8341                	srli	a4,a4,0x10
    5954:	fee45783          	lhu	a5,-18(s0)
    5958:	8fd9                	or	a5,a5,a4
    595a:	fef41723          	sh	a5,-18(s0)
        tmpcr2 &= (uint16_t)(~((uint16_t)TIM_OIS3));
    595e:	fec45703          	lhu	a4,-20(s0)
    5962:	77fd                	lui	a5,0xfffff
    5964:	17fd                	addi	a5,a5,-1
    5966:	8ff9                	and	a5,a5,a4
    5968:	fef41623          	sh	a5,-20(s0)
        tmpcr2 &= (uint16_t)(~((uint16_t)TIM_OIS3N));
    596c:	fec45703          	lhu	a4,-20(s0)
    5970:	77f9                	lui	a5,0xffffe
    5972:	17fd                	addi	a5,a5,-1
    5974:	8ff9                	and	a5,a5,a4
    5976:	fef41623          	sh	a5,-20(s0)
        tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 4);
    597a:	fd842783          	lw	a5,-40(s0)
    597e:	00c7d783          	lhu	a5,12(a5) # ffffe00c <_eusrstack+0xdfffa00c>
    5982:	0792                	slli	a5,a5,0x4
    5984:	01079713          	slli	a4,a5,0x10
    5988:	8341                	srli	a4,a4,0x10
    598a:	fec45783          	lhu	a5,-20(s0)
    598e:	8fd9                	or	a5,a5,a4
    5990:	fef41623          	sh	a5,-20(s0)
        tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 4);
    5994:	fd842783          	lw	a5,-40(s0)
    5998:	00e7d783          	lhu	a5,14(a5)
    599c:	0792                	slli	a5,a5,0x4
    599e:	01079713          	slli	a4,a5,0x10
    59a2:	8341                	srli	a4,a4,0x10
    59a4:	fec45783          	lhu	a5,-20(s0)
    59a8:	8fd9                	or	a5,a5,a4
    59aa:	fef41623          	sh	a5,-20(s0)
    }

    TIMx->CTLR2 = tmpcr2;
    59ae:	fdc42783          	lw	a5,-36(s0)
    59b2:	fec45703          	lhu	a4,-20(s0)
    59b6:	00e79223          	sh	a4,4(a5)
    TIMx->CHCTLR2 = tmpccmrx;
    59ba:	fdc42783          	lw	a5,-36(s0)
    59be:	fea45703          	lhu	a4,-22(s0)
    59c2:	00e79e23          	sh	a4,28(a5)
    TIMx->CH3CVR = TIM_OCInitStruct->TIM_Pulse;
    59c6:	fd842783          	lw	a5,-40(s0)
    59ca:	0067d703          	lhu	a4,6(a5)
    59ce:	fdc42783          	lw	a5,-36(s0)
    59d2:	02e79e23          	sh	a4,60(a5)
    TIMx->CCER = tmpccer;
    59d6:	fdc42783          	lw	a5,-36(s0)
    59da:	fee45703          	lhu	a4,-18(s0)
    59de:	02e79023          	sh	a4,32(a5)
}
    59e2:	0001                	nop
    59e4:	5432                	lw	s0,44(sp)
    59e6:	6145                	addi	sp,sp,48
    59e8:	8082                	ret

000059ea <TIM_OC4Init>:
 *          TIM_OCInitStruct - pointer to a TIM_OCInitTypeDef structure.
 *
 * @return  none
 */
void TIM_OC4Init(TIM_TypeDef *TIMx, TIM_OCInitTypeDef *TIM_OCInitStruct)
{
    59ea:	7179                	addi	sp,sp,-48
    59ec:	d622                	sw	s0,44(sp)
    59ee:	1800                	addi	s0,sp,48
    59f0:	fca42e23          	sw	a0,-36(s0)
    59f4:	fcb42c23          	sw	a1,-40(s0)
    uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
    59f8:	fe041623          	sh	zero,-20(s0)
    59fc:	fe041523          	sh	zero,-22(s0)
    5a00:	fe041723          	sh	zero,-18(s0)

    TIMx->CCER &= (uint16_t)(~((uint16_t)TIM_CC4E));
    5a04:	fdc42783          	lw	a5,-36(s0)
    5a08:	0207d783          	lhu	a5,32(a5)
    5a0c:	01079713          	slli	a4,a5,0x10
    5a10:	8341                	srli	a4,a4,0x10
    5a12:	77fd                	lui	a5,0xfffff
    5a14:	17fd                	addi	a5,a5,-1
    5a16:	8ff9                	and	a5,a5,a4
    5a18:	01079713          	slli	a4,a5,0x10
    5a1c:	8341                	srli	a4,a4,0x10
    5a1e:	fdc42783          	lw	a5,-36(s0)
    5a22:	02e79023          	sh	a4,32(a5) # fffff020 <_eusrstack+0xdfffb020>
    tmpccer = TIMx->CCER;
    5a26:	fdc42783          	lw	a5,-36(s0)
    5a2a:	0207d783          	lhu	a5,32(a5)
    5a2e:	fef41523          	sh	a5,-22(s0)
    tmpcr2 = TIMx->CTLR2;
    5a32:	fdc42783          	lw	a5,-36(s0)
    5a36:	0047d783          	lhu	a5,4(a5)
    5a3a:	fef41723          	sh	a5,-18(s0)
    tmpccmrx = TIMx->CHCTLR2;
    5a3e:	fdc42783          	lw	a5,-36(s0)
    5a42:	01c7d783          	lhu	a5,28(a5)
    5a46:	fef41623          	sh	a5,-20(s0)
    tmpccmrx &= (uint16_t)(~((uint16_t)TIM_OC4M));
    5a4a:	fec45703          	lhu	a4,-20(s0)
    5a4e:	77e5                	lui	a5,0xffff9
    5a50:	17fd                	addi	a5,a5,-1
    5a52:	8ff9                	and	a5,a5,a4
    5a54:	fef41623          	sh	a5,-20(s0)
    tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CC4S));
    5a58:	fec45783          	lhu	a5,-20(s0)
    5a5c:	cff7f793          	andi	a5,a5,-769
    5a60:	fef41623          	sh	a5,-20(s0)
    tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
    5a64:	fd842783          	lw	a5,-40(s0)
    5a68:	0007d783          	lhu	a5,0(a5) # ffff9000 <_eusrstack+0xdfff5000>
    5a6c:	07a2                	slli	a5,a5,0x8
    5a6e:	01079713          	slli	a4,a5,0x10
    5a72:	8341                	srli	a4,a4,0x10
    5a74:	fec45783          	lhu	a5,-20(s0)
    5a78:	8fd9                	or	a5,a5,a4
    5a7a:	fef41623          	sh	a5,-20(s0)
    tmpccer &= (uint16_t)(~((uint16_t)TIM_CC4P));
    5a7e:	fea45703          	lhu	a4,-22(s0)
    5a82:	77f9                	lui	a5,0xffffe
    5a84:	17fd                	addi	a5,a5,-1
    5a86:	8ff9                	and	a5,a5,a4
    5a88:	fef41523          	sh	a5,-22(s0)
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 12);
    5a8c:	fd842783          	lw	a5,-40(s0)
    5a90:	0087d783          	lhu	a5,8(a5) # ffffe008 <_eusrstack+0xdfffa008>
    5a94:	07b2                	slli	a5,a5,0xc
    5a96:	01079713          	slli	a4,a5,0x10
    5a9a:	8341                	srli	a4,a4,0x10
    5a9c:	fea45783          	lhu	a5,-22(s0)
    5aa0:	8fd9                	or	a5,a5,a4
    5aa2:	fef41523          	sh	a5,-22(s0)
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 12);
    5aa6:	fd842783          	lw	a5,-40(s0)
    5aaa:	0027d783          	lhu	a5,2(a5)
    5aae:	07b2                	slli	a5,a5,0xc
    5ab0:	01079713          	slli	a4,a5,0x10
    5ab4:	8341                	srli	a4,a4,0x10
    5ab6:	fea45783          	lhu	a5,-22(s0)
    5aba:	8fd9                	or	a5,a5,a4
    5abc:	fef41523          	sh	a5,-22(s0)

    if((TIMx == TIM1) || (TIMx == TIM2))
    5ac0:	fdc42703          	lw	a4,-36(s0)
    5ac4:	400137b7          	lui	a5,0x40013
    5ac8:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    5acc:	00f70863          	beq	a4,a5,5adc <TIM_OC4Init+0xf2>
    5ad0:	fdc42703          	lw	a4,-36(s0)
    5ad4:	400007b7          	lui	a5,0x40000
    5ad8:	02f71663          	bne	a4,a5,5b04 <TIM_OC4Init+0x11a>
    {
        tmpcr2 &= (uint16_t)(~((uint16_t)TIM_OIS4));
    5adc:	fee45703          	lhu	a4,-18(s0)
    5ae0:	77f1                	lui	a5,0xffffc
    5ae2:	17fd                	addi	a5,a5,-1
    5ae4:	8ff9                	and	a5,a5,a4
    5ae6:	fef41723          	sh	a5,-18(s0)
        tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 6);
    5aea:	fd842783          	lw	a5,-40(s0)
    5aee:	00c7d783          	lhu	a5,12(a5) # ffffc00c <_eusrstack+0xdfff800c>
    5af2:	079a                	slli	a5,a5,0x6
    5af4:	01079713          	slli	a4,a5,0x10
    5af8:	8341                	srli	a4,a4,0x10
    5afa:	fee45783          	lhu	a5,-18(s0)
    5afe:	8fd9                	or	a5,a5,a4
    5b00:	fef41723          	sh	a5,-18(s0)
    }

    TIMx->CTLR2 = tmpcr2;
    5b04:	fdc42783          	lw	a5,-36(s0)
    5b08:	fee45703          	lhu	a4,-18(s0)
    5b0c:	00e79223          	sh	a4,4(a5)
    TIMx->CHCTLR2 = tmpccmrx;
    5b10:	fdc42783          	lw	a5,-36(s0)
    5b14:	fec45703          	lhu	a4,-20(s0)
    5b18:	00e79e23          	sh	a4,28(a5)
    TIMx->CH4CVR = TIM_OCInitStruct->TIM_Pulse;
    5b1c:	fd842783          	lw	a5,-40(s0)
    5b20:	0067d703          	lhu	a4,6(a5)
    5b24:	fdc42783          	lw	a5,-36(s0)
    5b28:	04e79023          	sh	a4,64(a5)
    TIMx->CCER = tmpccer;
    5b2c:	fdc42783          	lw	a5,-36(s0)
    5b30:	fea45703          	lhu	a4,-22(s0)
    5b34:	02e79023          	sh	a4,32(a5)
}
    5b38:	0001                	nop
    5b3a:	5432                	lw	s0,44(sp)
    5b3c:	6145                	addi	sp,sp,48
    5b3e:	8082                	ret

00005b40 <TIM_ICInit>:
 *          TIM_ICInitStruct - pointer to a TIM_ICInitTypeDef structure.
 *
 * @return  none
 */
void TIM_ICInit(TIM_TypeDef *TIMx, TIM_ICInitTypeDef *TIM_ICInitStruct)
{
    5b40:	1101                	addi	sp,sp,-32
    5b42:	ce06                	sw	ra,28(sp)
    5b44:	cc22                	sw	s0,24(sp)
    5b46:	1000                	addi	s0,sp,32
    5b48:	fea42623          	sw	a0,-20(s0)
    5b4c:	feb42423          	sw	a1,-24(s0)
    if(TIM_ICInitStruct->TIM_Channel == TIM_Channel_1)
    5b50:	fe842783          	lw	a5,-24(s0)
    5b54:	0007d783          	lhu	a5,0(a5)
    5b58:	ef8d                	bnez	a5,5b92 <TIM_ICInit+0x52>
    {
        TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
    5b5a:	fe842783          	lw	a5,-24(s0)
    5b5e:	0027d703          	lhu	a4,2(a5)
    5b62:	fe842783          	lw	a5,-24(s0)
    5b66:	0047d603          	lhu	a2,4(a5)
    5b6a:	fe842783          	lw	a5,-24(s0)
    5b6e:	0087d783          	lhu	a5,8(a5)
    5b72:	86be                	mv	a3,a5
    5b74:	85ba                	mv	a1,a4
    5b76:	fec42503          	lw	a0,-20(s0)
    5b7a:	371010ef          	jal	ra,76ea <TI1_Config>
                   TIM_ICInitStruct->TIM_ICSelection,
                   TIM_ICInitStruct->TIM_ICFilter);
        TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    5b7e:	fe842783          	lw	a5,-24(s0)
    5b82:	0067d783          	lhu	a5,6(a5)
    5b86:	85be                	mv	a1,a5
    5b88:	fec42503          	lw	a0,-20(s0)
    5b8c:	7cc010ef          	jal	ra,7358 <TIM_SetIC1Prescaler>
        TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
                   TIM_ICInitStruct->TIM_ICSelection,
                   TIM_ICInitStruct->TIM_ICFilter);
        TIM_SetIC4Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    }
}
    5b90:	a0d1                	j	5c54 <TIM_ICInit+0x114>
    else if(TIM_ICInitStruct->TIM_Channel == TIM_Channel_2)
    5b92:	fe842783          	lw	a5,-24(s0)
    5b96:	0007d703          	lhu	a4,0(a5)
    5b9a:	4791                	li	a5,4
    5b9c:	02f71e63          	bne	a4,a5,5bd8 <TIM_ICInit+0x98>
        TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
    5ba0:	fe842783          	lw	a5,-24(s0)
    5ba4:	0027d703          	lhu	a4,2(a5)
    5ba8:	fe842783          	lw	a5,-24(s0)
    5bac:	0047d603          	lhu	a2,4(a5)
    5bb0:	fe842783          	lw	a5,-24(s0)
    5bb4:	0087d783          	lhu	a5,8(a5)
    5bb8:	86be                	mv	a3,a5
    5bba:	85ba                	mv	a1,a4
    5bbc:	fec42503          	lw	a0,-20(s0)
    5bc0:	441010ef          	jal	ra,7800 <TI2_Config>
        TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    5bc4:	fe842783          	lw	a5,-24(s0)
    5bc8:	0067d783          	lhu	a5,6(a5)
    5bcc:	85be                	mv	a1,a5
    5bce:	fec42503          	lw	a0,-20(s0)
    5bd2:	7dc010ef          	jal	ra,73ae <TIM_SetIC2Prescaler>
}
    5bd6:	a8bd                	j	5c54 <TIM_ICInit+0x114>
    else if(TIM_ICInitStruct->TIM_Channel == TIM_Channel_3)
    5bd8:	fe842783          	lw	a5,-24(s0)
    5bdc:	0007d703          	lhu	a4,0(a5)
    5be0:	47a1                	li	a5,8
    5be2:	02f71e63          	bne	a4,a5,5c1e <TIM_ICInit+0xde>
        TI3_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
    5be6:	fe842783          	lw	a5,-24(s0)
    5bea:	0027d703          	lhu	a4,2(a5)
    5bee:	fe842783          	lw	a5,-24(s0)
    5bf2:	0047d603          	lhu	a2,4(a5)
    5bf6:	fe842783          	lw	a5,-24(s0)
    5bfa:	0087d783          	lhu	a5,8(a5)
    5bfe:	86be                	mv	a3,a5
    5c00:	85ba                	mv	a1,a4
    5c02:	fec42503          	lw	a0,-20(s0)
    5c06:	531010ef          	jal	ra,7936 <TI3_Config>
        TIM_SetIC3Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    5c0a:	fe842783          	lw	a5,-24(s0)
    5c0e:	0067d783          	lhu	a5,6(a5)
    5c12:	85be                	mv	a1,a5
    5c14:	fec42503          	lw	a0,-20(s0)
    5c18:	7fa010ef          	jal	ra,7412 <TIM_SetIC3Prescaler>
}
    5c1c:	a825                	j	5c54 <TIM_ICInit+0x114>
        TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
    5c1e:	fe842783          	lw	a5,-24(s0)
    5c22:	0027d703          	lhu	a4,2(a5)
    5c26:	fe842783          	lw	a5,-24(s0)
    5c2a:	0047d603          	lhu	a2,4(a5)
    5c2e:	fe842783          	lw	a5,-24(s0)
    5c32:	0087d783          	lhu	a5,8(a5)
    5c36:	86be                	mv	a3,a5
    5c38:	85ba                	mv	a1,a4
    5c3a:	fec42503          	lw	a0,-20(s0)
    5c3e:	627010ef          	jal	ra,7a64 <TI4_Config>
        TIM_SetIC4Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    5c42:	fe842783          	lw	a5,-24(s0)
    5c46:	0067d783          	lhu	a5,6(a5)
    5c4a:	85be                	mv	a1,a5
    5c4c:	fec42503          	lw	a0,-20(s0)
    5c50:	019010ef          	jal	ra,7468 <TIM_SetIC4Prescaler>
}
    5c54:	0001                	nop
    5c56:	40f2                	lw	ra,28(sp)
    5c58:	4462                	lw	s0,24(sp)
    5c5a:	6105                	addi	sp,sp,32
    5c5c:	8082                	ret

00005c5e <TIM_PWMIConfig>:
 *          TIM_ICInitStruct - pointer to a TIM_ICInitTypeDef structure.
 *
 * @return  none
 */
void TIM_PWMIConfig(TIM_TypeDef *TIMx, TIM_ICInitTypeDef *TIM_ICInitStruct)
{
    5c5e:	7179                	addi	sp,sp,-48
    5c60:	d606                	sw	ra,44(sp)
    5c62:	d422                	sw	s0,40(sp)
    5c64:	1800                	addi	s0,sp,48
    5c66:	fca42e23          	sw	a0,-36(s0)
    5c6a:	fcb42c23          	sw	a1,-40(s0)
    uint16_t icoppositepolarity = TIM_ICPolarity_Rising;
    5c6e:	fe041723          	sh	zero,-18(s0)
    uint16_t icoppositeselection = TIM_ICSelection_DirectTI;
    5c72:	4785                	li	a5,1
    5c74:	fef41623          	sh	a5,-20(s0)

    if(TIM_ICInitStruct->TIM_ICPolarity == TIM_ICPolarity_Rising)
    5c78:	fd842783          	lw	a5,-40(s0)
    5c7c:	0027d783          	lhu	a5,2(a5)
    5c80:	e789                	bnez	a5,5c8a <TIM_PWMIConfig+0x2c>
    {
        icoppositepolarity = TIM_ICPolarity_Falling;
    5c82:	4789                	li	a5,2
    5c84:	fef41723          	sh	a5,-18(s0)
    5c88:	a019                	j	5c8e <TIM_PWMIConfig+0x30>
    }
    else
    {
        icoppositepolarity = TIM_ICPolarity_Rising;
    5c8a:	fe041723          	sh	zero,-18(s0)
    }

    if(TIM_ICInitStruct->TIM_ICSelection == TIM_ICSelection_DirectTI)
    5c8e:	fd842783          	lw	a5,-40(s0)
    5c92:	0047d703          	lhu	a4,4(a5)
    5c96:	4785                	li	a5,1
    5c98:	00f71663          	bne	a4,a5,5ca4 <TIM_PWMIConfig+0x46>
    {
        icoppositeselection = TIM_ICSelection_IndirectTI;
    5c9c:	4789                	li	a5,2
    5c9e:	fef41623          	sh	a5,-20(s0)
    5ca2:	a021                	j	5caa <TIM_PWMIConfig+0x4c>
    }
    else
    {
        icoppositeselection = TIM_ICSelection_DirectTI;
    5ca4:	4785                	li	a5,1
    5ca6:	fef41623          	sh	a5,-20(s0)
    }

    if(TIM_ICInitStruct->TIM_Channel == TIM_Channel_1)
    5caa:	fd842783          	lw	a5,-40(s0)
    5cae:	0007d783          	lhu	a5,0(a5)
    5cb2:	e7a5                	bnez	a5,5d1a <TIM_PWMIConfig+0xbc>
    {
        TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
    5cb4:	fd842783          	lw	a5,-40(s0)
    5cb8:	0027d703          	lhu	a4,2(a5)
    5cbc:	fd842783          	lw	a5,-40(s0)
    5cc0:	0047d603          	lhu	a2,4(a5)
    5cc4:	fd842783          	lw	a5,-40(s0)
    5cc8:	0087d783          	lhu	a5,8(a5)
    5ccc:	86be                	mv	a3,a5
    5cce:	85ba                	mv	a1,a4
    5cd0:	fdc42503          	lw	a0,-36(s0)
    5cd4:	217010ef          	jal	ra,76ea <TI1_Config>
                   TIM_ICInitStruct->TIM_ICFilter);
        TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    5cd8:	fd842783          	lw	a5,-40(s0)
    5cdc:	0067d783          	lhu	a5,6(a5)
    5ce0:	85be                	mv	a1,a5
    5ce2:	fdc42503          	lw	a0,-36(s0)
    5ce6:	672010ef          	jal	ra,7358 <TIM_SetIC1Prescaler>
        TI2_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
    5cea:	fd842783          	lw	a5,-40(s0)
    5cee:	0087d683          	lhu	a3,8(a5)
    5cf2:	fec45703          	lhu	a4,-20(s0)
    5cf6:	fee45783          	lhu	a5,-18(s0)
    5cfa:	863a                	mv	a2,a4
    5cfc:	85be                	mv	a1,a5
    5cfe:	fdc42503          	lw	a0,-36(s0)
    5d02:	2ff010ef          	jal	ra,7800 <TI2_Config>
        TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    5d06:	fd842783          	lw	a5,-40(s0)
    5d0a:	0067d783          	lhu	a5,6(a5)
    5d0e:	85be                	mv	a1,a5
    5d10:	fdc42503          	lw	a0,-36(s0)
    5d14:	69a010ef          	jal	ra,73ae <TIM_SetIC2Prescaler>
                   TIM_ICInitStruct->TIM_ICFilter);
        TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
        TI1_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
        TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    }
}
    5d18:	a09d                	j	5d7e <TIM_PWMIConfig+0x120>
        TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
    5d1a:	fd842783          	lw	a5,-40(s0)
    5d1e:	0027d703          	lhu	a4,2(a5)
    5d22:	fd842783          	lw	a5,-40(s0)
    5d26:	0047d603          	lhu	a2,4(a5)
    5d2a:	fd842783          	lw	a5,-40(s0)
    5d2e:	0087d783          	lhu	a5,8(a5)
    5d32:	86be                	mv	a3,a5
    5d34:	85ba                	mv	a1,a4
    5d36:	fdc42503          	lw	a0,-36(s0)
    5d3a:	2c7010ef          	jal	ra,7800 <TI2_Config>
        TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    5d3e:	fd842783          	lw	a5,-40(s0)
    5d42:	0067d783          	lhu	a5,6(a5)
    5d46:	85be                	mv	a1,a5
    5d48:	fdc42503          	lw	a0,-36(s0)
    5d4c:	662010ef          	jal	ra,73ae <TIM_SetIC2Prescaler>
        TI1_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
    5d50:	fd842783          	lw	a5,-40(s0)
    5d54:	0087d683          	lhu	a3,8(a5)
    5d58:	fec45703          	lhu	a4,-20(s0)
    5d5c:	fee45783          	lhu	a5,-18(s0)
    5d60:	863a                	mv	a2,a4
    5d62:	85be                	mv	a1,a5
    5d64:	fdc42503          	lw	a0,-36(s0)
    5d68:	183010ef          	jal	ra,76ea <TI1_Config>
        TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
    5d6c:	fd842783          	lw	a5,-40(s0)
    5d70:	0067d783          	lhu	a5,6(a5)
    5d74:	85be                	mv	a1,a5
    5d76:	fdc42503          	lw	a0,-36(s0)
    5d7a:	5de010ef          	jal	ra,7358 <TIM_SetIC1Prescaler>
}
    5d7e:	0001                	nop
    5d80:	50b2                	lw	ra,44(sp)
    5d82:	5422                	lw	s0,40(sp)
    5d84:	6145                	addi	sp,sp,48
    5d86:	8082                	ret

00005d88 <TIM_BDTRConfig>:
 *          TIM_BDTRInitStruct - pointer to a TIM_BDTRInitTypeDef structure.
 *
 * @return  none
 */
void TIM_BDTRConfig(TIM_TypeDef *TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct)
{
    5d88:	1101                	addi	sp,sp,-32
    5d8a:	ce22                	sw	s0,28(sp)
    5d8c:	1000                	addi	s0,sp,32
    5d8e:	fea42623          	sw	a0,-20(s0)
    5d92:	feb42423          	sw	a1,-24(s0)
    TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
    5d96:	fe842783          	lw	a5,-24(s0)
    5d9a:	0007d703          	lhu	a4,0(a5)
    5d9e:	fe842783          	lw	a5,-24(s0)
    5da2:	0027d783          	lhu	a5,2(a5)
    5da6:	8fd9                	or	a5,a5,a4
    5da8:	01079713          	slli	a4,a5,0x10
    5dac:	8341                	srli	a4,a4,0x10
                 TIM_BDTRInitStruct->TIM_LOCKLevel | TIM_BDTRInitStruct->TIM_DeadTime |
    5dae:	fe842783          	lw	a5,-24(s0)
    5db2:	0047d783          	lhu	a5,4(a5)
    TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
    5db6:	8fd9                	or	a5,a5,a4
    5db8:	01079713          	slli	a4,a5,0x10
    5dbc:	8341                	srli	a4,a4,0x10
                 TIM_BDTRInitStruct->TIM_LOCKLevel | TIM_BDTRInitStruct->TIM_DeadTime |
    5dbe:	fe842783          	lw	a5,-24(s0)
    5dc2:	0067d783          	lhu	a5,6(a5)
    TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
    5dc6:	8fd9                	or	a5,a5,a4
    5dc8:	01079713          	slli	a4,a5,0x10
    5dcc:	8341                	srli	a4,a4,0x10
                 TIM_BDTRInitStruct->TIM_Break | TIM_BDTRInitStruct->TIM_BreakPolarity |
    5dce:	fe842783          	lw	a5,-24(s0)
    5dd2:	0087d783          	lhu	a5,8(a5)
    TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
    5dd6:	8fd9                	or	a5,a5,a4
    5dd8:	01079713          	slli	a4,a5,0x10
    5ddc:	8341                	srli	a4,a4,0x10
                 TIM_BDTRInitStruct->TIM_Break | TIM_BDTRInitStruct->TIM_BreakPolarity |
    5dde:	fe842783          	lw	a5,-24(s0)
    5de2:	00a7d783          	lhu	a5,10(a5)
    TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
    5de6:	8fd9                	or	a5,a5,a4
    5de8:	01079713          	slli	a4,a5,0x10
    5dec:	8341                	srli	a4,a4,0x10
                 TIM_BDTRInitStruct->TIM_AutomaticOutput;
    5dee:	fe842783          	lw	a5,-24(s0)
    5df2:	00c7d783          	lhu	a5,12(a5)
    TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
    5df6:	8fd9                	or	a5,a5,a4
    5df8:	01079713          	slli	a4,a5,0x10
    5dfc:	8341                	srli	a4,a4,0x10
    5dfe:	fec42783          	lw	a5,-20(s0)
    5e02:	04e79223          	sh	a4,68(a5)
}
    5e06:	0001                	nop
    5e08:	4472                	lw	s0,28(sp)
    5e0a:	6105                	addi	sp,sp,32
    5e0c:	8082                	ret

00005e0e <TIM_TimeBaseStructInit>:
 * @param   TIM_TimeBaseInitStruct - pointer to a TIM_TimeBaseInitTypeDef structure.
 *
 * @return  none
 */
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef *TIM_TimeBaseInitStruct)
{
    5e0e:	1101                	addi	sp,sp,-32
    5e10:	ce22                	sw	s0,28(sp)
    5e12:	1000                	addi	s0,sp,32
    5e14:	fea42623          	sw	a0,-20(s0)
    TIM_TimeBaseInitStruct->TIM_Period = 0xFFFF;
    5e18:	fec42783          	lw	a5,-20(s0)
    5e1c:	577d                	li	a4,-1
    5e1e:	00e79223          	sh	a4,4(a5)
    TIM_TimeBaseInitStruct->TIM_Prescaler = 0x0000;
    5e22:	fec42783          	lw	a5,-20(s0)
    5e26:	00079023          	sh	zero,0(a5)
    TIM_TimeBaseInitStruct->TIM_ClockDivision = TIM_CKD_DIV1;
    5e2a:	fec42783          	lw	a5,-20(s0)
    5e2e:	00079323          	sh	zero,6(a5)
    TIM_TimeBaseInitStruct->TIM_CounterMode = TIM_CounterMode_Up;
    5e32:	fec42783          	lw	a5,-20(s0)
    5e36:	00079123          	sh	zero,2(a5)
    TIM_TimeBaseInitStruct->TIM_RepetitionCounter = 0x0000;
    5e3a:	fec42783          	lw	a5,-20(s0)
    5e3e:	00078423          	sb	zero,8(a5)
}
    5e42:	0001                	nop
    5e44:	4472                	lw	s0,28(sp)
    5e46:	6105                	addi	sp,sp,32
    5e48:	8082                	ret

00005e4a <TIM_OCStructInit>:
 * @param   TIM_OCInitStruct - pointer to a TIM_OCInitTypeDef structure.
 *
 * @return  none
 */
void TIM_OCStructInit(TIM_OCInitTypeDef *TIM_OCInitStruct)
{
    5e4a:	1101                	addi	sp,sp,-32
    5e4c:	ce22                	sw	s0,28(sp)
    5e4e:	1000                	addi	s0,sp,32
    5e50:	fea42623          	sw	a0,-20(s0)
    TIM_OCInitStruct->TIM_OCMode = TIM_OCMode_Timing;
    5e54:	fec42783          	lw	a5,-20(s0)
    5e58:	00079023          	sh	zero,0(a5)
    TIM_OCInitStruct->TIM_OutputState = TIM_OutputState_Disable;
    5e5c:	fec42783          	lw	a5,-20(s0)
    5e60:	00079123          	sh	zero,2(a5)
    TIM_OCInitStruct->TIM_OutputNState = TIM_OutputNState_Disable;
    5e64:	fec42783          	lw	a5,-20(s0)
    5e68:	00079223          	sh	zero,4(a5)
    TIM_OCInitStruct->TIM_Pulse = 0x0000;
    5e6c:	fec42783          	lw	a5,-20(s0)
    5e70:	00079323          	sh	zero,6(a5)
    TIM_OCInitStruct->TIM_OCPolarity = TIM_OCPolarity_High;
    5e74:	fec42783          	lw	a5,-20(s0)
    5e78:	00079423          	sh	zero,8(a5)
    TIM_OCInitStruct->TIM_OCNPolarity = TIM_OCPolarity_High;
    5e7c:	fec42783          	lw	a5,-20(s0)
    5e80:	00079523          	sh	zero,10(a5)
    TIM_OCInitStruct->TIM_OCIdleState = TIM_OCIdleState_Reset;
    5e84:	fec42783          	lw	a5,-20(s0)
    5e88:	00079623          	sh	zero,12(a5)
    TIM_OCInitStruct->TIM_OCNIdleState = TIM_OCNIdleState_Reset;
    5e8c:	fec42783          	lw	a5,-20(s0)
    5e90:	00079723          	sh	zero,14(a5)
}
    5e94:	0001                	nop
    5e96:	4472                	lw	s0,28(sp)
    5e98:	6105                	addi	sp,sp,32
    5e9a:	8082                	ret

00005e9c <TIM_ICStructInit>:
 * @param   TIM_ICInitStruct - pointer to a TIM_ICInitTypeDef structure.
 *
 * @return  none
 */
void TIM_ICStructInit(TIM_ICInitTypeDef *TIM_ICInitStruct)
{
    5e9c:	1101                	addi	sp,sp,-32
    5e9e:	ce22                	sw	s0,28(sp)
    5ea0:	1000                	addi	s0,sp,32
    5ea2:	fea42623          	sw	a0,-20(s0)
    TIM_ICInitStruct->TIM_Channel = TIM_Channel_1;
    5ea6:	fec42783          	lw	a5,-20(s0)
    5eaa:	00079023          	sh	zero,0(a5)
    TIM_ICInitStruct->TIM_ICPolarity = TIM_ICPolarity_Rising;
    5eae:	fec42783          	lw	a5,-20(s0)
    5eb2:	00079123          	sh	zero,2(a5)
    TIM_ICInitStruct->TIM_ICSelection = TIM_ICSelection_DirectTI;
    5eb6:	fec42783          	lw	a5,-20(s0)
    5eba:	4705                	li	a4,1
    5ebc:	00e79223          	sh	a4,4(a5)
    TIM_ICInitStruct->TIM_ICPrescaler = TIM_ICPSC_DIV1;
    5ec0:	fec42783          	lw	a5,-20(s0)
    5ec4:	00079323          	sh	zero,6(a5)
    TIM_ICInitStruct->TIM_ICFilter = 0x00;
    5ec8:	fec42783          	lw	a5,-20(s0)
    5ecc:	00079423          	sh	zero,8(a5)
}
    5ed0:	0001                	nop
    5ed2:	4472                	lw	s0,28(sp)
    5ed4:	6105                	addi	sp,sp,32
    5ed6:	8082                	ret

00005ed8 <TIM_BDTRStructInit>:
 * @param   TIM_BDTRInitStruct - pointer to a TIM_BDTRInitTypeDef structure.
 *
 * @return  none
 */
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef *TIM_BDTRInitStruct)
{
    5ed8:	1101                	addi	sp,sp,-32
    5eda:	ce22                	sw	s0,28(sp)
    5edc:	1000                	addi	s0,sp,32
    5ede:	fea42623          	sw	a0,-20(s0)
    TIM_BDTRInitStruct->TIM_OSSRState = TIM_OSSRState_Disable;
    5ee2:	fec42783          	lw	a5,-20(s0)
    5ee6:	00079023          	sh	zero,0(a5)
    TIM_BDTRInitStruct->TIM_OSSIState = TIM_OSSIState_Disable;
    5eea:	fec42783          	lw	a5,-20(s0)
    5eee:	00079123          	sh	zero,2(a5)
    TIM_BDTRInitStruct->TIM_LOCKLevel = TIM_LOCKLevel_OFF;
    5ef2:	fec42783          	lw	a5,-20(s0)
    5ef6:	00079223          	sh	zero,4(a5)
    TIM_BDTRInitStruct->TIM_DeadTime = 0x00;
    5efa:	fec42783          	lw	a5,-20(s0)
    5efe:	00079323          	sh	zero,6(a5)
    TIM_BDTRInitStruct->TIM_Break = TIM_Break_Disable;
    5f02:	fec42783          	lw	a5,-20(s0)
    5f06:	00079423          	sh	zero,8(a5)
    TIM_BDTRInitStruct->TIM_BreakPolarity = TIM_BreakPolarity_Low;
    5f0a:	fec42783          	lw	a5,-20(s0)
    5f0e:	00079523          	sh	zero,10(a5)
    TIM_BDTRInitStruct->TIM_AutomaticOutput = TIM_AutomaticOutput_Disable;
    5f12:	fec42783          	lw	a5,-20(s0)
    5f16:	00079623          	sh	zero,12(a5)
}
    5f1a:	0001                	nop
    5f1c:	4472                	lw	s0,28(sp)
    5f1e:	6105                	addi	sp,sp,32
    5f20:	8082                	ret

00005f22 <TIM_Cmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_Cmd(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    5f22:	1101                	addi	sp,sp,-32
    5f24:	ce22                	sw	s0,28(sp)
    5f26:	1000                	addi	s0,sp,32
    5f28:	fea42623          	sw	a0,-20(s0)
    5f2c:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    5f30:	fe842783          	lw	a5,-24(s0)
    5f34:	c38d                	beqz	a5,5f56 <TIM_Cmd+0x34>
    {
        TIMx->CTLR1 |= TIM_CEN;
    5f36:	fec42783          	lw	a5,-20(s0)
    5f3a:	0007d783          	lhu	a5,0(a5)
    5f3e:	07c2                	slli	a5,a5,0x10
    5f40:	83c1                	srli	a5,a5,0x10
    5f42:	0017e793          	ori	a5,a5,1
    5f46:	01079713          	slli	a4,a5,0x10
    5f4a:	8341                	srli	a4,a4,0x10
    5f4c:	fec42783          	lw	a5,-20(s0)
    5f50:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        TIMx->CTLR1 &= (uint16_t)(~((uint16_t)TIM_CEN));
    }
}
    5f54:	a839                	j	5f72 <TIM_Cmd+0x50>
        TIMx->CTLR1 &= (uint16_t)(~((uint16_t)TIM_CEN));
    5f56:	fec42783          	lw	a5,-20(s0)
    5f5a:	0007d783          	lhu	a5,0(a5)
    5f5e:	07c2                	slli	a5,a5,0x10
    5f60:	83c1                	srli	a5,a5,0x10
    5f62:	9bf9                	andi	a5,a5,-2
    5f64:	01079713          	slli	a4,a5,0x10
    5f68:	8341                	srli	a4,a4,0x10
    5f6a:	fec42783          	lw	a5,-20(s0)
    5f6e:	00e79023          	sh	a4,0(a5)
}
    5f72:	0001                	nop
    5f74:	4472                	lw	s0,28(sp)
    5f76:	6105                	addi	sp,sp,32
    5f78:	8082                	ret

00005f7a <TIM_CtrlPWMOutputs>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_CtrlPWMOutputs(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    5f7a:	1101                	addi	sp,sp,-32
    5f7c:	ce22                	sw	s0,28(sp)
    5f7e:	1000                	addi	s0,sp,32
    5f80:	fea42623          	sw	a0,-20(s0)
    5f84:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    5f88:	fe842783          	lw	a5,-24(s0)
    5f8c:	c395                	beqz	a5,5fb0 <TIM_CtrlPWMOutputs+0x36>
    {
        TIMx->BDTR |= TIM_MOE;
    5f8e:	fec42783          	lw	a5,-20(s0)
    5f92:	0447d783          	lhu	a5,68(a5)
    5f96:	01079713          	slli	a4,a5,0x10
    5f9a:	8341                	srli	a4,a4,0x10
    5f9c:	77e1                	lui	a5,0xffff8
    5f9e:	8fd9                	or	a5,a5,a4
    5fa0:	01079713          	slli	a4,a5,0x10
    5fa4:	8341                	srli	a4,a4,0x10
    5fa6:	fec42783          	lw	a5,-20(s0)
    5faa:	04e79223          	sh	a4,68(a5) # ffff8044 <_eusrstack+0xdfff4044>
    }
    else
    {
        TIMx->BDTR &= (uint16_t)(~((uint16_t)TIM_MOE));
    }
}
    5fae:	a015                	j	5fd2 <TIM_CtrlPWMOutputs+0x58>
        TIMx->BDTR &= (uint16_t)(~((uint16_t)TIM_MOE));
    5fb0:	fec42783          	lw	a5,-20(s0)
    5fb4:	0447d783          	lhu	a5,68(a5)
    5fb8:	01079713          	slli	a4,a5,0x10
    5fbc:	8341                	srli	a4,a4,0x10
    5fbe:	67a1                	lui	a5,0x8
    5fc0:	17fd                	addi	a5,a5,-1
    5fc2:	8ff9                	and	a5,a5,a4
    5fc4:	01079713          	slli	a4,a5,0x10
    5fc8:	8341                	srli	a4,a4,0x10
    5fca:	fec42783          	lw	a5,-20(s0)
    5fce:	04e79223          	sh	a4,68(a5) # 8044 <USART_ClockInit+0x16>
}
    5fd2:	0001                	nop
    5fd4:	4472                	lw	s0,28(sp)
    5fd6:	6105                	addi	sp,sp,32
    5fd8:	8082                	ret

00005fda <TIM_ITConfig>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_ITConfig(TIM_TypeDef *TIMx, uint16_t TIM_IT, FunctionalState NewState)
{
    5fda:	1101                	addi	sp,sp,-32
    5fdc:	ce22                	sw	s0,28(sp)
    5fde:	1000                	addi	s0,sp,32
    5fe0:	fea42623          	sw	a0,-20(s0)
    5fe4:	87ae                	mv	a5,a1
    5fe6:	fec42223          	sw	a2,-28(s0)
    5fea:	fef41523          	sh	a5,-22(s0)
    if(NewState != DISABLE)
    5fee:	fe442783          	lw	a5,-28(s0)
    5ff2:	c39d                	beqz	a5,6018 <TIM_ITConfig+0x3e>
    {
        TIMx->DMAINTENR |= TIM_IT;
    5ff4:	fec42783          	lw	a5,-20(s0)
    5ff8:	00c7d783          	lhu	a5,12(a5)
    5ffc:	01079713          	slli	a4,a5,0x10
    6000:	8341                	srli	a4,a4,0x10
    6002:	fea45783          	lhu	a5,-22(s0)
    6006:	8fd9                	or	a5,a5,a4
    6008:	01079713          	slli	a4,a5,0x10
    600c:	8341                	srli	a4,a4,0x10
    600e:	fec42783          	lw	a5,-20(s0)
    6012:	00e79623          	sh	a4,12(a5)
    }
    else
    {
        TIMx->DMAINTENR &= (uint16_t)~TIM_IT;
    }
}
    6016:	a035                	j	6042 <TIM_ITConfig+0x68>
        TIMx->DMAINTENR &= (uint16_t)~TIM_IT;
    6018:	fec42783          	lw	a5,-20(s0)
    601c:	00c7d783          	lhu	a5,12(a5)
    6020:	01079713          	slli	a4,a5,0x10
    6024:	8341                	srli	a4,a4,0x10
    6026:	fea45783          	lhu	a5,-22(s0)
    602a:	fff7c793          	not	a5,a5
    602e:	07c2                	slli	a5,a5,0x10
    6030:	83c1                	srli	a5,a5,0x10
    6032:	8ff9                	and	a5,a5,a4
    6034:	01079713          	slli	a4,a5,0x10
    6038:	8341                	srli	a4,a4,0x10
    603a:	fec42783          	lw	a5,-20(s0)
    603e:	00e79623          	sh	a4,12(a5)
}
    6042:	0001                	nop
    6044:	4472                	lw	s0,28(sp)
    6046:	6105                	addi	sp,sp,32
    6048:	8082                	ret

0000604a <TIM_GenerateEvent>:
 *                 TIM_EventSource_Break: Timer Break event source.
 *
 * @return None
 */
void TIM_GenerateEvent(TIM_TypeDef *TIMx, uint16_t TIM_EventSource)
{
    604a:	1101                	addi	sp,sp,-32
    604c:	ce22                	sw	s0,28(sp)
    604e:	1000                	addi	s0,sp,32
    6050:	fea42623          	sw	a0,-20(s0)
    6054:	87ae                	mv	a5,a1
    6056:	fef41523          	sh	a5,-22(s0)
    TIMx->SWEVGR = TIM_EventSource;
    605a:	fec42783          	lw	a5,-20(s0)
    605e:	fea45703          	lhu	a4,-22(s0)
    6062:	00e79a23          	sh	a4,20(a5)
}
    6066:	0001                	nop
    6068:	4472                	lw	s0,28(sp)
    606a:	6105                	addi	sp,sp,32
    606c:	8082                	ret

0000606e <TIM_DMAConfig>:
 *            TIM_DMABurstLength_18Transfers.
 *
 * @return  none
 */
void TIM_DMAConfig(TIM_TypeDef *TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength)
{
    606e:	1101                	addi	sp,sp,-32
    6070:	ce22                	sw	s0,28(sp)
    6072:	1000                	addi	s0,sp,32
    6074:	fea42623          	sw	a0,-20(s0)
    6078:	87ae                	mv	a5,a1
    607a:	8732                	mv	a4,a2
    607c:	fef41523          	sh	a5,-22(s0)
    6080:	87ba                	mv	a5,a4
    6082:	fef41423          	sh	a5,-24(s0)
    TIMx->DMACFGR = TIM_DMABase | TIM_DMABurstLength;
    6086:	fea45703          	lhu	a4,-22(s0)
    608a:	fe845783          	lhu	a5,-24(s0)
    608e:	8fd9                	or	a5,a5,a4
    6090:	01079713          	slli	a4,a5,0x10
    6094:	8341                	srli	a4,a4,0x10
    6096:	fec42783          	lw	a5,-20(s0)
    609a:	04e79423          	sh	a4,72(a5)
}
    609e:	0001                	nop
    60a0:	4472                	lw	s0,28(sp)
    60a2:	6105                	addi	sp,sp,32
    60a4:	8082                	ret

000060a6 <TIM_DMACmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_DMACmd(TIM_TypeDef *TIMx, uint16_t TIM_DMASource, FunctionalState NewState)
{
    60a6:	1101                	addi	sp,sp,-32
    60a8:	ce22                	sw	s0,28(sp)
    60aa:	1000                	addi	s0,sp,32
    60ac:	fea42623          	sw	a0,-20(s0)
    60b0:	87ae                	mv	a5,a1
    60b2:	fec42223          	sw	a2,-28(s0)
    60b6:	fef41523          	sh	a5,-22(s0)
    if(NewState != DISABLE)
    60ba:	fe442783          	lw	a5,-28(s0)
    60be:	c39d                	beqz	a5,60e4 <TIM_DMACmd+0x3e>
    {
        TIMx->DMAINTENR |= TIM_DMASource;
    60c0:	fec42783          	lw	a5,-20(s0)
    60c4:	00c7d783          	lhu	a5,12(a5)
    60c8:	01079713          	slli	a4,a5,0x10
    60cc:	8341                	srli	a4,a4,0x10
    60ce:	fea45783          	lhu	a5,-22(s0)
    60d2:	8fd9                	or	a5,a5,a4
    60d4:	01079713          	slli	a4,a5,0x10
    60d8:	8341                	srli	a4,a4,0x10
    60da:	fec42783          	lw	a5,-20(s0)
    60de:	00e79623          	sh	a4,12(a5)
    }
    else
    {
        TIMx->DMAINTENR &= (uint16_t)~TIM_DMASource;
    }
}
    60e2:	a035                	j	610e <TIM_DMACmd+0x68>
        TIMx->DMAINTENR &= (uint16_t)~TIM_DMASource;
    60e4:	fec42783          	lw	a5,-20(s0)
    60e8:	00c7d783          	lhu	a5,12(a5)
    60ec:	01079713          	slli	a4,a5,0x10
    60f0:	8341                	srli	a4,a4,0x10
    60f2:	fea45783          	lhu	a5,-22(s0)
    60f6:	fff7c793          	not	a5,a5
    60fa:	07c2                	slli	a5,a5,0x10
    60fc:	83c1                	srli	a5,a5,0x10
    60fe:	8ff9                	and	a5,a5,a4
    6100:	01079713          	slli	a4,a5,0x10
    6104:	8341                	srli	a4,a4,0x10
    6106:	fec42783          	lw	a5,-20(s0)
    610a:	00e79623          	sh	a4,12(a5)
}
    610e:	0001                	nop
    6110:	4472                	lw	s0,28(sp)
    6112:	6105                	addi	sp,sp,32
    6114:	8082                	ret

00006116 <TIM_InternalClockConfig>:
 * @param   TIMx - where x can be 1 to 3 to select the TIM peripheral.
 *
 * @return  none
 */
void TIM_InternalClockConfig(TIM_TypeDef *TIMx)
{
    6116:	1101                	addi	sp,sp,-32
    6118:	ce22                	sw	s0,28(sp)
    611a:	1000                	addi	s0,sp,32
    611c:	fea42623          	sw	a0,-20(s0)
    TIMx->SMCFGR &= (uint16_t)(~((uint16_t)TIM_SMS));
    6120:	fec42783          	lw	a5,-20(s0)
    6124:	0087d783          	lhu	a5,8(a5)
    6128:	07c2                	slli	a5,a5,0x10
    612a:	83c1                	srli	a5,a5,0x10
    612c:	9be1                	andi	a5,a5,-8
    612e:	01079713          	slli	a4,a5,0x10
    6132:	8341                	srli	a4,a4,0x10
    6134:	fec42783          	lw	a5,-20(s0)
    6138:	00e79423          	sh	a4,8(a5)
}
    613c:	0001                	nop
    613e:	4472                	lw	s0,28(sp)
    6140:	6105                	addi	sp,sp,32
    6142:	8082                	ret

00006144 <TIM_ITRxExternalClockConfig>:
 *            TIM_TS_ITR3 - Internal Trigger 3.
 *
 * @return  none
 */
void TIM_ITRxExternalClockConfig(TIM_TypeDef *TIMx, uint16_t TIM_InputTriggerSource)
{
    6144:	1101                	addi	sp,sp,-32
    6146:	ce06                	sw	ra,28(sp)
    6148:	cc22                	sw	s0,24(sp)
    614a:	1000                	addi	s0,sp,32
    614c:	fea42623          	sw	a0,-20(s0)
    6150:	87ae                	mv	a5,a1
    6152:	fef41523          	sh	a5,-22(s0)
    TIM_SelectInputTrigger(TIMx, TIM_InputTriggerSource);
    6156:	fea45783          	lhu	a5,-22(s0)
    615a:	85be                	mv	a1,a5
    615c:	fec42503          	lw	a0,-20(s0)
    6160:	2455                	jal	6404 <TIM_SelectInputTrigger>
    TIMx->SMCFGR |= TIM_SlaveMode_External1;
    6162:	fec42783          	lw	a5,-20(s0)
    6166:	0087d783          	lhu	a5,8(a5)
    616a:	07c2                	slli	a5,a5,0x10
    616c:	83c1                	srli	a5,a5,0x10
    616e:	0077e793          	ori	a5,a5,7
    6172:	01079713          	slli	a4,a5,0x10
    6176:	8341                	srli	a4,a4,0x10
    6178:	fec42783          	lw	a5,-20(s0)
    617c:	00e79423          	sh	a4,8(a5)
}
    6180:	0001                	nop
    6182:	40f2                	lw	ra,28(sp)
    6184:	4462                	lw	s0,24(sp)
    6186:	6105                	addi	sp,sp,32
    6188:	8082                	ret

0000618a <TIM_TIxExternalClockConfig>:
 *
 * @return  none
 */
void TIM_TIxExternalClockConfig(TIM_TypeDef *TIMx, uint16_t TIM_TIxExternalCLKSource,
                                uint16_t TIM_ICPolarity, uint16_t ICFilter)
{
    618a:	1101                	addi	sp,sp,-32
    618c:	ce06                	sw	ra,28(sp)
    618e:	cc22                	sw	s0,24(sp)
    6190:	1000                	addi	s0,sp,32
    6192:	fea42623          	sw	a0,-20(s0)
    6196:	87ae                	mv	a5,a1
    6198:	8736                	mv	a4,a3
    619a:	fef41523          	sh	a5,-22(s0)
    619e:	87b2                	mv	a5,a2
    61a0:	fef41423          	sh	a5,-24(s0)
    61a4:	87ba                	mv	a5,a4
    61a6:	fef41323          	sh	a5,-26(s0)
    if(TIM_TIxExternalCLKSource == TIM_TIxExternalCLK1Source_TI2)
    61aa:	fea45703          	lhu	a4,-22(s0)
    61ae:	06000793          	li	a5,96
    61b2:	00f71e63          	bne	a4,a5,61ce <TIM_TIxExternalClockConfig+0x44>
    {
        TI2_Config(TIMx, TIM_ICPolarity, TIM_ICSelection_DirectTI, ICFilter);
    61b6:	fe645703          	lhu	a4,-26(s0)
    61ba:	fe845783          	lhu	a5,-24(s0)
    61be:	86ba                	mv	a3,a4
    61c0:	4605                	li	a2,1
    61c2:	85be                	mv	a1,a5
    61c4:	fec42503          	lw	a0,-20(s0)
    61c8:	638010ef          	jal	ra,7800 <TI2_Config>
    61cc:	a821                	j	61e4 <TIM_TIxExternalClockConfig+0x5a>
    }
    else
    {
        TI1_Config(TIMx, TIM_ICPolarity, TIM_ICSelection_DirectTI, ICFilter);
    61ce:	fe645703          	lhu	a4,-26(s0)
    61d2:	fe845783          	lhu	a5,-24(s0)
    61d6:	86ba                	mv	a3,a4
    61d8:	4605                	li	a2,1
    61da:	85be                	mv	a1,a5
    61dc:	fec42503          	lw	a0,-20(s0)
    61e0:	50a010ef          	jal	ra,76ea <TI1_Config>
    }

    TIM_SelectInputTrigger(TIMx, TIM_TIxExternalCLKSource);
    61e4:	fea45783          	lhu	a5,-22(s0)
    61e8:	85be                	mv	a1,a5
    61ea:	fec42503          	lw	a0,-20(s0)
    61ee:	2c19                	jal	6404 <TIM_SelectInputTrigger>
    TIMx->SMCFGR |= TIM_SlaveMode_External1;
    61f0:	fec42783          	lw	a5,-20(s0)
    61f4:	0087d783          	lhu	a5,8(a5)
    61f8:	07c2                	slli	a5,a5,0x10
    61fa:	83c1                	srli	a5,a5,0x10
    61fc:	0077e793          	ori	a5,a5,7
    6200:	01079713          	slli	a4,a5,0x10
    6204:	8341                	srli	a4,a4,0x10
    6206:	fec42783          	lw	a5,-20(s0)
    620a:	00e79423          	sh	a4,8(a5)
}
    620e:	0001                	nop
    6210:	40f2                	lw	ra,28(sp)
    6212:	4462                	lw	s0,24(sp)
    6214:	6105                	addi	sp,sp,32
    6216:	8082                	ret

00006218 <TIM_ETRClockMode1Config>:
 *
 * @return  none
 */
void TIM_ETRClockMode1Config(TIM_TypeDef *TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                             uint16_t ExtTRGFilter)
{
    6218:	7179                	addi	sp,sp,-48
    621a:	d606                	sw	ra,44(sp)
    621c:	d422                	sw	s0,40(sp)
    621e:	1800                	addi	s0,sp,48
    6220:	fca42e23          	sw	a0,-36(s0)
    6224:	87ae                	mv	a5,a1
    6226:	8736                	mv	a4,a3
    6228:	fcf41d23          	sh	a5,-38(s0)
    622c:	87b2                	mv	a5,a2
    622e:	fcf41c23          	sh	a5,-40(s0)
    6232:	87ba                	mv	a5,a4
    6234:	fcf41b23          	sh	a5,-42(s0)
    uint16_t tmpsmcr = 0;
    6238:	fe041723          	sh	zero,-18(s0)

    TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
    623c:	fd645683          	lhu	a3,-42(s0)
    6240:	fd845703          	lhu	a4,-40(s0)
    6244:	fda45783          	lhu	a5,-38(s0)
    6248:	863a                	mv	a2,a4
    624a:	85be                	mv	a1,a5
    624c:	fdc42503          	lw	a0,-36(s0)
    6250:	284d                	jal	6302 <TIM_ETRConfig>
    tmpsmcr = TIMx->SMCFGR;
    6252:	fdc42783          	lw	a5,-36(s0)
    6256:	0087d783          	lhu	a5,8(a5)
    625a:	fef41723          	sh	a5,-18(s0)
    tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMS));
    625e:	fee45783          	lhu	a5,-18(s0)
    6262:	9be1                	andi	a5,a5,-8
    6264:	fef41723          	sh	a5,-18(s0)
    tmpsmcr |= TIM_SlaveMode_External1;
    6268:	fee45783          	lhu	a5,-18(s0)
    626c:	0077e793          	ori	a5,a5,7
    6270:	fef41723          	sh	a5,-18(s0)
    tmpsmcr &= (uint16_t)(~((uint16_t)TIM_TS));
    6274:	fee45783          	lhu	a5,-18(s0)
    6278:	f8f7f793          	andi	a5,a5,-113
    627c:	fef41723          	sh	a5,-18(s0)
    tmpsmcr |= TIM_TS_ETRF;
    6280:	fee45783          	lhu	a5,-18(s0)
    6284:	0707e793          	ori	a5,a5,112
    6288:	fef41723          	sh	a5,-18(s0)
    TIMx->SMCFGR = tmpsmcr;
    628c:	fdc42783          	lw	a5,-36(s0)
    6290:	fee45703          	lhu	a4,-18(s0)
    6294:	00e79423          	sh	a4,8(a5)
}
    6298:	0001                	nop
    629a:	50b2                	lw	ra,44(sp)
    629c:	5422                	lw	s0,40(sp)
    629e:	6145                	addi	sp,sp,48
    62a0:	8082                	ret

000062a2 <TIM_ETRClockMode2Config>:
 *
 * @return  none
 */
void TIM_ETRClockMode2Config(TIM_TypeDef *TIMx, uint16_t TIM_ExtTRGPrescaler,
                             uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
{
    62a2:	1101                	addi	sp,sp,-32
    62a4:	ce06                	sw	ra,28(sp)
    62a6:	cc22                	sw	s0,24(sp)
    62a8:	1000                	addi	s0,sp,32
    62aa:	fea42623          	sw	a0,-20(s0)
    62ae:	87ae                	mv	a5,a1
    62b0:	8736                	mv	a4,a3
    62b2:	fef41523          	sh	a5,-22(s0)
    62b6:	87b2                	mv	a5,a2
    62b8:	fef41423          	sh	a5,-24(s0)
    62bc:	87ba                	mv	a5,a4
    62be:	fef41323          	sh	a5,-26(s0)
    TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
    62c2:	fe645683          	lhu	a3,-26(s0)
    62c6:	fe845703          	lhu	a4,-24(s0)
    62ca:	fea45783          	lhu	a5,-22(s0)
    62ce:	863a                	mv	a2,a4
    62d0:	85be                	mv	a1,a5
    62d2:	fec42503          	lw	a0,-20(s0)
    62d6:	2035                	jal	6302 <TIM_ETRConfig>
    TIMx->SMCFGR |= TIM_ECE;
    62d8:	fec42783          	lw	a5,-20(s0)
    62dc:	0087d783          	lhu	a5,8(a5)
    62e0:	01079713          	slli	a4,a5,0x10
    62e4:	8341                	srli	a4,a4,0x10
    62e6:	6791                	lui	a5,0x4
    62e8:	8fd9                	or	a5,a5,a4
    62ea:	01079713          	slli	a4,a5,0x10
    62ee:	8341                	srli	a4,a4,0x10
    62f0:	fec42783          	lw	a5,-20(s0)
    62f4:	00e79423          	sh	a4,8(a5) # 4008 <NVIC_Init+0x2b8>
}
    62f8:	0001                	nop
    62fa:	40f2                	lw	ra,28(sp)
    62fc:	4462                	lw	s0,24(sp)
    62fe:	6105                	addi	sp,sp,32
    6300:	8082                	ret

00006302 <TIM_ETRConfig>:
 *
 * @return  none
 */
void TIM_ETRConfig(TIM_TypeDef *TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                   uint16_t ExtTRGFilter)
{
    6302:	7179                	addi	sp,sp,-48
    6304:	d622                	sw	s0,44(sp)
    6306:	1800                	addi	s0,sp,48
    6308:	fca42e23          	sw	a0,-36(s0)
    630c:	87ae                	mv	a5,a1
    630e:	8736                	mv	a4,a3
    6310:	fcf41d23          	sh	a5,-38(s0)
    6314:	87b2                	mv	a5,a2
    6316:	fcf41c23          	sh	a5,-40(s0)
    631a:	87ba                	mv	a5,a4
    631c:	fcf41b23          	sh	a5,-42(s0)
    uint16_t tmpsmcr = 0;
    6320:	fe041723          	sh	zero,-18(s0)

    tmpsmcr = TIMx->SMCFGR;
    6324:	fdc42783          	lw	a5,-36(s0)
    6328:	0087d783          	lhu	a5,8(a5)
    632c:	fef41723          	sh	a5,-18(s0)
    tmpsmcr &= SMCFGR_ETR_Mask;
    6330:	fee45783          	lhu	a5,-18(s0)
    6334:	0ff7f793          	andi	a5,a5,255
    6338:	fef41723          	sh	a5,-18(s0)
    tmpsmcr |= (uint16_t)(TIM_ExtTRGPrescaler | (uint16_t)(TIM_ExtTRGPolarity | (uint16_t)(ExtTRGFilter << (uint16_t)8)));
    633c:	fd645783          	lhu	a5,-42(s0)
    6340:	07a2                	slli	a5,a5,0x8
    6342:	01079713          	slli	a4,a5,0x10
    6346:	8341                	srli	a4,a4,0x10
    6348:	fd845783          	lhu	a5,-40(s0)
    634c:	8fd9                	or	a5,a5,a4
    634e:	01079713          	slli	a4,a5,0x10
    6352:	8341                	srli	a4,a4,0x10
    6354:	fda45783          	lhu	a5,-38(s0)
    6358:	8fd9                	or	a5,a5,a4
    635a:	01079713          	slli	a4,a5,0x10
    635e:	8341                	srli	a4,a4,0x10
    6360:	fee45783          	lhu	a5,-18(s0)
    6364:	8fd9                	or	a5,a5,a4
    6366:	fef41723          	sh	a5,-18(s0)
    TIMx->SMCFGR = tmpsmcr;
    636a:	fdc42783          	lw	a5,-36(s0)
    636e:	fee45703          	lhu	a4,-18(s0)
    6372:	00e79423          	sh	a4,8(a5)
}
    6376:	0001                	nop
    6378:	5432                	lw	s0,44(sp)
    637a:	6145                	addi	sp,sp,48
    637c:	8082                	ret

0000637e <TIM_PrescalerConfig>:
 *            TIM_PSCReloadMode_Immediate - The Prescaler is loaded immediately.
 *
 * @return  none
 */
void TIM_PrescalerConfig(TIM_TypeDef *TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode)
{
    637e:	1101                	addi	sp,sp,-32
    6380:	ce22                	sw	s0,28(sp)
    6382:	1000                	addi	s0,sp,32
    6384:	fea42623          	sw	a0,-20(s0)
    6388:	87ae                	mv	a5,a1
    638a:	8732                	mv	a4,a2
    638c:	fef41523          	sh	a5,-22(s0)
    6390:	87ba                	mv	a5,a4
    6392:	fef41423          	sh	a5,-24(s0)
    TIMx->PSC = Prescaler;
    6396:	fec42783          	lw	a5,-20(s0)
    639a:	fea45703          	lhu	a4,-22(s0)
    639e:	02e79423          	sh	a4,40(a5)
    TIMx->SWEVGR = TIM_PSCReloadMode;
    63a2:	fec42783          	lw	a5,-20(s0)
    63a6:	fe845703          	lhu	a4,-24(s0)
    63aa:	00e79a23          	sh	a4,20(a5)
}
    63ae:	0001                	nop
    63b0:	4472                	lw	s0,28(sp)
    63b2:	6105                	addi	sp,sp,32
    63b4:	8082                	ret

000063b6 <TIM_CounterModeConfig>:
 *            TIM_CounterMode_CenterAligned3 - TIM Center Aligned Mode3.
 *
 * @return  none
 */
void TIM_CounterModeConfig(TIM_TypeDef *TIMx, uint16_t TIM_CounterMode)
{
    63b6:	7179                	addi	sp,sp,-48
    63b8:	d622                	sw	s0,44(sp)
    63ba:	1800                	addi	s0,sp,48
    63bc:	fca42e23          	sw	a0,-36(s0)
    63c0:	87ae                	mv	a5,a1
    63c2:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpcr1 = 0;
    63c6:	fe041723          	sh	zero,-18(s0)

    tmpcr1 = TIMx->CTLR1;
    63ca:	fdc42783          	lw	a5,-36(s0)
    63ce:	0007d783          	lhu	a5,0(a5)
    63d2:	fef41723          	sh	a5,-18(s0)
    tmpcr1 &= (uint16_t)(~((uint16_t)(TIM_DIR | TIM_CMS)));
    63d6:	fee45783          	lhu	a5,-18(s0)
    63da:	f8f7f793          	andi	a5,a5,-113
    63de:	fef41723          	sh	a5,-18(s0)
    tmpcr1 |= TIM_CounterMode;
    63e2:	fee45703          	lhu	a4,-18(s0)
    63e6:	fda45783          	lhu	a5,-38(s0)
    63ea:	8fd9                	or	a5,a5,a4
    63ec:	fef41723          	sh	a5,-18(s0)
    TIMx->CTLR1 = tmpcr1;
    63f0:	fdc42783          	lw	a5,-36(s0)
    63f4:	fee45703          	lhu	a4,-18(s0)
    63f8:	00e79023          	sh	a4,0(a5)
}
    63fc:	0001                	nop
    63fe:	5432                	lw	s0,44(sp)
    6400:	6145                	addi	sp,sp,48
    6402:	8082                	ret

00006404 <TIM_SelectInputTrigger>:
 *            TIM_TS_ETRF - External Trigger input.
 *
 * @return  none
 */
void TIM_SelectInputTrigger(TIM_TypeDef *TIMx, uint16_t TIM_InputTriggerSource)
{
    6404:	7179                	addi	sp,sp,-48
    6406:	d622                	sw	s0,44(sp)
    6408:	1800                	addi	s0,sp,48
    640a:	fca42e23          	sw	a0,-36(s0)
    640e:	87ae                	mv	a5,a1
    6410:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpsmcr = 0;
    6414:	fe041723          	sh	zero,-18(s0)

    tmpsmcr = TIMx->SMCFGR;
    6418:	fdc42783          	lw	a5,-36(s0)
    641c:	0087d783          	lhu	a5,8(a5)
    6420:	fef41723          	sh	a5,-18(s0)
    tmpsmcr &= (uint16_t)(~((uint16_t)TIM_TS));
    6424:	fee45783          	lhu	a5,-18(s0)
    6428:	f8f7f793          	andi	a5,a5,-113
    642c:	fef41723          	sh	a5,-18(s0)
    tmpsmcr |= TIM_InputTriggerSource;
    6430:	fee45703          	lhu	a4,-18(s0)
    6434:	fda45783          	lhu	a5,-38(s0)
    6438:	8fd9                	or	a5,a5,a4
    643a:	fef41723          	sh	a5,-18(s0)
    TIMx->SMCFGR = tmpsmcr;
    643e:	fdc42783          	lw	a5,-36(s0)
    6442:	fee45703          	lhu	a4,-18(s0)
    6446:	00e79423          	sh	a4,8(a5)
}
    644a:	0001                	nop
    644c:	5432                	lw	s0,44(sp)
    644e:	6145                	addi	sp,sp,48
    6450:	8082                	ret

00006452 <TIM_EncoderInterfaceConfig>:
 *
 * @return  none
 */
void TIM_EncoderInterfaceConfig(TIM_TypeDef *TIMx, uint16_t TIM_EncoderMode,
                                uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity)
{
    6452:	7179                	addi	sp,sp,-48
    6454:	d622                	sw	s0,44(sp)
    6456:	1800                	addi	s0,sp,48
    6458:	fca42e23          	sw	a0,-36(s0)
    645c:	87ae                	mv	a5,a1
    645e:	8736                	mv	a4,a3
    6460:	fcf41d23          	sh	a5,-38(s0)
    6464:	87b2                	mv	a5,a2
    6466:	fcf41c23          	sh	a5,-40(s0)
    646a:	87ba                	mv	a5,a4
    646c:	fcf41b23          	sh	a5,-42(s0)
    uint16_t tmpsmcr = 0;
    6470:	fe041723          	sh	zero,-18(s0)
    uint16_t tmpccmr1 = 0;
    6474:	fe041623          	sh	zero,-20(s0)
    uint16_t tmpccer = 0;
    6478:	fe041523          	sh	zero,-22(s0)

    tmpsmcr = TIMx->SMCFGR;
    647c:	fdc42783          	lw	a5,-36(s0)
    6480:	0087d783          	lhu	a5,8(a5)
    6484:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 = TIMx->CHCTLR1;
    6488:	fdc42783          	lw	a5,-36(s0)
    648c:	0187d783          	lhu	a5,24(a5)
    6490:	fef41623          	sh	a5,-20(s0)
    tmpccer = TIMx->CCER;
    6494:	fdc42783          	lw	a5,-36(s0)
    6498:	0207d783          	lhu	a5,32(a5)
    649c:	fef41523          	sh	a5,-22(s0)
    tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMS));
    64a0:	fee45783          	lhu	a5,-18(s0)
    64a4:	9be1                	andi	a5,a5,-8
    64a6:	fef41723          	sh	a5,-18(s0)
    tmpsmcr |= TIM_EncoderMode;
    64aa:	fee45703          	lhu	a4,-18(s0)
    64ae:	fda45783          	lhu	a5,-38(s0)
    64b2:	8fd9                	or	a5,a5,a4
    64b4:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t)(((uint16_t) ~((uint16_t)TIM_CC1S)) & (uint16_t)(~((uint16_t)TIM_CC2S)));
    64b8:	fec45783          	lhu	a5,-20(s0)
    64bc:	cfc7f793          	andi	a5,a5,-772
    64c0:	fef41623          	sh	a5,-20(s0)
    tmpccmr1 |= TIM_CC1S_0 | TIM_CC2S_0;
    64c4:	fec45783          	lhu	a5,-20(s0)
    64c8:	1017e793          	ori	a5,a5,257
    64cc:	fef41623          	sh	a5,-20(s0)
    tmpccer &= (uint16_t)(((uint16_t) ~((uint16_t)TIM_CC1P)) & ((uint16_t) ~((uint16_t)TIM_CC2P)));
    64d0:	fea45783          	lhu	a5,-22(s0)
    64d4:	fdd7f793          	andi	a5,a5,-35
    64d8:	fef41523          	sh	a5,-22(s0)
    tmpccer |= (uint16_t)(TIM_IC1Polarity | (uint16_t)(TIM_IC2Polarity << (uint16_t)4));
    64dc:	fd645783          	lhu	a5,-42(s0)
    64e0:	0792                	slli	a5,a5,0x4
    64e2:	01079713          	slli	a4,a5,0x10
    64e6:	8341                	srli	a4,a4,0x10
    64e8:	fd845783          	lhu	a5,-40(s0)
    64ec:	8fd9                	or	a5,a5,a4
    64ee:	01079713          	slli	a4,a5,0x10
    64f2:	8341                	srli	a4,a4,0x10
    64f4:	fea45783          	lhu	a5,-22(s0)
    64f8:	8fd9                	or	a5,a5,a4
    64fa:	fef41523          	sh	a5,-22(s0)
    TIMx->SMCFGR = tmpsmcr;
    64fe:	fdc42783          	lw	a5,-36(s0)
    6502:	fee45703          	lhu	a4,-18(s0)
    6506:	00e79423          	sh	a4,8(a5)
    TIMx->CHCTLR1 = tmpccmr1;
    650a:	fdc42783          	lw	a5,-36(s0)
    650e:	fec45703          	lhu	a4,-20(s0)
    6512:	00e79c23          	sh	a4,24(a5)
    TIMx->CCER = tmpccer;
    6516:	fdc42783          	lw	a5,-36(s0)
    651a:	fea45703          	lhu	a4,-22(s0)
    651e:	02e79023          	sh	a4,32(a5)
}
    6522:	0001                	nop
    6524:	5432                	lw	s0,44(sp)
    6526:	6145                	addi	sp,sp,48
    6528:	8082                	ret

0000652a <TIM_ForcedOC1Config>:
 *            TIM_ForcedAction_InActive - Force inactive level on OC1REF.
 *
 * @return  none
 */
void TIM_ForcedOC1Config(TIM_TypeDef *TIMx, uint16_t TIM_ForcedAction)
{
    652a:	7179                	addi	sp,sp,-48
    652c:	d622                	sw	s0,44(sp)
    652e:	1800                	addi	s0,sp,48
    6530:	fca42e23          	sw	a0,-36(s0)
    6534:	87ae                	mv	a5,a1
    6536:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr1 = 0;
    653a:	fe041723          	sh	zero,-18(s0)

    tmpccmr1 = TIMx->CHCTLR1;
    653e:	fdc42783          	lw	a5,-36(s0)
    6542:	0187d783          	lhu	a5,24(a5)
    6546:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t) ~((uint16_t)TIM_OC1M);
    654a:	fee45783          	lhu	a5,-18(s0)
    654e:	f8f7f793          	andi	a5,a5,-113
    6552:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 |= TIM_ForcedAction;
    6556:	fee45703          	lhu	a4,-18(s0)
    655a:	fda45783          	lhu	a5,-38(s0)
    655e:	8fd9                	or	a5,a5,a4
    6560:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR1 = tmpccmr1;
    6564:	fdc42783          	lw	a5,-36(s0)
    6568:	fee45703          	lhu	a4,-18(s0)
    656c:	00e79c23          	sh	a4,24(a5)
}
    6570:	0001                	nop
    6572:	5432                	lw	s0,44(sp)
    6574:	6145                	addi	sp,sp,48
    6576:	8082                	ret

00006578 <TIM_ForcedOC2Config>:
 *            TIM_ForcedAction_InActive - Force inactive level on OC2REF.
 *
 * @return  none
 */
void TIM_ForcedOC2Config(TIM_TypeDef *TIMx, uint16_t TIM_ForcedAction)
{
    6578:	7179                	addi	sp,sp,-48
    657a:	d622                	sw	s0,44(sp)
    657c:	1800                	addi	s0,sp,48
    657e:	fca42e23          	sw	a0,-36(s0)
    6582:	87ae                	mv	a5,a1
    6584:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr1 = 0;
    6588:	fe041723          	sh	zero,-18(s0)

    tmpccmr1 = TIMx->CHCTLR1;
    658c:	fdc42783          	lw	a5,-36(s0)
    6590:	0187d783          	lhu	a5,24(a5)
    6594:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t) ~((uint16_t)TIM_OC2M);
    6598:	fee45703          	lhu	a4,-18(s0)
    659c:	77e5                	lui	a5,0xffff9
    659e:	17fd                	addi	a5,a5,-1
    65a0:	8ff9                	and	a5,a5,a4
    65a2:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 |= (uint16_t)(TIM_ForcedAction << 8);
    65a6:	fda45783          	lhu	a5,-38(s0)
    65aa:	07a2                	slli	a5,a5,0x8
    65ac:	01079713          	slli	a4,a5,0x10
    65b0:	8341                	srli	a4,a4,0x10
    65b2:	fee45783          	lhu	a5,-18(s0)
    65b6:	8fd9                	or	a5,a5,a4
    65b8:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR1 = tmpccmr1;
    65bc:	fdc42783          	lw	a5,-36(s0)
    65c0:	fee45703          	lhu	a4,-18(s0)
    65c4:	00e79c23          	sh	a4,24(a5) # ffff9018 <_eusrstack+0xdfff5018>
}
    65c8:	0001                	nop
    65ca:	5432                	lw	s0,44(sp)
    65cc:	6145                	addi	sp,sp,48
    65ce:	8082                	ret

000065d0 <TIM_ForcedOC3Config>:
 *            TIM_ForcedAction_InActive - Force inactive level on OC3REF.
 *
 * @return  none
 */
void TIM_ForcedOC3Config(TIM_TypeDef *TIMx, uint16_t TIM_ForcedAction)
{
    65d0:	7179                	addi	sp,sp,-48
    65d2:	d622                	sw	s0,44(sp)
    65d4:	1800                	addi	s0,sp,48
    65d6:	fca42e23          	sw	a0,-36(s0)
    65da:	87ae                	mv	a5,a1
    65dc:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr2 = 0;
    65e0:	fe041723          	sh	zero,-18(s0)

    tmpccmr2 = TIMx->CHCTLR2;
    65e4:	fdc42783          	lw	a5,-36(s0)
    65e8:	01c7d783          	lhu	a5,28(a5)
    65ec:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 &= (uint16_t) ~((uint16_t)TIM_OC3M);
    65f0:	fee45783          	lhu	a5,-18(s0)
    65f4:	f8f7f793          	andi	a5,a5,-113
    65f8:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 |= TIM_ForcedAction;
    65fc:	fee45703          	lhu	a4,-18(s0)
    6600:	fda45783          	lhu	a5,-38(s0)
    6604:	8fd9                	or	a5,a5,a4
    6606:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR2 = tmpccmr2;
    660a:	fdc42783          	lw	a5,-36(s0)
    660e:	fee45703          	lhu	a4,-18(s0)
    6612:	00e79e23          	sh	a4,28(a5)
}
    6616:	0001                	nop
    6618:	5432                	lw	s0,44(sp)
    661a:	6145                	addi	sp,sp,48
    661c:	8082                	ret

0000661e <TIM_ForcedOC4Config>:
 *            TIM_ForcedAction_InActive - Force inactive level on OC4REF.
 *
 * @return  none
 */
void TIM_ForcedOC4Config(TIM_TypeDef *TIMx, uint16_t TIM_ForcedAction)
{
    661e:	7179                	addi	sp,sp,-48
    6620:	d622                	sw	s0,44(sp)
    6622:	1800                	addi	s0,sp,48
    6624:	fca42e23          	sw	a0,-36(s0)
    6628:	87ae                	mv	a5,a1
    662a:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr2 = 0;
    662e:	fe041723          	sh	zero,-18(s0)

    tmpccmr2 = TIMx->CHCTLR2;
    6632:	fdc42783          	lw	a5,-36(s0)
    6636:	01c7d783          	lhu	a5,28(a5)
    663a:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 &= (uint16_t) ~((uint16_t)TIM_OC4M);
    663e:	fee45703          	lhu	a4,-18(s0)
    6642:	77e5                	lui	a5,0xffff9
    6644:	17fd                	addi	a5,a5,-1
    6646:	8ff9                	and	a5,a5,a4
    6648:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 |= (uint16_t)(TIM_ForcedAction << 8);
    664c:	fda45783          	lhu	a5,-38(s0)
    6650:	07a2                	slli	a5,a5,0x8
    6652:	01079713          	slli	a4,a5,0x10
    6656:	8341                	srli	a4,a4,0x10
    6658:	fee45783          	lhu	a5,-18(s0)
    665c:	8fd9                	or	a5,a5,a4
    665e:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR2 = tmpccmr2;
    6662:	fdc42783          	lw	a5,-36(s0)
    6666:	fee45703          	lhu	a4,-18(s0)
    666a:	00e79e23          	sh	a4,28(a5) # ffff901c <_eusrstack+0xdfff501c>
}
    666e:	0001                	nop
    6670:	5432                	lw	s0,44(sp)
    6672:	6145                	addi	sp,sp,48
    6674:	8082                	ret

00006676 <TIM_ARRPreloadConfig>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_ARRPreloadConfig(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    6676:	1101                	addi	sp,sp,-32
    6678:	ce22                	sw	s0,28(sp)
    667a:	1000                	addi	s0,sp,32
    667c:	fea42623          	sw	a0,-20(s0)
    6680:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    6684:	fe842783          	lw	a5,-24(s0)
    6688:	c38d                	beqz	a5,66aa <TIM_ARRPreloadConfig+0x34>
    {
        TIMx->CTLR1 |= TIM_ARPE;
    668a:	fec42783          	lw	a5,-20(s0)
    668e:	0007d783          	lhu	a5,0(a5)
    6692:	07c2                	slli	a5,a5,0x10
    6694:	83c1                	srli	a5,a5,0x10
    6696:	0807e793          	ori	a5,a5,128
    669a:	01079713          	slli	a4,a5,0x10
    669e:	8341                	srli	a4,a4,0x10
    66a0:	fec42783          	lw	a5,-20(s0)
    66a4:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        TIMx->CTLR1 &= (uint16_t) ~((uint16_t)TIM_ARPE);
    }
}
    66a8:	a005                	j	66c8 <TIM_ARRPreloadConfig+0x52>
        TIMx->CTLR1 &= (uint16_t) ~((uint16_t)TIM_ARPE);
    66aa:	fec42783          	lw	a5,-20(s0)
    66ae:	0007d783          	lhu	a5,0(a5)
    66b2:	07c2                	slli	a5,a5,0x10
    66b4:	83c1                	srli	a5,a5,0x10
    66b6:	f7f7f793          	andi	a5,a5,-129
    66ba:	01079713          	slli	a4,a5,0x10
    66be:	8341                	srli	a4,a4,0x10
    66c0:	fec42783          	lw	a5,-20(s0)
    66c4:	00e79023          	sh	a4,0(a5)
}
    66c8:	0001                	nop
    66ca:	4472                	lw	s0,28(sp)
    66cc:	6105                	addi	sp,sp,32
    66ce:	8082                	ret

000066d0 <TIM_SelectCOM>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_SelectCOM(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    66d0:	1101                	addi	sp,sp,-32
    66d2:	ce22                	sw	s0,28(sp)
    66d4:	1000                	addi	s0,sp,32
    66d6:	fea42623          	sw	a0,-20(s0)
    66da:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    66de:	fe842783          	lw	a5,-24(s0)
    66e2:	c38d                	beqz	a5,6704 <TIM_SelectCOM+0x34>
    {
        TIMx->CTLR2 |= TIM_CCUS;
    66e4:	fec42783          	lw	a5,-20(s0)
    66e8:	0047d783          	lhu	a5,4(a5)
    66ec:	07c2                	slli	a5,a5,0x10
    66ee:	83c1                	srli	a5,a5,0x10
    66f0:	0047e793          	ori	a5,a5,4
    66f4:	01079713          	slli	a4,a5,0x10
    66f8:	8341                	srli	a4,a4,0x10
    66fa:	fec42783          	lw	a5,-20(s0)
    66fe:	00e79223          	sh	a4,4(a5)
    }
    else
    {
        TIMx->CTLR2 &= (uint16_t) ~((uint16_t)TIM_CCUS);
    }
}
    6702:	a839                	j	6720 <TIM_SelectCOM+0x50>
        TIMx->CTLR2 &= (uint16_t) ~((uint16_t)TIM_CCUS);
    6704:	fec42783          	lw	a5,-20(s0)
    6708:	0047d783          	lhu	a5,4(a5)
    670c:	07c2                	slli	a5,a5,0x10
    670e:	83c1                	srli	a5,a5,0x10
    6710:	9bed                	andi	a5,a5,-5
    6712:	01079713          	slli	a4,a5,0x10
    6716:	8341                	srli	a4,a4,0x10
    6718:	fec42783          	lw	a5,-20(s0)
    671c:	00e79223          	sh	a4,4(a5)
}
    6720:	0001                	nop
    6722:	4472                	lw	s0,28(sp)
    6724:	6105                	addi	sp,sp,32
    6726:	8082                	ret

00006728 <TIM_SelectCCDMA>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_SelectCCDMA(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    6728:	1101                	addi	sp,sp,-32
    672a:	ce22                	sw	s0,28(sp)
    672c:	1000                	addi	s0,sp,32
    672e:	fea42623          	sw	a0,-20(s0)
    6732:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    6736:	fe842783          	lw	a5,-24(s0)
    673a:	c38d                	beqz	a5,675c <TIM_SelectCCDMA+0x34>
    {
        TIMx->CTLR2 |= TIM_CCDS;
    673c:	fec42783          	lw	a5,-20(s0)
    6740:	0047d783          	lhu	a5,4(a5)
    6744:	07c2                	slli	a5,a5,0x10
    6746:	83c1                	srli	a5,a5,0x10
    6748:	0087e793          	ori	a5,a5,8
    674c:	01079713          	slli	a4,a5,0x10
    6750:	8341                	srli	a4,a4,0x10
    6752:	fec42783          	lw	a5,-20(s0)
    6756:	00e79223          	sh	a4,4(a5)
    }
    else
    {
        TIMx->CTLR2 &= (uint16_t) ~((uint16_t)TIM_CCDS);
    }
}
    675a:	a839                	j	6778 <TIM_SelectCCDMA+0x50>
        TIMx->CTLR2 &= (uint16_t) ~((uint16_t)TIM_CCDS);
    675c:	fec42783          	lw	a5,-20(s0)
    6760:	0047d783          	lhu	a5,4(a5)
    6764:	07c2                	slli	a5,a5,0x10
    6766:	83c1                	srli	a5,a5,0x10
    6768:	9bdd                	andi	a5,a5,-9
    676a:	01079713          	slli	a4,a5,0x10
    676e:	8341                	srli	a4,a4,0x10
    6770:	fec42783          	lw	a5,-20(s0)
    6774:	00e79223          	sh	a4,4(a5)
}
    6778:	0001                	nop
    677a:	4472                	lw	s0,28(sp)
    677c:	6105                	addi	sp,sp,32
    677e:	8082                	ret

00006780 <TIM_CCPreloadControl>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_CCPreloadControl(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    6780:	1101                	addi	sp,sp,-32
    6782:	ce22                	sw	s0,28(sp)
    6784:	1000                	addi	s0,sp,32
    6786:	fea42623          	sw	a0,-20(s0)
    678a:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    678e:	fe842783          	lw	a5,-24(s0)
    6792:	c38d                	beqz	a5,67b4 <TIM_CCPreloadControl+0x34>
    {
        TIMx->CTLR2 |= TIM_CCPC;
    6794:	fec42783          	lw	a5,-20(s0)
    6798:	0047d783          	lhu	a5,4(a5)
    679c:	07c2                	slli	a5,a5,0x10
    679e:	83c1                	srli	a5,a5,0x10
    67a0:	0017e793          	ori	a5,a5,1
    67a4:	01079713          	slli	a4,a5,0x10
    67a8:	8341                	srli	a4,a4,0x10
    67aa:	fec42783          	lw	a5,-20(s0)
    67ae:	00e79223          	sh	a4,4(a5)
    }
    else
    {
        TIMx->CTLR2 &= (uint16_t) ~((uint16_t)TIM_CCPC);
    }
}
    67b2:	a839                	j	67d0 <TIM_CCPreloadControl+0x50>
        TIMx->CTLR2 &= (uint16_t) ~((uint16_t)TIM_CCPC);
    67b4:	fec42783          	lw	a5,-20(s0)
    67b8:	0047d783          	lhu	a5,4(a5)
    67bc:	07c2                	slli	a5,a5,0x10
    67be:	83c1                	srli	a5,a5,0x10
    67c0:	9bf9                	andi	a5,a5,-2
    67c2:	01079713          	slli	a4,a5,0x10
    67c6:	8341                	srli	a4,a4,0x10
    67c8:	fec42783          	lw	a5,-20(s0)
    67cc:	00e79223          	sh	a4,4(a5)
}
    67d0:	0001                	nop
    67d2:	4472                	lw	s0,28(sp)
    67d4:	6105                	addi	sp,sp,32
    67d6:	8082                	ret

000067d8 <TIM_OC1PreloadConfig>:
 *            TIM_OCPreload_Disable.
 *
 * @return  none
 */
void TIM_OC1PreloadConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCPreload)
{
    67d8:	7179                	addi	sp,sp,-48
    67da:	d622                	sw	s0,44(sp)
    67dc:	1800                	addi	s0,sp,48
    67de:	fca42e23          	sw	a0,-36(s0)
    67e2:	87ae                	mv	a5,a1
    67e4:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr1 = 0;
    67e8:	fe041723          	sh	zero,-18(s0)

    tmpccmr1 = TIMx->CHCTLR1;
    67ec:	fdc42783          	lw	a5,-36(s0)
    67f0:	0187d783          	lhu	a5,24(a5)
    67f4:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t) ~((uint16_t)TIM_OC1PE);
    67f8:	fee45783          	lhu	a5,-18(s0)
    67fc:	9bdd                	andi	a5,a5,-9
    67fe:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 |= TIM_OCPreload;
    6802:	fee45703          	lhu	a4,-18(s0)
    6806:	fda45783          	lhu	a5,-38(s0)
    680a:	8fd9                	or	a5,a5,a4
    680c:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR1 = tmpccmr1;
    6810:	fdc42783          	lw	a5,-36(s0)
    6814:	fee45703          	lhu	a4,-18(s0)
    6818:	00e79c23          	sh	a4,24(a5)
}
    681c:	0001                	nop
    681e:	5432                	lw	s0,44(sp)
    6820:	6145                	addi	sp,sp,48
    6822:	8082                	ret

00006824 <TIM_OC2PreloadConfig>:
 *            TIM_OCPreload_Disable.
 *
 * @return  none
 */
void TIM_OC2PreloadConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCPreload)
{
    6824:	7179                	addi	sp,sp,-48
    6826:	d622                	sw	s0,44(sp)
    6828:	1800                	addi	s0,sp,48
    682a:	fca42e23          	sw	a0,-36(s0)
    682e:	87ae                	mv	a5,a1
    6830:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr1 = 0;
    6834:	fe041723          	sh	zero,-18(s0)

    tmpccmr1 = TIMx->CHCTLR1;
    6838:	fdc42783          	lw	a5,-36(s0)
    683c:	0187d783          	lhu	a5,24(a5)
    6840:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t) ~((uint16_t)TIM_OC2PE);
    6844:	fee45703          	lhu	a4,-18(s0)
    6848:	77fd                	lui	a5,0xfffff
    684a:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    684e:	8ff9                	and	a5,a5,a4
    6850:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 |= (uint16_t)(TIM_OCPreload << 8);
    6854:	fda45783          	lhu	a5,-38(s0)
    6858:	07a2                	slli	a5,a5,0x8
    685a:	01079713          	slli	a4,a5,0x10
    685e:	8341                	srli	a4,a4,0x10
    6860:	fee45783          	lhu	a5,-18(s0)
    6864:	8fd9                	or	a5,a5,a4
    6866:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR1 = tmpccmr1;
    686a:	fdc42783          	lw	a5,-36(s0)
    686e:	fee45703          	lhu	a4,-18(s0)
    6872:	00e79c23          	sh	a4,24(a5)
}
    6876:	0001                	nop
    6878:	5432                	lw	s0,44(sp)
    687a:	6145                	addi	sp,sp,48
    687c:	8082                	ret

0000687e <TIM_OC3PreloadConfig>:
 *            TIM_OCPreload_Disable.
 *
 * @return  none
 */
void TIM_OC3PreloadConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCPreload)
{
    687e:	7179                	addi	sp,sp,-48
    6880:	d622                	sw	s0,44(sp)
    6882:	1800                	addi	s0,sp,48
    6884:	fca42e23          	sw	a0,-36(s0)
    6888:	87ae                	mv	a5,a1
    688a:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr2 = 0;
    688e:	fe041723          	sh	zero,-18(s0)

    tmpccmr2 = TIMx->CHCTLR2;
    6892:	fdc42783          	lw	a5,-36(s0)
    6896:	01c7d783          	lhu	a5,28(a5)
    689a:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 &= (uint16_t) ~((uint16_t)TIM_OC3PE);
    689e:	fee45783          	lhu	a5,-18(s0)
    68a2:	9bdd                	andi	a5,a5,-9
    68a4:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 |= TIM_OCPreload;
    68a8:	fee45703          	lhu	a4,-18(s0)
    68ac:	fda45783          	lhu	a5,-38(s0)
    68b0:	8fd9                	or	a5,a5,a4
    68b2:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR2 = tmpccmr2;
    68b6:	fdc42783          	lw	a5,-36(s0)
    68ba:	fee45703          	lhu	a4,-18(s0)
    68be:	00e79e23          	sh	a4,28(a5)
}
    68c2:	0001                	nop
    68c4:	5432                	lw	s0,44(sp)
    68c6:	6145                	addi	sp,sp,48
    68c8:	8082                	ret

000068ca <TIM_OC4PreloadConfig>:
 *            TIM_OCPreload_Disable.
 *
 * @return  none
 */
void TIM_OC4PreloadConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCPreload)
{
    68ca:	7179                	addi	sp,sp,-48
    68cc:	d622                	sw	s0,44(sp)
    68ce:	1800                	addi	s0,sp,48
    68d0:	fca42e23          	sw	a0,-36(s0)
    68d4:	87ae                	mv	a5,a1
    68d6:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr2 = 0;
    68da:	fe041723          	sh	zero,-18(s0)

    tmpccmr2 = TIMx->CHCTLR2;
    68de:	fdc42783          	lw	a5,-36(s0)
    68e2:	01c7d783          	lhu	a5,28(a5)
    68e6:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 &= (uint16_t) ~((uint16_t)TIM_OC4PE);
    68ea:	fee45703          	lhu	a4,-18(s0)
    68ee:	77fd                	lui	a5,0xfffff
    68f0:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    68f4:	8ff9                	and	a5,a5,a4
    68f6:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 |= (uint16_t)(TIM_OCPreload << 8);
    68fa:	fda45783          	lhu	a5,-38(s0)
    68fe:	07a2                	slli	a5,a5,0x8
    6900:	01079713          	slli	a4,a5,0x10
    6904:	8341                	srli	a4,a4,0x10
    6906:	fee45783          	lhu	a5,-18(s0)
    690a:	8fd9                	or	a5,a5,a4
    690c:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR2 = tmpccmr2;
    6910:	fdc42783          	lw	a5,-36(s0)
    6914:	fee45703          	lhu	a4,-18(s0)
    6918:	00e79e23          	sh	a4,28(a5)
}
    691c:	0001                	nop
    691e:	5432                	lw	s0,44(sp)
    6920:	6145                	addi	sp,sp,48
    6922:	8082                	ret

00006924 <TIM_OC1FastConfig>:
 *            TIM_OCFast_Disable - TIM output compare fast disable.
 *
 * @return  none
 */
void TIM_OC1FastConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCFast)
{
    6924:	7179                	addi	sp,sp,-48
    6926:	d622                	sw	s0,44(sp)
    6928:	1800                	addi	s0,sp,48
    692a:	fca42e23          	sw	a0,-36(s0)
    692e:	87ae                	mv	a5,a1
    6930:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr1 = 0;
    6934:	fe041723          	sh	zero,-18(s0)

    tmpccmr1 = TIMx->CHCTLR1;
    6938:	fdc42783          	lw	a5,-36(s0)
    693c:	0187d783          	lhu	a5,24(a5)
    6940:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t) ~((uint16_t)TIM_OC1FE);
    6944:	fee45783          	lhu	a5,-18(s0)
    6948:	9bed                	andi	a5,a5,-5
    694a:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 |= TIM_OCFast;
    694e:	fee45703          	lhu	a4,-18(s0)
    6952:	fda45783          	lhu	a5,-38(s0)
    6956:	8fd9                	or	a5,a5,a4
    6958:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR1 = tmpccmr1;
    695c:	fdc42783          	lw	a5,-36(s0)
    6960:	fee45703          	lhu	a4,-18(s0)
    6964:	00e79c23          	sh	a4,24(a5)
}
    6968:	0001                	nop
    696a:	5432                	lw	s0,44(sp)
    696c:	6145                	addi	sp,sp,48
    696e:	8082                	ret

00006970 <TIM_OC2FastConfig>:
 *            TIM_OCFast_Disable - TIM output compare fast disable.
 *
 * @return  none
 */
void TIM_OC2FastConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCFast)
{
    6970:	7179                	addi	sp,sp,-48
    6972:	d622                	sw	s0,44(sp)
    6974:	1800                	addi	s0,sp,48
    6976:	fca42e23          	sw	a0,-36(s0)
    697a:	87ae                	mv	a5,a1
    697c:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr1 = 0;
    6980:	fe041723          	sh	zero,-18(s0)

    tmpccmr1 = TIMx->CHCTLR1;
    6984:	fdc42783          	lw	a5,-36(s0)
    6988:	0187d783          	lhu	a5,24(a5)
    698c:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t) ~((uint16_t)TIM_OC2FE);
    6990:	fee45783          	lhu	a5,-18(s0)
    6994:	bff7f793          	andi	a5,a5,-1025
    6998:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 |= (uint16_t)(TIM_OCFast << 8);
    699c:	fda45783          	lhu	a5,-38(s0)
    69a0:	07a2                	slli	a5,a5,0x8
    69a2:	01079713          	slli	a4,a5,0x10
    69a6:	8341                	srli	a4,a4,0x10
    69a8:	fee45783          	lhu	a5,-18(s0)
    69ac:	8fd9                	or	a5,a5,a4
    69ae:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR1 = tmpccmr1;
    69b2:	fdc42783          	lw	a5,-36(s0)
    69b6:	fee45703          	lhu	a4,-18(s0)
    69ba:	00e79c23          	sh	a4,24(a5)
}
    69be:	0001                	nop
    69c0:	5432                	lw	s0,44(sp)
    69c2:	6145                	addi	sp,sp,48
    69c4:	8082                	ret

000069c6 <TIM_OC3FastConfig>:
 *            TIM_OCFast_Disable - TIM output compare fast disable.
 *
 * @return  none
 */
void TIM_OC3FastConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCFast)
{
    69c6:	7179                	addi	sp,sp,-48
    69c8:	d622                	sw	s0,44(sp)
    69ca:	1800                	addi	s0,sp,48
    69cc:	fca42e23          	sw	a0,-36(s0)
    69d0:	87ae                	mv	a5,a1
    69d2:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr2 = 0;
    69d6:	fe041723          	sh	zero,-18(s0)

    tmpccmr2 = TIMx->CHCTLR2;
    69da:	fdc42783          	lw	a5,-36(s0)
    69de:	01c7d783          	lhu	a5,28(a5)
    69e2:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 &= (uint16_t) ~((uint16_t)TIM_OC3FE);
    69e6:	fee45783          	lhu	a5,-18(s0)
    69ea:	9bed                	andi	a5,a5,-5
    69ec:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 |= TIM_OCFast;
    69f0:	fee45703          	lhu	a4,-18(s0)
    69f4:	fda45783          	lhu	a5,-38(s0)
    69f8:	8fd9                	or	a5,a5,a4
    69fa:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR2 = tmpccmr2;
    69fe:	fdc42783          	lw	a5,-36(s0)
    6a02:	fee45703          	lhu	a4,-18(s0)
    6a06:	00e79e23          	sh	a4,28(a5)
}
    6a0a:	0001                	nop
    6a0c:	5432                	lw	s0,44(sp)
    6a0e:	6145                	addi	sp,sp,48
    6a10:	8082                	ret

00006a12 <TIM_OC4FastConfig>:
 *            TIM_OCFast_Disable - TIM output compare fast disable.
 *
 * @return  none
 */
void TIM_OC4FastConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCFast)
{
    6a12:	7179                	addi	sp,sp,-48
    6a14:	d622                	sw	s0,44(sp)
    6a16:	1800                	addi	s0,sp,48
    6a18:	fca42e23          	sw	a0,-36(s0)
    6a1c:	87ae                	mv	a5,a1
    6a1e:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr2 = 0;
    6a22:	fe041723          	sh	zero,-18(s0)

    tmpccmr2 = TIMx->CHCTLR2;
    6a26:	fdc42783          	lw	a5,-36(s0)
    6a2a:	01c7d783          	lhu	a5,28(a5)
    6a2e:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 &= (uint16_t) ~((uint16_t)TIM_OC4FE);
    6a32:	fee45783          	lhu	a5,-18(s0)
    6a36:	bff7f793          	andi	a5,a5,-1025
    6a3a:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 |= (uint16_t)(TIM_OCFast << 8);
    6a3e:	fda45783          	lhu	a5,-38(s0)
    6a42:	07a2                	slli	a5,a5,0x8
    6a44:	01079713          	slli	a4,a5,0x10
    6a48:	8341                	srli	a4,a4,0x10
    6a4a:	fee45783          	lhu	a5,-18(s0)
    6a4e:	8fd9                	or	a5,a5,a4
    6a50:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR2 = tmpccmr2;
    6a54:	fdc42783          	lw	a5,-36(s0)
    6a58:	fee45703          	lhu	a4,-18(s0)
    6a5c:	00e79e23          	sh	a4,28(a5)
}
    6a60:	0001                	nop
    6a62:	5432                	lw	s0,44(sp)
    6a64:	6145                	addi	sp,sp,48
    6a66:	8082                	ret

00006a68 <TIM_ClearOC1Ref>:
 *            TIM_OCClear_Disable - TIM Output clear disable.
 *
 * @return  none
 */
void TIM_ClearOC1Ref(TIM_TypeDef *TIMx, uint16_t TIM_OCClear)
{
    6a68:	7179                	addi	sp,sp,-48
    6a6a:	d622                	sw	s0,44(sp)
    6a6c:	1800                	addi	s0,sp,48
    6a6e:	fca42e23          	sw	a0,-36(s0)
    6a72:	87ae                	mv	a5,a1
    6a74:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr1 = 0;
    6a78:	fe041723          	sh	zero,-18(s0)

    tmpccmr1 = TIMx->CHCTLR1;
    6a7c:	fdc42783          	lw	a5,-36(s0)
    6a80:	0187d783          	lhu	a5,24(a5)
    6a84:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t) ~((uint16_t)TIM_OC1CE);
    6a88:	fee45783          	lhu	a5,-18(s0)
    6a8c:	f7f7f793          	andi	a5,a5,-129
    6a90:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 |= TIM_OCClear;
    6a94:	fee45703          	lhu	a4,-18(s0)
    6a98:	fda45783          	lhu	a5,-38(s0)
    6a9c:	8fd9                	or	a5,a5,a4
    6a9e:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR1 = tmpccmr1;
    6aa2:	fdc42783          	lw	a5,-36(s0)
    6aa6:	fee45703          	lhu	a4,-18(s0)
    6aaa:	00e79c23          	sh	a4,24(a5)
}
    6aae:	0001                	nop
    6ab0:	5432                	lw	s0,44(sp)
    6ab2:	6145                	addi	sp,sp,48
    6ab4:	8082                	ret

00006ab6 <TIM_ClearOC2Ref>:
 *            TIM_OCClear_Disable - TIM Output clear disable.
 *
 * @return  none
 */
void TIM_ClearOC2Ref(TIM_TypeDef *TIMx, uint16_t TIM_OCClear)
{
    6ab6:	7179                	addi	sp,sp,-48
    6ab8:	d622                	sw	s0,44(sp)
    6aba:	1800                	addi	s0,sp,48
    6abc:	fca42e23          	sw	a0,-36(s0)
    6ac0:	87ae                	mv	a5,a1
    6ac2:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr1 = 0;
    6ac6:	fe041723          	sh	zero,-18(s0)

    tmpccmr1 = TIMx->CHCTLR1;
    6aca:	fdc42783          	lw	a5,-36(s0)
    6ace:	0187d783          	lhu	a5,24(a5)
    6ad2:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t) ~((uint16_t)TIM_OC2CE);
    6ad6:	fee45703          	lhu	a4,-18(s0)
    6ada:	67a1                	lui	a5,0x8
    6adc:	17fd                	addi	a5,a5,-1
    6ade:	8ff9                	and	a5,a5,a4
    6ae0:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 |= (uint16_t)(TIM_OCClear << 8);
    6ae4:	fda45783          	lhu	a5,-38(s0)
    6ae8:	07a2                	slli	a5,a5,0x8
    6aea:	01079713          	slli	a4,a5,0x10
    6aee:	8341                	srli	a4,a4,0x10
    6af0:	fee45783          	lhu	a5,-18(s0)
    6af4:	8fd9                	or	a5,a5,a4
    6af6:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR1 = tmpccmr1;
    6afa:	fdc42783          	lw	a5,-36(s0)
    6afe:	fee45703          	lhu	a4,-18(s0)
    6b02:	00e79c23          	sh	a4,24(a5) # 8018 <USART_StructInit+0x32>
}
    6b06:	0001                	nop
    6b08:	5432                	lw	s0,44(sp)
    6b0a:	6145                	addi	sp,sp,48
    6b0c:	8082                	ret

00006b0e <TIM_ClearOC3Ref>:
 *            TIM_OCClear_Disable - TIM Output clear disable.
 *
 * @return  none
 */
void TIM_ClearOC3Ref(TIM_TypeDef *TIMx, uint16_t TIM_OCClear)
{
    6b0e:	7179                	addi	sp,sp,-48
    6b10:	d622                	sw	s0,44(sp)
    6b12:	1800                	addi	s0,sp,48
    6b14:	fca42e23          	sw	a0,-36(s0)
    6b18:	87ae                	mv	a5,a1
    6b1a:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr2 = 0;
    6b1e:	fe041723          	sh	zero,-18(s0)

    tmpccmr2 = TIMx->CHCTLR2;
    6b22:	fdc42783          	lw	a5,-36(s0)
    6b26:	01c7d783          	lhu	a5,28(a5)
    6b2a:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 &= (uint16_t) ~((uint16_t)TIM_OC3CE);
    6b2e:	fee45783          	lhu	a5,-18(s0)
    6b32:	f7f7f793          	andi	a5,a5,-129
    6b36:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 |= TIM_OCClear;
    6b3a:	fee45703          	lhu	a4,-18(s0)
    6b3e:	fda45783          	lhu	a5,-38(s0)
    6b42:	8fd9                	or	a5,a5,a4
    6b44:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR2 = tmpccmr2;
    6b48:	fdc42783          	lw	a5,-36(s0)
    6b4c:	fee45703          	lhu	a4,-18(s0)
    6b50:	00e79e23          	sh	a4,28(a5)
}
    6b54:	0001                	nop
    6b56:	5432                	lw	s0,44(sp)
    6b58:	6145                	addi	sp,sp,48
    6b5a:	8082                	ret

00006b5c <TIM_ClearOC4Ref>:
 *            TIM_OCClear_Disable - TIM Output clear disable.
 *
 * @return  none
 */
void TIM_ClearOC4Ref(TIM_TypeDef *TIMx, uint16_t TIM_OCClear)
{
    6b5c:	7179                	addi	sp,sp,-48
    6b5e:	d622                	sw	s0,44(sp)
    6b60:	1800                	addi	s0,sp,48
    6b62:	fca42e23          	sw	a0,-36(s0)
    6b66:	87ae                	mv	a5,a1
    6b68:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccmr2 = 0;
    6b6c:	fe041723          	sh	zero,-18(s0)

    tmpccmr2 = TIMx->CHCTLR2;
    6b70:	fdc42783          	lw	a5,-36(s0)
    6b74:	01c7d783          	lhu	a5,28(a5)
    6b78:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 &= (uint16_t) ~((uint16_t)TIM_OC4CE);
    6b7c:	fee45703          	lhu	a4,-18(s0)
    6b80:	67a1                	lui	a5,0x8
    6b82:	17fd                	addi	a5,a5,-1
    6b84:	8ff9                	and	a5,a5,a4
    6b86:	fef41723          	sh	a5,-18(s0)
    tmpccmr2 |= (uint16_t)(TIM_OCClear << 8);
    6b8a:	fda45783          	lhu	a5,-38(s0)
    6b8e:	07a2                	slli	a5,a5,0x8
    6b90:	01079713          	slli	a4,a5,0x10
    6b94:	8341                	srli	a4,a4,0x10
    6b96:	fee45783          	lhu	a5,-18(s0)
    6b9a:	8fd9                	or	a5,a5,a4
    6b9c:	fef41723          	sh	a5,-18(s0)
    TIMx->CHCTLR2 = tmpccmr2;
    6ba0:	fdc42783          	lw	a5,-36(s0)
    6ba4:	fee45703          	lhu	a4,-18(s0)
    6ba8:	00e79e23          	sh	a4,28(a5) # 801c <USART_StructInit+0x36>
}
    6bac:	0001                	nop
    6bae:	5432                	lw	s0,44(sp)
    6bb0:	6145                	addi	sp,sp,48
    6bb2:	8082                	ret

00006bb4 <TIM_OC1PolarityConfig>:
 *            TIM_OCPolarity_Low - Output Compare active low.
 *
 * @return  none
 */
void TIM_OC1PolarityConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCPolarity)
{
    6bb4:	7179                	addi	sp,sp,-48
    6bb6:	d622                	sw	s0,44(sp)
    6bb8:	1800                	addi	s0,sp,48
    6bba:	fca42e23          	sw	a0,-36(s0)
    6bbe:	87ae                	mv	a5,a1
    6bc0:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccer = 0;
    6bc4:	fe041723          	sh	zero,-18(s0)

    tmpccer = TIMx->CCER;
    6bc8:	fdc42783          	lw	a5,-36(s0)
    6bcc:	0207d783          	lhu	a5,32(a5)
    6bd0:	fef41723          	sh	a5,-18(s0)
    tmpccer &= (uint16_t) ~((uint16_t)TIM_CC1P);
    6bd4:	fee45783          	lhu	a5,-18(s0)
    6bd8:	9bf5                	andi	a5,a5,-3
    6bda:	fef41723          	sh	a5,-18(s0)
    tmpccer |= TIM_OCPolarity;
    6bde:	fee45703          	lhu	a4,-18(s0)
    6be2:	fda45783          	lhu	a5,-38(s0)
    6be6:	8fd9                	or	a5,a5,a4
    6be8:	fef41723          	sh	a5,-18(s0)
    TIMx->CCER = tmpccer;
    6bec:	fdc42783          	lw	a5,-36(s0)
    6bf0:	fee45703          	lhu	a4,-18(s0)
    6bf4:	02e79023          	sh	a4,32(a5)
}
    6bf8:	0001                	nop
    6bfa:	5432                	lw	s0,44(sp)
    6bfc:	6145                	addi	sp,sp,48
    6bfe:	8082                	ret

00006c00 <TIM_OC1NPolarityConfig>:
 *            TIM_OCNPolarity_Low - Output Compare active low.
 *
 * @return  none
 */
void TIM_OC1NPolarityConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCNPolarity)
{
    6c00:	7179                	addi	sp,sp,-48
    6c02:	d622                	sw	s0,44(sp)
    6c04:	1800                	addi	s0,sp,48
    6c06:	fca42e23          	sw	a0,-36(s0)
    6c0a:	87ae                	mv	a5,a1
    6c0c:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccer = 0;
    6c10:	fe041723          	sh	zero,-18(s0)

    tmpccer = TIMx->CCER;
    6c14:	fdc42783          	lw	a5,-36(s0)
    6c18:	0207d783          	lhu	a5,32(a5)
    6c1c:	fef41723          	sh	a5,-18(s0)
    tmpccer &= (uint16_t) ~((uint16_t)TIM_CC1NP);
    6c20:	fee45783          	lhu	a5,-18(s0)
    6c24:	9bdd                	andi	a5,a5,-9
    6c26:	fef41723          	sh	a5,-18(s0)
    tmpccer |= TIM_OCNPolarity;
    6c2a:	fee45703          	lhu	a4,-18(s0)
    6c2e:	fda45783          	lhu	a5,-38(s0)
    6c32:	8fd9                	or	a5,a5,a4
    6c34:	fef41723          	sh	a5,-18(s0)
    TIMx->CCER = tmpccer;
    6c38:	fdc42783          	lw	a5,-36(s0)
    6c3c:	fee45703          	lhu	a4,-18(s0)
    6c40:	02e79023          	sh	a4,32(a5)
}
    6c44:	0001                	nop
    6c46:	5432                	lw	s0,44(sp)
    6c48:	6145                	addi	sp,sp,48
    6c4a:	8082                	ret

00006c4c <TIM_OC2PolarityConfig>:
 *            TIM_OCPolarity_Low - Output Compare active low.
 *
 * @return  none
 */
void TIM_OC2PolarityConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCPolarity)
{
    6c4c:	7179                	addi	sp,sp,-48
    6c4e:	d622                	sw	s0,44(sp)
    6c50:	1800                	addi	s0,sp,48
    6c52:	fca42e23          	sw	a0,-36(s0)
    6c56:	87ae                	mv	a5,a1
    6c58:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccer = 0;
    6c5c:	fe041723          	sh	zero,-18(s0)

    tmpccer = TIMx->CCER;
    6c60:	fdc42783          	lw	a5,-36(s0)
    6c64:	0207d783          	lhu	a5,32(a5)
    6c68:	fef41723          	sh	a5,-18(s0)
    tmpccer &= (uint16_t) ~((uint16_t)TIM_CC2P);
    6c6c:	fee45783          	lhu	a5,-18(s0)
    6c70:	fdf7f793          	andi	a5,a5,-33
    6c74:	fef41723          	sh	a5,-18(s0)
    tmpccer |= (uint16_t)(TIM_OCPolarity << 4);
    6c78:	fda45783          	lhu	a5,-38(s0)
    6c7c:	0792                	slli	a5,a5,0x4
    6c7e:	01079713          	slli	a4,a5,0x10
    6c82:	8341                	srli	a4,a4,0x10
    6c84:	fee45783          	lhu	a5,-18(s0)
    6c88:	8fd9                	or	a5,a5,a4
    6c8a:	fef41723          	sh	a5,-18(s0)
    TIMx->CCER = tmpccer;
    6c8e:	fdc42783          	lw	a5,-36(s0)
    6c92:	fee45703          	lhu	a4,-18(s0)
    6c96:	02e79023          	sh	a4,32(a5)
}
    6c9a:	0001                	nop
    6c9c:	5432                	lw	s0,44(sp)
    6c9e:	6145                	addi	sp,sp,48
    6ca0:	8082                	ret

00006ca2 <TIM_OC2NPolarityConfig>:
 *            TIM_OCNPolarity_Low - Output Compare active low.
 *
 * @return  none
 */
void TIM_OC2NPolarityConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCNPolarity)
{
    6ca2:	7179                	addi	sp,sp,-48
    6ca4:	d622                	sw	s0,44(sp)
    6ca6:	1800                	addi	s0,sp,48
    6ca8:	fca42e23          	sw	a0,-36(s0)
    6cac:	87ae                	mv	a5,a1
    6cae:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccer = 0;
    6cb2:	fe041723          	sh	zero,-18(s0)

    tmpccer = TIMx->CCER;
    6cb6:	fdc42783          	lw	a5,-36(s0)
    6cba:	0207d783          	lhu	a5,32(a5)
    6cbe:	fef41723          	sh	a5,-18(s0)
    tmpccer &= (uint16_t) ~((uint16_t)TIM_CC2NP);
    6cc2:	fee45783          	lhu	a5,-18(s0)
    6cc6:	f7f7f793          	andi	a5,a5,-129
    6cca:	fef41723          	sh	a5,-18(s0)
    tmpccer |= (uint16_t)(TIM_OCNPolarity << 4);
    6cce:	fda45783          	lhu	a5,-38(s0)
    6cd2:	0792                	slli	a5,a5,0x4
    6cd4:	01079713          	slli	a4,a5,0x10
    6cd8:	8341                	srli	a4,a4,0x10
    6cda:	fee45783          	lhu	a5,-18(s0)
    6cde:	8fd9                	or	a5,a5,a4
    6ce0:	fef41723          	sh	a5,-18(s0)
    TIMx->CCER = tmpccer;
    6ce4:	fdc42783          	lw	a5,-36(s0)
    6ce8:	fee45703          	lhu	a4,-18(s0)
    6cec:	02e79023          	sh	a4,32(a5)
}
    6cf0:	0001                	nop
    6cf2:	5432                	lw	s0,44(sp)
    6cf4:	6145                	addi	sp,sp,48
    6cf6:	8082                	ret

00006cf8 <TIM_OC3PolarityConfig>:
 *            TIM_OCPolarity_Low - Output Compare active low.
 *
 * @return  none
 */
void TIM_OC3PolarityConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCPolarity)
{
    6cf8:	7179                	addi	sp,sp,-48
    6cfa:	d622                	sw	s0,44(sp)
    6cfc:	1800                	addi	s0,sp,48
    6cfe:	fca42e23          	sw	a0,-36(s0)
    6d02:	87ae                	mv	a5,a1
    6d04:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccer = 0;
    6d08:	fe041723          	sh	zero,-18(s0)

    tmpccer = TIMx->CCER;
    6d0c:	fdc42783          	lw	a5,-36(s0)
    6d10:	0207d783          	lhu	a5,32(a5)
    6d14:	fef41723          	sh	a5,-18(s0)
    tmpccer &= (uint16_t) ~((uint16_t)TIM_CC3P);
    6d18:	fee45783          	lhu	a5,-18(s0)
    6d1c:	dff7f793          	andi	a5,a5,-513
    6d20:	fef41723          	sh	a5,-18(s0)
    tmpccer |= (uint16_t)(TIM_OCPolarity << 8);
    6d24:	fda45783          	lhu	a5,-38(s0)
    6d28:	07a2                	slli	a5,a5,0x8
    6d2a:	01079713          	slli	a4,a5,0x10
    6d2e:	8341                	srli	a4,a4,0x10
    6d30:	fee45783          	lhu	a5,-18(s0)
    6d34:	8fd9                	or	a5,a5,a4
    6d36:	fef41723          	sh	a5,-18(s0)
    TIMx->CCER = tmpccer;
    6d3a:	fdc42783          	lw	a5,-36(s0)
    6d3e:	fee45703          	lhu	a4,-18(s0)
    6d42:	02e79023          	sh	a4,32(a5)
}
    6d46:	0001                	nop
    6d48:	5432                	lw	s0,44(sp)
    6d4a:	6145                	addi	sp,sp,48
    6d4c:	8082                	ret

00006d4e <TIM_OC3NPolarityConfig>:
 *            TIM_OCNPolarity_Low - Output Compare active low.
 *
 * @return  none
 */
void TIM_OC3NPolarityConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCNPolarity)
{
    6d4e:	7179                	addi	sp,sp,-48
    6d50:	d622                	sw	s0,44(sp)
    6d52:	1800                	addi	s0,sp,48
    6d54:	fca42e23          	sw	a0,-36(s0)
    6d58:	87ae                	mv	a5,a1
    6d5a:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccer = 0;
    6d5e:	fe041723          	sh	zero,-18(s0)

    tmpccer = TIMx->CCER;
    6d62:	fdc42783          	lw	a5,-36(s0)
    6d66:	0207d783          	lhu	a5,32(a5)
    6d6a:	fef41723          	sh	a5,-18(s0)
    tmpccer &= (uint16_t) ~((uint16_t)TIM_CC3NP);
    6d6e:	fee45703          	lhu	a4,-18(s0)
    6d72:	77fd                	lui	a5,0xfffff
    6d74:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    6d78:	8ff9                	and	a5,a5,a4
    6d7a:	fef41723          	sh	a5,-18(s0)
    tmpccer |= (uint16_t)(TIM_OCNPolarity << 8);
    6d7e:	fda45783          	lhu	a5,-38(s0)
    6d82:	07a2                	slli	a5,a5,0x8
    6d84:	01079713          	slli	a4,a5,0x10
    6d88:	8341                	srli	a4,a4,0x10
    6d8a:	fee45783          	lhu	a5,-18(s0)
    6d8e:	8fd9                	or	a5,a5,a4
    6d90:	fef41723          	sh	a5,-18(s0)
    TIMx->CCER = tmpccer;
    6d94:	fdc42783          	lw	a5,-36(s0)
    6d98:	fee45703          	lhu	a4,-18(s0)
    6d9c:	02e79023          	sh	a4,32(a5)
}
    6da0:	0001                	nop
    6da2:	5432                	lw	s0,44(sp)
    6da4:	6145                	addi	sp,sp,48
    6da6:	8082                	ret

00006da8 <TIM_OC4PolarityConfig>:
 *            TIM_OCPolarity_Low - Output Compare active low.
 *
 * @return  none
 */
void TIM_OC4PolarityConfig(TIM_TypeDef *TIMx, uint16_t TIM_OCPolarity)
{
    6da8:	7179                	addi	sp,sp,-48
    6daa:	d622                	sw	s0,44(sp)
    6dac:	1800                	addi	s0,sp,48
    6dae:	fca42e23          	sw	a0,-36(s0)
    6db2:	87ae                	mv	a5,a1
    6db4:	fcf41d23          	sh	a5,-38(s0)
    uint16_t tmpccer = 0;
    6db8:	fe041723          	sh	zero,-18(s0)

    tmpccer = TIMx->CCER;
    6dbc:	fdc42783          	lw	a5,-36(s0)
    6dc0:	0207d783          	lhu	a5,32(a5)
    6dc4:	fef41723          	sh	a5,-18(s0)
    tmpccer &= (uint16_t) ~((uint16_t)TIM_CC4P);
    6dc8:	fee45703          	lhu	a4,-18(s0)
    6dcc:	77f9                	lui	a5,0xffffe
    6dce:	17fd                	addi	a5,a5,-1
    6dd0:	8ff9                	and	a5,a5,a4
    6dd2:	fef41723          	sh	a5,-18(s0)
    tmpccer |= (uint16_t)(TIM_OCPolarity << 12);
    6dd6:	fda45783          	lhu	a5,-38(s0)
    6dda:	07b2                	slli	a5,a5,0xc
    6ddc:	01079713          	slli	a4,a5,0x10
    6de0:	8341                	srli	a4,a4,0x10
    6de2:	fee45783          	lhu	a5,-18(s0)
    6de6:	8fd9                	or	a5,a5,a4
    6de8:	fef41723          	sh	a5,-18(s0)
    TIMx->CCER = tmpccer;
    6dec:	fdc42783          	lw	a5,-36(s0)
    6df0:	fee45703          	lhu	a4,-18(s0)
    6df4:	02e79023          	sh	a4,32(a5) # ffffe020 <_eusrstack+0xdfffa020>
}
    6df8:	0001                	nop
    6dfa:	5432                	lw	s0,44(sp)
    6dfc:	6145                	addi	sp,sp,48
    6dfe:	8082                	ret

00006e00 <TIM_CCxCmd>:
 *            TIM_CCx_Disable.
 *
 * @return  none
 */
void TIM_CCxCmd(TIM_TypeDef *TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx)
{
    6e00:	7179                	addi	sp,sp,-48
    6e02:	d622                	sw	s0,44(sp)
    6e04:	1800                	addi	s0,sp,48
    6e06:	fca42e23          	sw	a0,-36(s0)
    6e0a:	87ae                	mv	a5,a1
    6e0c:	8732                	mv	a4,a2
    6e0e:	fcf41d23          	sh	a5,-38(s0)
    6e12:	87ba                	mv	a5,a4
    6e14:	fcf41c23          	sh	a5,-40(s0)
    uint16_t tmp = 0;
    6e18:	fe041723          	sh	zero,-18(s0)

    tmp = CCER_CCE_Set << TIM_Channel;
    6e1c:	fda45783          	lhu	a5,-38(s0)
    6e20:	4705                	li	a4,1
    6e22:	00f717b3          	sll	a5,a4,a5
    6e26:	fef41723          	sh	a5,-18(s0)
    TIMx->CCER &= (uint16_t)~tmp;
    6e2a:	fdc42783          	lw	a5,-36(s0)
    6e2e:	0207d783          	lhu	a5,32(a5)
    6e32:	01079713          	slli	a4,a5,0x10
    6e36:	8341                	srli	a4,a4,0x10
    6e38:	fee45783          	lhu	a5,-18(s0)
    6e3c:	fff7c793          	not	a5,a5
    6e40:	07c2                	slli	a5,a5,0x10
    6e42:	83c1                	srli	a5,a5,0x10
    6e44:	8ff9                	and	a5,a5,a4
    6e46:	01079713          	slli	a4,a5,0x10
    6e4a:	8341                	srli	a4,a4,0x10
    6e4c:	fdc42783          	lw	a5,-36(s0)
    6e50:	02e79023          	sh	a4,32(a5)
    TIMx->CCER |= (uint16_t)(TIM_CCx << TIM_Channel);
    6e54:	fdc42783          	lw	a5,-36(s0)
    6e58:	0207d783          	lhu	a5,32(a5)
    6e5c:	01079713          	slli	a4,a5,0x10
    6e60:	8341                	srli	a4,a4,0x10
    6e62:	fd845683          	lhu	a3,-40(s0)
    6e66:	fda45783          	lhu	a5,-38(s0)
    6e6a:	00f697b3          	sll	a5,a3,a5
    6e6e:	07c2                	slli	a5,a5,0x10
    6e70:	83c1                	srli	a5,a5,0x10
    6e72:	8fd9                	or	a5,a5,a4
    6e74:	01079713          	slli	a4,a5,0x10
    6e78:	8341                	srli	a4,a4,0x10
    6e7a:	fdc42783          	lw	a5,-36(s0)
    6e7e:	02e79023          	sh	a4,32(a5)
}
    6e82:	0001                	nop
    6e84:	5432                	lw	s0,44(sp)
    6e86:	6145                	addi	sp,sp,48
    6e88:	8082                	ret

00006e8a <TIM_CCxNCmd>:
 *            TIM_CCxN_Disable.
 *
 * @return  none
 */
void TIM_CCxNCmd(TIM_TypeDef *TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN)
{
    6e8a:	7179                	addi	sp,sp,-48
    6e8c:	d622                	sw	s0,44(sp)
    6e8e:	1800                	addi	s0,sp,48
    6e90:	fca42e23          	sw	a0,-36(s0)
    6e94:	87ae                	mv	a5,a1
    6e96:	8732                	mv	a4,a2
    6e98:	fcf41d23          	sh	a5,-38(s0)
    6e9c:	87ba                	mv	a5,a4
    6e9e:	fcf41c23          	sh	a5,-40(s0)
    uint16_t tmp = 0;
    6ea2:	fe041723          	sh	zero,-18(s0)

    tmp = CCER_CCNE_Set << TIM_Channel;
    6ea6:	fda45783          	lhu	a5,-38(s0)
    6eaa:	4711                	li	a4,4
    6eac:	00f717b3          	sll	a5,a4,a5
    6eb0:	fef41723          	sh	a5,-18(s0)
    TIMx->CCER &= (uint16_t)~tmp;
    6eb4:	fdc42783          	lw	a5,-36(s0)
    6eb8:	0207d783          	lhu	a5,32(a5)
    6ebc:	01079713          	slli	a4,a5,0x10
    6ec0:	8341                	srli	a4,a4,0x10
    6ec2:	fee45783          	lhu	a5,-18(s0)
    6ec6:	fff7c793          	not	a5,a5
    6eca:	07c2                	slli	a5,a5,0x10
    6ecc:	83c1                	srli	a5,a5,0x10
    6ece:	8ff9                	and	a5,a5,a4
    6ed0:	01079713          	slli	a4,a5,0x10
    6ed4:	8341                	srli	a4,a4,0x10
    6ed6:	fdc42783          	lw	a5,-36(s0)
    6eda:	02e79023          	sh	a4,32(a5)
    TIMx->CCER |= (uint16_t)(TIM_CCxN << TIM_Channel);
    6ede:	fdc42783          	lw	a5,-36(s0)
    6ee2:	0207d783          	lhu	a5,32(a5)
    6ee6:	01079713          	slli	a4,a5,0x10
    6eea:	8341                	srli	a4,a4,0x10
    6eec:	fd845683          	lhu	a3,-40(s0)
    6ef0:	fda45783          	lhu	a5,-38(s0)
    6ef4:	00f697b3          	sll	a5,a3,a5
    6ef8:	07c2                	slli	a5,a5,0x10
    6efa:	83c1                	srli	a5,a5,0x10
    6efc:	8fd9                	or	a5,a5,a4
    6efe:	01079713          	slli	a4,a5,0x10
    6f02:	8341                	srli	a4,a4,0x10
    6f04:	fdc42783          	lw	a5,-36(s0)
    6f08:	02e79023          	sh	a4,32(a5)
}
    6f0c:	0001                	nop
    6f0e:	5432                	lw	s0,44(sp)
    6f10:	6145                	addi	sp,sp,48
    6f12:	8082                	ret

00006f14 <TIM_SelectOCxM>:
 *            TIM_ForcedAction_InActive.
 *
 * @return  none
 */
void TIM_SelectOCxM(TIM_TypeDef *TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode)
{
    6f14:	7179                	addi	sp,sp,-48
    6f16:	d622                	sw	s0,44(sp)
    6f18:	1800                	addi	s0,sp,48
    6f1a:	fca42e23          	sw	a0,-36(s0)
    6f1e:	87ae                	mv	a5,a1
    6f20:	8732                	mv	a4,a2
    6f22:	fcf41d23          	sh	a5,-38(s0)
    6f26:	87ba                	mv	a5,a4
    6f28:	fcf41c23          	sh	a5,-40(s0)
    uint32_t tmp = 0;
    6f2c:	fe042623          	sw	zero,-20(s0)
    uint16_t tmp1 = 0;
    6f30:	fe041523          	sh	zero,-22(s0)

    tmp = (uint32_t)TIMx;
    6f34:	fdc42783          	lw	a5,-36(s0)
    6f38:	fef42623          	sw	a5,-20(s0)
    tmp += CHCTLR_Offset;
    6f3c:	fec42783          	lw	a5,-20(s0)
    6f40:	07e1                	addi	a5,a5,24
    6f42:	fef42623          	sw	a5,-20(s0)
    tmp1 = CCER_CCE_Set << (uint16_t)TIM_Channel;
    6f46:	fda45783          	lhu	a5,-38(s0)
    6f4a:	4705                	li	a4,1
    6f4c:	00f717b3          	sll	a5,a4,a5
    6f50:	fef41523          	sh	a5,-22(s0)
    TIMx->CCER &= (uint16_t)~tmp1;
    6f54:	fdc42783          	lw	a5,-36(s0)
    6f58:	0207d783          	lhu	a5,32(a5)
    6f5c:	01079713          	slli	a4,a5,0x10
    6f60:	8341                	srli	a4,a4,0x10
    6f62:	fea45783          	lhu	a5,-22(s0)
    6f66:	fff7c793          	not	a5,a5
    6f6a:	07c2                	slli	a5,a5,0x10
    6f6c:	83c1                	srli	a5,a5,0x10
    6f6e:	8ff9                	and	a5,a5,a4
    6f70:	01079713          	slli	a4,a5,0x10
    6f74:	8341                	srli	a4,a4,0x10
    6f76:	fdc42783          	lw	a5,-36(s0)
    6f7a:	02e79023          	sh	a4,32(a5)

    if((TIM_Channel == TIM_Channel_1) || (TIM_Channel == TIM_Channel_3))
    6f7e:	fda45783          	lhu	a5,-38(s0)
    6f82:	c791                	beqz	a5,6f8e <TIM_SelectOCxM+0x7a>
    6f84:	fda45703          	lhu	a4,-38(s0)
    6f88:	47a1                	li	a5,8
    6f8a:	02f71f63          	bne	a4,a5,6fc8 <TIM_SelectOCxM+0xb4>
    {
        tmp += (TIM_Channel >> 1);
    6f8e:	fda45783          	lhu	a5,-38(s0)
    6f92:	8385                	srli	a5,a5,0x1
    6f94:	07c2                	slli	a5,a5,0x10
    6f96:	83c1                	srli	a5,a5,0x10
    6f98:	873e                	mv	a4,a5
    6f9a:	fec42783          	lw	a5,-20(s0)
    6f9e:	97ba                	add	a5,a5,a4
    6fa0:	fef42623          	sw	a5,-20(s0)
        *(__IO uint32_t *)tmp &= (uint32_t) ~((uint32_t)TIM_OC1M);
    6fa4:	fec42783          	lw	a5,-20(s0)
    6fa8:	4398                	lw	a4,0(a5)
    6faa:	fec42783          	lw	a5,-20(s0)
    6fae:	f8f77713          	andi	a4,a4,-113
    6fb2:	c398                	sw	a4,0(a5)
        *(__IO uint32_t *)tmp |= TIM_OCMode;
    6fb4:	fec42783          	lw	a5,-20(s0)
    6fb8:	4394                	lw	a3,0(a5)
    6fba:	fd845703          	lhu	a4,-40(s0)
    6fbe:	fec42783          	lw	a5,-20(s0)
    6fc2:	8f55                	or	a4,a4,a3
    6fc4:	c398                	sw	a4,0(a5)
    6fc6:	a0a9                	j	7010 <TIM_SelectOCxM+0xfc>
    }
    else
    {
        tmp += (uint16_t)(TIM_Channel - (uint16_t)4) >> (uint16_t)1;
    6fc8:	fda45783          	lhu	a5,-38(s0)
    6fcc:	17f1                	addi	a5,a5,-4
    6fce:	07c2                	slli	a5,a5,0x10
    6fd0:	83c1                	srli	a5,a5,0x10
    6fd2:	8385                	srli	a5,a5,0x1
    6fd4:	07c2                	slli	a5,a5,0x10
    6fd6:	83c1                	srli	a5,a5,0x10
    6fd8:	873e                	mv	a4,a5
    6fda:	fec42783          	lw	a5,-20(s0)
    6fde:	97ba                	add	a5,a5,a4
    6fe0:	fef42623          	sw	a5,-20(s0)
        *(__IO uint32_t *)tmp &= (uint32_t) ~((uint32_t)TIM_OC2M);
    6fe4:	fec42783          	lw	a5,-20(s0)
    6fe8:	4394                	lw	a3,0(a5)
    6fea:	fec42783          	lw	a5,-20(s0)
    6fee:	7765                	lui	a4,0xffff9
    6ff0:	177d                	addi	a4,a4,-1
    6ff2:	8f75                	and	a4,a4,a3
    6ff4:	c398                	sw	a4,0(a5)
        *(__IO uint32_t *)tmp |= (uint16_t)(TIM_OCMode << 8);
    6ff6:	fec42783          	lw	a5,-20(s0)
    6ffa:	4398                	lw	a4,0(a5)
    6ffc:	fd845783          	lhu	a5,-40(s0)
    7000:	07a2                	slli	a5,a5,0x8
    7002:	07c2                	slli	a5,a5,0x10
    7004:	83c1                	srli	a5,a5,0x10
    7006:	86be                	mv	a3,a5
    7008:	fec42783          	lw	a5,-20(s0)
    700c:	8f55                	or	a4,a4,a3
    700e:	c398                	sw	a4,0(a5)
    }
}
    7010:	0001                	nop
    7012:	5432                	lw	s0,44(sp)
    7014:	6145                	addi	sp,sp,48
    7016:	8082                	ret

00007018 <TIM_UpdateDisableConfig>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_UpdateDisableConfig(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    7018:	1101                	addi	sp,sp,-32
    701a:	ce22                	sw	s0,28(sp)
    701c:	1000                	addi	s0,sp,32
    701e:	fea42623          	sw	a0,-20(s0)
    7022:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    7026:	fe842783          	lw	a5,-24(s0)
    702a:	c38d                	beqz	a5,704c <TIM_UpdateDisableConfig+0x34>
    {
        TIMx->CTLR1 |= TIM_UDIS;
    702c:	fec42783          	lw	a5,-20(s0)
    7030:	0007d783          	lhu	a5,0(a5)
    7034:	07c2                	slli	a5,a5,0x10
    7036:	83c1                	srli	a5,a5,0x10
    7038:	0027e793          	ori	a5,a5,2
    703c:	01079713          	slli	a4,a5,0x10
    7040:	8341                	srli	a4,a4,0x10
    7042:	fec42783          	lw	a5,-20(s0)
    7046:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        TIMx->CTLR1 &= (uint16_t) ~((uint16_t)TIM_UDIS);
    }
}
    704a:	a839                	j	7068 <TIM_UpdateDisableConfig+0x50>
        TIMx->CTLR1 &= (uint16_t) ~((uint16_t)TIM_UDIS);
    704c:	fec42783          	lw	a5,-20(s0)
    7050:	0007d783          	lhu	a5,0(a5)
    7054:	07c2                	slli	a5,a5,0x10
    7056:	83c1                	srli	a5,a5,0x10
    7058:	9bf5                	andi	a5,a5,-3
    705a:	01079713          	slli	a4,a5,0x10
    705e:	8341                	srli	a4,a4,0x10
    7060:	fec42783          	lw	a5,-20(s0)
    7064:	00e79023          	sh	a4,0(a5)
}
    7068:	0001                	nop
    706a:	4472                	lw	s0,28(sp)
    706c:	6105                	addi	sp,sp,32
    706e:	8082                	ret

00007070 <TIM_UpdateRequestConfig>:
 *            TIM_UpdateSource_Global.
 *
 * @return  none
 */
void TIM_UpdateRequestConfig(TIM_TypeDef *TIMx, uint16_t TIM_UpdateSource)
{
    7070:	1101                	addi	sp,sp,-32
    7072:	ce22                	sw	s0,28(sp)
    7074:	1000                	addi	s0,sp,32
    7076:	fea42623          	sw	a0,-20(s0)
    707a:	87ae                	mv	a5,a1
    707c:	fef41523          	sh	a5,-22(s0)
    if(TIM_UpdateSource != TIM_UpdateSource_Global)
    7080:	fea45783          	lhu	a5,-22(s0)
    7084:	c38d                	beqz	a5,70a6 <TIM_UpdateRequestConfig+0x36>
    {
        TIMx->CTLR1 |= TIM_URS;
    7086:	fec42783          	lw	a5,-20(s0)
    708a:	0007d783          	lhu	a5,0(a5)
    708e:	07c2                	slli	a5,a5,0x10
    7090:	83c1                	srli	a5,a5,0x10
    7092:	0047e793          	ori	a5,a5,4
    7096:	01079713          	slli	a4,a5,0x10
    709a:	8341                	srli	a4,a4,0x10
    709c:	fec42783          	lw	a5,-20(s0)
    70a0:	00e79023          	sh	a4,0(a5)
    }
    else
    {
        TIMx->CTLR1 &= (uint16_t) ~((uint16_t)TIM_URS);
    }
}
    70a4:	a839                	j	70c2 <TIM_UpdateRequestConfig+0x52>
        TIMx->CTLR1 &= (uint16_t) ~((uint16_t)TIM_URS);
    70a6:	fec42783          	lw	a5,-20(s0)
    70aa:	0007d783          	lhu	a5,0(a5)
    70ae:	07c2                	slli	a5,a5,0x10
    70b0:	83c1                	srli	a5,a5,0x10
    70b2:	9bed                	andi	a5,a5,-5
    70b4:	01079713          	slli	a4,a5,0x10
    70b8:	8341                	srli	a4,a4,0x10
    70ba:	fec42783          	lw	a5,-20(s0)
    70be:	00e79023          	sh	a4,0(a5)
}
    70c2:	0001                	nop
    70c4:	4472                	lw	s0,28(sp)
    70c6:	6105                	addi	sp,sp,32
    70c8:	8082                	ret

000070ca <TIM_SelectHallSensor>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_SelectHallSensor(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    70ca:	1101                	addi	sp,sp,-32
    70cc:	ce22                	sw	s0,28(sp)
    70ce:	1000                	addi	s0,sp,32
    70d0:	fea42623          	sw	a0,-20(s0)
    70d4:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    70d8:	fe842783          	lw	a5,-24(s0)
    70dc:	c38d                	beqz	a5,70fe <TIM_SelectHallSensor+0x34>
    {
        TIMx->CTLR2 |= TIM_TI1S;
    70de:	fec42783          	lw	a5,-20(s0)
    70e2:	0047d783          	lhu	a5,4(a5)
    70e6:	07c2                	slli	a5,a5,0x10
    70e8:	83c1                	srli	a5,a5,0x10
    70ea:	0807e793          	ori	a5,a5,128
    70ee:	01079713          	slli	a4,a5,0x10
    70f2:	8341                	srli	a4,a4,0x10
    70f4:	fec42783          	lw	a5,-20(s0)
    70f8:	00e79223          	sh	a4,4(a5)
    }
    else
    {
        TIMx->CTLR2 &= (uint16_t) ~((uint16_t)TIM_TI1S);
    }
}
    70fc:	a005                	j	711c <TIM_SelectHallSensor+0x52>
        TIMx->CTLR2 &= (uint16_t) ~((uint16_t)TIM_TI1S);
    70fe:	fec42783          	lw	a5,-20(s0)
    7102:	0047d783          	lhu	a5,4(a5)
    7106:	07c2                	slli	a5,a5,0x10
    7108:	83c1                	srli	a5,a5,0x10
    710a:	f7f7f793          	andi	a5,a5,-129
    710e:	01079713          	slli	a4,a5,0x10
    7112:	8341                	srli	a4,a4,0x10
    7114:	fec42783          	lw	a5,-20(s0)
    7118:	00e79223          	sh	a4,4(a5)
}
    711c:	0001                	nop
    711e:	4472                	lw	s0,28(sp)
    7120:	6105                	addi	sp,sp,32
    7122:	8082                	ret

00007124 <TIM_SelectOnePulseMode>:
 *            TIM_OPMode_Repetitive.
 *
 * @return  none
 */
void TIM_SelectOnePulseMode(TIM_TypeDef *TIMx, uint16_t TIM_OPMode)
{
    7124:	1101                	addi	sp,sp,-32
    7126:	ce22                	sw	s0,28(sp)
    7128:	1000                	addi	s0,sp,32
    712a:	fea42623          	sw	a0,-20(s0)
    712e:	87ae                	mv	a5,a1
    7130:	fef41523          	sh	a5,-22(s0)
    TIMx->CTLR1 &= (uint16_t) ~((uint16_t)TIM_OPM);
    7134:	fec42783          	lw	a5,-20(s0)
    7138:	0007d783          	lhu	a5,0(a5)
    713c:	07c2                	slli	a5,a5,0x10
    713e:	83c1                	srli	a5,a5,0x10
    7140:	9bdd                	andi	a5,a5,-9
    7142:	01079713          	slli	a4,a5,0x10
    7146:	8341                	srli	a4,a4,0x10
    7148:	fec42783          	lw	a5,-20(s0)
    714c:	00e79023          	sh	a4,0(a5)
    TIMx->CTLR1 |= TIM_OPMode;
    7150:	fec42783          	lw	a5,-20(s0)
    7154:	0007d783          	lhu	a5,0(a5)
    7158:	01079713          	slli	a4,a5,0x10
    715c:	8341                	srli	a4,a4,0x10
    715e:	fea45783          	lhu	a5,-22(s0)
    7162:	8fd9                	or	a5,a5,a4
    7164:	01079713          	slli	a4,a5,0x10
    7168:	8341                	srli	a4,a4,0x10
    716a:	fec42783          	lw	a5,-20(s0)
    716e:	00e79023          	sh	a4,0(a5)
}
    7172:	0001                	nop
    7174:	4472                	lw	s0,28(sp)
    7176:	6105                	addi	sp,sp,32
    7178:	8082                	ret

0000717a <TIM_SelectOutputTrigger>:
 *            TIM_TRGOSource_OC4Ref - OC4REF signal is used as the trigger output (TRGO).
 *
 * @return  none
 */
void TIM_SelectOutputTrigger(TIM_TypeDef *TIMx, uint16_t TIM_TRGOSource)
{
    717a:	1101                	addi	sp,sp,-32
    717c:	ce22                	sw	s0,28(sp)
    717e:	1000                	addi	s0,sp,32
    7180:	fea42623          	sw	a0,-20(s0)
    7184:	87ae                	mv	a5,a1
    7186:	fef41523          	sh	a5,-22(s0)
    TIMx->CTLR2 &= (uint16_t) ~((uint16_t)TIM_MMS);
    718a:	fec42783          	lw	a5,-20(s0)
    718e:	0047d783          	lhu	a5,4(a5)
    7192:	07c2                	slli	a5,a5,0x10
    7194:	83c1                	srli	a5,a5,0x10
    7196:	f8f7f793          	andi	a5,a5,-113
    719a:	01079713          	slli	a4,a5,0x10
    719e:	8341                	srli	a4,a4,0x10
    71a0:	fec42783          	lw	a5,-20(s0)
    71a4:	00e79223          	sh	a4,4(a5)
    TIMx->CTLR2 |= TIM_TRGOSource;
    71a8:	fec42783          	lw	a5,-20(s0)
    71ac:	0047d783          	lhu	a5,4(a5)
    71b0:	01079713          	slli	a4,a5,0x10
    71b4:	8341                	srli	a4,a4,0x10
    71b6:	fea45783          	lhu	a5,-22(s0)
    71ba:	8fd9                	or	a5,a5,a4
    71bc:	01079713          	slli	a4,a5,0x10
    71c0:	8341                	srli	a4,a4,0x10
    71c2:	fec42783          	lw	a5,-20(s0)
    71c6:	00e79223          	sh	a4,4(a5)
}
    71ca:	0001                	nop
    71cc:	4472                	lw	s0,28(sp)
    71ce:	6105                	addi	sp,sp,32
    71d0:	8082                	ret

000071d2 <TIM_SelectSlaveMode>:
 *        (TRGI) clock the counter.
 *
 * @return  none
 */
void TIM_SelectSlaveMode(TIM_TypeDef *TIMx, uint16_t TIM_SlaveMode)
{
    71d2:	1101                	addi	sp,sp,-32
    71d4:	ce22                	sw	s0,28(sp)
    71d6:	1000                	addi	s0,sp,32
    71d8:	fea42623          	sw	a0,-20(s0)
    71dc:	87ae                	mv	a5,a1
    71de:	fef41523          	sh	a5,-22(s0)
    TIMx->SMCFGR &= (uint16_t) ~((uint16_t)TIM_SMS);
    71e2:	fec42783          	lw	a5,-20(s0)
    71e6:	0087d783          	lhu	a5,8(a5)
    71ea:	07c2                	slli	a5,a5,0x10
    71ec:	83c1                	srli	a5,a5,0x10
    71ee:	9be1                	andi	a5,a5,-8
    71f0:	01079713          	slli	a4,a5,0x10
    71f4:	8341                	srli	a4,a4,0x10
    71f6:	fec42783          	lw	a5,-20(s0)
    71fa:	00e79423          	sh	a4,8(a5)
    TIMx->SMCFGR |= TIM_SlaveMode;
    71fe:	fec42783          	lw	a5,-20(s0)
    7202:	0087d783          	lhu	a5,8(a5)
    7206:	01079713          	slli	a4,a5,0x10
    720a:	8341                	srli	a4,a4,0x10
    720c:	fea45783          	lhu	a5,-22(s0)
    7210:	8fd9                	or	a5,a5,a4
    7212:	01079713          	slli	a4,a5,0x10
    7216:	8341                	srli	a4,a4,0x10
    7218:	fec42783          	lw	a5,-20(s0)
    721c:	00e79423          	sh	a4,8(a5)
}
    7220:	0001                	nop
    7222:	4472                	lw	s0,28(sp)
    7224:	6105                	addi	sp,sp,32
    7226:	8082                	ret

00007228 <TIM_SelectMasterSlaveMode>:
 *            TIM_MasterSlaveMode_Disable - No action.
 *
 * @return  none
 */
void TIM_SelectMasterSlaveMode(TIM_TypeDef *TIMx, uint16_t TIM_MasterSlaveMode)
{
    7228:	1101                	addi	sp,sp,-32
    722a:	ce22                	sw	s0,28(sp)
    722c:	1000                	addi	s0,sp,32
    722e:	fea42623          	sw	a0,-20(s0)
    7232:	87ae                	mv	a5,a1
    7234:	fef41523          	sh	a5,-22(s0)
    TIMx->SMCFGR &= (uint16_t) ~((uint16_t)TIM_MSM);
    7238:	fec42783          	lw	a5,-20(s0)
    723c:	0087d783          	lhu	a5,8(a5)
    7240:	07c2                	slli	a5,a5,0x10
    7242:	83c1                	srli	a5,a5,0x10
    7244:	f7f7f793          	andi	a5,a5,-129
    7248:	01079713          	slli	a4,a5,0x10
    724c:	8341                	srli	a4,a4,0x10
    724e:	fec42783          	lw	a5,-20(s0)
    7252:	00e79423          	sh	a4,8(a5)
    TIMx->SMCFGR |= TIM_MasterSlaveMode;
    7256:	fec42783          	lw	a5,-20(s0)
    725a:	0087d783          	lhu	a5,8(a5)
    725e:	01079713          	slli	a4,a5,0x10
    7262:	8341                	srli	a4,a4,0x10
    7264:	fea45783          	lhu	a5,-22(s0)
    7268:	8fd9                	or	a5,a5,a4
    726a:	01079713          	slli	a4,a5,0x10
    726e:	8341                	srli	a4,a4,0x10
    7270:	fec42783          	lw	a5,-20(s0)
    7274:	00e79423          	sh	a4,8(a5)
}
    7278:	0001                	nop
    727a:	4472                	lw	s0,28(sp)
    727c:	6105                	addi	sp,sp,32
    727e:	8082                	ret

00007280 <TIM_SetCounter>:
 *          Counter - specifies the Counter register new value.
 *
 * @return  none
 */
void TIM_SetCounter(TIM_TypeDef *TIMx, uint16_t Counter)
{
    7280:	1101                	addi	sp,sp,-32
    7282:	ce22                	sw	s0,28(sp)
    7284:	1000                	addi	s0,sp,32
    7286:	fea42623          	sw	a0,-20(s0)
    728a:	87ae                	mv	a5,a1
    728c:	fef41523          	sh	a5,-22(s0)
    TIMx->CNT = Counter;
    7290:	fec42783          	lw	a5,-20(s0)
    7294:	fea45703          	lhu	a4,-22(s0)
    7298:	02e79223          	sh	a4,36(a5)
}
    729c:	0001                	nop
    729e:	4472                	lw	s0,28(sp)
    72a0:	6105                	addi	sp,sp,32
    72a2:	8082                	ret

000072a4 <TIM_SetAutoreload>:
 *          Autoreload - specifies the Autoreload register new value.
 *
 * @return  none
 */
void TIM_SetAutoreload(TIM_TypeDef *TIMx, uint16_t Autoreload)
{
    72a4:	1101                	addi	sp,sp,-32
    72a6:	ce22                	sw	s0,28(sp)
    72a8:	1000                	addi	s0,sp,32
    72aa:	fea42623          	sw	a0,-20(s0)
    72ae:	87ae                	mv	a5,a1
    72b0:	fef41523          	sh	a5,-22(s0)
    TIMx->ATRLR = Autoreload;
    72b4:	fec42783          	lw	a5,-20(s0)
    72b8:	fea45703          	lhu	a4,-22(s0)
    72bc:	02e79623          	sh	a4,44(a5)
}
    72c0:	0001                	nop
    72c2:	4472                	lw	s0,28(sp)
    72c4:	6105                	addi	sp,sp,32
    72c6:	8082                	ret

000072c8 <TIM_SetCompare1>:
 *          Compare1 - specifies the Capture Compare1 register new value.
 *
 * @return  none
 */
void TIM_SetCompare1(TIM_TypeDef *TIMx, uint16_t Compare1)
{
    72c8:	1101                	addi	sp,sp,-32
    72ca:	ce22                	sw	s0,28(sp)
    72cc:	1000                	addi	s0,sp,32
    72ce:	fea42623          	sw	a0,-20(s0)
    72d2:	87ae                	mv	a5,a1
    72d4:	fef41523          	sh	a5,-22(s0)
    TIMx->CH1CVR = Compare1;
    72d8:	fec42783          	lw	a5,-20(s0)
    72dc:	fea45703          	lhu	a4,-22(s0)
    72e0:	02e79a23          	sh	a4,52(a5)
}
    72e4:	0001                	nop
    72e6:	4472                	lw	s0,28(sp)
    72e8:	6105                	addi	sp,sp,32
    72ea:	8082                	ret

000072ec <TIM_SetCompare2>:
 *          Compare1 - specifies the Capture Compare1 register new value.
 *
 * @return  none
 */
void TIM_SetCompare2(TIM_TypeDef *TIMx, uint16_t Compare2)
{
    72ec:	1101                	addi	sp,sp,-32
    72ee:	ce22                	sw	s0,28(sp)
    72f0:	1000                	addi	s0,sp,32
    72f2:	fea42623          	sw	a0,-20(s0)
    72f6:	87ae                	mv	a5,a1
    72f8:	fef41523          	sh	a5,-22(s0)
    TIMx->CH2CVR = Compare2;
    72fc:	fec42783          	lw	a5,-20(s0)
    7300:	fea45703          	lhu	a4,-22(s0)
    7304:	02e79c23          	sh	a4,56(a5)
}
    7308:	0001                	nop
    730a:	4472                	lw	s0,28(sp)
    730c:	6105                	addi	sp,sp,32
    730e:	8082                	ret

00007310 <TIM_SetCompare3>:
 *          Compare1 - specifies the Capture Compare1 register new value.
 *
 * @return  none
 */
void TIM_SetCompare3(TIM_TypeDef *TIMx, uint16_t Compare3)
{
    7310:	1101                	addi	sp,sp,-32
    7312:	ce22                	sw	s0,28(sp)
    7314:	1000                	addi	s0,sp,32
    7316:	fea42623          	sw	a0,-20(s0)
    731a:	87ae                	mv	a5,a1
    731c:	fef41523          	sh	a5,-22(s0)
    TIMx->CH3CVR = Compare3;
    7320:	fec42783          	lw	a5,-20(s0)
    7324:	fea45703          	lhu	a4,-22(s0)
    7328:	02e79e23          	sh	a4,60(a5)
}
    732c:	0001                	nop
    732e:	4472                	lw	s0,28(sp)
    7330:	6105                	addi	sp,sp,32
    7332:	8082                	ret

00007334 <TIM_SetCompare4>:
 *          Compare1 - specifies the Capture Compare1 register new value.
 *
 * @return  none
 */
void TIM_SetCompare4(TIM_TypeDef *TIMx, uint16_t Compare4)
{
    7334:	1101                	addi	sp,sp,-32
    7336:	ce22                	sw	s0,28(sp)
    7338:	1000                	addi	s0,sp,32
    733a:	fea42623          	sw	a0,-20(s0)
    733e:	87ae                	mv	a5,a1
    7340:	fef41523          	sh	a5,-22(s0)
    TIMx->CH4CVR = Compare4;
    7344:	fec42783          	lw	a5,-20(s0)
    7348:	fea45703          	lhu	a4,-22(s0)
    734c:	04e79023          	sh	a4,64(a5)
}
    7350:	0001                	nop
    7352:	4472                	lw	s0,28(sp)
    7354:	6105                	addi	sp,sp,32
    7356:	8082                	ret

00007358 <TIM_SetIC1Prescaler>:
 *            TIM_ICPSC_DIV8 - capture is done once every 8 events.
 *
 * @return  none
 */
void TIM_SetIC1Prescaler(TIM_TypeDef *TIMx, uint16_t TIM_ICPSC)
{
    7358:	1101                	addi	sp,sp,-32
    735a:	ce22                	sw	s0,28(sp)
    735c:	1000                	addi	s0,sp,32
    735e:	fea42623          	sw	a0,-20(s0)
    7362:	87ae                	mv	a5,a1
    7364:	fef41523          	sh	a5,-22(s0)
    TIMx->CHCTLR1 &= (uint16_t) ~((uint16_t)TIM_IC1PSC);
    7368:	fec42783          	lw	a5,-20(s0)
    736c:	0187d783          	lhu	a5,24(a5)
    7370:	07c2                	slli	a5,a5,0x10
    7372:	83c1                	srli	a5,a5,0x10
    7374:	9bcd                	andi	a5,a5,-13
    7376:	01079713          	slli	a4,a5,0x10
    737a:	8341                	srli	a4,a4,0x10
    737c:	fec42783          	lw	a5,-20(s0)
    7380:	00e79c23          	sh	a4,24(a5)
    TIMx->CHCTLR1 |= TIM_ICPSC;
    7384:	fec42783          	lw	a5,-20(s0)
    7388:	0187d783          	lhu	a5,24(a5)
    738c:	01079713          	slli	a4,a5,0x10
    7390:	8341                	srli	a4,a4,0x10
    7392:	fea45783          	lhu	a5,-22(s0)
    7396:	8fd9                	or	a5,a5,a4
    7398:	01079713          	slli	a4,a5,0x10
    739c:	8341                	srli	a4,a4,0x10
    739e:	fec42783          	lw	a5,-20(s0)
    73a2:	00e79c23          	sh	a4,24(a5)
}
    73a6:	0001                	nop
    73a8:	4472                	lw	s0,28(sp)
    73aa:	6105                	addi	sp,sp,32
    73ac:	8082                	ret

000073ae <TIM_SetIC2Prescaler>:
 *            TIM_ICPSC_DIV8 - capture is done once every 8 events.
 *
 * @return  none
 */
void TIM_SetIC2Prescaler(TIM_TypeDef *TIMx, uint16_t TIM_ICPSC)
{
    73ae:	1101                	addi	sp,sp,-32
    73b0:	ce22                	sw	s0,28(sp)
    73b2:	1000                	addi	s0,sp,32
    73b4:	fea42623          	sw	a0,-20(s0)
    73b8:	87ae                	mv	a5,a1
    73ba:	fef41523          	sh	a5,-22(s0)
    TIMx->CHCTLR1 &= (uint16_t) ~((uint16_t)TIM_IC2PSC);
    73be:	fec42783          	lw	a5,-20(s0)
    73c2:	0187d783          	lhu	a5,24(a5)
    73c6:	01079713          	slli	a4,a5,0x10
    73ca:	8341                	srli	a4,a4,0x10
    73cc:	77fd                	lui	a5,0xfffff
    73ce:	3ff78793          	addi	a5,a5,1023 # fffff3ff <_eusrstack+0xdfffb3ff>
    73d2:	8ff9                	and	a5,a5,a4
    73d4:	01079713          	slli	a4,a5,0x10
    73d8:	8341                	srli	a4,a4,0x10
    73da:	fec42783          	lw	a5,-20(s0)
    73de:	00e79c23          	sh	a4,24(a5)
    TIMx->CHCTLR1 |= (uint16_t)(TIM_ICPSC << 8);
    73e2:	fec42783          	lw	a5,-20(s0)
    73e6:	0187d783          	lhu	a5,24(a5)
    73ea:	01079713          	slli	a4,a5,0x10
    73ee:	8341                	srli	a4,a4,0x10
    73f0:	fea45783          	lhu	a5,-22(s0)
    73f4:	07a2                	slli	a5,a5,0x8
    73f6:	07c2                	slli	a5,a5,0x10
    73f8:	83c1                	srli	a5,a5,0x10
    73fa:	8fd9                	or	a5,a5,a4
    73fc:	01079713          	slli	a4,a5,0x10
    7400:	8341                	srli	a4,a4,0x10
    7402:	fec42783          	lw	a5,-20(s0)
    7406:	00e79c23          	sh	a4,24(a5)
}
    740a:	0001                	nop
    740c:	4472                	lw	s0,28(sp)
    740e:	6105                	addi	sp,sp,32
    7410:	8082                	ret

00007412 <TIM_SetIC3Prescaler>:
 *            TIM_ICPSC_DIV8 - capture is done once every 8 events.
 *
 * @return  none
 */
void TIM_SetIC3Prescaler(TIM_TypeDef *TIMx, uint16_t TIM_ICPSC)
{
    7412:	1101                	addi	sp,sp,-32
    7414:	ce22                	sw	s0,28(sp)
    7416:	1000                	addi	s0,sp,32
    7418:	fea42623          	sw	a0,-20(s0)
    741c:	87ae                	mv	a5,a1
    741e:	fef41523          	sh	a5,-22(s0)
    TIMx->CHCTLR2 &= (uint16_t) ~((uint16_t)TIM_IC3PSC);
    7422:	fec42783          	lw	a5,-20(s0)
    7426:	01c7d783          	lhu	a5,28(a5)
    742a:	07c2                	slli	a5,a5,0x10
    742c:	83c1                	srli	a5,a5,0x10
    742e:	9bcd                	andi	a5,a5,-13
    7430:	01079713          	slli	a4,a5,0x10
    7434:	8341                	srli	a4,a4,0x10
    7436:	fec42783          	lw	a5,-20(s0)
    743a:	00e79e23          	sh	a4,28(a5)
    TIMx->CHCTLR2 |= TIM_ICPSC;
    743e:	fec42783          	lw	a5,-20(s0)
    7442:	01c7d783          	lhu	a5,28(a5)
    7446:	01079713          	slli	a4,a5,0x10
    744a:	8341                	srli	a4,a4,0x10
    744c:	fea45783          	lhu	a5,-22(s0)
    7450:	8fd9                	or	a5,a5,a4
    7452:	01079713          	slli	a4,a5,0x10
    7456:	8341                	srli	a4,a4,0x10
    7458:	fec42783          	lw	a5,-20(s0)
    745c:	00e79e23          	sh	a4,28(a5)
}
    7460:	0001                	nop
    7462:	4472                	lw	s0,28(sp)
    7464:	6105                	addi	sp,sp,32
    7466:	8082                	ret

00007468 <TIM_SetIC4Prescaler>:
 *            TIM_ICPSC_DIV8 - capture is done once every 8 events.
 *
 * @return  none
 */
void TIM_SetIC4Prescaler(TIM_TypeDef *TIMx, uint16_t TIM_ICPSC)
{
    7468:	1101                	addi	sp,sp,-32
    746a:	ce22                	sw	s0,28(sp)
    746c:	1000                	addi	s0,sp,32
    746e:	fea42623          	sw	a0,-20(s0)
    7472:	87ae                	mv	a5,a1
    7474:	fef41523          	sh	a5,-22(s0)
    TIMx->CHCTLR2 &= (uint16_t) ~((uint16_t)TIM_IC4PSC);
    7478:	fec42783          	lw	a5,-20(s0)
    747c:	01c7d783          	lhu	a5,28(a5)
    7480:	01079713          	slli	a4,a5,0x10
    7484:	8341                	srli	a4,a4,0x10
    7486:	77fd                	lui	a5,0xfffff
    7488:	3ff78793          	addi	a5,a5,1023 # fffff3ff <_eusrstack+0xdfffb3ff>
    748c:	8ff9                	and	a5,a5,a4
    748e:	01079713          	slli	a4,a5,0x10
    7492:	8341                	srli	a4,a4,0x10
    7494:	fec42783          	lw	a5,-20(s0)
    7498:	00e79e23          	sh	a4,28(a5)
    TIMx->CHCTLR2 |= (uint16_t)(TIM_ICPSC << 8);
    749c:	fec42783          	lw	a5,-20(s0)
    74a0:	01c7d783          	lhu	a5,28(a5)
    74a4:	01079713          	slli	a4,a5,0x10
    74a8:	8341                	srli	a4,a4,0x10
    74aa:	fea45783          	lhu	a5,-22(s0)
    74ae:	07a2                	slli	a5,a5,0x8
    74b0:	07c2                	slli	a5,a5,0x10
    74b2:	83c1                	srli	a5,a5,0x10
    74b4:	8fd9                	or	a5,a5,a4
    74b6:	01079713          	slli	a4,a5,0x10
    74ba:	8341                	srli	a4,a4,0x10
    74bc:	fec42783          	lw	a5,-20(s0)
    74c0:	00e79e23          	sh	a4,28(a5)
}
    74c4:	0001                	nop
    74c6:	4472                	lw	s0,28(sp)
    74c8:	6105                	addi	sp,sp,32
    74ca:	8082                	ret

000074cc <TIM_SetClockDivision>:
 *            TIM_CKD_DIV4 - TDTS = 4*Tck_tim.
 *
 * @return  none
 */
void TIM_SetClockDivision(TIM_TypeDef *TIMx, uint16_t TIM_CKD)
{
    74cc:	1101                	addi	sp,sp,-32
    74ce:	ce22                	sw	s0,28(sp)
    74d0:	1000                	addi	s0,sp,32
    74d2:	fea42623          	sw	a0,-20(s0)
    74d6:	87ae                	mv	a5,a1
    74d8:	fef41523          	sh	a5,-22(s0)
    TIMx->CTLR1 &= (uint16_t) ~((uint16_t)TIM_CTLR1_CKD);
    74dc:	fec42783          	lw	a5,-20(s0)
    74e0:	0007d783          	lhu	a5,0(a5)
    74e4:	07c2                	slli	a5,a5,0x10
    74e6:	83c1                	srli	a5,a5,0x10
    74e8:	cff7f793          	andi	a5,a5,-769
    74ec:	01079713          	slli	a4,a5,0x10
    74f0:	8341                	srli	a4,a4,0x10
    74f2:	fec42783          	lw	a5,-20(s0)
    74f6:	00e79023          	sh	a4,0(a5)
    TIMx->CTLR1 |= TIM_CKD;
    74fa:	fec42783          	lw	a5,-20(s0)
    74fe:	0007d783          	lhu	a5,0(a5)
    7502:	01079713          	slli	a4,a5,0x10
    7506:	8341                	srli	a4,a4,0x10
    7508:	fea45783          	lhu	a5,-22(s0)
    750c:	8fd9                	or	a5,a5,a4
    750e:	01079713          	slli	a4,a5,0x10
    7512:	8341                	srli	a4,a4,0x10
    7514:	fec42783          	lw	a5,-20(s0)
    7518:	00e79023          	sh	a4,0(a5)
}
    751c:	0001                	nop
    751e:	4472                	lw	s0,28(sp)
    7520:	6105                	addi	sp,sp,32
    7522:	8082                	ret

00007524 <TIM_GetCapture1>:
 * @param   TIMx - where x can be 1 to 3 select the TIM peripheral.
 *
 * @return  TIMx->CH1CVR - Capture Compare 1 Register value.
 */
uint16_t TIM_GetCapture1(TIM_TypeDef *TIMx)
{
    7524:	1101                	addi	sp,sp,-32
    7526:	ce22                	sw	s0,28(sp)
    7528:	1000                	addi	s0,sp,32
    752a:	fea42623          	sw	a0,-20(s0)
    return TIMx->CH1CVR;
    752e:	fec42783          	lw	a5,-20(s0)
    7532:	0347d783          	lhu	a5,52(a5)
    7536:	07c2                	slli	a5,a5,0x10
    7538:	83c1                	srli	a5,a5,0x10
}
    753a:	853e                	mv	a0,a5
    753c:	4472                	lw	s0,28(sp)
    753e:	6105                	addi	sp,sp,32
    7540:	8082                	ret

00007542 <TIM_GetCapture2>:
 * @param   TIMx - where x can be 1 to 3 select the TIM peripheral.
 *
 * @return  TIMx->CH2CVR - Capture Compare 2 Register value.
 */
uint16_t TIM_GetCapture2(TIM_TypeDef *TIMx)
{
    7542:	1101                	addi	sp,sp,-32
    7544:	ce22                	sw	s0,28(sp)
    7546:	1000                	addi	s0,sp,32
    7548:	fea42623          	sw	a0,-20(s0)
    return TIMx->CH2CVR;
    754c:	fec42783          	lw	a5,-20(s0)
    7550:	0387d783          	lhu	a5,56(a5)
    7554:	07c2                	slli	a5,a5,0x10
    7556:	83c1                	srli	a5,a5,0x10
}
    7558:	853e                	mv	a0,a5
    755a:	4472                	lw	s0,28(sp)
    755c:	6105                	addi	sp,sp,32
    755e:	8082                	ret

00007560 <TIM_GetCapture3>:
 * @param   TIMx - where x can be 1 to 2 select the TIM peripheral.
 *
 * @return  TIMx->CH3CVR - Capture Compare 3 Register value.
 */
uint16_t TIM_GetCapture3(TIM_TypeDef *TIMx)
{
    7560:	1101                	addi	sp,sp,-32
    7562:	ce22                	sw	s0,28(sp)
    7564:	1000                	addi	s0,sp,32
    7566:	fea42623          	sw	a0,-20(s0)
    return TIMx->CH3CVR;
    756a:	fec42783          	lw	a5,-20(s0)
    756e:	03c7d783          	lhu	a5,60(a5)
    7572:	07c2                	slli	a5,a5,0x10
    7574:	83c1                	srli	a5,a5,0x10
}
    7576:	853e                	mv	a0,a5
    7578:	4472                	lw	s0,28(sp)
    757a:	6105                	addi	sp,sp,32
    757c:	8082                	ret

0000757e <TIM_GetCapture4>:
 * @param   TIMx - where x can be 1 to 2 select the TIM peripheral.
 *
 * @return  TIMx->CH4CVR - Capture Compare 4 Register value.
 */
uint16_t TIM_GetCapture4(TIM_TypeDef *TIMx)
{
    757e:	1101                	addi	sp,sp,-32
    7580:	ce22                	sw	s0,28(sp)
    7582:	1000                	addi	s0,sp,32
    7584:	fea42623          	sw	a0,-20(s0)
    return TIMx->CH4CVR;
    7588:	fec42783          	lw	a5,-20(s0)
    758c:	0407d783          	lhu	a5,64(a5)
    7590:	07c2                	slli	a5,a5,0x10
    7592:	83c1                	srli	a5,a5,0x10
}
    7594:	853e                	mv	a0,a5
    7596:	4472                	lw	s0,28(sp)
    7598:	6105                	addi	sp,sp,32
    759a:	8082                	ret

0000759c <TIM_GetCounter>:
 * @param   TIMx - where x can be 1 to 3 select the TIM peripheral.
 *
 * @return  TIMx->CNT - Counter Register value.
 */
uint16_t TIM_GetCounter(TIM_TypeDef *TIMx)
{
    759c:	1101                	addi	sp,sp,-32
    759e:	ce22                	sw	s0,28(sp)
    75a0:	1000                	addi	s0,sp,32
    75a2:	fea42623          	sw	a0,-20(s0)
    return TIMx->CNT;
    75a6:	fec42783          	lw	a5,-20(s0)
    75aa:	0247d783          	lhu	a5,36(a5)
    75ae:	07c2                	slli	a5,a5,0x10
    75b0:	83c1                	srli	a5,a5,0x10
}
    75b2:	853e                	mv	a0,a5
    75b4:	4472                	lw	s0,28(sp)
    75b6:	6105                	addi	sp,sp,32
    75b8:	8082                	ret

000075ba <TIM_GetPrescaler>:
 * @param   TIMx - where x can be 1 to 3 select the TIM peripheral.
 *
 * @return  TIMx->PSC - Prescaler Register value.
 */
uint16_t TIM_GetPrescaler(TIM_TypeDef *TIMx)
{
    75ba:	1101                	addi	sp,sp,-32
    75bc:	ce22                	sw	s0,28(sp)
    75be:	1000                	addi	s0,sp,32
    75c0:	fea42623          	sw	a0,-20(s0)
    return TIMx->PSC;
    75c4:	fec42783          	lw	a5,-20(s0)
    75c8:	0287d783          	lhu	a5,40(a5)
    75cc:	07c2                	slli	a5,a5,0x10
    75ce:	83c1                	srli	a5,a5,0x10
}
    75d0:	853e                	mv	a0,a5
    75d2:	4472                	lw	s0,28(sp)
    75d4:	6105                	addi	sp,sp,32
    75d6:	8082                	ret

000075d8 <TIM_GetFlagStatus>:
 *            TIM_FLAG_CC4OF - TIM Capture Compare 4 overcapture Flag.
 *
 * @return  none
 */
FlagStatus TIM_GetFlagStatus(TIM_TypeDef *TIMx, uint16_t TIM_FLAG)
{
    75d8:	7179                	addi	sp,sp,-48
    75da:	d622                	sw	s0,44(sp)
    75dc:	1800                	addi	s0,sp,48
    75de:	fca42e23          	sw	a0,-36(s0)
    75e2:	87ae                	mv	a5,a1
    75e4:	fcf41d23          	sh	a5,-38(s0)
    ITStatus bitstatus = RESET;
    75e8:	fe042623          	sw	zero,-20(s0)

    if((TIMx->INTFR & TIM_FLAG) != (uint16_t)RESET)
    75ec:	fdc42783          	lw	a5,-36(s0)
    75f0:	0107d783          	lhu	a5,16(a5)
    75f4:	01079713          	slli	a4,a5,0x10
    75f8:	8341                	srli	a4,a4,0x10
    75fa:	fda45783          	lhu	a5,-38(s0)
    75fe:	8ff9                	and	a5,a5,a4
    7600:	07c2                	slli	a5,a5,0x10
    7602:	83c1                	srli	a5,a5,0x10
    7604:	c789                	beqz	a5,760e <TIM_GetFlagStatus+0x36>
    {
        bitstatus = SET;
    7606:	4785                	li	a5,1
    7608:	fef42623          	sw	a5,-20(s0)
    760c:	a019                	j	7612 <TIM_GetFlagStatus+0x3a>
    }
    else
    {
        bitstatus = RESET;
    760e:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    7612:	fec42783          	lw	a5,-20(s0)
}
    7616:	853e                	mv	a0,a5
    7618:	5432                	lw	s0,44(sp)
    761a:	6145                	addi	sp,sp,48
    761c:	8082                	ret

0000761e <TIM_ClearFlag>:
 *            TIM_FLAG_CC4OF - TIM Capture Compare 4 overcapture Flag.
 *
 * @return  none
 */
void TIM_ClearFlag(TIM_TypeDef *TIMx, uint16_t TIM_FLAG)
{
    761e:	1101                	addi	sp,sp,-32
    7620:	ce22                	sw	s0,28(sp)
    7622:	1000                	addi	s0,sp,32
    7624:	fea42623          	sw	a0,-20(s0)
    7628:	87ae                	mv	a5,a1
    762a:	fef41523          	sh	a5,-22(s0)
    TIMx->INTFR = (uint16_t)~TIM_FLAG;
    762e:	fea45783          	lhu	a5,-22(s0)
    7632:	fff7c793          	not	a5,a5
    7636:	01079713          	slli	a4,a5,0x10
    763a:	8341                	srli	a4,a4,0x10
    763c:	fec42783          	lw	a5,-20(s0)
    7640:	00e79823          	sh	a4,16(a5)
}
    7644:	0001                	nop
    7646:	4472                	lw	s0,28(sp)
    7648:	6105                	addi	sp,sp,32
    764a:	8082                	ret

0000764c <TIM_GetITStatus>:
 *            TIM_IT_Break - TIM Break Interrupt source.
 *
 * @return  none
 */
ITStatus TIM_GetITStatus(TIM_TypeDef *TIMx, uint16_t TIM_IT)
{
    764c:	7179                	addi	sp,sp,-48
    764e:	d622                	sw	s0,44(sp)
    7650:	1800                	addi	s0,sp,48
    7652:	fca42e23          	sw	a0,-36(s0)
    7656:	87ae                	mv	a5,a1
    7658:	fcf41d23          	sh	a5,-38(s0)
    ITStatus bitstatus = RESET;
    765c:	fe042623          	sw	zero,-20(s0)
    uint16_t itstatus = 0x0, itenable = 0x0;
    7660:	fe041523          	sh	zero,-22(s0)
    7664:	fe041423          	sh	zero,-24(s0)

    itstatus = TIMx->INTFR & TIM_IT;
    7668:	fdc42783          	lw	a5,-36(s0)
    766c:	0107d783          	lhu	a5,16(a5)
    7670:	01079713          	slli	a4,a5,0x10
    7674:	8341                	srli	a4,a4,0x10
    7676:	fda45783          	lhu	a5,-38(s0)
    767a:	8ff9                	and	a5,a5,a4
    767c:	fef41523          	sh	a5,-22(s0)

    itenable = TIMx->DMAINTENR & TIM_IT;
    7680:	fdc42783          	lw	a5,-36(s0)
    7684:	00c7d783          	lhu	a5,12(a5)
    7688:	01079713          	slli	a4,a5,0x10
    768c:	8341                	srli	a4,a4,0x10
    768e:	fda45783          	lhu	a5,-38(s0)
    7692:	8ff9                	and	a5,a5,a4
    7694:	fef41423          	sh	a5,-24(s0)
    if((itstatus != (uint16_t)RESET) && (itenable != (uint16_t)RESET))
    7698:	fea45783          	lhu	a5,-22(s0)
    769c:	cb81                	beqz	a5,76ac <TIM_GetITStatus+0x60>
    769e:	fe845783          	lhu	a5,-24(s0)
    76a2:	c789                	beqz	a5,76ac <TIM_GetITStatus+0x60>
    {
        bitstatus = SET;
    76a4:	4785                	li	a5,1
    76a6:	fef42623          	sw	a5,-20(s0)
    76aa:	a019                	j	76b0 <TIM_GetITStatus+0x64>
    }
    else
    {
        bitstatus = RESET;
    76ac:	fe042623          	sw	zero,-20(s0)
    }

    return bitstatus;
    76b0:	fec42783          	lw	a5,-20(s0)
}
    76b4:	853e                	mv	a0,a5
    76b6:	5432                	lw	s0,44(sp)
    76b8:	6145                	addi	sp,sp,48
    76ba:	8082                	ret

000076bc <TIM_ClearITPendingBit>:
 *            TIM_IT_Break - TIM Break Interrupt source.
 *
 * @return  none
 */
void TIM_ClearITPendingBit(TIM_TypeDef *TIMx, uint16_t TIM_IT)
{
    76bc:	1101                	addi	sp,sp,-32
    76be:	ce22                	sw	s0,28(sp)
    76c0:	1000                	addi	s0,sp,32
    76c2:	fea42623          	sw	a0,-20(s0)
    76c6:	87ae                	mv	a5,a1
    76c8:	fef41523          	sh	a5,-22(s0)
    TIMx->INTFR = (uint16_t)~TIM_IT;
    76cc:	fea45783          	lhu	a5,-22(s0)
    76d0:	fff7c793          	not	a5,a5
    76d4:	01079713          	slli	a4,a5,0x10
    76d8:	8341                	srli	a4,a4,0x10
    76da:	fec42783          	lw	a5,-20(s0)
    76de:	00e79823          	sh	a4,16(a5)
}
    76e2:	0001                	nop
    76e4:	4472                	lw	s0,28(sp)
    76e6:	6105                	addi	sp,sp,32
    76e8:	8082                	ret

000076ea <TI1_Config>:
 *
 * @return  none
 */
static void TI1_Config(TIM_TypeDef *TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
    76ea:	7179                	addi	sp,sp,-48
    76ec:	d622                	sw	s0,44(sp)
    76ee:	1800                	addi	s0,sp,48
    76f0:	fca42e23          	sw	a0,-36(s0)
    76f4:	87ae                	mv	a5,a1
    76f6:	8736                	mv	a4,a3
    76f8:	fcf41d23          	sh	a5,-38(s0)
    76fc:	87b2                	mv	a5,a2
    76fe:	fcf41c23          	sh	a5,-40(s0)
    7702:	87ba                	mv	a5,a4
    7704:	fcf41b23          	sh	a5,-42(s0)
    uint16_t tmpccmr1 = 0, tmpccer = 0;
    7708:	fe041623          	sh	zero,-20(s0)
    770c:	fe041723          	sh	zero,-18(s0)

    TIMx->CCER &= (uint16_t) ~((uint16_t)TIM_CC1E);
    7710:	fdc42783          	lw	a5,-36(s0)
    7714:	0207d783          	lhu	a5,32(a5)
    7718:	07c2                	slli	a5,a5,0x10
    771a:	83c1                	srli	a5,a5,0x10
    771c:	9bf9                	andi	a5,a5,-2
    771e:	01079713          	slli	a4,a5,0x10
    7722:	8341                	srli	a4,a4,0x10
    7724:	fdc42783          	lw	a5,-36(s0)
    7728:	02e79023          	sh	a4,32(a5)
    tmpccmr1 = TIMx->CHCTLR1;
    772c:	fdc42783          	lw	a5,-36(s0)
    7730:	0187d783          	lhu	a5,24(a5)
    7734:	fef41623          	sh	a5,-20(s0)
    tmpccer = TIMx->CCER;
    7738:	fdc42783          	lw	a5,-36(s0)
    773c:	0207d783          	lhu	a5,32(a5)
    7740:	fef41723          	sh	a5,-18(s0)
    tmpccmr1 &= (uint16_t)(((uint16_t) ~((uint16_t)TIM_CC1S)) & ((uint16_t) ~((uint16_t)TIM_IC1F)));
    7744:	fec45783          	lhu	a5,-20(s0)
    7748:	f0c7f793          	andi	a5,a5,-244
    774c:	fef41623          	sh	a5,-20(s0)
    tmpccmr1 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
    7750:	fd645783          	lhu	a5,-42(s0)
    7754:	0792                	slli	a5,a5,0x4
    7756:	01079713          	slli	a4,a5,0x10
    775a:	8341                	srli	a4,a4,0x10
    775c:	fd845783          	lhu	a5,-40(s0)
    7760:	8fd9                	or	a5,a5,a4
    7762:	01079713          	slli	a4,a5,0x10
    7766:	8341                	srli	a4,a4,0x10
    7768:	fec45783          	lhu	a5,-20(s0)
    776c:	8fd9                	or	a5,a5,a4
    776e:	fef41623          	sh	a5,-20(s0)

    if((TIMx == TIM1) || (TIMx == TIM2) || (TIMx == TIM3))
    7772:	fdc42703          	lw	a4,-36(s0)
    7776:	400137b7          	lui	a5,0x40013
    777a:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    777e:	02f70063          	beq	a4,a5,779e <TI1_Config+0xb4>
    7782:	fdc42703          	lw	a4,-36(s0)
    7786:	400007b7          	lui	a5,0x40000
    778a:	00f70a63          	beq	a4,a5,779e <TI1_Config+0xb4>
    778e:	fdc42703          	lw	a4,-36(s0)
    7792:	400007b7          	lui	a5,0x40000
    7796:	40078793          	addi	a5,a5,1024 # 40000400 <_eusrstack+0x1fffc400>
    779a:	02f71363          	bne	a4,a5,77c0 <TI1_Config+0xd6>
    {
        tmpccer &= (uint16_t) ~((uint16_t)(TIM_CC1P));
    779e:	fee45783          	lhu	a5,-18(s0)
    77a2:	9bf5                	andi	a5,a5,-3
    77a4:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CC1E);
    77a8:	fda45703          	lhu	a4,-38(s0)
    77ac:	fee45783          	lhu	a5,-18(s0)
    77b0:	8fd9                	or	a5,a5,a4
    77b2:	07c2                	slli	a5,a5,0x10
    77b4:	83c1                	srli	a5,a5,0x10
    77b6:	0017e793          	ori	a5,a5,1
    77ba:	fef41723          	sh	a5,-18(s0)
    77be:	a00d                	j	77e0 <TI1_Config+0xf6>
    }
    else
    {
        tmpccer &= (uint16_t) ~((uint16_t)(TIM_CC1P | TIM_CC1NP));
    77c0:	fee45783          	lhu	a5,-18(s0)
    77c4:	9bd5                	andi	a5,a5,-11
    77c6:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CC1E);
    77ca:	fda45703          	lhu	a4,-38(s0)
    77ce:	fee45783          	lhu	a5,-18(s0)
    77d2:	8fd9                	or	a5,a5,a4
    77d4:	07c2                	slli	a5,a5,0x10
    77d6:	83c1                	srli	a5,a5,0x10
    77d8:	0017e793          	ori	a5,a5,1
    77dc:	fef41723          	sh	a5,-18(s0)
    }

    TIMx->CHCTLR1 = tmpccmr1;
    77e0:	fdc42783          	lw	a5,-36(s0)
    77e4:	fec45703          	lhu	a4,-20(s0)
    77e8:	00e79c23          	sh	a4,24(a5)
    TIMx->CCER = tmpccer;
    77ec:	fdc42783          	lw	a5,-36(s0)
    77f0:	fee45703          	lhu	a4,-18(s0)
    77f4:	02e79023          	sh	a4,32(a5)
}
    77f8:	0001                	nop
    77fa:	5432                	lw	s0,44(sp)
    77fc:	6145                	addi	sp,sp,48
    77fe:	8082                	ret

00007800 <TI2_Config>:
 *
 * @return  none
 */
static void TI2_Config(TIM_TypeDef *TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
    7800:	7179                	addi	sp,sp,-48
    7802:	d622                	sw	s0,44(sp)
    7804:	1800                	addi	s0,sp,48
    7806:	fca42e23          	sw	a0,-36(s0)
    780a:	87ae                	mv	a5,a1
    780c:	8736                	mv	a4,a3
    780e:	fcf41d23          	sh	a5,-38(s0)
    7812:	87b2                	mv	a5,a2
    7814:	fcf41c23          	sh	a5,-40(s0)
    7818:	87ba                	mv	a5,a4
    781a:	fcf41b23          	sh	a5,-42(s0)
    uint16_t tmpccmr1 = 0, tmpccer = 0, tmp = 0;
    781e:	fe041623          	sh	zero,-20(s0)
    7822:	fe041723          	sh	zero,-18(s0)
    7826:	fe041523          	sh	zero,-22(s0)

    TIMx->CCER &= (uint16_t) ~((uint16_t)TIM_CC2E);
    782a:	fdc42783          	lw	a5,-36(s0)
    782e:	0207d783          	lhu	a5,32(a5)
    7832:	07c2                	slli	a5,a5,0x10
    7834:	83c1                	srli	a5,a5,0x10
    7836:	9bbd                	andi	a5,a5,-17
    7838:	01079713          	slli	a4,a5,0x10
    783c:	8341                	srli	a4,a4,0x10
    783e:	fdc42783          	lw	a5,-36(s0)
    7842:	02e79023          	sh	a4,32(a5)
    tmpccmr1 = TIMx->CHCTLR1;
    7846:	fdc42783          	lw	a5,-36(s0)
    784a:	0187d783          	lhu	a5,24(a5)
    784e:	fef41623          	sh	a5,-20(s0)
    tmpccer = TIMx->CCER;
    7852:	fdc42783          	lw	a5,-36(s0)
    7856:	0207d783          	lhu	a5,32(a5)
    785a:	fef41723          	sh	a5,-18(s0)
    tmp = (uint16_t)(TIM_ICPolarity << 4);
    785e:	fda45783          	lhu	a5,-38(s0)
    7862:	0792                	slli	a5,a5,0x4
    7864:	fef41523          	sh	a5,-22(s0)
    tmpccmr1 &= (uint16_t)(((uint16_t) ~((uint16_t)TIM_CC2S)) & ((uint16_t) ~((uint16_t)TIM_IC2F)));
    7868:	fec45703          	lhu	a4,-20(s0)
    786c:	6785                	lui	a5,0x1
    786e:	cff78793          	addi	a5,a5,-769 # cff <ADC_InjectedChannelConfig+0x13b>
    7872:	8ff9                	and	a5,a5,a4
    7874:	fef41623          	sh	a5,-20(s0)
    tmpccmr1 |= (uint16_t)(TIM_ICFilter << 12);
    7878:	fd645783          	lhu	a5,-42(s0)
    787c:	07b2                	slli	a5,a5,0xc
    787e:	01079713          	slli	a4,a5,0x10
    7882:	8341                	srli	a4,a4,0x10
    7884:	fec45783          	lhu	a5,-20(s0)
    7888:	8fd9                	or	a5,a5,a4
    788a:	fef41623          	sh	a5,-20(s0)
    tmpccmr1 |= (uint16_t)(TIM_ICSelection << 8);
    788e:	fd845783          	lhu	a5,-40(s0)
    7892:	07a2                	slli	a5,a5,0x8
    7894:	01079713          	slli	a4,a5,0x10
    7898:	8341                	srli	a4,a4,0x10
    789a:	fec45783          	lhu	a5,-20(s0)
    789e:	8fd9                	or	a5,a5,a4
    78a0:	fef41623          	sh	a5,-20(s0)

    if((TIMx == TIM1) || (TIMx == TIM2) || (TIMx == TIM3))
    78a4:	fdc42703          	lw	a4,-36(s0)
    78a8:	400137b7          	lui	a5,0x40013
    78ac:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    78b0:	02f70063          	beq	a4,a5,78d0 <TI2_Config+0xd0>
    78b4:	fdc42703          	lw	a4,-36(s0)
    78b8:	400007b7          	lui	a5,0x40000
    78bc:	00f70a63          	beq	a4,a5,78d0 <TI2_Config+0xd0>
    78c0:	fdc42703          	lw	a4,-36(s0)
    78c4:	400007b7          	lui	a5,0x40000
    78c8:	40078793          	addi	a5,a5,1024 # 40000400 <_eusrstack+0x1fffc400>
    78cc:	02f71463          	bne	a4,a5,78f4 <TI2_Config+0xf4>
    {
        tmpccer &= (uint16_t) ~((uint16_t)(TIM_CC2P));
    78d0:	fee45783          	lhu	a5,-18(s0)
    78d4:	fdf7f793          	andi	a5,a5,-33
    78d8:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CC2E);
    78dc:	fea45703          	lhu	a4,-22(s0)
    78e0:	fee45783          	lhu	a5,-18(s0)
    78e4:	8fd9                	or	a5,a5,a4
    78e6:	07c2                	slli	a5,a5,0x10
    78e8:	83c1                	srli	a5,a5,0x10
    78ea:	0107e793          	ori	a5,a5,16
    78ee:	fef41723          	sh	a5,-18(s0)
    78f2:	a015                	j	7916 <TI2_Config+0x116>
    }
    else
    {
        tmpccer &= (uint16_t) ~((uint16_t)(TIM_CC2P | TIM_CC2NP));
    78f4:	fee45783          	lhu	a5,-18(s0)
    78f8:	f5f7f793          	andi	a5,a5,-161
    78fc:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CC2E);
    7900:	fda45703          	lhu	a4,-38(s0)
    7904:	fee45783          	lhu	a5,-18(s0)
    7908:	8fd9                	or	a5,a5,a4
    790a:	07c2                	slli	a5,a5,0x10
    790c:	83c1                	srli	a5,a5,0x10
    790e:	0107e793          	ori	a5,a5,16
    7912:	fef41723          	sh	a5,-18(s0)
    }

    TIMx->CHCTLR1 = tmpccmr1;
    7916:	fdc42783          	lw	a5,-36(s0)
    791a:	fec45703          	lhu	a4,-20(s0)
    791e:	00e79c23          	sh	a4,24(a5)
    TIMx->CCER = tmpccer;
    7922:	fdc42783          	lw	a5,-36(s0)
    7926:	fee45703          	lhu	a4,-18(s0)
    792a:	02e79023          	sh	a4,32(a5)
}
    792e:	0001                	nop
    7930:	5432                	lw	s0,44(sp)
    7932:	6145                	addi	sp,sp,48
    7934:	8082                	ret

00007936 <TI3_Config>:
 *
 * @return  none
 */
static void TI3_Config(TIM_TypeDef *TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
    7936:	7179                	addi	sp,sp,-48
    7938:	d622                	sw	s0,44(sp)
    793a:	1800                	addi	s0,sp,48
    793c:	fca42e23          	sw	a0,-36(s0)
    7940:	87ae                	mv	a5,a1
    7942:	8736                	mv	a4,a3
    7944:	fcf41d23          	sh	a5,-38(s0)
    7948:	87b2                	mv	a5,a2
    794a:	fcf41c23          	sh	a5,-40(s0)
    794e:	87ba                	mv	a5,a4
    7950:	fcf41b23          	sh	a5,-42(s0)
    uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
    7954:	fe041623          	sh	zero,-20(s0)
    7958:	fe041723          	sh	zero,-18(s0)
    795c:	fe041523          	sh	zero,-22(s0)

    TIMx->CCER &= (uint16_t) ~((uint16_t)TIM_CC3E);
    7960:	fdc42783          	lw	a5,-36(s0)
    7964:	0207d783          	lhu	a5,32(a5)
    7968:	07c2                	slli	a5,a5,0x10
    796a:	83c1                	srli	a5,a5,0x10
    796c:	eff7f793          	andi	a5,a5,-257
    7970:	01079713          	slli	a4,a5,0x10
    7974:	8341                	srli	a4,a4,0x10
    7976:	fdc42783          	lw	a5,-36(s0)
    797a:	02e79023          	sh	a4,32(a5)
    tmpccmr2 = TIMx->CHCTLR2;
    797e:	fdc42783          	lw	a5,-36(s0)
    7982:	01c7d783          	lhu	a5,28(a5)
    7986:	fef41623          	sh	a5,-20(s0)
    tmpccer = TIMx->CCER;
    798a:	fdc42783          	lw	a5,-36(s0)
    798e:	0207d783          	lhu	a5,32(a5)
    7992:	fef41723          	sh	a5,-18(s0)
    tmp = (uint16_t)(TIM_ICPolarity << 8);
    7996:	fda45783          	lhu	a5,-38(s0)
    799a:	07a2                	slli	a5,a5,0x8
    799c:	fef41523          	sh	a5,-22(s0)
    tmpccmr2 &= (uint16_t)(((uint16_t) ~((uint16_t)TIM_CC3S)) & ((uint16_t) ~((uint16_t)TIM_IC3F)));
    79a0:	fec45783          	lhu	a5,-20(s0)
    79a4:	f0c7f793          	andi	a5,a5,-244
    79a8:	fef41623          	sh	a5,-20(s0)
    tmpccmr2 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
    79ac:	fd645783          	lhu	a5,-42(s0)
    79b0:	0792                	slli	a5,a5,0x4
    79b2:	01079713          	slli	a4,a5,0x10
    79b6:	8341                	srli	a4,a4,0x10
    79b8:	fd845783          	lhu	a5,-40(s0)
    79bc:	8fd9                	or	a5,a5,a4
    79be:	01079713          	slli	a4,a5,0x10
    79c2:	8341                	srli	a4,a4,0x10
    79c4:	fec45783          	lhu	a5,-20(s0)
    79c8:	8fd9                	or	a5,a5,a4
    79ca:	fef41623          	sh	a5,-20(s0)

    if((TIMx == TIM1) || (TIMx == TIM2) || (TIMx == TIM3))
    79ce:	fdc42703          	lw	a4,-36(s0)
    79d2:	400137b7          	lui	a5,0x40013
    79d6:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    79da:	02f70063          	beq	a4,a5,79fa <TI3_Config+0xc4>
    79de:	fdc42703          	lw	a4,-36(s0)
    79e2:	400007b7          	lui	a5,0x40000
    79e6:	00f70a63          	beq	a4,a5,79fa <TI3_Config+0xc4>
    79ea:	fdc42703          	lw	a4,-36(s0)
    79ee:	400007b7          	lui	a5,0x40000
    79f2:	40078793          	addi	a5,a5,1024 # 40000400 <_eusrstack+0x1fffc400>
    79f6:	02f71463          	bne	a4,a5,7a1e <TI3_Config+0xe8>
    {
        tmpccer &= (uint16_t) ~((uint16_t)(TIM_CC3P));
    79fa:	fee45783          	lhu	a5,-18(s0)
    79fe:	dff7f793          	andi	a5,a5,-513
    7a02:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CC3E);
    7a06:	fea45703          	lhu	a4,-22(s0)
    7a0a:	fee45783          	lhu	a5,-18(s0)
    7a0e:	8fd9                	or	a5,a5,a4
    7a10:	07c2                	slli	a5,a5,0x10
    7a12:	83c1                	srli	a5,a5,0x10
    7a14:	1007e793          	ori	a5,a5,256
    7a18:	fef41723          	sh	a5,-18(s0)
    7a1c:	a025                	j	7a44 <TI3_Config+0x10e>
    }
    else
    {
        tmpccer &= (uint16_t) ~((uint16_t)(TIM_CC3P | TIM_CC3NP));
    7a1e:	fee45703          	lhu	a4,-18(s0)
    7a22:	77fd                	lui	a5,0xfffff
    7a24:	5ff78793          	addi	a5,a5,1535 # fffff5ff <_eusrstack+0xdfffb5ff>
    7a28:	8ff9                	and	a5,a5,a4
    7a2a:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CC3E);
    7a2e:	fda45703          	lhu	a4,-38(s0)
    7a32:	fee45783          	lhu	a5,-18(s0)
    7a36:	8fd9                	or	a5,a5,a4
    7a38:	07c2                	slli	a5,a5,0x10
    7a3a:	83c1                	srli	a5,a5,0x10
    7a3c:	1007e793          	ori	a5,a5,256
    7a40:	fef41723          	sh	a5,-18(s0)
    }

    TIMx->CHCTLR2 = tmpccmr2;
    7a44:	fdc42783          	lw	a5,-36(s0)
    7a48:	fec45703          	lhu	a4,-20(s0)
    7a4c:	00e79e23          	sh	a4,28(a5)
    TIMx->CCER = tmpccer;
    7a50:	fdc42783          	lw	a5,-36(s0)
    7a54:	fee45703          	lhu	a4,-18(s0)
    7a58:	02e79023          	sh	a4,32(a5)
}
    7a5c:	0001                	nop
    7a5e:	5432                	lw	s0,44(sp)
    7a60:	6145                	addi	sp,sp,48
    7a62:	8082                	ret

00007a64 <TI4_Config>:
 *
 * @return  none
 */
static void TI4_Config(TIM_TypeDef *TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
    7a64:	7179                	addi	sp,sp,-48
    7a66:	d622                	sw	s0,44(sp)
    7a68:	1800                	addi	s0,sp,48
    7a6a:	fca42e23          	sw	a0,-36(s0)
    7a6e:	87ae                	mv	a5,a1
    7a70:	8736                	mv	a4,a3
    7a72:	fcf41d23          	sh	a5,-38(s0)
    7a76:	87b2                	mv	a5,a2
    7a78:	fcf41c23          	sh	a5,-40(s0)
    7a7c:	87ba                	mv	a5,a4
    7a7e:	fcf41b23          	sh	a5,-42(s0)
    uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
    7a82:	fe041623          	sh	zero,-20(s0)
    7a86:	fe041723          	sh	zero,-18(s0)
    7a8a:	fe041523          	sh	zero,-22(s0)

    TIMx->CCER &= (uint16_t) ~((uint16_t)TIM_CC4E);
    7a8e:	fdc42783          	lw	a5,-36(s0)
    7a92:	0207d783          	lhu	a5,32(a5)
    7a96:	01079713          	slli	a4,a5,0x10
    7a9a:	8341                	srli	a4,a4,0x10
    7a9c:	77fd                	lui	a5,0xfffff
    7a9e:	17fd                	addi	a5,a5,-1
    7aa0:	8ff9                	and	a5,a5,a4
    7aa2:	01079713          	slli	a4,a5,0x10
    7aa6:	8341                	srli	a4,a4,0x10
    7aa8:	fdc42783          	lw	a5,-36(s0)
    7aac:	02e79023          	sh	a4,32(a5) # fffff020 <_eusrstack+0xdfffb020>
    tmpccmr2 = TIMx->CHCTLR2;
    7ab0:	fdc42783          	lw	a5,-36(s0)
    7ab4:	01c7d783          	lhu	a5,28(a5)
    7ab8:	fef41623          	sh	a5,-20(s0)
    tmpccer = TIMx->CCER;
    7abc:	fdc42783          	lw	a5,-36(s0)
    7ac0:	0207d783          	lhu	a5,32(a5)
    7ac4:	fef41723          	sh	a5,-18(s0)
    tmp = (uint16_t)(TIM_ICPolarity << 12);
    7ac8:	fda45783          	lhu	a5,-38(s0)
    7acc:	07b2                	slli	a5,a5,0xc
    7ace:	fef41523          	sh	a5,-22(s0)
    tmpccmr2 &= (uint16_t)((uint16_t)(~(uint16_t)TIM_CC4S) & ((uint16_t) ~((uint16_t)TIM_IC4F)));
    7ad2:	fec45703          	lhu	a4,-20(s0)
    7ad6:	6785                	lui	a5,0x1
    7ad8:	cff78793          	addi	a5,a5,-769 # cff <ADC_InjectedChannelConfig+0x13b>
    7adc:	8ff9                	and	a5,a5,a4
    7ade:	fef41623          	sh	a5,-20(s0)
    tmpccmr2 |= (uint16_t)(TIM_ICSelection << 8);
    7ae2:	fd845783          	lhu	a5,-40(s0)
    7ae6:	07a2                	slli	a5,a5,0x8
    7ae8:	01079713          	slli	a4,a5,0x10
    7aec:	8341                	srli	a4,a4,0x10
    7aee:	fec45783          	lhu	a5,-20(s0)
    7af2:	8fd9                	or	a5,a5,a4
    7af4:	fef41623          	sh	a5,-20(s0)
    tmpccmr2 |= (uint16_t)(TIM_ICFilter << 12);
    7af8:	fd645783          	lhu	a5,-42(s0)
    7afc:	07b2                	slli	a5,a5,0xc
    7afe:	01079713          	slli	a4,a5,0x10
    7b02:	8341                	srli	a4,a4,0x10
    7b04:	fec45783          	lhu	a5,-20(s0)
    7b08:	8fd9                	or	a5,a5,a4
    7b0a:	fef41623          	sh	a5,-20(s0)

    if((TIMx == TIM1) || (TIMx == TIM2) || (TIMx == TIM3))
    7b0e:	fdc42703          	lw	a4,-36(s0)
    7b12:	400137b7          	lui	a5,0x40013
    7b16:	c0078793          	addi	a5,a5,-1024 # 40012c00 <_eusrstack+0x2000ec00>
    7b1a:	02f70063          	beq	a4,a5,7b3a <TI4_Config+0xd6>
    7b1e:	fdc42703          	lw	a4,-36(s0)
    7b22:	400007b7          	lui	a5,0x40000
    7b26:	00f70a63          	beq	a4,a5,7b3a <TI4_Config+0xd6>
    7b2a:	fdc42703          	lw	a4,-36(s0)
    7b2e:	400007b7          	lui	a5,0x40000
    7b32:	40078793          	addi	a5,a5,1024 # 40000400 <_eusrstack+0x1fffc400>
    7b36:	02f71663          	bne	a4,a5,7b62 <TI4_Config+0xfe>
    {
        tmpccer &= (uint16_t) ~((uint16_t)(TIM_CC4P));
    7b3a:	fee45703          	lhu	a4,-18(s0)
    7b3e:	77f9                	lui	a5,0xffffe
    7b40:	17fd                	addi	a5,a5,-1
    7b42:	8ff9                	and	a5,a5,a4
    7b44:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CC4E);
    7b48:	fea45703          	lhu	a4,-22(s0)
    7b4c:	fee45783          	lhu	a5,-18(s0)
    7b50:	8fd9                	or	a5,a5,a4
    7b52:	01079713          	slli	a4,a5,0x10
    7b56:	8341                	srli	a4,a4,0x10
    7b58:	6785                	lui	a5,0x1
    7b5a:	8fd9                	or	a5,a5,a4
    7b5c:	fef41723          	sh	a5,-18(s0)
    7b60:	a01d                	j	7b86 <TI4_Config+0x122>
    }
    else
    {
        tmpccer &= (uint16_t) ~((uint16_t)TIM_CC3P);
    7b62:	fee45783          	lhu	a5,-18(s0)
    7b66:	dff7f793          	andi	a5,a5,-513
    7b6a:	fef41723          	sh	a5,-18(s0)
        tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CC4E);
    7b6e:	fda45703          	lhu	a4,-38(s0)
    7b72:	fee45783          	lhu	a5,-18(s0)
    7b76:	8fd9                	or	a5,a5,a4
    7b78:	01079713          	slli	a4,a5,0x10
    7b7c:	8341                	srli	a4,a4,0x10
    7b7e:	6785                	lui	a5,0x1
    7b80:	8fd9                	or	a5,a5,a4
    7b82:	fef41723          	sh	a5,-18(s0)
    }

    TIMx->CHCTLR2 = tmpccmr2;
    7b86:	fdc42783          	lw	a5,-36(s0)
    7b8a:	fec45703          	lhu	a4,-20(s0)
    7b8e:	00e79e23          	sh	a4,28(a5) # 101c <ADC_ClearFlag+0x14>
    TIMx->CCER = tmpccer;
    7b92:	fdc42783          	lw	a5,-36(s0)
    7b96:	fee45703          	lhu	a4,-18(s0)
    7b9a:	02e79023          	sh	a4,32(a5)
}
    7b9e:	0001                	nop
    7ba0:	5432                	lw	s0,44(sp)
    7ba2:	6145                	addi	sp,sp,48
    7ba4:	8082                	ret

00007ba6 <TIM_CaptureModeCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_CaptureModeCmd(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    7ba6:	1101                	addi	sp,sp,-32
    7ba8:	ce22                	sw	s0,28(sp)
    7baa:	1000                	addi	s0,sp,32
    7bac:	fea42623          	sw	a0,-20(s0)
    7bb0:	feb42423          	sw	a1,-24(s0)
    if(NewState)
    7bb4:	fe842783          	lw	a5,-24(s0)
    7bb8:	c395                	beqz	a5,7bdc <TIM_CaptureModeCmd+0x36>
    {
        TIMx->CTLR1 |= (1<<14);
    7bba:	fec42783          	lw	a5,-20(s0)
    7bbe:	0007d783          	lhu	a5,0(a5)
    7bc2:	01079713          	slli	a4,a5,0x10
    7bc6:	8341                	srli	a4,a4,0x10
    7bc8:	6791                	lui	a5,0x4
    7bca:	8fd9                	or	a5,a5,a4
    7bcc:	01079713          	slli	a4,a5,0x10
    7bd0:	8341                	srli	a4,a4,0x10
    7bd2:	fec42783          	lw	a5,-20(s0)
    7bd6:	00e79023          	sh	a4,0(a5) # 4000 <NVIC_Init+0x2b0>
    }
    else{
        TIMx->CTLR1 &= ~(1<<14);
    }
}
    7bda:	a015                	j	7bfe <TIM_CaptureModeCmd+0x58>
        TIMx->CTLR1 &= ~(1<<14);
    7bdc:	fec42783          	lw	a5,-20(s0)
    7be0:	0007d783          	lhu	a5,0(a5)
    7be4:	01079713          	slli	a4,a5,0x10
    7be8:	8341                	srli	a4,a4,0x10
    7bea:	77f1                	lui	a5,0xffffc
    7bec:	17fd                	addi	a5,a5,-1
    7bee:	8ff9                	and	a5,a5,a4
    7bf0:	01079713          	slli	a4,a5,0x10
    7bf4:	8341                	srli	a4,a4,0x10
    7bf6:	fec42783          	lw	a5,-20(s0)
    7bfa:	00e79023          	sh	a4,0(a5) # ffffc000 <_eusrstack+0xdfff8000>
}
    7bfe:	0001                	nop
    7c00:	4472                	lw	s0,28(sp)
    7c02:	6105                	addi	sp,sp,32
    7c04:	8082                	ret

00007c06 <TIM_IndicateCaptureLevelCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void TIM_IndicateCaptureLevelCmd(TIM_TypeDef *TIMx, FunctionalState NewState)
{
    7c06:	1101                	addi	sp,sp,-32
    7c08:	ce22                	sw	s0,28(sp)
    7c0a:	1000                	addi	s0,sp,32
    7c0c:	fea42623          	sw	a0,-20(s0)
    7c10:	feb42423          	sw	a1,-24(s0)
    if(NewState)
    7c14:	fe842783          	lw	a5,-24(s0)
    7c18:	c395                	beqz	a5,7c3c <TIM_IndicateCaptureLevelCmd+0x36>
    {
        TIMx->CTLR1 |= (1<<15);
    7c1a:	fec42783          	lw	a5,-20(s0)
    7c1e:	0007d783          	lhu	a5,0(a5)
    7c22:	01079713          	slli	a4,a5,0x10
    7c26:	8341                	srli	a4,a4,0x10
    7c28:	77e1                	lui	a5,0xffff8
    7c2a:	8fd9                	or	a5,a5,a4
    7c2c:	01079713          	slli	a4,a5,0x10
    7c30:	8341                	srli	a4,a4,0x10
    7c32:	fec42783          	lw	a5,-20(s0)
    7c36:	00e79023          	sh	a4,0(a5) # ffff8000 <_eusrstack+0xdfff4000>
    }
    else{
        TIMx->CTLR1 &= ~(1<<15);
    }
}
    7c3a:	a015                	j	7c5e <TIM_IndicateCaptureLevelCmd+0x58>
        TIMx->CTLR1 &= ~(1<<15);
    7c3c:	fec42783          	lw	a5,-20(s0)
    7c40:	0007d783          	lhu	a5,0(a5)
    7c44:	01079713          	slli	a4,a5,0x10
    7c48:	8341                	srli	a4,a4,0x10
    7c4a:	67a1                	lui	a5,0x8
    7c4c:	17fd                	addi	a5,a5,-1
    7c4e:	8ff9                	and	a5,a5,a4
    7c50:	01079713          	slli	a4,a5,0x10
    7c54:	8341                	srli	a4,a4,0x10
    7c56:	fec42783          	lw	a5,-20(s0)
    7c5a:	00e79023          	sh	a4,0(a5) # 8000 <USART_StructInit+0x1a>
}
    7c5e:	0001                	nop
    7c60:	4472                	lw	s0,28(sp)
    7c62:	6105                	addi	sp,sp,32
    7c64:	8082                	ret

00007c66 <TIM_OC12_SupersedeModeCmd>:
 *
 * @return  none
 */
void TIM_OC12_SupersedeModeCmd(TIM_TypeDef *TIMx, uint16_t TIM_Supersede_Mode_OC1, uint16_t TIM_Supersede_Mode_OC2,
                              FunctionalState NewState)
{
    7c66:	7179                	addi	sp,sp,-48
    7c68:	d622                	sw	s0,44(sp)
    7c6a:	1800                	addi	s0,sp,48
    7c6c:	fca42e23          	sw	a0,-36(s0)
    7c70:	87ae                	mv	a5,a1
    7c72:	8732                	mv	a4,a2
    7c74:	fcd42a23          	sw	a3,-44(s0)
    7c78:	fcf41d23          	sh	a5,-38(s0)
    7c7c:	87ba                	mv	a5,a4
    7c7e:	fcf41c23          	sh	a5,-40(s0)
    uint32_t tmpreg = 0;
    7c82:	fe042623          	sw	zero,-20(s0)

    tmpreg = TIMx->SPEC;
    7c86:	fdc42783          	lw	a5,-36(s0)
    7c8a:	0507d783          	lhu	a5,80(a5)
    7c8e:	07c2                	slli	a5,a5,0x10
    7c90:	83c1                	srli	a5,a5,0x10
    7c92:	fef42623          	sw	a5,-20(s0)

    tmpreg &= SPEC_OC12_Mask;
    7c96:	fec42703          	lw	a4,-20(s0)
    7c9a:	67c1                	lui	a5,0x10
    7c9c:	fce78793          	addi	a5,a5,-50 # ffce <_data_lma+0x3d1a>
    7ca0:	8ff9                	and	a5,a5,a4
    7ca2:	fef42623          	sw	a5,-20(s0)
    tmpreg |= TIM_Supersede_Mode_OC1 | TIM_Supersede_Mode_OC2;
    7ca6:	fda45703          	lhu	a4,-38(s0)
    7caa:	fd845783          	lhu	a5,-40(s0)
    7cae:	8fd9                	or	a5,a5,a4
    7cb0:	07c2                	slli	a5,a5,0x10
    7cb2:	83c1                	srli	a5,a5,0x10
    7cb4:	873e                	mv	a4,a5
    7cb6:	fec42783          	lw	a5,-20(s0)
    7cba:	8fd9                	or	a5,a5,a4
    7cbc:	fef42623          	sw	a5,-20(s0)


    if(NewState)
    7cc0:	fd442783          	lw	a5,-44(s0)
    7cc4:	c799                	beqz	a5,7cd2 <TIM_OC12_SupersedeModeCmd+0x6c>
    {
        tmpreg |= (1<<0);
    7cc6:	fec42783          	lw	a5,-20(s0)
    7cca:	0017e793          	ori	a5,a5,1
    7cce:	fef42623          	sw	a5,-20(s0)
    }

    TIMx->SPEC = tmpreg;
    7cd2:	fec42783          	lw	a5,-20(s0)
    7cd6:	01079713          	slli	a4,a5,0x10
    7cda:	8341                	srli	a4,a4,0x10
    7cdc:	fdc42783          	lw	a5,-36(s0)
    7ce0:	04e79823          	sh	a4,80(a5)
}
    7ce4:	0001                	nop
    7ce6:	5432                	lw	s0,44(sp)
    7ce8:	6145                	addi	sp,sp,48
    7cea:	8082                	ret

00007cec <TIM_OC34_SupersedeModeCmd>:
 *
 * @return  none
 */
void TIM_OC34_SupersedeModeCmd(TIM_TypeDef *TIMx, uint16_t TIM_Supersede_Mode_OC3, uint16_t TIM_Supersede_Mode_OC4,
                              FunctionalState NewState)
{
    7cec:	7179                	addi	sp,sp,-48
    7cee:	d622                	sw	s0,44(sp)
    7cf0:	1800                	addi	s0,sp,48
    7cf2:	fca42e23          	sw	a0,-36(s0)
    7cf6:	87ae                	mv	a5,a1
    7cf8:	8732                	mv	a4,a2
    7cfa:	fcd42a23          	sw	a3,-44(s0)
    7cfe:	fcf41d23          	sh	a5,-38(s0)
    7d02:	87ba                	mv	a5,a4
    7d04:	fcf41c23          	sh	a5,-40(s0)
    uint32_t tmpreg = 0;
    7d08:	fe042623          	sw	zero,-20(s0)

    tmpreg = TIMx->SPEC;
    7d0c:	fdc42783          	lw	a5,-36(s0)
    7d10:	0507d783          	lhu	a5,80(a5)
    7d14:	07c2                	slli	a5,a5,0x10
    7d16:	83c1                	srli	a5,a5,0x10
    7d18:	fef42623          	sw	a5,-20(s0)

    tmpreg &= SPEC_OC34_Mask;
    7d1c:	fec42703          	lw	a4,-20(s0)
    7d20:	67c1                	lui	a5,0x10
    7d22:	f3d78793          	addi	a5,a5,-195 # ff3d <_data_lma+0x3c89>
    7d26:	8ff9                	and	a5,a5,a4
    7d28:	fef42623          	sw	a5,-20(s0)
    tmpreg |= TIM_Supersede_Mode_OC3 | TIM_Supersede_Mode_OC4;
    7d2c:	fda45703          	lhu	a4,-38(s0)
    7d30:	fd845783          	lhu	a5,-40(s0)
    7d34:	8fd9                	or	a5,a5,a4
    7d36:	07c2                	slli	a5,a5,0x10
    7d38:	83c1                	srli	a5,a5,0x10
    7d3a:	873e                	mv	a4,a5
    7d3c:	fec42783          	lw	a5,-20(s0)
    7d40:	8fd9                	or	a5,a5,a4
    7d42:	fef42623          	sw	a5,-20(s0)


    if(NewState)
    7d46:	fd442783          	lw	a5,-44(s0)
    7d4a:	c799                	beqz	a5,7d58 <TIM_OC34_SupersedeModeCmd+0x6c>
    {
        tmpreg |= (1<<1);
    7d4c:	fec42783          	lw	a5,-20(s0)
    7d50:	0027e793          	ori	a5,a5,2
    7d54:	fef42623          	sw	a5,-20(s0)
    }

    TIMx->SPEC = tmpreg;
    7d58:	fec42783          	lw	a5,-20(s0)
    7d5c:	01079713          	slli	a4,a5,0x10
    7d60:	8341                	srli	a4,a4,0x10
    7d62:	fdc42783          	lw	a5,-36(s0)
    7d66:	04e79823          	sh	a4,80(a5)
}
    7d6a:	0001                	nop
    7d6c:	5432                	lw	s0,44(sp)
    7d6e:	6145                	addi	sp,sp,48
    7d70:	8082                	ret

00007d72 <USART_DeInit>:
 * @param   USARTx - where x can be 1, 2 , 3 or 4 to select the UART peripheral.
 *
 * @return  none
 */
void USART_DeInit(USART_TypeDef *USARTx)
{
    7d72:	1101                	addi	sp,sp,-32
    7d74:	ce06                	sw	ra,28(sp)
    7d76:	cc22                	sw	s0,24(sp)
    7d78:	1000                	addi	s0,sp,32
    7d7a:	fea42623          	sw	a0,-20(s0)
    if(USARTx == USART1)
    7d7e:	fec42703          	lw	a4,-20(s0)
    7d82:	400147b7          	lui	a5,0x40014
    7d86:	80078793          	addi	a5,a5,-2048 # 40013800 <_eusrstack+0x2000f800>
    7d8a:	00f71b63          	bne	a4,a5,7da0 <USART_DeInit+0x2e>
    {
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, ENABLE);
    7d8e:	4585                	li	a1,1
    7d90:	6511                	lui	a0,0x4
    7d92:	df9fc0ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
        RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, DISABLE);
    7d96:	4581                	li	a1,0
    7d98:	6511                	lui	a0,0x4
    7d9a:	df1fc0ef          	jal	ra,4b8a <RCC_APB2PeriphResetCmd>
    else if(USARTx == USART4)
    {
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART4, ENABLE);
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART4, DISABLE);
    }
}
    7d9e:	a88d                	j	7e10 <USART_DeInit+0x9e>
    else if(USARTx == USART2)
    7da0:	fec42703          	lw	a4,-20(s0)
    7da4:	400047b7          	lui	a5,0x40004
    7da8:	40078793          	addi	a5,a5,1024 # 40004400 <_eusrstack+0x20000400>
    7dac:	00f71d63          	bne	a4,a5,7dc6 <USART_DeInit+0x54>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, ENABLE);
    7db0:	4585                	li	a1,1
    7db2:	00020537          	lui	a0,0x20
    7db6:	e1bfc0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, DISABLE);
    7dba:	4581                	li	a1,0
    7dbc:	00020537          	lui	a0,0x20
    7dc0:	e11fc0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
}
    7dc4:	a0b1                	j	7e10 <USART_DeInit+0x9e>
    else if(USARTx == USART3)
    7dc6:	fec42703          	lw	a4,-20(s0)
    7dca:	400057b7          	lui	a5,0x40005
    7dce:	80078793          	addi	a5,a5,-2048 # 40004800 <_eusrstack+0x20000800>
    7dd2:	00f71d63          	bne	a4,a5,7dec <USART_DeInit+0x7a>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, ENABLE);
    7dd6:	4585                	li	a1,1
    7dd8:	00040537          	lui	a0,0x40
    7ddc:	df5fc0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, DISABLE);
    7de0:	4581                	li	a1,0
    7de2:	00040537          	lui	a0,0x40
    7de6:	debfc0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
}
    7dea:	a01d                	j	7e10 <USART_DeInit+0x9e>
    else if(USARTx == USART4)
    7dec:	fec42703          	lw	a4,-20(s0)
    7df0:	400057b7          	lui	a5,0x40005
    7df4:	c0078793          	addi	a5,a5,-1024 # 40004c00 <_eusrstack+0x20000c00>
    7df8:	00f71c63          	bne	a4,a5,7e10 <USART_DeInit+0x9e>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART4, ENABLE);
    7dfc:	4585                	li	a1,1
    7dfe:	00080537          	lui	a0,0x80
    7e02:	dcffc0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART4, DISABLE);
    7e06:	4581                	li	a1,0
    7e08:	00080537          	lui	a0,0x80
    7e0c:	dc5fc0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
}
    7e10:	0001                	nop
    7e12:	40f2                	lw	ra,28(sp)
    7e14:	4462                	lw	s0,24(sp)
    7e16:	6105                	addi	sp,sp,32
    7e18:	8082                	ret

00007e1a <USART_Init>:
 *        USART peripheral.
 *
 * @return  none
 */
void USART_Init(USART_TypeDef *USARTx, USART_InitTypeDef *USART_InitStruct)
{
    7e1a:	715d                	addi	sp,sp,-80
    7e1c:	c686                	sw	ra,76(sp)
    7e1e:	c4a2                	sw	s0,72(sp)
    7e20:	0880                	addi	s0,sp,80
    7e22:	faa42e23          	sw	a0,-68(s0)
    7e26:	fab42c23          	sw	a1,-72(s0)
    uint32_t          tmpreg = 0x00, apbclock = 0x00;
    7e2a:	fe042423          	sw	zero,-24(s0)
    7e2e:	fe042623          	sw	zero,-20(s0)
    uint32_t          integerdivider = 0x00;
    7e32:	fe042223          	sw	zero,-28(s0)
    uint32_t          fractionaldivider = 0x00;
    7e36:	fe042023          	sw	zero,-32(s0)
    uint32_t          usartxbase = 0;
    7e3a:	fc042e23          	sw	zero,-36(s0)

    if(USART_InitStruct->USART_HardwareFlowControl != USART_HardwareFlowControl_None)
    {
    }

    usartxbase = (uint32_t)USARTx;
    7e3e:	fbc42783          	lw	a5,-68(s0)
    7e42:	fcf42e23          	sw	a5,-36(s0)
    tmpreg = USARTx->CTLR2;
    7e46:	fbc42783          	lw	a5,-68(s0)
    7e4a:	0107d783          	lhu	a5,16(a5)
    7e4e:	07c2                	slli	a5,a5,0x10
    7e50:	83c1                	srli	a5,a5,0x10
    7e52:	fef42423          	sw	a5,-24(s0)
    tmpreg &= CTLR2_STOP_CLEAR_Mask;
    7e56:	fe842703          	lw	a4,-24(s0)
    7e5a:	67b5                	lui	a5,0xd
    7e5c:	17fd                	addi	a5,a5,-1
    7e5e:	8ff9                	and	a5,a5,a4
    7e60:	fef42423          	sw	a5,-24(s0)
    tmpreg |= (uint32_t)USART_InitStruct->USART_StopBits;
    7e64:	fb842783          	lw	a5,-72(s0)
    7e68:	0067d783          	lhu	a5,6(a5) # d006 <_data_lma+0xd52>
    7e6c:	873e                	mv	a4,a5
    7e6e:	fe842783          	lw	a5,-24(s0)
    7e72:	8fd9                	or	a5,a5,a4
    7e74:	fef42423          	sw	a5,-24(s0)

    USARTx->CTLR2 = (uint16_t)tmpreg;
    7e78:	fe842783          	lw	a5,-24(s0)
    7e7c:	01079713          	slli	a4,a5,0x10
    7e80:	8341                	srli	a4,a4,0x10
    7e82:	fbc42783          	lw	a5,-68(s0)
    7e86:	00e79823          	sh	a4,16(a5)
    tmpreg = USARTx->CTLR1;
    7e8a:	fbc42783          	lw	a5,-68(s0)
    7e8e:	00c7d783          	lhu	a5,12(a5)
    7e92:	07c2                	slli	a5,a5,0x10
    7e94:	83c1                	srli	a5,a5,0x10
    7e96:	fef42423          	sw	a5,-24(s0)
    tmpreg &= CTLR1_CLEAR_Mask;
    7e9a:	fe842703          	lw	a4,-24(s0)
    7e9e:	67bd                	lui	a5,0xf
    7ea0:	9f378793          	addi	a5,a5,-1549 # e9f3 <_data_lma+0x273f>
    7ea4:	8ff9                	and	a5,a5,a4
    7ea6:	fef42423          	sw	a5,-24(s0)
    tmpreg |= (uint32_t)USART_InitStruct->USART_WordLength | USART_InitStruct->USART_Parity |
    7eaa:	fb842783          	lw	a5,-72(s0)
    7eae:	0047d703          	lhu	a4,4(a5)
    7eb2:	fb842783          	lw	a5,-72(s0)
    7eb6:	0087d783          	lhu	a5,8(a5)
    7eba:	8fd9                	or	a5,a5,a4
    7ebc:	01079713          	slli	a4,a5,0x10
    7ec0:	8341                	srli	a4,a4,0x10
              USART_InitStruct->USART_Mode;
    7ec2:	fb842783          	lw	a5,-72(s0)
    7ec6:	00a7d783          	lhu	a5,10(a5)
    tmpreg |= (uint32_t)USART_InitStruct->USART_WordLength | USART_InitStruct->USART_Parity |
    7eca:	8fd9                	or	a5,a5,a4
    7ecc:	07c2                	slli	a5,a5,0x10
    7ece:	83c1                	srli	a5,a5,0x10
    7ed0:	873e                	mv	a4,a5
    7ed2:	fe842783          	lw	a5,-24(s0)
    7ed6:	8fd9                	or	a5,a5,a4
    7ed8:	fef42423          	sw	a5,-24(s0)
    USARTx->CTLR1 = (uint16_t)tmpreg;
    7edc:	fe842783          	lw	a5,-24(s0)
    7ee0:	01079713          	slli	a4,a5,0x10
    7ee4:	8341                	srli	a4,a4,0x10
    7ee6:	fbc42783          	lw	a5,-68(s0)
    7eea:	00e79623          	sh	a4,12(a5)

    tmpreg = USARTx->CTLR3;
    7eee:	fbc42783          	lw	a5,-68(s0)
    7ef2:	0147d783          	lhu	a5,20(a5)
    7ef6:	07c2                	slli	a5,a5,0x10
    7ef8:	83c1                	srli	a5,a5,0x10
    7efa:	fef42423          	sw	a5,-24(s0)
    tmpreg &= CTLR3_CLEAR_Mask;
    7efe:	fe842703          	lw	a4,-24(s0)
    7f02:	67c1                	lui	a5,0x10
    7f04:	cff78793          	addi	a5,a5,-769 # fcff <_data_lma+0x3a4b>
    7f08:	8ff9                	and	a5,a5,a4
    7f0a:	fef42423          	sw	a5,-24(s0)
    tmpreg |= USART_InitStruct->USART_HardwareFlowControl;
    7f0e:	fb842783          	lw	a5,-72(s0)
    7f12:	00c7d783          	lhu	a5,12(a5)
    7f16:	873e                	mv	a4,a5
    7f18:	fe842783          	lw	a5,-24(s0)
    7f1c:	8fd9                	or	a5,a5,a4
    7f1e:	fef42423          	sw	a5,-24(s0)
    USARTx->CTLR3 = (uint16_t)tmpreg;
    7f22:	fe842783          	lw	a5,-24(s0)
    7f26:	01079713          	slli	a4,a5,0x10
    7f2a:	8341                	srli	a4,a4,0x10
    7f2c:	fbc42783          	lw	a5,-68(s0)
    7f30:	00e79a23          	sh	a4,20(a5)

    RCC_GetClocksFreq(&RCC_ClocksStatus);
    7f34:	fcc40793          	addi	a5,s0,-52
    7f38:	853e                	mv	a0,a5
    7f3a:	a91fc0ef          	jal	ra,49ca <RCC_GetClocksFreq>

    if(usartxbase == USART1_BASE)
    7f3e:	fdc42703          	lw	a4,-36(s0)
    7f42:	400147b7          	lui	a5,0x40014
    7f46:	80078793          	addi	a5,a5,-2048 # 40013800 <_eusrstack+0x2000f800>
    7f4a:	00f71763          	bne	a4,a5,7f58 <USART_Init+0x13e>
    {
        apbclock = RCC_ClocksStatus.PCLK2_Frequency;
    7f4e:	fd842783          	lw	a5,-40(s0)
    7f52:	fef42623          	sw	a5,-20(s0)
    7f56:	a029                	j	7f60 <USART_Init+0x146>
    }
    else
    {
        apbclock = RCC_ClocksStatus.PCLK1_Frequency;
    7f58:	fd442783          	lw	a5,-44(s0)
    7f5c:	fef42623          	sw	a5,-20(s0)
    }

    integerdivider = ((25 * apbclock) / (4 * (USART_InitStruct->USART_BaudRate)));
    7f60:	fec42703          	lw	a4,-20(s0)
    7f64:	87ba                	mv	a5,a4
    7f66:	0786                	slli	a5,a5,0x1
    7f68:	97ba                	add	a5,a5,a4
    7f6a:	078e                	slli	a5,a5,0x3
    7f6c:	973e                	add	a4,a4,a5
    7f6e:	fb842783          	lw	a5,-72(s0)
    7f72:	439c                	lw	a5,0(a5)
    7f74:	078a                	slli	a5,a5,0x2
    7f76:	02f757b3          	divu	a5,a4,a5
    7f7a:	fef42223          	sw	a5,-28(s0)
    tmpreg = (integerdivider / 100) << 4;
    7f7e:	fe442703          	lw	a4,-28(s0)
    7f82:	06400793          	li	a5,100
    7f86:	02f757b3          	divu	a5,a4,a5
    7f8a:	0792                	slli	a5,a5,0x4
    7f8c:	fef42423          	sw	a5,-24(s0)

    fractionaldivider = integerdivider - (100 * (tmpreg >> 4));
    7f90:	fe842783          	lw	a5,-24(s0)
    7f94:	0047d713          	srli	a4,a5,0x4
    7f98:	06400793          	li	a5,100
    7f9c:	02f707b3          	mul	a5,a4,a5
    7fa0:	fe442703          	lw	a4,-28(s0)
    7fa4:	40f707b3          	sub	a5,a4,a5
    7fa8:	fef42023          	sw	a5,-32(s0)
    tmpreg |= ((((fractionaldivider * 16) + 50) / 100)) & ((uint8_t)0x0F);
    7fac:	fe042783          	lw	a5,-32(s0)
    7fb0:	0792                	slli	a5,a5,0x4
    7fb2:	03278713          	addi	a4,a5,50
    7fb6:	06400793          	li	a5,100
    7fba:	02f757b3          	divu	a5,a4,a5
    7fbe:	8bbd                	andi	a5,a5,15
    7fc0:	fe842703          	lw	a4,-24(s0)
    7fc4:	8fd9                	or	a5,a5,a4
    7fc6:	fef42423          	sw	a5,-24(s0)

    USARTx->BRR = (uint16_t)tmpreg;
    7fca:	fe842783          	lw	a5,-24(s0)
    7fce:	01079713          	slli	a4,a5,0x10
    7fd2:	8341                	srli	a4,a4,0x10
    7fd4:	fbc42783          	lw	a5,-68(s0)
    7fd8:	00e79423          	sh	a4,8(a5)
}
    7fdc:	0001                	nop
    7fde:	40b6                	lw	ra,76(sp)
    7fe0:	4426                	lw	s0,72(sp)
    7fe2:	6161                	addi	sp,sp,80
    7fe4:	8082                	ret

00007fe6 <USART_StructInit>:
 *       which will be initialized.
 *
 * @return  none
 */
void USART_StructInit(USART_InitTypeDef *USART_InitStruct)
{
    7fe6:	1101                	addi	sp,sp,-32
    7fe8:	ce22                	sw	s0,28(sp)
    7fea:	1000                	addi	s0,sp,32
    7fec:	fea42623          	sw	a0,-20(s0)
    USART_InitStruct->USART_BaudRate = 9600;
    7ff0:	fec42783          	lw	a5,-20(s0)
    7ff4:	6709                	lui	a4,0x2
    7ff6:	58070713          	addi	a4,a4,1408 # 2580 <GPIO_Init+0xf2>
    7ffa:	c398                	sw	a4,0(a5)
    USART_InitStruct->USART_WordLength = USART_WordLength_8b;
    7ffc:	fec42783          	lw	a5,-20(s0)
    8000:	00079223          	sh	zero,4(a5)
    USART_InitStruct->USART_StopBits = USART_StopBits_1;
    8004:	fec42783          	lw	a5,-20(s0)
    8008:	00079323          	sh	zero,6(a5)
    USART_InitStruct->USART_Parity = USART_Parity_No;
    800c:	fec42783          	lw	a5,-20(s0)
    8010:	00079423          	sh	zero,8(a5)
    USART_InitStruct->USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
    8014:	fec42783          	lw	a5,-20(s0)
    8018:	4731                	li	a4,12
    801a:	00e79523          	sh	a4,10(a5)
    USART_InitStruct->USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    801e:	fec42783          	lw	a5,-20(s0)
    8022:	00079623          	sh	zero,12(a5)
}
    8026:	0001                	nop
    8028:	4472                	lw	s0,28(sp)
    802a:	6105                	addi	sp,sp,32
    802c:	8082                	ret

0000802e <USART_ClockInit>:
 *        USART peripheral.
 *
 * @return  none
 */
void USART_ClockInit(USART_TypeDef *USARTx, USART_ClockInitTypeDef *USART_ClockInitStruct)
{
    802e:	7179                	addi	sp,sp,-48
    8030:	d622                	sw	s0,44(sp)
    8032:	1800                	addi	s0,sp,48
    8034:	fca42e23          	sw	a0,-36(s0)
    8038:	fcb42c23          	sw	a1,-40(s0)
    uint32_t tmpreg = 0x00;
    803c:	fe042623          	sw	zero,-20(s0)

    tmpreg = USARTx->CTLR2;
    8040:	fdc42783          	lw	a5,-36(s0)
    8044:	0107d783          	lhu	a5,16(a5)
    8048:	07c2                	slli	a5,a5,0x10
    804a:	83c1                	srli	a5,a5,0x10
    804c:	fef42623          	sw	a5,-20(s0)
    tmpreg &= CTLR2_CLOCK_CLEAR_Mask;
    8050:	fec42703          	lw	a4,-20(s0)
    8054:	67bd                	lui	a5,0xf
    8056:	0ff78793          	addi	a5,a5,255 # f0ff <_data_lma+0x2e4b>
    805a:	8ff9                	and	a5,a5,a4
    805c:	fef42623          	sw	a5,-20(s0)
    tmpreg |= (uint32_t)USART_ClockInitStruct->USART_Clock | USART_ClockInitStruct->USART_CPOL |
    8060:	fd842783          	lw	a5,-40(s0)
    8064:	0007d703          	lhu	a4,0(a5)
    8068:	fd842783          	lw	a5,-40(s0)
    806c:	0027d783          	lhu	a5,2(a5)
              USART_ClockInitStruct->USART_CPHA | USART_ClockInitStruct->USART_LastBit;
    8070:	8fd9                	or	a5,a5,a4
    8072:	01079713          	slli	a4,a5,0x10
    8076:	8341                	srli	a4,a4,0x10
    8078:	fd842783          	lw	a5,-40(s0)
    807c:	0047d783          	lhu	a5,4(a5)
    8080:	8fd9                	or	a5,a5,a4
    8082:	01079713          	slli	a4,a5,0x10
    8086:	8341                	srli	a4,a4,0x10
    8088:	fd842783          	lw	a5,-40(s0)
    808c:	0067d783          	lhu	a5,6(a5)
    8090:	8fd9                	or	a5,a5,a4
    8092:	07c2                	slli	a5,a5,0x10
    8094:	83c1                	srli	a5,a5,0x10
    8096:	873e                	mv	a4,a5
    tmpreg |= (uint32_t)USART_ClockInitStruct->USART_Clock | USART_ClockInitStruct->USART_CPOL |
    8098:	fec42783          	lw	a5,-20(s0)
    809c:	8fd9                	or	a5,a5,a4
    809e:	fef42623          	sw	a5,-20(s0)
    USARTx->CTLR2 = (uint16_t)tmpreg;
    80a2:	fec42783          	lw	a5,-20(s0)
    80a6:	01079713          	slli	a4,a5,0x10
    80aa:	8341                	srli	a4,a4,0x10
    80ac:	fdc42783          	lw	a5,-36(s0)
    80b0:	00e79823          	sh	a4,16(a5)
}
    80b4:	0001                	nop
    80b6:	5432                	lw	s0,44(sp)
    80b8:	6145                	addi	sp,sp,48
    80ba:	8082                	ret

000080bc <USART_ClockStructInit>:
 *        structure which will be initialized.
 *
 * @return  none
 */
void USART_ClockStructInit(USART_ClockInitTypeDef *USART_ClockInitStruct)
{
    80bc:	1101                	addi	sp,sp,-32
    80be:	ce22                	sw	s0,28(sp)
    80c0:	1000                	addi	s0,sp,32
    80c2:	fea42623          	sw	a0,-20(s0)
    USART_ClockInitStruct->USART_Clock = USART_Clock_Disable;
    80c6:	fec42783          	lw	a5,-20(s0)
    80ca:	00079023          	sh	zero,0(a5)
    USART_ClockInitStruct->USART_CPOL = USART_CPOL_Low;
    80ce:	fec42783          	lw	a5,-20(s0)
    80d2:	00079123          	sh	zero,2(a5)
    USART_ClockInitStruct->USART_CPHA = USART_CPHA_1Edge;
    80d6:	fec42783          	lw	a5,-20(s0)
    80da:	00079223          	sh	zero,4(a5)
    USART_ClockInitStruct->USART_LastBit = USART_LastBit_Disable;
    80de:	fec42783          	lw	a5,-20(s0)
    80e2:	00079323          	sh	zero,6(a5)
}
    80e6:	0001                	nop
    80e8:	4472                	lw	s0,28(sp)
    80ea:	6105                	addi	sp,sp,32
    80ec:	8082                	ret

000080ee <USART_Cmd>:
 *          NewState: ENABLE or DISABLE.
 *
 * @return  none
 */
void USART_Cmd(USART_TypeDef *USARTx, FunctionalState NewState)
{
    80ee:	1101                	addi	sp,sp,-32
    80f0:	ce22                	sw	s0,28(sp)
    80f2:	1000                	addi	s0,sp,32
    80f4:	fea42623          	sw	a0,-20(s0)
    80f8:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    80fc:	fe842783          	lw	a5,-24(s0)
    8100:	c395                	beqz	a5,8124 <USART_Cmd+0x36>
    {
        USARTx->CTLR1 |= CTLR1_UE_Set;
    8102:	fec42783          	lw	a5,-20(s0)
    8106:	00c7d783          	lhu	a5,12(a5)
    810a:	01079713          	slli	a4,a5,0x10
    810e:	8341                	srli	a4,a4,0x10
    8110:	6789                	lui	a5,0x2
    8112:	8fd9                	or	a5,a5,a4
    8114:	01079713          	slli	a4,a5,0x10
    8118:	8341                	srli	a4,a4,0x10
    811a:	fec42783          	lw	a5,-20(s0)
    811e:	00e79623          	sh	a4,12(a5) # 200c <FLASH_ClearFlag+0x2>
    }
    else
    {
        USARTx->CTLR1 &= CTLR1_UE_Reset;
    }
}
    8122:	a015                	j	8146 <USART_Cmd+0x58>
        USARTx->CTLR1 &= CTLR1_UE_Reset;
    8124:	fec42783          	lw	a5,-20(s0)
    8128:	00c7d783          	lhu	a5,12(a5)
    812c:	01079713          	slli	a4,a5,0x10
    8130:	8341                	srli	a4,a4,0x10
    8132:	77f9                	lui	a5,0xffffe
    8134:	17fd                	addi	a5,a5,-1
    8136:	8ff9                	and	a5,a5,a4
    8138:	01079713          	slli	a4,a5,0x10
    813c:	8341                	srli	a4,a4,0x10
    813e:	fec42783          	lw	a5,-20(s0)
    8142:	00e79623          	sh	a4,12(a5) # ffffe00c <_eusrstack+0xdfffa00c>
}
    8146:	0001                	nop
    8148:	4472                	lw	s0,28(sp)
    814a:	6105                	addi	sp,sp,32
    814c:	8082                	ret

0000814e <USART_ITConfig>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void USART_ITConfig(USART_TypeDef *USARTx, uint16_t USART_IT, FunctionalState NewState)
{
    814e:	7179                	addi	sp,sp,-48
    8150:	d622                	sw	s0,44(sp)
    8152:	1800                	addi	s0,sp,48
    8154:	fca42e23          	sw	a0,-36(s0)
    8158:	87ae                	mv	a5,a1
    815a:	fcc42a23          	sw	a2,-44(s0)
    815e:	fcf41d23          	sh	a5,-38(s0)
    uint32_t usartreg = 0x00, itpos = 0x00, itmask = 0x00;
    8162:	fe042423          	sw	zero,-24(s0)
    8166:	fe042223          	sw	zero,-28(s0)
    816a:	fe042023          	sw	zero,-32(s0)
    uint32_t usartxbase = 0x00;
    816e:	fe042623          	sw	zero,-20(s0)


    usartxbase = (uint32_t)USARTx;
    8172:	fdc42783          	lw	a5,-36(s0)
    8176:	fef42623          	sw	a5,-20(s0)
    usartreg = (((uint8_t)USART_IT) >> 0x05);
    817a:	fda45783          	lhu	a5,-38(s0)
    817e:	0ff7f793          	andi	a5,a5,255
    8182:	8395                	srli	a5,a5,0x5
    8184:	0ff7f793          	andi	a5,a5,255
    8188:	fef42423          	sw	a5,-24(s0)
    itpos = USART_IT & IT_Mask;
    818c:	fda45783          	lhu	a5,-38(s0)
    8190:	8bfd                	andi	a5,a5,31
    8192:	fef42223          	sw	a5,-28(s0)
    itmask = (((uint32_t)0x01) << itpos);
    8196:	fe442783          	lw	a5,-28(s0)
    819a:	4705                	li	a4,1
    819c:	00f717b3          	sll	a5,a4,a5
    81a0:	fef42023          	sw	a5,-32(s0)

    if(usartreg == 0x01)
    81a4:	fe842703          	lw	a4,-24(s0)
    81a8:	4785                	li	a5,1
    81aa:	00f71863          	bne	a4,a5,81ba <USART_ITConfig+0x6c>
    {
        usartxbase += 0x0C;
    81ae:	fec42783          	lw	a5,-20(s0)
    81b2:	07b1                	addi	a5,a5,12
    81b4:	fef42623          	sw	a5,-20(s0)
    81b8:	a00d                	j	81da <USART_ITConfig+0x8c>
    }
    else if(usartreg == 0x02)
    81ba:	fe842703          	lw	a4,-24(s0)
    81be:	4789                	li	a5,2
    81c0:	00f71863          	bne	a4,a5,81d0 <USART_ITConfig+0x82>
    {
        usartxbase += 0x10;
    81c4:	fec42783          	lw	a5,-20(s0)
    81c8:	07c1                	addi	a5,a5,16
    81ca:	fef42623          	sw	a5,-20(s0)
    81ce:	a031                	j	81da <USART_ITConfig+0x8c>
    }
    else
    {
        usartxbase += 0x14;
    81d0:	fec42783          	lw	a5,-20(s0)
    81d4:	07d1                	addi	a5,a5,20
    81d6:	fef42623          	sw	a5,-20(s0)
    }

    if(NewState != DISABLE)
    81da:	fd442783          	lw	a5,-44(s0)
    81de:	cb99                	beqz	a5,81f4 <USART_ITConfig+0xa6>
    {
        *(__IO uint32_t *)usartxbase |= itmask;
    81e0:	fec42783          	lw	a5,-20(s0)
    81e4:	4394                	lw	a3,0(a5)
    81e6:	fec42783          	lw	a5,-20(s0)
    81ea:	fe042703          	lw	a4,-32(s0)
    81ee:	8f55                	or	a4,a4,a3
    81f0:	c398                	sw	a4,0(a5)
    }
    else
    {
        *(__IO uint32_t *)usartxbase &= ~itmask;
    }
}
    81f2:	a821                	j	820a <USART_ITConfig+0xbc>
        *(__IO uint32_t *)usartxbase &= ~itmask;
    81f4:	fec42783          	lw	a5,-20(s0)
    81f8:	4394                	lw	a3,0(a5)
    81fa:	fe042783          	lw	a5,-32(s0)
    81fe:	fff7c713          	not	a4,a5
    8202:	fec42783          	lw	a5,-20(s0)
    8206:	8f75                	and	a4,a4,a3
    8208:	c398                	sw	a4,0(a5)
}
    820a:	0001                	nop
    820c:	5432                	lw	s0,44(sp)
    820e:	6145                	addi	sp,sp,48
    8210:	8082                	ret

00008212 <USART_DMACmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void USART_DMACmd(USART_TypeDef *USARTx, uint16_t USART_DMAReq, FunctionalState NewState)
{
    8212:	1101                	addi	sp,sp,-32
    8214:	ce22                	sw	s0,28(sp)
    8216:	1000                	addi	s0,sp,32
    8218:	fea42623          	sw	a0,-20(s0)
    821c:	87ae                	mv	a5,a1
    821e:	fec42223          	sw	a2,-28(s0)
    8222:	fef41523          	sh	a5,-22(s0)
    if(NewState != DISABLE)
    8226:	fe442783          	lw	a5,-28(s0)
    822a:	c39d                	beqz	a5,8250 <USART_DMACmd+0x3e>
    {
        USARTx->CTLR3 |= USART_DMAReq;
    822c:	fec42783          	lw	a5,-20(s0)
    8230:	0147d783          	lhu	a5,20(a5)
    8234:	01079713          	slli	a4,a5,0x10
    8238:	8341                	srli	a4,a4,0x10
    823a:	fea45783          	lhu	a5,-22(s0)
    823e:	8fd9                	or	a5,a5,a4
    8240:	01079713          	slli	a4,a5,0x10
    8244:	8341                	srli	a4,a4,0x10
    8246:	fec42783          	lw	a5,-20(s0)
    824a:	00e79a23          	sh	a4,20(a5)
    }
    else
    {
        USARTx->CTLR3 &= (uint16_t)~USART_DMAReq;
    }
}
    824e:	a035                	j	827a <USART_DMACmd+0x68>
        USARTx->CTLR3 &= (uint16_t)~USART_DMAReq;
    8250:	fec42783          	lw	a5,-20(s0)
    8254:	0147d783          	lhu	a5,20(a5)
    8258:	01079713          	slli	a4,a5,0x10
    825c:	8341                	srli	a4,a4,0x10
    825e:	fea45783          	lhu	a5,-22(s0)
    8262:	fff7c793          	not	a5,a5
    8266:	07c2                	slli	a5,a5,0x10
    8268:	83c1                	srli	a5,a5,0x10
    826a:	8ff9                	and	a5,a5,a4
    826c:	01079713          	slli	a4,a5,0x10
    8270:	8341                	srli	a4,a4,0x10
    8272:	fec42783          	lw	a5,-20(s0)
    8276:	00e79a23          	sh	a4,20(a5)
}
    827a:	0001                	nop
    827c:	4472                	lw	s0,28(sp)
    827e:	6105                	addi	sp,sp,32
    8280:	8082                	ret

00008282 <USART_SetAddress>:
 *          USART_Address - Indicates the address of the USART node.
 *
 * @return  none
 */
void USART_SetAddress(USART_TypeDef *USARTx, uint8_t USART_Address)
{
    8282:	1101                	addi	sp,sp,-32
    8284:	ce22                	sw	s0,28(sp)
    8286:	1000                	addi	s0,sp,32
    8288:	fea42623          	sw	a0,-20(s0)
    828c:	87ae                	mv	a5,a1
    828e:	fef405a3          	sb	a5,-21(s0)
    USARTx->CTLR2 &= CTLR2_Address_Mask;
    8292:	fec42783          	lw	a5,-20(s0)
    8296:	0107d783          	lhu	a5,16(a5)
    829a:	07c2                	slli	a5,a5,0x10
    829c:	83c1                	srli	a5,a5,0x10
    829e:	9bc1                	andi	a5,a5,-16
    82a0:	01079713          	slli	a4,a5,0x10
    82a4:	8341                	srli	a4,a4,0x10
    82a6:	fec42783          	lw	a5,-20(s0)
    82aa:	00e79823          	sh	a4,16(a5)
    USARTx->CTLR2 |= USART_Address;
    82ae:	fec42783          	lw	a5,-20(s0)
    82b2:	0107d783          	lhu	a5,16(a5)
    82b6:	01079713          	slli	a4,a5,0x10
    82ba:	8341                	srli	a4,a4,0x10
    82bc:	feb44783          	lbu	a5,-21(s0)
    82c0:	07c2                	slli	a5,a5,0x10
    82c2:	83c1                	srli	a5,a5,0x10
    82c4:	8fd9                	or	a5,a5,a4
    82c6:	01079713          	slli	a4,a5,0x10
    82ca:	8341                	srli	a4,a4,0x10
    82cc:	fec42783          	lw	a5,-20(s0)
    82d0:	00e79823          	sh	a4,16(a5)
}
    82d4:	0001                	nop
    82d6:	4472                	lw	s0,28(sp)
    82d8:	6105                	addi	sp,sp,32
    82da:	8082                	ret

000082dc <USART_WakeUpConfig>:
 *            USART_WakeUp_AddressMark - WakeUp by an address mark.
 *
 * @return  none
 */
void USART_WakeUpConfig(USART_TypeDef *USARTx, uint16_t USART_WakeUp)
{
    82dc:	1101                	addi	sp,sp,-32
    82de:	ce22                	sw	s0,28(sp)
    82e0:	1000                	addi	s0,sp,32
    82e2:	fea42623          	sw	a0,-20(s0)
    82e6:	87ae                	mv	a5,a1
    82e8:	fef41523          	sh	a5,-22(s0)
    USARTx->CTLR1 &= CTLR1_WAKE_Mask;
    82ec:	fec42783          	lw	a5,-20(s0)
    82f0:	00c7d783          	lhu	a5,12(a5)
    82f4:	01079713          	slli	a4,a5,0x10
    82f8:	8341                	srli	a4,a4,0x10
    82fa:	77fd                	lui	a5,0xfffff
    82fc:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_eusrstack+0xdfffb7ff>
    8300:	8ff9                	and	a5,a5,a4
    8302:	01079713          	slli	a4,a5,0x10
    8306:	8341                	srli	a4,a4,0x10
    8308:	fec42783          	lw	a5,-20(s0)
    830c:	00e79623          	sh	a4,12(a5)
    USARTx->CTLR1 |= USART_WakeUp;
    8310:	fec42783          	lw	a5,-20(s0)
    8314:	00c7d783          	lhu	a5,12(a5)
    8318:	01079713          	slli	a4,a5,0x10
    831c:	8341                	srli	a4,a4,0x10
    831e:	fea45783          	lhu	a5,-22(s0)
    8322:	8fd9                	or	a5,a5,a4
    8324:	01079713          	slli	a4,a5,0x10
    8328:	8341                	srli	a4,a4,0x10
    832a:	fec42783          	lw	a5,-20(s0)
    832e:	00e79623          	sh	a4,12(a5)
}
    8332:	0001                	nop
    8334:	4472                	lw	s0,28(sp)
    8336:	6105                	addi	sp,sp,32
    8338:	8082                	ret

0000833a <USART_ReceiverWakeUpCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void USART_ReceiverWakeUpCmd(USART_TypeDef *USARTx, FunctionalState NewState)
{
    833a:	1101                	addi	sp,sp,-32
    833c:	ce22                	sw	s0,28(sp)
    833e:	1000                	addi	s0,sp,32
    8340:	fea42623          	sw	a0,-20(s0)
    8344:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    8348:	fe842783          	lw	a5,-24(s0)
    834c:	c38d                	beqz	a5,836e <USART_ReceiverWakeUpCmd+0x34>
    {
        USARTx->CTLR1 |= CTLR1_RWU_Set;
    834e:	fec42783          	lw	a5,-20(s0)
    8352:	00c7d783          	lhu	a5,12(a5)
    8356:	07c2                	slli	a5,a5,0x10
    8358:	83c1                	srli	a5,a5,0x10
    835a:	0027e793          	ori	a5,a5,2
    835e:	01079713          	slli	a4,a5,0x10
    8362:	8341                	srli	a4,a4,0x10
    8364:	fec42783          	lw	a5,-20(s0)
    8368:	00e79623          	sh	a4,12(a5)
    }
    else
    {
        USARTx->CTLR1 &= CTLR1_RWU_Reset;
    }
}
    836c:	a839                	j	838a <USART_ReceiverWakeUpCmd+0x50>
        USARTx->CTLR1 &= CTLR1_RWU_Reset;
    836e:	fec42783          	lw	a5,-20(s0)
    8372:	00c7d783          	lhu	a5,12(a5)
    8376:	07c2                	slli	a5,a5,0x10
    8378:	83c1                	srli	a5,a5,0x10
    837a:	9bf5                	andi	a5,a5,-3
    837c:	01079713          	slli	a4,a5,0x10
    8380:	8341                	srli	a4,a4,0x10
    8382:	fec42783          	lw	a5,-20(s0)
    8386:	00e79623          	sh	a4,12(a5)
}
    838a:	0001                	nop
    838c:	4472                	lw	s0,28(sp)
    838e:	6105                	addi	sp,sp,32
    8390:	8082                	ret

00008392 <USART_LINBreakDetectLengthConfig>:
 *            USART_LINBreakDetectLength_11b - 11-bit break detection.
 *
 * @return  none
 */
void USART_LINBreakDetectLengthConfig(USART_TypeDef *USARTx, uint16_t USART_LINBreakDetectLength)
{
    8392:	1101                	addi	sp,sp,-32
    8394:	ce22                	sw	s0,28(sp)
    8396:	1000                	addi	s0,sp,32
    8398:	fea42623          	sw	a0,-20(s0)
    839c:	87ae                	mv	a5,a1
    839e:	fef41523          	sh	a5,-22(s0)
    USARTx->CTLR2 &= CTLR2_LBDL_Mask;
    83a2:	fec42783          	lw	a5,-20(s0)
    83a6:	0107d783          	lhu	a5,16(a5)
    83aa:	07c2                	slli	a5,a5,0x10
    83ac:	83c1                	srli	a5,a5,0x10
    83ae:	fdf7f793          	andi	a5,a5,-33
    83b2:	01079713          	slli	a4,a5,0x10
    83b6:	8341                	srli	a4,a4,0x10
    83b8:	fec42783          	lw	a5,-20(s0)
    83bc:	00e79823          	sh	a4,16(a5)
    USARTx->CTLR2 |= USART_LINBreakDetectLength;
    83c0:	fec42783          	lw	a5,-20(s0)
    83c4:	0107d783          	lhu	a5,16(a5)
    83c8:	01079713          	slli	a4,a5,0x10
    83cc:	8341                	srli	a4,a4,0x10
    83ce:	fea45783          	lhu	a5,-22(s0)
    83d2:	8fd9                	or	a5,a5,a4
    83d4:	01079713          	slli	a4,a5,0x10
    83d8:	8341                	srli	a4,a4,0x10
    83da:	fec42783          	lw	a5,-20(s0)
    83de:	00e79823          	sh	a4,16(a5)
}
    83e2:	0001                	nop
    83e4:	4472                	lw	s0,28(sp)
    83e6:	6105                	addi	sp,sp,32
    83e8:	8082                	ret

000083ea <USART_LINCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void USART_LINCmd(USART_TypeDef *USARTx, FunctionalState NewState)
{
    83ea:	1101                	addi	sp,sp,-32
    83ec:	ce22                	sw	s0,28(sp)
    83ee:	1000                	addi	s0,sp,32
    83f0:	fea42623          	sw	a0,-20(s0)
    83f4:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    83f8:	fe842783          	lw	a5,-24(s0)
    83fc:	c395                	beqz	a5,8420 <USART_LINCmd+0x36>
    {
        USARTx->CTLR2 |= CTLR2_LINEN_Set;
    83fe:	fec42783          	lw	a5,-20(s0)
    8402:	0107d783          	lhu	a5,16(a5)
    8406:	01079713          	slli	a4,a5,0x10
    840a:	8341                	srli	a4,a4,0x10
    840c:	6791                	lui	a5,0x4
    840e:	8fd9                	or	a5,a5,a4
    8410:	01079713          	slli	a4,a5,0x10
    8414:	8341                	srli	a4,a4,0x10
    8416:	fec42783          	lw	a5,-20(s0)
    841a:	00e79823          	sh	a4,16(a5) # 4010 <NVIC_Init+0x2c0>
    }
    else
    {
        USARTx->CTLR2 &= CTLR2_LINEN_Reset;
    }
}
    841e:	a015                	j	8442 <USART_LINCmd+0x58>
        USARTx->CTLR2 &= CTLR2_LINEN_Reset;
    8420:	fec42783          	lw	a5,-20(s0)
    8424:	0107d783          	lhu	a5,16(a5)
    8428:	01079713          	slli	a4,a5,0x10
    842c:	8341                	srli	a4,a4,0x10
    842e:	77f1                	lui	a5,0xffffc
    8430:	17fd                	addi	a5,a5,-1
    8432:	8ff9                	and	a5,a5,a4
    8434:	01079713          	slli	a4,a5,0x10
    8438:	8341                	srli	a4,a4,0x10
    843a:	fec42783          	lw	a5,-20(s0)
    843e:	00e79823          	sh	a4,16(a5) # ffffc010 <_eusrstack+0xdfff8010>
}
    8442:	0001                	nop
    8444:	4472                	lw	s0,28(sp)
    8446:	6105                	addi	sp,sp,32
    8448:	8082                	ret

0000844a <USART_SendData>:
 *          Data - the data to transmit.
 *
 * @return  none
 */
void USART_SendData(USART_TypeDef *USARTx, uint16_t Data)
{
    844a:	1101                	addi	sp,sp,-32
    844c:	ce22                	sw	s0,28(sp)
    844e:	1000                	addi	s0,sp,32
    8450:	fea42623          	sw	a0,-20(s0)
    8454:	87ae                	mv	a5,a1
    8456:	fef41523          	sh	a5,-22(s0)
    USARTx->DATAR = (Data & (uint16_t)0x01FF);
    845a:	fea45783          	lhu	a5,-22(s0)
    845e:	1ff7f793          	andi	a5,a5,511
    8462:	01079713          	slli	a4,a5,0x10
    8466:	8341                	srli	a4,a4,0x10
    8468:	fec42783          	lw	a5,-20(s0)
    846c:	00e79223          	sh	a4,4(a5)
}
    8470:	0001                	nop
    8472:	4472                	lw	s0,28(sp)
    8474:	6105                	addi	sp,sp,32
    8476:	8082                	ret

00008478 <USART_ReceiveData>:
 * @param   USARTx - where x can be 1, 2, 3 or 4 to select the USART peripheral.
 *
 * @return  The received data.
 */
uint16_t USART_ReceiveData(USART_TypeDef *USARTx)
{
    8478:	1101                	addi	sp,sp,-32
    847a:	ce22                	sw	s0,28(sp)
    847c:	1000                	addi	s0,sp,32
    847e:	fea42623          	sw	a0,-20(s0)
    return (uint16_t)(USARTx->DATAR & (uint16_t)0x01FF);
    8482:	fec42783          	lw	a5,-20(s0)
    8486:	0047d783          	lhu	a5,4(a5)
    848a:	07c2                	slli	a5,a5,0x10
    848c:	83c1                	srli	a5,a5,0x10
    848e:	1ff7f793          	andi	a5,a5,511
    8492:	07c2                	slli	a5,a5,0x10
    8494:	83c1                	srli	a5,a5,0x10
}
    8496:	853e                	mv	a0,a5
    8498:	4472                	lw	s0,28(sp)
    849a:	6105                	addi	sp,sp,32
    849c:	8082                	ret

0000849e <USART_SendBreak>:
 * @param   USARTx - where x can be 1, 2, 3 or 4 to select the USART peripheral.
 *
 * @return  none
 */
void USART_SendBreak(USART_TypeDef *USARTx)
{
    849e:	1101                	addi	sp,sp,-32
    84a0:	ce22                	sw	s0,28(sp)
    84a2:	1000                	addi	s0,sp,32
    84a4:	fea42623          	sw	a0,-20(s0)
    USARTx->CTLR1 |= CTLR1_SBK_Set;
    84a8:	fec42783          	lw	a5,-20(s0)
    84ac:	00c7d783          	lhu	a5,12(a5)
    84b0:	07c2                	slli	a5,a5,0x10
    84b2:	83c1                	srli	a5,a5,0x10
    84b4:	0017e793          	ori	a5,a5,1
    84b8:	01079713          	slli	a4,a5,0x10
    84bc:	8341                	srli	a4,a4,0x10
    84be:	fec42783          	lw	a5,-20(s0)
    84c2:	00e79623          	sh	a4,12(a5)
}
    84c6:	0001                	nop
    84c8:	4472                	lw	s0,28(sp)
    84ca:	6105                	addi	sp,sp,32
    84cc:	8082                	ret

000084ce <USART_SetGuardTime>:
 *          USART_GuardTime - specifies the guard time.
 *
 * @return  none
 */
void USART_SetGuardTime(USART_TypeDef *USARTx, uint8_t USART_GuardTime)
{
    84ce:	1101                	addi	sp,sp,-32
    84d0:	ce22                	sw	s0,28(sp)
    84d2:	1000                	addi	s0,sp,32
    84d4:	fea42623          	sw	a0,-20(s0)
    84d8:	87ae                	mv	a5,a1
    84da:	fef405a3          	sb	a5,-21(s0)
    USARTx->GPR &= GPR_LSB_Mask;
    84de:	fec42783          	lw	a5,-20(s0)
    84e2:	0187d783          	lhu	a5,24(a5)
    84e6:	07c2                	slli	a5,a5,0x10
    84e8:	83c1                	srli	a5,a5,0x10
    84ea:	0ff7f793          	andi	a5,a5,255
    84ee:	01079713          	slli	a4,a5,0x10
    84f2:	8341                	srli	a4,a4,0x10
    84f4:	fec42783          	lw	a5,-20(s0)
    84f8:	00e79c23          	sh	a4,24(a5)
    USARTx->GPR |= (uint16_t)((uint16_t)USART_GuardTime << 0x08);
    84fc:	fec42783          	lw	a5,-20(s0)
    8500:	0187d783          	lhu	a5,24(a5)
    8504:	01079713          	slli	a4,a5,0x10
    8508:	8341                	srli	a4,a4,0x10
    850a:	feb44783          	lbu	a5,-21(s0)
    850e:	07c2                	slli	a5,a5,0x10
    8510:	83c1                	srli	a5,a5,0x10
    8512:	07a2                	slli	a5,a5,0x8
    8514:	07c2                	slli	a5,a5,0x10
    8516:	83c1                	srli	a5,a5,0x10
    8518:	8fd9                	or	a5,a5,a4
    851a:	01079713          	slli	a4,a5,0x10
    851e:	8341                	srli	a4,a4,0x10
    8520:	fec42783          	lw	a5,-20(s0)
    8524:	00e79c23          	sh	a4,24(a5)
}
    8528:	0001                	nop
    852a:	4472                	lw	s0,28(sp)
    852c:	6105                	addi	sp,sp,32
    852e:	8082                	ret

00008530 <USART_SetPrescaler>:
 *          USART_Prescaler - specifies the prescaler clock.
 *
 * @return  none
 */
void USART_SetPrescaler(USART_TypeDef *USARTx, uint8_t USART_Prescaler)
{
    8530:	1101                	addi	sp,sp,-32
    8532:	ce22                	sw	s0,28(sp)
    8534:	1000                	addi	s0,sp,32
    8536:	fea42623          	sw	a0,-20(s0)
    853a:	87ae                	mv	a5,a1
    853c:	fef405a3          	sb	a5,-21(s0)
    USARTx->GPR &= GPR_MSB_Mask;
    8540:	fec42783          	lw	a5,-20(s0)
    8544:	0187d783          	lhu	a5,24(a5)
    8548:	07c2                	slli	a5,a5,0x10
    854a:	83c1                	srli	a5,a5,0x10
    854c:	f007f793          	andi	a5,a5,-256
    8550:	01079713          	slli	a4,a5,0x10
    8554:	8341                	srli	a4,a4,0x10
    8556:	fec42783          	lw	a5,-20(s0)
    855a:	00e79c23          	sh	a4,24(a5)
    USARTx->GPR |= USART_Prescaler;
    855e:	fec42783          	lw	a5,-20(s0)
    8562:	0187d783          	lhu	a5,24(a5)
    8566:	01079713          	slli	a4,a5,0x10
    856a:	8341                	srli	a4,a4,0x10
    856c:	feb44783          	lbu	a5,-21(s0)
    8570:	07c2                	slli	a5,a5,0x10
    8572:	83c1                	srli	a5,a5,0x10
    8574:	8fd9                	or	a5,a5,a4
    8576:	01079713          	slli	a4,a5,0x10
    857a:	8341                	srli	a4,a4,0x10
    857c:	fec42783          	lw	a5,-20(s0)
    8580:	00e79c23          	sh	a4,24(a5)
}
    8584:	0001                	nop
    8586:	4472                	lw	s0,28(sp)
    8588:	6105                	addi	sp,sp,32
    858a:	8082                	ret

0000858c <USART_SmartCardCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void USART_SmartCardCmd(USART_TypeDef *USARTx, FunctionalState NewState)
{
    858c:	1101                	addi	sp,sp,-32
    858e:	ce22                	sw	s0,28(sp)
    8590:	1000                	addi	s0,sp,32
    8592:	fea42623          	sw	a0,-20(s0)
    8596:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    859a:	fe842783          	lw	a5,-24(s0)
    859e:	c38d                	beqz	a5,85c0 <USART_SmartCardCmd+0x34>
    {
        USARTx->CTLR3 |= CTLR3_SCEN_Set;
    85a0:	fec42783          	lw	a5,-20(s0)
    85a4:	0147d783          	lhu	a5,20(a5)
    85a8:	07c2                	slli	a5,a5,0x10
    85aa:	83c1                	srli	a5,a5,0x10
    85ac:	0207e793          	ori	a5,a5,32
    85b0:	01079713          	slli	a4,a5,0x10
    85b4:	8341                	srli	a4,a4,0x10
    85b6:	fec42783          	lw	a5,-20(s0)
    85ba:	00e79a23          	sh	a4,20(a5)
    }
    else
    {
        USARTx->CTLR3 &= CTLR3_SCEN_Reset;
    }
}
    85be:	a005                	j	85de <USART_SmartCardCmd+0x52>
        USARTx->CTLR3 &= CTLR3_SCEN_Reset;
    85c0:	fec42783          	lw	a5,-20(s0)
    85c4:	0147d783          	lhu	a5,20(a5)
    85c8:	07c2                	slli	a5,a5,0x10
    85ca:	83c1                	srli	a5,a5,0x10
    85cc:	fdf7f793          	andi	a5,a5,-33
    85d0:	01079713          	slli	a4,a5,0x10
    85d4:	8341                	srli	a4,a4,0x10
    85d6:	fec42783          	lw	a5,-20(s0)
    85da:	00e79a23          	sh	a4,20(a5)
}
    85de:	0001                	nop
    85e0:	4472                	lw	s0,28(sp)
    85e2:	6105                	addi	sp,sp,32
    85e4:	8082                	ret

000085e6 <USART_SmartCardNACKCmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void USART_SmartCardNACKCmd(USART_TypeDef *USARTx, FunctionalState NewState)
{
    85e6:	1101                	addi	sp,sp,-32
    85e8:	ce22                	sw	s0,28(sp)
    85ea:	1000                	addi	s0,sp,32
    85ec:	fea42623          	sw	a0,-20(s0)
    85f0:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    85f4:	fe842783          	lw	a5,-24(s0)
    85f8:	c38d                	beqz	a5,861a <USART_SmartCardNACKCmd+0x34>
    {
        USARTx->CTLR3 |= CTLR3_NACK_Set;
    85fa:	fec42783          	lw	a5,-20(s0)
    85fe:	0147d783          	lhu	a5,20(a5)
    8602:	07c2                	slli	a5,a5,0x10
    8604:	83c1                	srli	a5,a5,0x10
    8606:	0107e793          	ori	a5,a5,16
    860a:	01079713          	slli	a4,a5,0x10
    860e:	8341                	srli	a4,a4,0x10
    8610:	fec42783          	lw	a5,-20(s0)
    8614:	00e79a23          	sh	a4,20(a5)
    }
    else
    {
        USARTx->CTLR3 &= CTLR3_NACK_Reset;
    }
}
    8618:	a839                	j	8636 <USART_SmartCardNACKCmd+0x50>
        USARTx->CTLR3 &= CTLR3_NACK_Reset;
    861a:	fec42783          	lw	a5,-20(s0)
    861e:	0147d783          	lhu	a5,20(a5)
    8622:	07c2                	slli	a5,a5,0x10
    8624:	83c1                	srli	a5,a5,0x10
    8626:	9bbd                	andi	a5,a5,-17
    8628:	01079713          	slli	a4,a5,0x10
    862c:	8341                	srli	a4,a4,0x10
    862e:	fec42783          	lw	a5,-20(s0)
    8632:	00e79a23          	sh	a4,20(a5)
}
    8636:	0001                	nop
    8638:	4472                	lw	s0,28(sp)
    863a:	6105                	addi	sp,sp,32
    863c:	8082                	ret

0000863e <USART_HalfDuplexCmd>:
 *                  NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void USART_HalfDuplexCmd(USART_TypeDef *USARTx, FunctionalState NewState)
{
    863e:	1101                	addi	sp,sp,-32
    8640:	ce22                	sw	s0,28(sp)
    8642:	1000                	addi	s0,sp,32
    8644:	fea42623          	sw	a0,-20(s0)
    8648:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    864c:	fe842783          	lw	a5,-24(s0)
    8650:	c38d                	beqz	a5,8672 <USART_HalfDuplexCmd+0x34>
    {
        USARTx->CTLR3 |= CTLR3_HDSEL_Set;
    8652:	fec42783          	lw	a5,-20(s0)
    8656:	0147d783          	lhu	a5,20(a5)
    865a:	07c2                	slli	a5,a5,0x10
    865c:	83c1                	srli	a5,a5,0x10
    865e:	0087e793          	ori	a5,a5,8
    8662:	01079713          	slli	a4,a5,0x10
    8666:	8341                	srli	a4,a4,0x10
    8668:	fec42783          	lw	a5,-20(s0)
    866c:	00e79a23          	sh	a4,20(a5)
    }
    else
    {
        USARTx->CTLR3 &= CTLR3_HDSEL_Reset;
    }
}
    8670:	a839                	j	868e <USART_HalfDuplexCmd+0x50>
        USARTx->CTLR3 &= CTLR3_HDSEL_Reset;
    8672:	fec42783          	lw	a5,-20(s0)
    8676:	0147d783          	lhu	a5,20(a5)
    867a:	07c2                	slli	a5,a5,0x10
    867c:	83c1                	srli	a5,a5,0x10
    867e:	9bdd                	andi	a5,a5,-9
    8680:	01079713          	slli	a4,a5,0x10
    8684:	8341                	srli	a4,a4,0x10
    8686:	fec42783          	lw	a5,-20(s0)
    868a:	00e79a23          	sh	a4,20(a5)
}
    868e:	0001                	nop
    8690:	4472                	lw	s0,28(sp)
    8692:	6105                	addi	sp,sp,32
    8694:	8082                	ret

00008696 <USART_IrDAConfig>:
 *            USART_IrDAMode_Normal.
 *
 * @return  none
 */
void USART_IrDAConfig(USART_TypeDef *USARTx, uint16_t USART_IrDAMode)
{
    8696:	1101                	addi	sp,sp,-32
    8698:	ce22                	sw	s0,28(sp)
    869a:	1000                	addi	s0,sp,32
    869c:	fea42623          	sw	a0,-20(s0)
    86a0:	87ae                	mv	a5,a1
    86a2:	fef41523          	sh	a5,-22(s0)
    USARTx->CTLR3 &= CTLR3_IRLP_Mask;
    86a6:	fec42783          	lw	a5,-20(s0)
    86aa:	0147d783          	lhu	a5,20(a5)
    86ae:	07c2                	slli	a5,a5,0x10
    86b0:	83c1                	srli	a5,a5,0x10
    86b2:	9bed                	andi	a5,a5,-5
    86b4:	01079713          	slli	a4,a5,0x10
    86b8:	8341                	srli	a4,a4,0x10
    86ba:	fec42783          	lw	a5,-20(s0)
    86be:	00e79a23          	sh	a4,20(a5)
    USARTx->CTLR3 |= USART_IrDAMode;
    86c2:	fec42783          	lw	a5,-20(s0)
    86c6:	0147d783          	lhu	a5,20(a5)
    86ca:	01079713          	slli	a4,a5,0x10
    86ce:	8341                	srli	a4,a4,0x10
    86d0:	fea45783          	lhu	a5,-22(s0)
    86d4:	8fd9                	or	a5,a5,a4
    86d6:	01079713          	slli	a4,a5,0x10
    86da:	8341                	srli	a4,a4,0x10
    86dc:	fec42783          	lw	a5,-20(s0)
    86e0:	00e79a23          	sh	a4,20(a5)
}
    86e4:	0001                	nop
    86e6:	4472                	lw	s0,28(sp)
    86e8:	6105                	addi	sp,sp,32
    86ea:	8082                	ret

000086ec <USART_IrDACmd>:
 *          NewState - ENABLE or DISABLE.
 *
 * @return  none
 */
void USART_IrDACmd(USART_TypeDef *USARTx, FunctionalState NewState)
{
    86ec:	1101                	addi	sp,sp,-32
    86ee:	ce22                	sw	s0,28(sp)
    86f0:	1000                	addi	s0,sp,32
    86f2:	fea42623          	sw	a0,-20(s0)
    86f6:	feb42423          	sw	a1,-24(s0)
    if(NewState != DISABLE)
    86fa:	fe842783          	lw	a5,-24(s0)
    86fe:	c38d                	beqz	a5,8720 <USART_IrDACmd+0x34>
    {
        USARTx->CTLR3 |= CTLR3_IREN_Set;
    8700:	fec42783          	lw	a5,-20(s0)
    8704:	0147d783          	lhu	a5,20(a5)
    8708:	07c2                	slli	a5,a5,0x10
    870a:	83c1                	srli	a5,a5,0x10
    870c:	0027e793          	ori	a5,a5,2
    8710:	01079713          	slli	a4,a5,0x10
    8714:	8341                	srli	a4,a4,0x10
    8716:	fec42783          	lw	a5,-20(s0)
    871a:	00e79a23          	sh	a4,20(a5)
    }
    else
    {
        USARTx->CTLR3 &= CTLR3_IREN_Reset;
    }
}
    871e:	a839                	j	873c <USART_IrDACmd+0x50>
        USARTx->CTLR3 &= CTLR3_IREN_Reset;
    8720:	fec42783          	lw	a5,-20(s0)
    8724:	0147d783          	lhu	a5,20(a5)
    8728:	07c2                	slli	a5,a5,0x10
    872a:	83c1                	srli	a5,a5,0x10
    872c:	9bf5                	andi	a5,a5,-3
    872e:	01079713          	slli	a4,a5,0x10
    8732:	8341                	srli	a4,a4,0x10
    8734:	fec42783          	lw	a5,-20(s0)
    8738:	00e79a23          	sh	a4,20(a5)
}
    873c:	0001                	nop
    873e:	4472                	lw	s0,28(sp)
    8740:	6105                	addi	sp,sp,32
    8742:	8082                	ret

00008744 <USART_GetFlagStatus>:
 *            USART_FLAG_PE - Parity Error flag.
 *
 * @return  bitstatus: SET or RESET
 */
FlagStatus USART_GetFlagStatus(USART_TypeDef *USARTx, uint16_t USART_FLAG)
{
    8744:	7179                	addi	sp,sp,-48
    8746:	d622                	sw	s0,44(sp)
    8748:	1800                	addi	s0,sp,48
    874a:	fca42e23          	sw	a0,-36(s0)
    874e:	87ae                	mv	a5,a1
    8750:	fcf41d23          	sh	a5,-38(s0)
    FlagStatus bitstatus = RESET;
    8754:	fe042623          	sw	zero,-20(s0)


    if((USARTx->STATR & USART_FLAG) != (uint16_t)RESET)
    8758:	fdc42783          	lw	a5,-36(s0)
    875c:	0007d783          	lhu	a5,0(a5)
    8760:	01079713          	slli	a4,a5,0x10
    8764:	8341                	srli	a4,a4,0x10
    8766:	fda45783          	lhu	a5,-38(s0)
    876a:	8ff9                	and	a5,a5,a4
    876c:	07c2                	slli	a5,a5,0x10
    876e:	83c1                	srli	a5,a5,0x10
    8770:	c789                	beqz	a5,877a <USART_GetFlagStatus+0x36>
    {
        bitstatus = SET;
    8772:	4785                	li	a5,1
    8774:	fef42623          	sw	a5,-20(s0)
    8778:	a019                	j	877e <USART_GetFlagStatus+0x3a>
    }
    else
    {
        bitstatus = RESET;
    877a:	fe042623          	sw	zero,-20(s0)
    }
    return bitstatus;
    877e:	fec42783          	lw	a5,-20(s0)
}
    8782:	853e                	mv	a0,a5
    8784:	5432                	lw	s0,44(sp)
    8786:	6145                	addi	sp,sp,48
    8788:	8082                	ret

0000878a <USART_ClearFlag>:
 *            - TXE flag is cleared only by a write to the USART_DATAR register 
 *            (USART_SendData()).
 * @return  none
 */
void USART_ClearFlag(USART_TypeDef *USARTx, uint16_t USART_FLAG)
{
    878a:	1101                	addi	sp,sp,-32
    878c:	ce22                	sw	s0,28(sp)
    878e:	1000                	addi	s0,sp,32
    8790:	fea42623          	sw	a0,-20(s0)
    8794:	87ae                	mv	a5,a1
    8796:	fef41523          	sh	a5,-22(s0)

    USARTx->STATR = (uint16_t)~USART_FLAG;
    879a:	fea45783          	lhu	a5,-22(s0)
    879e:	fff7c793          	not	a5,a5
    87a2:	01079713          	slli	a4,a5,0x10
    87a6:	8341                	srli	a4,a4,0x10
    87a8:	fec42783          	lw	a5,-20(s0)
    87ac:	00e79023          	sh	a4,0(a5)
}
    87b0:	0001                	nop
    87b2:	4472                	lw	s0,28(sp)
    87b4:	6105                	addi	sp,sp,32
    87b6:	8082                	ret

000087b8 <USART_GetITStatus>:
 *            USART_IT_PE - Parity Error interrupt.
 *
 * @return  bitstatus: SET or RESET.
 */
ITStatus USART_GetITStatus(USART_TypeDef *USARTx, uint16_t USART_IT)
{
    87b8:	7179                	addi	sp,sp,-48
    87ba:	d622                	sw	s0,44(sp)
    87bc:	1800                	addi	s0,sp,48
    87be:	fca42e23          	sw	a0,-36(s0)
    87c2:	87ae                	mv	a5,a1
    87c4:	fcf41d23          	sh	a5,-38(s0)
    uint32_t bitpos = 0x00, itmask = 0x00, usartreg = 0x00;
    87c8:	fe042223          	sw	zero,-28(s0)
    87cc:	fe042623          	sw	zero,-20(s0)
    87d0:	fe042023          	sw	zero,-32(s0)
    ITStatus bitstatus = RESET;
    87d4:	fe042423          	sw	zero,-24(s0)

    usartreg = (((uint8_t)USART_IT) >> 0x05);
    87d8:	fda45783          	lhu	a5,-38(s0)
    87dc:	0ff7f793          	andi	a5,a5,255
    87e0:	8395                	srli	a5,a5,0x5
    87e2:	0ff7f793          	andi	a5,a5,255
    87e6:	fef42023          	sw	a5,-32(s0)
    itmask = USART_IT & IT_Mask;
    87ea:	fda45783          	lhu	a5,-38(s0)
    87ee:	8bfd                	andi	a5,a5,31
    87f0:	fef42623          	sw	a5,-20(s0)
    itmask = (uint32_t)0x01 << itmask;
    87f4:	fec42783          	lw	a5,-20(s0)
    87f8:	4705                	li	a4,1
    87fa:	00f717b3          	sll	a5,a4,a5
    87fe:	fef42623          	sw	a5,-20(s0)

    if(usartreg == 0x01)
    8802:	fe042703          	lw	a4,-32(s0)
    8806:	4785                	li	a5,1
    8808:	00f71f63          	bne	a4,a5,8826 <USART_GetITStatus+0x6e>
    {
        itmask &= USARTx->CTLR1;
    880c:	fdc42783          	lw	a5,-36(s0)
    8810:	00c7d783          	lhu	a5,12(a5)
    8814:	07c2                	slli	a5,a5,0x10
    8816:	83c1                	srli	a5,a5,0x10
    8818:	873e                	mv	a4,a5
    881a:	fec42783          	lw	a5,-20(s0)
    881e:	8ff9                	and	a5,a5,a4
    8820:	fef42623          	sw	a5,-20(s0)
    8824:	a83d                	j	8862 <USART_GetITStatus+0xaa>
    }
    else if(usartreg == 0x02)
    8826:	fe042703          	lw	a4,-32(s0)
    882a:	4789                	li	a5,2
    882c:	00f71f63          	bne	a4,a5,884a <USART_GetITStatus+0x92>
    {
        itmask &= USARTx->CTLR2;
    8830:	fdc42783          	lw	a5,-36(s0)
    8834:	0107d783          	lhu	a5,16(a5)
    8838:	07c2                	slli	a5,a5,0x10
    883a:	83c1                	srli	a5,a5,0x10
    883c:	873e                	mv	a4,a5
    883e:	fec42783          	lw	a5,-20(s0)
    8842:	8ff9                	and	a5,a5,a4
    8844:	fef42623          	sw	a5,-20(s0)
    8848:	a829                	j	8862 <USART_GetITStatus+0xaa>
    }
    else
    {
        itmask &= USARTx->CTLR3;
    884a:	fdc42783          	lw	a5,-36(s0)
    884e:	0147d783          	lhu	a5,20(a5)
    8852:	07c2                	slli	a5,a5,0x10
    8854:	83c1                	srli	a5,a5,0x10
    8856:	873e                	mv	a4,a5
    8858:	fec42783          	lw	a5,-20(s0)
    885c:	8ff9                	and	a5,a5,a4
    885e:	fef42623          	sw	a5,-20(s0)
    }

    bitpos = USART_IT >> 0x08;
    8862:	fda45783          	lhu	a5,-38(s0)
    8866:	83a1                	srli	a5,a5,0x8
    8868:	07c2                	slli	a5,a5,0x10
    886a:	83c1                	srli	a5,a5,0x10
    886c:	fef42223          	sw	a5,-28(s0)
    bitpos = (uint32_t)0x01 << bitpos;
    8870:	fe442783          	lw	a5,-28(s0)
    8874:	4705                	li	a4,1
    8876:	00f717b3          	sll	a5,a4,a5
    887a:	fef42223          	sw	a5,-28(s0)
    bitpos &= USARTx->STATR;
    887e:	fdc42783          	lw	a5,-36(s0)
    8882:	0007d783          	lhu	a5,0(a5)
    8886:	07c2                	slli	a5,a5,0x10
    8888:	83c1                	srli	a5,a5,0x10
    888a:	873e                	mv	a4,a5
    888c:	fe442783          	lw	a5,-28(s0)
    8890:	8ff9                	and	a5,a5,a4
    8892:	fef42223          	sw	a5,-28(s0)

    if((itmask != (uint16_t)RESET) && (bitpos != (uint16_t)RESET))
    8896:	fec42783          	lw	a5,-20(s0)
    889a:	cb81                	beqz	a5,88aa <USART_GetITStatus+0xf2>
    889c:	fe442783          	lw	a5,-28(s0)
    88a0:	c789                	beqz	a5,88aa <USART_GetITStatus+0xf2>
    {
        bitstatus = SET;
    88a2:	4785                	li	a5,1
    88a4:	fef42423          	sw	a5,-24(s0)
    88a8:	a019                	j	88ae <USART_GetITStatus+0xf6>
    }
    else
    {
        bitstatus = RESET;
    88aa:	fe042423          	sw	zero,-24(s0)
    }

    return bitstatus;
    88ae:	fe842783          	lw	a5,-24(s0)
}
    88b2:	853e                	mv	a0,a5
    88b4:	5432                	lw	s0,44(sp)
    88b6:	6145                	addi	sp,sp,48
    88b8:	8082                	ret

000088ba <USART_ClearITPendingBit>:
 *            - TXE pending bit is cleared only by a write to the USART_DATAR register 
 *            (USART_SendData()).
 * @return  none
 */
void USART_ClearITPendingBit(USART_TypeDef *USARTx, uint16_t USART_IT)
{
    88ba:	7179                	addi	sp,sp,-48
    88bc:	d622                	sw	s0,44(sp)
    88be:	1800                	addi	s0,sp,48
    88c0:	fca42e23          	sw	a0,-36(s0)
    88c4:	87ae                	mv	a5,a1
    88c6:	fcf41d23          	sh	a5,-38(s0)
    uint16_t bitpos = 0x00, itmask = 0x00;
    88ca:	fe041723          	sh	zero,-18(s0)
    88ce:	fe041623          	sh	zero,-20(s0)

    bitpos = USART_IT >> 0x08;
    88d2:	fda45783          	lhu	a5,-38(s0)
    88d6:	83a1                	srli	a5,a5,0x8
    88d8:	fef41723          	sh	a5,-18(s0)
    itmask = ((uint16_t)0x01 << (uint16_t)bitpos);
    88dc:	fee45783          	lhu	a5,-18(s0)
    88e0:	4705                	li	a4,1
    88e2:	00f717b3          	sll	a5,a4,a5
    88e6:	fef41623          	sh	a5,-20(s0)
    USARTx->STATR = (uint16_t)~itmask;
    88ea:	fec45783          	lhu	a5,-20(s0)
    88ee:	fff7c793          	not	a5,a5
    88f2:	01079713          	slli	a4,a5,0x10
    88f6:	8341                	srli	a4,a4,0x10
    88f8:	fdc42783          	lw	a5,-36(s0)
    88fc:	00e79023          	sh	a4,0(a5)
}
    8900:	0001                	nop
    8902:	5432                	lw	s0,44(sp)
    8904:	6145                	addi	sp,sp,48
    8906:	8082                	ret

00008908 <WWDG_DeInit>:
 * @brief   Deinitializes the WWDG peripheral registers to their default reset values
 *
 * @return  none
 */
void WWDG_DeInit(void)
{
    8908:	1141                	addi	sp,sp,-16
    890a:	c606                	sw	ra,12(sp)
    890c:	c422                	sw	s0,8(sp)
    890e:	0800                	addi	s0,sp,16
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_WWDG, ENABLE);
    8910:	4585                	li	a1,1
    8912:	6785                	lui	a5,0x1
    8914:	80078513          	addi	a0,a5,-2048 # 800 <__stack_size>
    8918:	ab8fc0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_WWDG, DISABLE);
    891c:	4581                	li	a1,0
    891e:	6785                	lui	a5,0x1
    8920:	80078513          	addi	a0,a5,-2048 # 800 <__stack_size>
    8924:	aacfc0ef          	jal	ra,4bd0 <RCC_APB1PeriphResetCmd>
}
    8928:	0001                	nop
    892a:	40b2                	lw	ra,12(sp)
    892c:	4422                	lw	s0,8(sp)
    892e:	0141                	addi	sp,sp,16
    8930:	8082                	ret

00008932 <WWDG_SetPrescaler>:
 *            WWDG_Prescaler_8 - WWDG counter clock = (PCLK1/4096)/8
 *
 * @return  none
 */
void WWDG_SetPrescaler(uint32_t WWDG_Prescaler)
{
    8932:	7179                	addi	sp,sp,-48
    8934:	d622                	sw	s0,44(sp)
    8936:	1800                	addi	s0,sp,48
    8938:	fca42e23          	sw	a0,-36(s0)
    uint32_t tmpreg = 0;
    893c:	fe042623          	sw	zero,-20(s0)
    tmpreg = WWDG->CFGR & CFGR_WDGTB_Mask;
    8940:	400037b7          	lui	a5,0x40003
    8944:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    8948:	43dc                	lw	a5,4(a5)
    894a:	e7f7f793          	andi	a5,a5,-385
    894e:	fef42623          	sw	a5,-20(s0)
    tmpreg |= WWDG_Prescaler;
    8952:	fec42703          	lw	a4,-20(s0)
    8956:	fdc42783          	lw	a5,-36(s0)
    895a:	8fd9                	or	a5,a5,a4
    895c:	fef42623          	sw	a5,-20(s0)
    WWDG->CFGR = tmpreg;
    8960:	400037b7          	lui	a5,0x40003
    8964:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    8968:	fec42703          	lw	a4,-20(s0)
    896c:	c3d8                	sw	a4,4(a5)
}
    896e:	0001                	nop
    8970:	5432                	lw	s0,44(sp)
    8972:	6145                	addi	sp,sp,48
    8974:	8082                	ret

00008976 <WWDG_SetWindowValue>:
 *        downcounter,which must be lower than 0x80
 *
 * @return  none
 */
void WWDG_SetWindowValue(uint8_t WindowValue)
{
    8976:	7179                	addi	sp,sp,-48
    8978:	d622                	sw	s0,44(sp)
    897a:	1800                	addi	s0,sp,48
    897c:	87aa                	mv	a5,a0
    897e:	fcf40fa3          	sb	a5,-33(s0)
    __IO uint32_t tmpreg = 0;
    8982:	fe042623          	sw	zero,-20(s0)

    tmpreg = WWDG->CFGR & CFGR_W_Mask;
    8986:	400037b7          	lui	a5,0x40003
    898a:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    898e:	43dc                	lw	a5,4(a5)
    8990:	f807f793          	andi	a5,a5,-128
    8994:	fef42623          	sw	a5,-20(s0)

    tmpreg |= WindowValue & (uint32_t)BIT_Mask;
    8998:	fdf44783          	lbu	a5,-33(s0)
    899c:	07f7f713          	andi	a4,a5,127
    89a0:	fec42783          	lw	a5,-20(s0)
    89a4:	8fd9                	or	a5,a5,a4
    89a6:	fef42623          	sw	a5,-20(s0)

    WWDG->CFGR = tmpreg;
    89aa:	400037b7          	lui	a5,0x40003
    89ae:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    89b2:	fec42703          	lw	a4,-20(s0)
    89b6:	c3d8                	sw	a4,4(a5)
}
    89b8:	0001                	nop
    89ba:	5432                	lw	s0,44(sp)
    89bc:	6145                	addi	sp,sp,48
    89be:	8082                	ret

000089c0 <WWDG_EnableIT>:
 * @brief   Enables the WWDG Early Wakeup interrupt(EWI)
 *
 * @return  none
 */
void WWDG_EnableIT(void)
{
    89c0:	1141                	addi	sp,sp,-16
    89c2:	c622                	sw	s0,12(sp)
    89c4:	0800                	addi	s0,sp,16
    WWDG->CFGR |= (1 << 9);
    89c6:	400037b7          	lui	a5,0x40003
    89ca:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    89ce:	43d8                	lw	a4,4(a5)
    89d0:	400037b7          	lui	a5,0x40003
    89d4:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    89d8:	20076713          	ori	a4,a4,512
    89dc:	c3d8                	sw	a4,4(a5)
}
    89de:	0001                	nop
    89e0:	4432                	lw	s0,12(sp)
    89e2:	0141                	addi	sp,sp,16
    89e4:	8082                	ret

000089e6 <WWDG_SetCounter>:
 *        number between 0x40 and 0x7F
 *
 * @return  none
 */
void WWDG_SetCounter(uint8_t Counter)
{
    89e6:	1101                	addi	sp,sp,-32
    89e8:	ce22                	sw	s0,28(sp)
    89ea:	1000                	addi	s0,sp,32
    89ec:	87aa                	mv	a5,a0
    89ee:	fef407a3          	sb	a5,-17(s0)
    WWDG->CTLR = Counter & BIT_Mask;
    89f2:	fef44703          	lbu	a4,-17(s0)
    89f6:	400037b7          	lui	a5,0x40003
    89fa:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    89fe:	07f77713          	andi	a4,a4,127
    8a02:	c398                	sw	a4,0(a5)
}
    8a04:	0001                	nop
    8a06:	4472                	lw	s0,28(sp)
    8a08:	6105                	addi	sp,sp,32
    8a0a:	8082                	ret

00008a0c <WWDG_Enable>:
 * @param   Counter - specifies the watchdog counter value,which must be a
 *        number between 0x40 and 0x7F
 * @return  none
 */
void WWDG_Enable(uint8_t Counter)
{
    8a0c:	1101                	addi	sp,sp,-32
    8a0e:	ce22                	sw	s0,28(sp)
    8a10:	1000                	addi	s0,sp,32
    8a12:	87aa                	mv	a5,a0
    8a14:	fef407a3          	sb	a5,-17(s0)
    WWDG->CTLR = CTLR_WDGA_Set | Counter;
    8a18:	fef44783          	lbu	a5,-17(s0)
    8a1c:	f807e793          	ori	a5,a5,-128
    8a20:	0ff7f713          	andi	a4,a5,255
    8a24:	400037b7          	lui	a5,0x40003
    8a28:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    8a2c:	c398                	sw	a4,0(a5)
}
    8a2e:	0001                	nop
    8a30:	4472                	lw	s0,28(sp)
    8a32:	6105                	addi	sp,sp,32
    8a34:	8082                	ret

00008a36 <WWDG_GetFlagStatus>:
 * @brief   Checks whether the Early Wakeup interrupt flag is set or not
 *
 * @return  The new state of the Early Wakeup interrupt flag (SET or RESET)
 */
FlagStatus WWDG_GetFlagStatus(void)
{
    8a36:	1141                	addi	sp,sp,-16
    8a38:	c622                	sw	s0,12(sp)
    8a3a:	0800                	addi	s0,sp,16
    return (FlagStatus)(WWDG->STATR);
    8a3c:	400037b7          	lui	a5,0x40003
    8a40:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    8a44:	479c                	lw	a5,8(a5)
}
    8a46:	853e                	mv	a0,a5
    8a48:	4432                	lw	s0,12(sp)
    8a4a:	0141                	addi	sp,sp,16
    8a4c:	8082                	ret

00008a4e <WWDG_ClearFlag>:
 * @brief   Clears Early Wakeup interrupt flag
 *
 * @return  none
 */
void WWDG_ClearFlag(void)
{
    8a4e:	1141                	addi	sp,sp,-16
    8a50:	c622                	sw	s0,12(sp)
    8a52:	0800                	addi	s0,sp,16
    WWDG->STATR = (uint32_t)RESET;
    8a54:	400037b7          	lui	a5,0x40003
    8a58:	c0078793          	addi	a5,a5,-1024 # 40002c00 <_eusrstack+0x1fffec00>
    8a5c:	0007a423          	sw	zero,8(a5)
}
    8a60:	0001                	nop
    8a62:	4432                	lw	s0,12(sp)
    8a64:	0141                	addi	sp,sp,16
    8a66:	8082                	ret

00008a68 <ilog10>:
/*----------------------------------------------*/
#include <math.h>


static int ilog10 (double n)	/* Calculate log10(n) in integer output */
{
    8a68:	7179                	addi	sp,sp,-48
    8a6a:	d606                	sw	ra,44(sp)
    8a6c:	d422                	sw	s0,40(sp)
    8a6e:	1800                	addi	s0,sp,48
    8a70:	fca42c23          	sw	a0,-40(s0)
    8a74:	fcb42e23          	sw	a1,-36(s0)
	int rv = 0;
    8a78:	fe042623          	sw	zero,-20(s0)

	while (n >= 10) {	/* Decimate digit in right shift */
    8a7c:	a8a5                	j	8af4 <ilog10+0x8c>
		if (n >= 100000) {
    8a7e:	67b1                	lui	a5,0xc
    8a80:	0907a603          	lw	a2,144(a5) # c090 <strlen+0x146>
    8a84:	0947a683          	lw	a3,148(a5)
    8a88:	fd842503          	lw	a0,-40(s0)
    8a8c:	fdc42583          	lw	a1,-36(s0)
    8a90:	5da020ef          	jal	ra,b06a <__gedf2>
    8a94:	87aa                	mv	a5,a0
    8a96:	0207c963          	bltz	a5,8ac8 <ilog10+0x60>
			n /= 100000; rv += 5;
    8a9a:	67b1                	lui	a5,0xc
    8a9c:	0907a603          	lw	a2,144(a5) # c090 <strlen+0x146>
    8aa0:	0947a683          	lw	a3,148(a5)
    8aa4:	fd842503          	lw	a0,-40(s0)
    8aa8:	fdc42583          	lw	a1,-36(s0)
    8aac:	7a1010ef          	jal	ra,aa4c <__divdf3>
    8ab0:	87aa                	mv	a5,a0
    8ab2:	882e                	mv	a6,a1
    8ab4:	fcf42c23          	sw	a5,-40(s0)
    8ab8:	fd042e23          	sw	a6,-36(s0)
    8abc:	fec42783          	lw	a5,-20(s0)
    8ac0:	0795                	addi	a5,a5,5
    8ac2:	fef42623          	sw	a5,-20(s0)
    8ac6:	a03d                	j	8af4 <ilog10+0x8c>
		} else {
			n /= 10; rv++;
    8ac8:	67b1                	lui	a5,0xc
    8aca:	0987a603          	lw	a2,152(a5) # c098 <strlen+0x14e>
    8ace:	09c7a683          	lw	a3,156(a5)
    8ad2:	fd842503          	lw	a0,-40(s0)
    8ad6:	fdc42583          	lw	a1,-36(s0)
    8ada:	773010ef          	jal	ra,aa4c <__divdf3>
    8ade:	87aa                	mv	a5,a0
    8ae0:	882e                	mv	a6,a1
    8ae2:	fcf42c23          	sw	a5,-40(s0)
    8ae6:	fd042e23          	sw	a6,-36(s0)
    8aea:	fec42783          	lw	a5,-20(s0)
    8aee:	0785                	addi	a5,a5,1
    8af0:	fef42623          	sw	a5,-20(s0)
	while (n >= 10) {	/* Decimate digit in right shift */
    8af4:	67b1                	lui	a5,0xc
    8af6:	0987a603          	lw	a2,152(a5) # c098 <strlen+0x14e>
    8afa:	09c7a683          	lw	a3,156(a5)
    8afe:	fd842503          	lw	a0,-40(s0)
    8b02:	fdc42583          	lw	a1,-36(s0)
    8b06:	564020ef          	jal	ra,b06a <__gedf2>
    8b0a:	87aa                	mv	a5,a0
    8b0c:	f607d9e3          	bgez	a5,8a7e <ilog10+0x16>
		}
	}
	while (n < 1) {		/* Decimate digit in left shift */
    8b10:	a8a5                	j	8b88 <ilog10+0x120>
		if (n < 0.00001) {
    8b12:	67b1                	lui	a5,0xc
    8b14:	0a07a603          	lw	a2,160(a5) # c0a0 <strlen+0x156>
    8b18:	0a47a683          	lw	a3,164(a5)
    8b1c:	fd842503          	lw	a0,-40(s0)
    8b20:	fdc42583          	lw	a1,-36(s0)
    8b24:	5f4020ef          	jal	ra,b118 <__ledf2>
    8b28:	87aa                	mv	a5,a0
    8b2a:	0207d963          	bgez	a5,8b5c <ilog10+0xf4>
			n *= 100000; rv -= 5;
    8b2e:	67b1                	lui	a5,0xc
    8b30:	0907a603          	lw	a2,144(a5) # c090 <strlen+0x146>
    8b34:	0947a683          	lw	a3,148(a5)
    8b38:	fd842503          	lw	a0,-40(s0)
    8b3c:	fdc42583          	lw	a1,-36(s0)
    8b40:	68e020ef          	jal	ra,b1ce <__muldf3>
    8b44:	87aa                	mv	a5,a0
    8b46:	882e                	mv	a6,a1
    8b48:	fcf42c23          	sw	a5,-40(s0)
    8b4c:	fd042e23          	sw	a6,-36(s0)
    8b50:	fec42783          	lw	a5,-20(s0)
    8b54:	17ed                	addi	a5,a5,-5
    8b56:	fef42623          	sw	a5,-20(s0)
    8b5a:	a03d                	j	8b88 <ilog10+0x120>
		} else {
			n *= 10; rv--;
    8b5c:	67b1                	lui	a5,0xc
    8b5e:	0987a603          	lw	a2,152(a5) # c098 <strlen+0x14e>
    8b62:	09c7a683          	lw	a3,156(a5)
    8b66:	fd842503          	lw	a0,-40(s0)
    8b6a:	fdc42583          	lw	a1,-36(s0)
    8b6e:	660020ef          	jal	ra,b1ce <__muldf3>
    8b72:	87aa                	mv	a5,a0
    8b74:	882e                	mv	a6,a1
    8b76:	fcf42c23          	sw	a5,-40(s0)
    8b7a:	fd042e23          	sw	a6,-36(s0)
    8b7e:	fec42783          	lw	a5,-20(s0)
    8b82:	17fd                	addi	a5,a5,-1
    8b84:	fef42623          	sw	a5,-20(s0)
	while (n < 1) {		/* Decimate digit in left shift */
    8b88:	67b1                	lui	a5,0xc
    8b8a:	0a87a603          	lw	a2,168(a5) # c0a8 <strlen+0x15e>
    8b8e:	0ac7a683          	lw	a3,172(a5)
    8b92:	fd842503          	lw	a0,-40(s0)
    8b96:	fdc42583          	lw	a1,-36(s0)
    8b9a:	57e020ef          	jal	ra,b118 <__ledf2>
    8b9e:	87aa                	mv	a5,a0
    8ba0:	f607c9e3          	bltz	a5,8b12 <ilog10+0xaa>
		}
	}
	return rv;
    8ba4:	fec42783          	lw	a5,-20(s0)
}
    8ba8:	853e                	mv	a0,a5
    8baa:	50b2                	lw	ra,44(sp)
    8bac:	5422                	lw	s0,40(sp)
    8bae:	6145                	addi	sp,sp,48
    8bb0:	8082                	ret

00008bb2 <i10x>:


static double i10x (int n)	/* Calculate 10^n */
{
    8bb2:	7179                	addi	sp,sp,-48
    8bb4:	d606                	sw	ra,44(sp)
    8bb6:	d422                	sw	s0,40(sp)
    8bb8:	1800                	addi	s0,sp,48
    8bba:	fca42e23          	sw	a0,-36(s0)
	double rv = 1;
    8bbe:	67b1                	lui	a5,0xc
    8bc0:	0ac7a803          	lw	a6,172(a5) # c0ac <strlen+0x162>
    8bc4:	0a87a783          	lw	a5,168(a5)
    8bc8:	fef42423          	sw	a5,-24(s0)
    8bcc:	ff042623          	sw	a6,-20(s0)

	while (n > 0) {		/* Left shift */
    8bd0:	a09d                	j	8c36 <i10x+0x84>
		if (n >= 5) {
    8bd2:	fdc42703          	lw	a4,-36(s0)
    8bd6:	4791                	li	a5,4
    8bd8:	02e7d963          	bge	a5,a4,8c0a <i10x+0x58>
			rv *= 100000; n -= 5;
    8bdc:	67b1                	lui	a5,0xc
    8bde:	0907a603          	lw	a2,144(a5) # c090 <strlen+0x146>
    8be2:	0947a683          	lw	a3,148(a5)
    8be6:	fe842503          	lw	a0,-24(s0)
    8bea:	fec42583          	lw	a1,-20(s0)
    8bee:	5e0020ef          	jal	ra,b1ce <__muldf3>
    8bf2:	87aa                	mv	a5,a0
    8bf4:	882e                	mv	a6,a1
    8bf6:	fef42423          	sw	a5,-24(s0)
    8bfa:	ff042623          	sw	a6,-20(s0)
    8bfe:	fdc42783          	lw	a5,-36(s0)
    8c02:	17ed                	addi	a5,a5,-5
    8c04:	fcf42e23          	sw	a5,-36(s0)
    8c08:	a03d                	j	8c36 <i10x+0x84>
		} else {
			rv *= 10; n--;
    8c0a:	67b1                	lui	a5,0xc
    8c0c:	0987a603          	lw	a2,152(a5) # c098 <strlen+0x14e>
    8c10:	09c7a683          	lw	a3,156(a5)
    8c14:	fe842503          	lw	a0,-24(s0)
    8c18:	fec42583          	lw	a1,-20(s0)
    8c1c:	5b2020ef          	jal	ra,b1ce <__muldf3>
    8c20:	87aa                	mv	a5,a0
    8c22:	882e                	mv	a6,a1
    8c24:	fef42423          	sw	a5,-24(s0)
    8c28:	ff042623          	sw	a6,-20(s0)
    8c2c:	fdc42783          	lw	a5,-36(s0)
    8c30:	17fd                	addi	a5,a5,-1
    8c32:	fcf42e23          	sw	a5,-36(s0)
	while (n > 0) {		/* Left shift */
    8c36:	fdc42783          	lw	a5,-36(s0)
    8c3a:	f8f04ce3          	bgtz	a5,8bd2 <i10x+0x20>
		}
	}
	while (n < 0) {		/* Right shift */
    8c3e:	a09d                	j	8ca4 <i10x+0xf2>
		if (n <= -5) {
    8c40:	fdc42703          	lw	a4,-36(s0)
    8c44:	57f1                	li	a5,-4
    8c46:	02f75963          	bge	a4,a5,8c78 <i10x+0xc6>
			rv /= 100000; n += 5;
    8c4a:	67b1                	lui	a5,0xc
    8c4c:	0907a603          	lw	a2,144(a5) # c090 <strlen+0x146>
    8c50:	0947a683          	lw	a3,148(a5)
    8c54:	fe842503          	lw	a0,-24(s0)
    8c58:	fec42583          	lw	a1,-20(s0)
    8c5c:	5f1010ef          	jal	ra,aa4c <__divdf3>
    8c60:	87aa                	mv	a5,a0
    8c62:	882e                	mv	a6,a1
    8c64:	fef42423          	sw	a5,-24(s0)
    8c68:	ff042623          	sw	a6,-20(s0)
    8c6c:	fdc42783          	lw	a5,-36(s0)
    8c70:	0795                	addi	a5,a5,5
    8c72:	fcf42e23          	sw	a5,-36(s0)
    8c76:	a03d                	j	8ca4 <i10x+0xf2>
		} else {
			rv /= 10; n++;
    8c78:	67b1                	lui	a5,0xc
    8c7a:	0987a603          	lw	a2,152(a5) # c098 <strlen+0x14e>
    8c7e:	09c7a683          	lw	a3,156(a5)
    8c82:	fe842503          	lw	a0,-24(s0)
    8c86:	fec42583          	lw	a1,-20(s0)
    8c8a:	5c3010ef          	jal	ra,aa4c <__divdf3>
    8c8e:	87aa                	mv	a5,a0
    8c90:	882e                	mv	a6,a1
    8c92:	fef42423          	sw	a5,-24(s0)
    8c96:	ff042623          	sw	a6,-20(s0)
    8c9a:	fdc42783          	lw	a5,-36(s0)
    8c9e:	0785                	addi	a5,a5,1
    8ca0:	fcf42e23          	sw	a5,-36(s0)
	while (n < 0) {		/* Right shift */
    8ca4:	fdc42783          	lw	a5,-36(s0)
    8ca8:	f807cce3          	bltz	a5,8c40 <i10x+0x8e>
		}
	}
	return rv;
    8cac:	fe842783          	lw	a5,-24(s0)
    8cb0:	fec42803          	lw	a6,-20(s0)
}
    8cb4:	853e                	mv	a0,a5
    8cb6:	85c2                	mv	a1,a6
    8cb8:	50b2                	lw	ra,44(sp)
    8cba:	5422                	lw	s0,40(sp)
    8cbc:	6145                	addi	sp,sp,48
    8cbe:	8082                	ret

00008cc0 <ftoa>:
	char* buf,	/* Buffer to output the generated string */
	double val,	/* Real number to output */
	int prec,	/* Number of fractinal digits */
	char fmt	/* Notation */
)
{
    8cc0:	711d                	addi	sp,sp,-96
    8cc2:	ce86                	sw	ra,92(sp)
    8cc4:	cca2                	sw	s0,88(sp)
    8cc6:	caa6                	sw	s1,84(sp)
    8cc8:	c8ca                	sw	s2,80(sp)
    8cca:	c6ce                	sw	s3,76(sp)
    8ccc:	1080                	addi	s0,sp,96
    8cce:	faa42e23          	sw	a0,-68(s0)
    8cd2:	fab42823          	sw	a1,-80(s0)
    8cd6:	fac42a23          	sw	a2,-76(s0)
    8cda:	fad42c23          	sw	a3,-72(s0)
    8cde:	87ba                	mv	a5,a4
    8ce0:	faf407a3          	sb	a5,-81(s0)
	int d;
	int e = 0, m = 0;
    8ce4:	fc042e23          	sw	zero,-36(s0)
    8ce8:	fc042c23          	sw	zero,-40(s0)
	char sign = 0;
    8cec:	fc040ba3          	sb	zero,-41(s0)
	double w;
	const char *er = 0;
    8cf0:	fc042823          	sw	zero,-48(s0)


	if (isnan(val)) {			/* Not a number? */
    8cf4:	fb042603          	lw	a2,-80(s0)
    8cf8:	fb442683          	lw	a3,-76(s0)
    8cfc:	fb042503          	lw	a0,-80(s0)
    8d00:	fb442583          	lw	a1,-76(s0)
    8d04:	0bc030ef          	jal	ra,bdc0 <__unorddf2>
    8d08:	87aa                	mv	a5,a0
    8d0a:	c799                	beqz	a5,8d18 <ftoa+0x58>
		er = "NaN";
    8d0c:	67b1                	lui	a5,0xc
    8d0e:	fb078793          	addi	a5,a5,-80 # bfb0 <strlen+0x66>
    8d12:	fcf42823          	sw	a5,-48(s0)
    8d16:	a661                	j	909e <ftoa+0x3de>
	} else {
		if (prec < 0) prec = 6;	/* Default precision (6 fractional digits) */
    8d18:	fb842783          	lw	a5,-72(s0)
    8d1c:	0007d563          	bgez	a5,8d26 <ftoa+0x66>
    8d20:	4799                	li	a5,6
    8d22:	faf42c23          	sw	a5,-72(s0)
		if (val < 0) {			/* Nagative value? */
    8d26:	4601                	li	a2,0
    8d28:	4681                	li	a3,0
    8d2a:	fb042503          	lw	a0,-80(s0)
    8d2e:	fb442583          	lw	a1,-76(s0)
    8d32:	3e6020ef          	jal	ra,b118 <__ledf2>
    8d36:	87aa                	mv	a5,a0
    8d38:	0207d263          	bgez	a5,8d5c <ftoa+0x9c>
			val = -val; sign = '-';
    8d3c:	fb042783          	lw	a5,-80(s0)
    8d40:	faf42823          	sw	a5,-80(s0)
    8d44:	fb442703          	lw	a4,-76(s0)
    8d48:	800007b7          	lui	a5,0x80000
    8d4c:	8fb9                	xor	a5,a5,a4
    8d4e:	faf42a23          	sw	a5,-76(s0)
    8d52:	02d00793          	li	a5,45
    8d56:	fcf40ba3          	sb	a5,-41(s0)
    8d5a:	a029                	j	8d64 <ftoa+0xa4>
		} else {
			sign = '+';
    8d5c:	02b00793          	li	a5,43
    8d60:	fcf40ba3          	sb	a5,-41(s0)
		}
		if (isinf(val)) {		/* Infinite? */
    8d64:	fb042903          	lw	s2,-80(s0)
    8d68:	fb442703          	lw	a4,-76(s0)
    8d6c:	800007b7          	lui	a5,0x80000
    8d70:	fff7c793          	not	a5,a5
    8d74:	00f779b3          	and	s3,a4,a5
    8d78:	4485                	li	s1,1
    8d7a:	67b1                	lui	a5,0xc
    8d7c:	0b07a603          	lw	a2,176(a5) # c0b0 <strlen+0x166>
    8d80:	0b47a683          	lw	a3,180(a5)
    8d84:	854a                	mv	a0,s2
    8d86:	85ce                	mv	a1,s3
    8d88:	038030ef          	jal	ra,bdc0 <__unorddf2>
    8d8c:	87aa                	mv	a5,a0
    8d8e:	ef91                	bnez	a5,8daa <ftoa+0xea>
    8d90:	67b1                	lui	a5,0xc
    8d92:	0b07a603          	lw	a2,176(a5) # c0b0 <strlen+0x166>
    8d96:	0b47a683          	lw	a3,180(a5)
    8d9a:	854a                	mv	a0,s2
    8d9c:	85ce                	mv	a1,s3
    8d9e:	37a020ef          	jal	ra,b118 <__ledf2>
    8da2:	87aa                	mv	a5,a0
    8da4:	00f05363          	blez	a5,8daa <ftoa+0xea>
    8da8:	4481                	li	s1,0
    8daa:	0ff4f793          	andi	a5,s1,255
    8dae:	0017c793          	xori	a5,a5,1
    8db2:	0ff7f793          	andi	a5,a5,255
    8db6:	c799                	beqz	a5,8dc4 <ftoa+0x104>
			er = "INF";
    8db8:	67b1                	lui	a5,0xc
    8dba:	fb478793          	addi	a5,a5,-76 # bfb4 <strlen+0x6a>
    8dbe:	fcf42823          	sw	a5,-48(s0)
    8dc2:	a289                	j	8f04 <ftoa+0x244>
		} else {
			if (fmt == 'f') {	/* Decimal notation? */
    8dc4:	faf44703          	lbu	a4,-81(s0)
    8dc8:	06600793          	li	a5,102
    8dcc:	06f71a63          	bne	a4,a5,8e40 <ftoa+0x180>
				val += i10x(-prec) / 2;	/* Round (nearest) */
    8dd0:	fb842783          	lw	a5,-72(s0)
    8dd4:	40f007b3          	neg	a5,a5
    8dd8:	853e                	mv	a0,a5
    8dda:	3be1                	jal	8bb2 <i10x>
    8ddc:	67b1                	lui	a5,0xc
    8dde:	0b87a603          	lw	a2,184(a5) # c0b8 <strlen+0x16e>
    8de2:	0bc7a683          	lw	a3,188(a5)
    8de6:	467010ef          	jal	ra,aa4c <__divdf3>
    8dea:	87aa                	mv	a5,a0
    8dec:	882e                	mv	a6,a1
    8dee:	863e                	mv	a2,a5
    8df0:	86c2                	mv	a3,a6
    8df2:	fb042503          	lw	a0,-80(s0)
    8df6:	fb442583          	lw	a1,-76(s0)
    8dfa:	522010ef          	jal	ra,a31c <__adddf3>
    8dfe:	87aa                	mv	a5,a0
    8e00:	882e                	mv	a6,a1
    8e02:	faf42823          	sw	a5,-80(s0)
    8e06:	fb042a23          	sw	a6,-76(s0)
				m = ilog10(val);
    8e0a:	fb042503          	lw	a0,-80(s0)
    8e0e:	fb442583          	lw	a1,-76(s0)
    8e12:	3999                	jal	8a68 <ilog10>
    8e14:	fca42c23          	sw	a0,-40(s0)
				if (m < 0) m = 0;
    8e18:	fd842783          	lw	a5,-40(s0)
    8e1c:	0007d463          	bgez	a5,8e24 <ftoa+0x164>
    8e20:	fc042c23          	sw	zero,-40(s0)
				if (m + prec + 3 >= SZB_OUTPUT) er = "OV";	/* Buffer overflow? */
    8e24:	fd842703          	lw	a4,-40(s0)
    8e28:	fb842783          	lw	a5,-72(s0)
    8e2c:	973e                	add	a4,a4,a5
    8e2e:	47f1                	li	a5,28
    8e30:	0ce7da63          	bge	a5,a4,8f04 <ftoa+0x244>
    8e34:	67b1                	lui	a5,0xc
    8e36:	fb878793          	addi	a5,a5,-72 # bfb8 <strlen+0x6e>
    8e3a:	fcf42823          	sw	a5,-48(s0)
    8e3e:	a0d9                	j	8f04 <ftoa+0x244>
			} else {			/* E notation */
				if (val != 0) {		/* Not a true zero? */
    8e40:	4601                	li	a2,0
    8e42:	4681                	li	a3,0
    8e44:	fb042503          	lw	a0,-80(s0)
    8e48:	fb442583          	lw	a1,-76(s0)
    8e4c:	1b4020ef          	jal	ra,b000 <__eqdf2>
    8e50:	87aa                	mv	a5,a0
    8e52:	cbcd                	beqz	a5,8f04 <ftoa+0x244>
					val += i10x(ilog10(val) - prec) / 2;	/* Round (nearest) */
    8e54:	fb042503          	lw	a0,-80(s0)
    8e58:	fb442583          	lw	a1,-76(s0)
    8e5c:	3131                	jal	8a68 <ilog10>
    8e5e:	872a                	mv	a4,a0
    8e60:	fb842783          	lw	a5,-72(s0)
    8e64:	40f707b3          	sub	a5,a4,a5
    8e68:	853e                	mv	a0,a5
    8e6a:	33a1                	jal	8bb2 <i10x>
    8e6c:	67b1                	lui	a5,0xc
    8e6e:	0b87a603          	lw	a2,184(a5) # c0b8 <strlen+0x16e>
    8e72:	0bc7a683          	lw	a3,188(a5)
    8e76:	3d7010ef          	jal	ra,aa4c <__divdf3>
    8e7a:	87aa                	mv	a5,a0
    8e7c:	882e                	mv	a6,a1
    8e7e:	863e                	mv	a2,a5
    8e80:	86c2                	mv	a3,a6
    8e82:	fb042503          	lw	a0,-80(s0)
    8e86:	fb442583          	lw	a1,-76(s0)
    8e8a:	492010ef          	jal	ra,a31c <__adddf3>
    8e8e:	87aa                	mv	a5,a0
    8e90:	882e                	mv	a6,a1
    8e92:	faf42823          	sw	a5,-80(s0)
    8e96:	fb042a23          	sw	a6,-76(s0)
					e = ilog10(val);
    8e9a:	fb042503          	lw	a0,-80(s0)
    8e9e:	fb442583          	lw	a1,-76(s0)
    8ea2:	36d9                	jal	8a68 <ilog10>
    8ea4:	fca42e23          	sw	a0,-36(s0)
					if (e > 99 || prec + 6 >= SZB_OUTPUT) {	/* Buffer overflow or E > +99? */
    8ea8:	fdc42703          	lw	a4,-36(s0)
    8eac:	06300793          	li	a5,99
    8eb0:	00e7c763          	blt	a5,a4,8ebe <ftoa+0x1fe>
    8eb4:	fb842703          	lw	a4,-72(s0)
    8eb8:	47e5                	li	a5,25
    8eba:	00e7d863          	bge	a5,a4,8eca <ftoa+0x20a>
						er = "OV";
    8ebe:	67b1                	lui	a5,0xc
    8ec0:	fb878793          	addi	a5,a5,-72 # bfb8 <strlen+0x6e>
    8ec4:	fcf42823          	sw	a5,-48(s0)
    8ec8:	a835                	j	8f04 <ftoa+0x244>
					} else {
						if (e < -99) e = -99;
    8eca:	fdc42703          	lw	a4,-36(s0)
    8ece:	f9d00793          	li	a5,-99
    8ed2:	00f75663          	bge	a4,a5,8ede <ftoa+0x21e>
    8ed6:	f9d00793          	li	a5,-99
    8eda:	fcf42e23          	sw	a5,-36(s0)
						val /= i10x(e);	/* Normalize */
    8ede:	fdc42503          	lw	a0,-36(s0)
    8ee2:	39c1                	jal	8bb2 <i10x>
    8ee4:	87aa                	mv	a5,a0
    8ee6:	882e                	mv	a6,a1
    8ee8:	863e                	mv	a2,a5
    8eea:	86c2                	mv	a3,a6
    8eec:	fb042503          	lw	a0,-80(s0)
    8ef0:	fb442583          	lw	a1,-76(s0)
    8ef4:	359010ef          	jal	ra,aa4c <__divdf3>
    8ef8:	87aa                	mv	a5,a0
    8efa:	882e                	mv	a6,a1
    8efc:	faf42823          	sw	a5,-80(s0)
    8f00:	fb042a23          	sw	a6,-76(s0)
					}
				}
			}
		}
		if (!er) {	/* Not error condition */
    8f04:	fd042783          	lw	a5,-48(s0)
    8f08:	18079b63          	bnez	a5,909e <ftoa+0x3de>
			if (sign == '-') *buf++ = sign;	/* Add a - if negative value */
    8f0c:	fd744703          	lbu	a4,-41(s0)
    8f10:	02d00793          	li	a5,45
    8f14:	00f71c63          	bne	a4,a5,8f2c <ftoa+0x26c>
    8f18:	fbc42783          	lw	a5,-68(s0)
    8f1c:	00178713          	addi	a4,a5,1
    8f20:	fae42e23          	sw	a4,-68(s0)
    8f24:	fd744703          	lbu	a4,-41(s0)
    8f28:	00e78023          	sb	a4,0(a5)
			do {				/* Put decimal number */
				w = i10x(m);				/* Snip the highest digit d */
    8f2c:	fd842503          	lw	a0,-40(s0)
    8f30:	3149                	jal	8bb2 <i10x>
    8f32:	fca42423          	sw	a0,-56(s0)
    8f36:	fcb42623          	sw	a1,-52(s0)
				d = val / w; val -= d * w;
    8f3a:	fc842603          	lw	a2,-56(s0)
    8f3e:	fcc42683          	lw	a3,-52(s0)
    8f42:	fb042503          	lw	a0,-80(s0)
    8f46:	fb442583          	lw	a1,-76(s0)
    8f4a:	303010ef          	jal	ra,aa4c <__divdf3>
    8f4e:	87aa                	mv	a5,a0
    8f50:	882e                	mv	a6,a1
    8f52:	853e                	mv	a0,a5
    8f54:	85c2                	mv	a1,a6
    8f56:	6a7020ef          	jal	ra,bdfc <__fixdfsi>
    8f5a:	87aa                	mv	a5,a0
    8f5c:	fcf42223          	sw	a5,-60(s0)
    8f60:	fc442503          	lw	a0,-60(s0)
    8f64:	701020ef          	jal	ra,be64 <__floatsidf>
    8f68:	87aa                	mv	a5,a0
    8f6a:	882e                	mv	a6,a1
    8f6c:	fc842603          	lw	a2,-56(s0)
    8f70:	fcc42683          	lw	a3,-52(s0)
    8f74:	853e                	mv	a0,a5
    8f76:	85c2                	mv	a1,a6
    8f78:	256020ef          	jal	ra,b1ce <__muldf3>
    8f7c:	87aa                	mv	a5,a0
    8f7e:	882e                	mv	a6,a1
    8f80:	863e                	mv	a2,a5
    8f82:	86c2                	mv	a3,a6
    8f84:	fb042503          	lw	a0,-80(s0)
    8f88:	fb442583          	lw	a1,-76(s0)
    8f8c:	6fa020ef          	jal	ra,b686 <__subdf3>
    8f90:	87aa                	mv	a5,a0
    8f92:	882e                	mv	a6,a1
    8f94:	faf42823          	sw	a5,-80(s0)
    8f98:	fb042a23          	sw	a6,-76(s0)
				if (m == -1) *buf++ = XF_DPC;	/* Insert a decimal separarot if get into fractional part */
    8f9c:	fd842703          	lw	a4,-40(s0)
    8fa0:	57fd                	li	a5,-1
    8fa2:	00f71c63          	bne	a4,a5,8fba <ftoa+0x2fa>
    8fa6:	fbc42783          	lw	a5,-68(s0)
    8faa:	00178713          	addi	a4,a5,1
    8fae:	fae42e23          	sw	a4,-68(s0)
    8fb2:	02e00713          	li	a4,46
    8fb6:	00e78023          	sb	a4,0(a5)
				*buf++ = '0' + d;			/* Put the digit */
    8fba:	fc442783          	lw	a5,-60(s0)
    8fbe:	0ff7f713          	andi	a4,a5,255
    8fc2:	fbc42783          	lw	a5,-68(s0)
    8fc6:	00178693          	addi	a3,a5,1
    8fca:	fad42e23          	sw	a3,-68(s0)
    8fce:	03070713          	addi	a4,a4,48
    8fd2:	0ff77713          	andi	a4,a4,255
    8fd6:	00e78023          	sb	a4,0(a5)
			} while (--m >= -prec);			/* Output all digits specified by prec */
    8fda:	fd842783          	lw	a5,-40(s0)
    8fde:	17fd                	addi	a5,a5,-1
    8fe0:	fcf42c23          	sw	a5,-40(s0)
    8fe4:	fb842783          	lw	a5,-72(s0)
    8fe8:	40f007b3          	neg	a5,a5
    8fec:	fd842703          	lw	a4,-40(s0)
    8ff0:	f2f75ee3          	bge	a4,a5,8f2c <ftoa+0x26c>
			if (fmt != 'f') {	/* Put exponent if needed */
    8ff4:	faf44703          	lbu	a4,-81(s0)
    8ff8:	06600793          	li	a5,102
    8ffc:	0af70163          	beq	a4,a5,909e <ftoa+0x3de>
				*buf++ = fmt;
    9000:	fbc42783          	lw	a5,-68(s0)
    9004:	00178713          	addi	a4,a5,1
    9008:	fae42e23          	sw	a4,-68(s0)
    900c:	faf44703          	lbu	a4,-81(s0)
    9010:	00e78023          	sb	a4,0(a5)
				if (e < 0) {
    9014:	fdc42783          	lw	a5,-36(s0)
    9018:	0207d363          	bgez	a5,903e <ftoa+0x37e>
					e = -e; *buf++ = '-';
    901c:	fdc42783          	lw	a5,-36(s0)
    9020:	40f007b3          	neg	a5,a5
    9024:	fcf42e23          	sw	a5,-36(s0)
    9028:	fbc42783          	lw	a5,-68(s0)
    902c:	00178713          	addi	a4,a5,1
    9030:	fae42e23          	sw	a4,-68(s0)
    9034:	02d00713          	li	a4,45
    9038:	00e78023          	sb	a4,0(a5)
    903c:	a819                	j	9052 <ftoa+0x392>
				} else {
					*buf++ = '+';
    903e:	fbc42783          	lw	a5,-68(s0)
    9042:	00178713          	addi	a4,a5,1
    9046:	fae42e23          	sw	a4,-68(s0)
    904a:	02b00713          	li	a4,43
    904e:	00e78023          	sb	a4,0(a5)
				}
				*buf++ = '0' + e / 10;
    9052:	fdc42703          	lw	a4,-36(s0)
    9056:	47a9                	li	a5,10
    9058:	02f747b3          	div	a5,a4,a5
    905c:	0ff7f713          	andi	a4,a5,255
    9060:	fbc42783          	lw	a5,-68(s0)
    9064:	00178693          	addi	a3,a5,1
    9068:	fad42e23          	sw	a3,-68(s0)
    906c:	03070713          	addi	a4,a4,48
    9070:	0ff77713          	andi	a4,a4,255
    9074:	00e78023          	sb	a4,0(a5)
				*buf++ = '0' + e % 10;
    9078:	fdc42703          	lw	a4,-36(s0)
    907c:	47a9                	li	a5,10
    907e:	02f767b3          	rem	a5,a4,a5
    9082:	0ff7f713          	andi	a4,a5,255
    9086:	fbc42783          	lw	a5,-68(s0)
    908a:	00178693          	addi	a3,a5,1
    908e:	fad42e23          	sw	a3,-68(s0)
    9092:	03070713          	addi	a4,a4,48
    9096:	0ff77713          	andi	a4,a4,255
    909a:	00e78023          	sb	a4,0(a5)
			}
		}
	}
	if (er) {	/* Error condition? */
    909e:	fd042783          	lw	a5,-48(s0)
    90a2:	c3b9                	beqz	a5,90e8 <ftoa+0x428>
		if (sign) *buf++ = sign;		/* Add sign if needed */
    90a4:	fd744783          	lbu	a5,-41(s0)
    90a8:	cb99                	beqz	a5,90be <ftoa+0x3fe>
    90aa:	fbc42783          	lw	a5,-68(s0)
    90ae:	00178713          	addi	a4,a5,1
    90b2:	fae42e23          	sw	a4,-68(s0)
    90b6:	fd744703          	lbu	a4,-41(s0)
    90ba:	00e78023          	sb	a4,0(a5)
		do *buf++ = *er++; while (*er);	/* Put error symbol */
    90be:	fd042703          	lw	a4,-48(s0)
    90c2:	00170793          	addi	a5,a4,1
    90c6:	fcf42823          	sw	a5,-48(s0)
    90ca:	fbc42783          	lw	a5,-68(s0)
    90ce:	00178693          	addi	a3,a5,1
    90d2:	fad42e23          	sw	a3,-68(s0)
    90d6:	00074703          	lbu	a4,0(a4)
    90da:	00e78023          	sb	a4,0(a5)
    90de:	fd042783          	lw	a5,-48(s0)
    90e2:	0007c783          	lbu	a5,0(a5)
    90e6:	ffe1                	bnez	a5,90be <ftoa+0x3fe>
	}
	*buf = 0;	/* Term */
    90e8:	fbc42783          	lw	a5,-68(s0)
    90ec:	00078023          	sb	zero,0(a5)
}
    90f0:	0001                	nop
    90f2:	40f6                	lw	ra,92(sp)
    90f4:	4466                	lw	s0,88(sp)
    90f6:	44d6                	lw	s1,84(sp)
    90f8:	4946                	lw	s2,80(sp)
    90fa:	49b6                	lw	s3,76(sp)
    90fc:	6125                	addi	sp,sp,96
    90fe:	8082                	ret

00009100 <xputc>:
/*----------------------------------------------*/

void xputc (
	int chr				/* Character to be output */
)
{
    9100:	1101                	addi	sp,sp,-32
    9102:	ce06                	sw	ra,28(sp)
    9104:	cc22                	sw	s0,24(sp)
    9106:	1000                	addi	s0,sp,32
    9108:	fea42623          	sw	a0,-20(s0)
	xfputc(xfunc_output, chr);	/* Output it to the default output device */
    910c:	8241a783          	lw	a5,-2012(gp) # 20000044 <xfunc_output>
    9110:	fec42583          	lw	a1,-20(s0)
    9114:	853e                	mv	a0,a5
    9116:	2031                	jal	9122 <xfputc>
}
    9118:	0001                	nop
    911a:	40f2                	lw	ra,28(sp)
    911c:	4462                	lw	s0,24(sp)
    911e:	6105                	addi	sp,sp,32
    9120:	8082                	ret

00009122 <xfputc>:

void xfputc (			/* Put a character to the specified device */
	void(*func)(int),	/* Pointer to the output function (null:strptr) */
	int chr				/* Character to be output */
)
{
    9122:	1101                	addi	sp,sp,-32
    9124:	ce06                	sw	ra,28(sp)
    9126:	cc22                	sw	s0,24(sp)
    9128:	1000                	addi	s0,sp,32
    912a:	fea42623          	sw	a0,-20(s0)
    912e:	feb42423          	sw	a1,-24(s0)
	if (XF_CRLF && chr == '\n') xfputc(func, '\r');	/* CR -> CRLF */
    9132:	fe842703          	lw	a4,-24(s0)
    9136:	47a9                	li	a5,10
    9138:	00f71663          	bne	a4,a5,9144 <xfputc+0x22>
    913c:	45b5                	li	a1,13
    913e:	fec42503          	lw	a0,-20(s0)
    9142:	37c5                	jal	9122 <xfputc>

	if (func) {
    9144:	fec42783          	lw	a5,-20(s0)
    9148:	c799                	beqz	a5,9156 <xfputc+0x34>
		func(chr);		/* Write a character to the output device */
    914a:	fec42783          	lw	a5,-20(s0)
    914e:	fe842503          	lw	a0,-24(s0)
    9152:	9782                	jalr	a5
	} else if (strptr) {
		 *strptr++ = chr;	/* Write a character to the memory */
	}
}
    9154:	a005                	j	9174 <xfputc+0x52>
	} else if (strptr) {
    9156:	8201a783          	lw	a5,-2016(gp) # 20000040 <strptr>
    915a:	cf89                	beqz	a5,9174 <xfputc+0x52>
		 *strptr++ = chr;	/* Write a character to the memory */
    915c:	8201a783          	lw	a5,-2016(gp) # 20000040 <strptr>
    9160:	00178693          	addi	a3,a5,1
    9164:	82d1a023          	sw	a3,-2016(gp) # 20000040 <strptr>
    9168:	fe842703          	lw	a4,-24(s0)
    916c:	0ff77713          	andi	a4,a4,255
    9170:	00e78023          	sb	a4,0(a5)
}
    9174:	0001                	nop
    9176:	40f2                	lw	ra,28(sp)
    9178:	4462                	lw	s0,24(sp)
    917a:	6105                	addi	sp,sp,32
    917c:	8082                	ret

0000917e <xputs>:
/*----------------------------------------------*/

void xputs (			/* Put a string to the default device */
	const char* str		/* Pointer to the string */
)
{
    917e:	1101                	addi	sp,sp,-32
    9180:	ce06                	sw	ra,28(sp)
    9182:	cc22                	sw	s0,24(sp)
    9184:	1000                	addi	s0,sp,32
    9186:	fea42623          	sw	a0,-20(s0)
	xfputs(xfunc_output, str);
    918a:	8241a783          	lw	a5,-2012(gp) # 20000044 <xfunc_output>
    918e:	fec42583          	lw	a1,-20(s0)
    9192:	853e                	mv	a0,a5
    9194:	2031                	jal	91a0 <xfputs>
}
    9196:	0001                	nop
    9198:	40f2                	lw	ra,28(sp)
    919a:	4462                	lw	s0,24(sp)
    919c:	6105                	addi	sp,sp,32
    919e:	8082                	ret

000091a0 <xfputs>:

void xfputs (			/* Put a string to the specified device */
	void(*func)(int),	/* Pointer to the output function */
	const char*	str		/* Pointer to the string */
)
{
    91a0:	1101                	addi	sp,sp,-32
    91a2:	ce06                	sw	ra,28(sp)
    91a4:	cc22                	sw	s0,24(sp)
    91a6:	1000                	addi	s0,sp,32
    91a8:	fea42623          	sw	a0,-20(s0)
    91ac:	feb42423          	sw	a1,-24(s0)
	while (*str) {			/* Put the string */
    91b0:	a829                	j	91ca <xfputs+0x2a>
		xfputc(func, *str++);
    91b2:	fe842783          	lw	a5,-24(s0)
    91b6:	00178713          	addi	a4,a5,1
    91ba:	fee42423          	sw	a4,-24(s0)
    91be:	0007c783          	lbu	a5,0(a5)
    91c2:	85be                	mv	a1,a5
    91c4:	fec42503          	lw	a0,-20(s0)
    91c8:	3fa9                	jal	9122 <xfputc>
	while (*str) {			/* Put the string */
    91ca:	fe842783          	lw	a5,-24(s0)
    91ce:	0007c783          	lbu	a5,0(a5)
    91d2:	f3e5                	bnez	a5,91b2 <xfputs+0x12>
	}
}
    91d4:	0001                	nop
    91d6:	40f2                	lw	ra,28(sp)
    91d8:	4462                	lw	s0,24(sp)
    91da:	6105                	addi	sp,sp,32
    91dc:	8082                	ret

000091de <xvfprintf>:
static void xvfprintf (
	void(*func)(int),	/* Pointer to the output function */
	const char*	fmt,	/* Pointer to the format string */
	va_list arp			/* Pointer to arguments */
)
{
    91de:	7135                	addi	sp,sp,-160
    91e0:	cf06                	sw	ra,156(sp)
    91e2:	cd22                	sw	s0,152(sp)
    91e4:	cb4a                	sw	s2,148(sp)
    91e6:	c94e                	sw	s3,144(sp)
    91e8:	c752                	sw	s4,140(sp)
    91ea:	c556                	sw	s5,136(sp)
    91ec:	c35a                	sw	s6,132(sp)
    91ee:	c15e                	sw	s7,128(sp)
    91f0:	dee2                	sw	s8,124(sp)
    91f2:	dce6                	sw	s9,120(sp)
    91f4:	1100                	addi	s0,sp,160
    91f6:	f6a42623          	sw	a0,-148(s0)
    91fa:	f6b42423          	sw	a1,-152(s0)
    91fe:	f6c42223          	sw	a2,-156(s0)
	long v;
	unsigned long uv;
#endif

	for (;;) {
		c = *fmt++;					/* Get a format character */
    9202:	f6842783          	lw	a5,-152(s0)
    9206:	00178713          	addi	a4,a5,1
    920a:	f6e42423          	sw	a4,-152(s0)
    920e:	0007c783          	lbu	a5,0(a5)
    9212:	faf409a3          	sb	a5,-77(s0)
		if (!c) break;				/* End of format? */
    9216:	fb344783          	lbu	a5,-77(s0)
    921a:	66078563          	beqz	a5,9884 <xvfprintf+0x6a6>
		if (c != '%') {				/* Pass it through if not a % sequense */
    921e:	fb344703          	lbu	a4,-77(s0)
    9222:	02500793          	li	a5,37
    9226:	00f70963          	beq	a4,a5,9238 <xvfprintf+0x5a>
			xfputc(func, c); continue;
    922a:	fb344783          	lbu	a5,-77(s0)
    922e:	85be                	mv	a1,a5
    9230:	f6c42503          	lw	a0,-148(s0)
    9234:	35fd                	jal	9122 <xfputc>
    9236:	a5b1                	j	9882 <xvfprintf+0x6a4>
		}
		f = w = 0;			 		/* Clear parms */
    9238:	fc042023          	sw	zero,-64(s0)
    923c:	fc042783          	lw	a5,-64(s0)
    9240:	faf42e23          	sw	a5,-68(s0)
		pad = ' '; prec = -1;
    9244:	02000793          	li	a5,32
    9248:	faf405a3          	sb	a5,-85(s0)
    924c:	57fd                	li	a5,-1
    924e:	faf42a23          	sw	a5,-76(s0)
		c = *fmt++;					/* Get first char of the sequense */
    9252:	f6842783          	lw	a5,-152(s0)
    9256:	00178713          	addi	a4,a5,1
    925a:	f6e42423          	sw	a4,-152(s0)
    925e:	0007c783          	lbu	a5,0(a5)
    9262:	faf409a3          	sb	a5,-77(s0)
		if (c == '0') {				/* Flag: left '0' padded */
    9266:	fb344703          	lbu	a4,-77(s0)
    926a:	03000793          	li	a5,48
    926e:	02f71163          	bne	a4,a5,9290 <xvfprintf+0xb2>
			pad = '0'; c = *fmt++;
    9272:	03000793          	li	a5,48
    9276:	faf405a3          	sb	a5,-85(s0)
    927a:	f6842783          	lw	a5,-152(s0)
    927e:	00178713          	addi	a4,a5,1
    9282:	f6e42423          	sw	a4,-152(s0)
    9286:	0007c783          	lbu	a5,0(a5)
    928a:	faf409a3          	sb	a5,-77(s0)
    928e:	a025                	j	92b6 <xvfprintf+0xd8>
		} else {
			if (c == '-') {			/* Flag: left justified */
    9290:	fb344703          	lbu	a4,-77(s0)
    9294:	02d00793          	li	a5,45
    9298:	00f71f63          	bne	a4,a5,92b6 <xvfprintf+0xd8>
				f = 2; c = *fmt++;
    929c:	4789                	li	a5,2
    929e:	faf42e23          	sw	a5,-68(s0)
    92a2:	f6842783          	lw	a5,-152(s0)
    92a6:	00178713          	addi	a4,a5,1
    92aa:	f6e42423          	sw	a4,-152(s0)
    92ae:	0007c783          	lbu	a5,0(a5)
    92b2:	faf409a3          	sb	a5,-77(s0)
			}
		}
		if (c == '*') {				/* Minimum width from an argument */
    92b6:	fb344703          	lbu	a4,-77(s0)
    92ba:	02a00793          	li	a5,42
    92be:	06f71f63          	bne	a4,a5,933c <xvfprintf+0x15e>
			n = va_arg(arp, int);
    92c2:	f6442783          	lw	a5,-156(s0)
    92c6:	00478713          	addi	a4,a5,4
    92ca:	f6e42223          	sw	a4,-156(s0)
    92ce:	439c                	lw	a5,0(a5)
    92d0:	faf42c23          	sw	a5,-72(s0)
			if (n < 0) {			/* Flag: left justified */
    92d4:	fb842783          	lw	a5,-72(s0)
    92d8:	0007db63          	bgez	a5,92ee <xvfprintf+0x110>
				n = 0 - n; f = 2;
    92dc:	fb842783          	lw	a5,-72(s0)
    92e0:	40f007b3          	neg	a5,a5
    92e4:	faf42c23          	sw	a5,-72(s0)
    92e8:	4789                	li	a5,2
    92ea:	faf42e23          	sw	a5,-68(s0)
			}
			w = n; c = *fmt++;
    92ee:	fb842783          	lw	a5,-72(s0)
    92f2:	fcf42023          	sw	a5,-64(s0)
    92f6:	f6842783          	lw	a5,-152(s0)
    92fa:	00178713          	addi	a4,a5,1
    92fe:	f6e42423          	sw	a4,-152(s0)
    9302:	0007c783          	lbu	a5,0(a5)
    9306:	faf409a3          	sb	a5,-77(s0)
    930a:	a0a9                	j	9354 <xvfprintf+0x176>
		} else {
			while (c >= '0' && c <= '9') {	/* Minimum width */
				w = w * 10 + c - '0';
    930c:	fc042703          	lw	a4,-64(s0)
    9310:	87ba                	mv	a5,a4
    9312:	078a                	slli	a5,a5,0x2
    9314:	97ba                	add	a5,a5,a4
    9316:	0786                	slli	a5,a5,0x1
    9318:	873e                	mv	a4,a5
    931a:	fb344783          	lbu	a5,-77(s0)
    931e:	97ba                	add	a5,a5,a4
    9320:	fd078793          	addi	a5,a5,-48
    9324:	fcf42023          	sw	a5,-64(s0)
				c = *fmt++;
    9328:	f6842783          	lw	a5,-152(s0)
    932c:	00178713          	addi	a4,a5,1
    9330:	f6e42423          	sw	a4,-152(s0)
    9334:	0007c783          	lbu	a5,0(a5)
    9338:	faf409a3          	sb	a5,-77(s0)
			while (c >= '0' && c <= '9') {	/* Minimum width */
    933c:	fb344703          	lbu	a4,-77(s0)
    9340:	02f00793          	li	a5,47
    9344:	00e7f863          	bgeu	a5,a4,9354 <xvfprintf+0x176>
    9348:	fb344703          	lbu	a4,-77(s0)
    934c:	03900793          	li	a5,57
    9350:	fae7fee3          	bgeu	a5,a4,930c <xvfprintf+0x12e>
			}
		}
		if (c == '.') {				/* Precision */
    9354:	fb344703          	lbu	a4,-77(s0)
    9358:	02e00793          	li	a5,46
    935c:	08f71d63          	bne	a4,a5,93f6 <xvfprintf+0x218>
			c = *fmt++;
    9360:	f6842783          	lw	a5,-152(s0)
    9364:	00178713          	addi	a4,a5,1
    9368:	f6e42423          	sw	a4,-152(s0)
    936c:	0007c783          	lbu	a5,0(a5)
    9370:	faf409a3          	sb	a5,-77(s0)
			if (c == '*') {				/* Precision from an argument */
    9374:	fb344703          	lbu	a4,-77(s0)
    9378:	02a00793          	li	a5,42
    937c:	02f71663          	bne	a4,a5,93a8 <xvfprintf+0x1ca>
				prec = va_arg(arp, int);
    9380:	f6442783          	lw	a5,-156(s0)
    9384:	00478713          	addi	a4,a5,4
    9388:	f6e42223          	sw	a4,-156(s0)
    938c:	439c                	lw	a5,0(a5)
    938e:	faf42a23          	sw	a5,-76(s0)
				c = *fmt++;
    9392:	f6842783          	lw	a5,-152(s0)
    9396:	00178713          	addi	a4,a5,1
    939a:	f6e42423          	sw	a4,-152(s0)
    939e:	0007c783          	lbu	a5,0(a5)
    93a2:	faf409a3          	sb	a5,-77(s0)
    93a6:	a881                	j	93f6 <xvfprintf+0x218>
			} else {
				prec = 0;
    93a8:	fa042a23          	sw	zero,-76(s0)
				while (c >= '0' && c <= '9') {
    93ac:	a80d                	j	93de <xvfprintf+0x200>
					prec = prec * 10 + c - '0';
    93ae:	fb442703          	lw	a4,-76(s0)
    93b2:	87ba                	mv	a5,a4
    93b4:	078a                	slli	a5,a5,0x2
    93b6:	97ba                	add	a5,a5,a4
    93b8:	0786                	slli	a5,a5,0x1
    93ba:	873e                	mv	a4,a5
    93bc:	fb344783          	lbu	a5,-77(s0)
    93c0:	97ba                	add	a5,a5,a4
    93c2:	fd078793          	addi	a5,a5,-48
    93c6:	faf42a23          	sw	a5,-76(s0)
					c = *fmt++;
    93ca:	f6842783          	lw	a5,-152(s0)
    93ce:	00178713          	addi	a4,a5,1
    93d2:	f6e42423          	sw	a4,-152(s0)
    93d6:	0007c783          	lbu	a5,0(a5)
    93da:	faf409a3          	sb	a5,-77(s0)
				while (c >= '0' && c <= '9') {
    93de:	fb344703          	lbu	a4,-77(s0)
    93e2:	02f00793          	li	a5,47
    93e6:	00e7f863          	bgeu	a5,a4,93f6 <xvfprintf+0x218>
    93ea:	fb344703          	lbu	a4,-77(s0)
    93ee:	03900793          	li	a5,57
    93f2:	fae7fee3          	bgeu	a5,a4,93ae <xvfprintf+0x1d0>
				}
			}
		}
		if (c == 'l') {		/* Prefix: Size is long */
    93f6:	fb344703          	lbu	a4,-77(s0)
    93fa:	06c00793          	li	a5,108
    93fe:	04f71863          	bne	a4,a5,944e <xvfprintf+0x270>
			f |= 4; c = *fmt++;
    9402:	fbc42783          	lw	a5,-68(s0)
    9406:	0047e793          	ori	a5,a5,4
    940a:	faf42e23          	sw	a5,-68(s0)
    940e:	f6842783          	lw	a5,-152(s0)
    9412:	00178713          	addi	a4,a5,1
    9416:	f6e42423          	sw	a4,-152(s0)
    941a:	0007c783          	lbu	a5,0(a5)
    941e:	faf409a3          	sb	a5,-77(s0)
#if XF_USE_LLI
			if (c == 'l') {	/* Prefix: Size is long long */
    9422:	fb344703          	lbu	a4,-77(s0)
    9426:	06c00793          	li	a5,108
    942a:	02f71263          	bne	a4,a5,944e <xvfprintf+0x270>
				f |= 8; c = *fmt++;
    942e:	fbc42783          	lw	a5,-68(s0)
    9432:	0087e793          	ori	a5,a5,8
    9436:	faf42e23          	sw	a5,-68(s0)
    943a:	f6842783          	lw	a5,-152(s0)
    943e:	00178713          	addi	a4,a5,1
    9442:	f6e42423          	sw	a4,-152(s0)
    9446:	0007c783          	lbu	a5,0(a5)
    944a:	faf409a3          	sb	a5,-77(s0)
			}
#endif
		}
		if (!c) break;				/* End of format? */
    944e:	fb344783          	lbu	a5,-77(s0)
    9452:	42078b63          	beqz	a5,9888 <xvfprintf+0x6aa>
		switch (c) {				/* Type is... */
    9456:	fb344783          	lbu	a5,-77(s0)
    945a:	fbb78793          	addi	a5,a5,-69
    945e:	03300713          	li	a4,51
    9462:	1cf76563          	bltu	a4,a5,962c <xvfprintf+0x44e>
    9466:	00279713          	slli	a4,a5,0x2
    946a:	67b1                	lui	a5,0xc
    946c:	fc078793          	addi	a5,a5,-64 # bfc0 <strlen+0x76>
    9470:	97ba                	add	a5,a5,a4
    9472:	439c                	lw	a5,0(a5)
    9474:	8782                	jr	a5
		case 'b':					/* Unsigned binary */
			r = 2; break;
    9476:	4789                	li	a5,2
    9478:	fcf42623          	sw	a5,-52(s0)
    947c:	aa7d                	j	963a <xvfprintf+0x45c>
		case 'o':					/* Unsigned octal */
			r = 8; break;
    947e:	47a1                	li	a5,8
    9480:	fcf42623          	sw	a5,-52(s0)
    9484:	aa5d                	j	963a <xvfprintf+0x45c>
		case 'd':					/* Signed decimal */
		case 'u':					/* Unsigned decimal */
			r = 10; break;
    9486:	47a9                	li	a5,10
    9488:	fcf42623          	sw	a5,-52(s0)
    948c:	a27d                	j	963a <xvfprintf+0x45c>
		case 'x':					/* Hexdecimal (lower case) */
		case 'X':					/* Hexdecimal (upper case) */
			r = 16; break;
    948e:	47c1                	li	a5,16
    9490:	fcf42623          	sw	a5,-52(s0)
    9494:	a25d                	j	963a <xvfprintf+0x45c>
		case 'c':					/* A character */
			xfputc(func, (char)va_arg(arp, int)); continue;
    9496:	f6442783          	lw	a5,-156(s0)
    949a:	00478713          	addi	a4,a5,4
    949e:	f6e42223          	sw	a4,-156(s0)
    94a2:	439c                	lw	a5,0(a5)
    94a4:	0ff7f793          	andi	a5,a5,255
    94a8:	85be                	mv	a1,a5
    94aa:	f6c42503          	lw	a0,-148(s0)
    94ae:	3995                	jal	9122 <xfputc>
    94b0:	aec9                	j	9882 <xvfprintf+0x6a4>
		case 's':					/* String */
			p = va_arg(arp, char*);		/* Get a pointer argument */
    94b2:	f6442783          	lw	a5,-156(s0)
    94b6:	00478713          	addi	a4,a5,4
    94ba:	f6e42223          	sw	a4,-156(s0)
    94be:	439c                	lw	a5,0(a5)
    94c0:	faf42623          	sw	a5,-84(s0)
			if (!p) p = "";				/* Null ptr generates a null string */
    94c4:	fac42783          	lw	a5,-84(s0)
    94c8:	e791                	bnez	a5,94d4 <xvfprintf+0x2f6>
    94ca:	67b1                	lui	a5,0xc
    94cc:	fbc78793          	addi	a5,a5,-68 # bfbc <strlen+0x72>
    94d0:	faf42623          	sw	a5,-84(s0)
			j = strlen(p);
    94d4:	fac42503          	lw	a0,-84(s0)
    94d8:	273020ef          	jal	ra,bf4a <strlen>
    94dc:	fca42223          	sw	a0,-60(s0)
			if (prec >= 0 && j > (unsigned int)prec) j = prec;	/* Limited length of string body */
    94e0:	fb442783          	lw	a5,-76(s0)
    94e4:	0207c863          	bltz	a5,9514 <xvfprintf+0x336>
    94e8:	fb442783          	lw	a5,-76(s0)
    94ec:	fc442703          	lw	a4,-60(s0)
    94f0:	02e7f263          	bgeu	a5,a4,9514 <xvfprintf+0x336>
    94f4:	fb442783          	lw	a5,-76(s0)
    94f8:	fcf42223          	sw	a5,-60(s0)
			for ( ; !(f & 2) && j < w; j++) xfputc(func, pad);	/* Left pads */
    94fc:	a821                	j	9514 <xvfprintf+0x336>
    94fe:	fab44783          	lbu	a5,-85(s0)
    9502:	85be                	mv	a1,a5
    9504:	f6c42503          	lw	a0,-148(s0)
    9508:	3929                	jal	9122 <xfputc>
    950a:	fc442783          	lw	a5,-60(s0)
    950e:	0785                	addi	a5,a5,1
    9510:	fcf42223          	sw	a5,-60(s0)
    9514:	fbc42783          	lw	a5,-68(s0)
    9518:	8b89                	andi	a5,a5,2
    951a:	e785                	bnez	a5,9542 <xvfprintf+0x364>
    951c:	fc442703          	lw	a4,-60(s0)
    9520:	fc042783          	lw	a5,-64(s0)
    9524:	fcf76de3          	bltu	a4,a5,94fe <xvfprintf+0x320>
			while (*p && prec--) xfputc(func, *p++);/* String body */
    9528:	a829                	j	9542 <xvfprintf+0x364>
    952a:	fac42783          	lw	a5,-84(s0)
    952e:	00178713          	addi	a4,a5,1
    9532:	fae42623          	sw	a4,-84(s0)
    9536:	0007c783          	lbu	a5,0(a5)
    953a:	85be                	mv	a1,a5
    953c:	f6c42503          	lw	a0,-148(s0)
    9540:	36cd                	jal	9122 <xfputc>
    9542:	fac42783          	lw	a5,-84(s0)
    9546:	0007c783          	lbu	a5,0(a5)
    954a:	cf91                	beqz	a5,9566 <xvfprintf+0x388>
    954c:	fb442783          	lw	a5,-76(s0)
    9550:	fff78713          	addi	a4,a5,-1
    9554:	fae42a23          	sw	a4,-76(s0)
    9558:	fbe9                	bnez	a5,952a <xvfprintf+0x34c>
			while (j++ < w) xfputc(func, ' ');		/* Right pads */
    955a:	a031                	j	9566 <xvfprintf+0x388>
    955c:	02000593          	li	a1,32
    9560:	f6c42503          	lw	a0,-148(s0)
    9564:	3e7d                	jal	9122 <xfputc>
    9566:	fc442783          	lw	a5,-60(s0)
    956a:	00178713          	addi	a4,a5,1
    956e:	fce42223          	sw	a4,-60(s0)
    9572:	fc042703          	lw	a4,-64(s0)
    9576:	fee7e3e3          	bltu	a5,a4,955c <xvfprintf+0x37e>
			continue;
    957a:	a621                	j	9882 <xvfprintf+0x6a4>
#if XF_USE_FP
		case 'f':					/* Float (decimal) */
		case 'e':					/* Float (e) */
		case 'E':					/* Float (E) */
			ftoa(p = str, va_arg(arp, double), prec, c);	/* Make fp string */
    957c:	f7840793          	addi	a5,s0,-136
    9580:	faf42623          	sw	a5,-84(s0)
    9584:	f6442783          	lw	a5,-156(s0)
    9588:	079d                	addi	a5,a5,7
    958a:	9be1                	andi	a5,a5,-8
    958c:	00878713          	addi	a4,a5,8
    9590:	f6e42223          	sw	a4,-156(s0)
    9594:	0047a803          	lw	a6,4(a5)
    9598:	439c                	lw	a5,0(a5)
    959a:	fb344703          	lbu	a4,-77(s0)
    959e:	fb442683          	lw	a3,-76(s0)
    95a2:	85be                	mv	a1,a5
    95a4:	8642                	mv	a2,a6
    95a6:	fac42503          	lw	a0,-84(s0)
    95aa:	f16ff0ef          	jal	ra,8cc0 <ftoa>
			for (j = strlen(p); !(f & 2) && j < w; j++) xfputc(func, pad);	/* Left pads */
    95ae:	fac42503          	lw	a0,-84(s0)
    95b2:	199020ef          	jal	ra,bf4a <strlen>
    95b6:	fca42223          	sw	a0,-60(s0)
    95ba:	a821                	j	95d2 <xvfprintf+0x3f4>
    95bc:	fab44783          	lbu	a5,-85(s0)
    95c0:	85be                	mv	a1,a5
    95c2:	f6c42503          	lw	a0,-148(s0)
    95c6:	3eb1                	jal	9122 <xfputc>
    95c8:	fc442783          	lw	a5,-60(s0)
    95cc:	0785                	addi	a5,a5,1
    95ce:	fcf42223          	sw	a5,-60(s0)
    95d2:	fbc42783          	lw	a5,-68(s0)
    95d6:	8b89                	andi	a5,a5,2
    95d8:	e785                	bnez	a5,9600 <xvfprintf+0x422>
    95da:	fc442703          	lw	a4,-60(s0)
    95de:	fc042783          	lw	a5,-64(s0)
    95e2:	fcf76de3          	bltu	a4,a5,95bc <xvfprintf+0x3de>
			while (*p) xfputc(func, *p++);		/* Value */
    95e6:	a829                	j	9600 <xvfprintf+0x422>
    95e8:	fac42783          	lw	a5,-84(s0)
    95ec:	00178713          	addi	a4,a5,1
    95f0:	fae42623          	sw	a4,-84(s0)
    95f4:	0007c783          	lbu	a5,0(a5)
    95f8:	85be                	mv	a1,a5
    95fa:	f6c42503          	lw	a0,-148(s0)
    95fe:	3615                	jal	9122 <xfputc>
    9600:	fac42783          	lw	a5,-84(s0)
    9604:	0007c783          	lbu	a5,0(a5)
    9608:	f3e5                	bnez	a5,95e8 <xvfprintf+0x40a>
			while (j++ < w) xfputc(func, ' ');	/* Right pads */
    960a:	a031                	j	9616 <xvfprintf+0x438>
    960c:	02000593          	li	a1,32
    9610:	f6c42503          	lw	a0,-148(s0)
    9614:	3639                	jal	9122 <xfputc>
    9616:	fc442783          	lw	a5,-60(s0)
    961a:	00178713          	addi	a4,a5,1
    961e:	fce42223          	sw	a4,-60(s0)
    9622:	fc042703          	lw	a4,-64(s0)
    9626:	fee7e3e3          	bltu	a5,a4,960c <xvfprintf+0x42e>
			continue;
    962a:	aca1                	j	9882 <xvfprintf+0x6a4>
#endif
		default:					/* Unknown type (passthrough) */
			xfputc(func, c); continue;
    962c:	fb344783          	lbu	a5,-77(s0)
    9630:	85be                	mv	a1,a5
    9632:	f6c42503          	lw	a0,-148(s0)
    9636:	34f5                	jal	9122 <xfputc>
    9638:	a4a9                	j	9882 <xvfprintf+0x6a4>
		}

		/* Get an integer argument and put it in numeral */
#if XF_USE_LLI
		if (f & 8) {	/* long long argument? */
    963a:	fbc42783          	lw	a5,-68(s0)
    963e:	8ba1                	andi	a5,a5,8
    9640:	c38d                	beqz	a5,9662 <xvfprintf+0x484>
			v = (long long)va_arg(arp, long long);
    9642:	f6442783          	lw	a5,-156(s0)
    9646:	079d                	addi	a5,a5,7
    9648:	9be1                	andi	a5,a5,-8
    964a:	00878713          	addi	a4,a5,8
    964e:	f6e42223          	sw	a4,-156(s0)
    9652:	0047a803          	lw	a6,4(a5)
    9656:	439c                	lw	a5,0(a5)
    9658:	faf42023          	sw	a5,-96(s0)
    965c:	fb042223          	sw	a6,-92(s0)
    9660:	a051                	j	96e4 <xvfprintf+0x506>
		} else {
			if (f & 4) {	/* long argument? */
    9662:	fbc42783          	lw	a5,-68(s0)
    9666:	8b91                	andi	a5,a5,4
    9668:	c3a1                	beqz	a5,96a8 <xvfprintf+0x4ca>
				v = (c == 'd') ? (long long)va_arg(arp, long) : (long long)va_arg(arp, unsigned long);
    966a:	fb344703          	lbu	a4,-77(s0)
    966e:	06400793          	li	a5,100
    9672:	00f71d63          	bne	a4,a5,968c <xvfprintf+0x4ae>
    9676:	f6442783          	lw	a5,-156(s0)
    967a:	00478713          	addi	a4,a5,4
    967e:	f6e42223          	sw	a4,-156(s0)
    9682:	439c                	lw	a5,0(a5)
    9684:	893e                	mv	s2,a5
    9686:	87fd                	srai	a5,a5,0x1f
    9688:	89be                	mv	s3,a5
    968a:	a811                	j	969e <xvfprintf+0x4c0>
    968c:	f6442783          	lw	a5,-156(s0)
    9690:	00478713          	addi	a4,a5,4
    9694:	f6e42223          	sw	a4,-156(s0)
    9698:	439c                	lw	a5,0(a5)
    969a:	893e                	mv	s2,a5
    969c:	4981                	li	s3,0
    969e:	fb242023          	sw	s2,-96(s0)
    96a2:	fb342223          	sw	s3,-92(s0)
    96a6:	a83d                	j	96e4 <xvfprintf+0x506>
			} else {		/* int/short/char argument */
				v = (c == 'd') ? (long long)va_arg(arp, int) : (long long)va_arg(arp, unsigned int);
    96a8:	fb344703          	lbu	a4,-77(s0)
    96ac:	06400793          	li	a5,100
    96b0:	00f71d63          	bne	a4,a5,96ca <xvfprintf+0x4ec>
    96b4:	f6442783          	lw	a5,-156(s0)
    96b8:	00478713          	addi	a4,a5,4
    96bc:	f6e42223          	sw	a4,-156(s0)
    96c0:	439c                	lw	a5,0(a5)
    96c2:	8a3e                	mv	s4,a5
    96c4:	87fd                	srai	a5,a5,0x1f
    96c6:	8abe                	mv	s5,a5
    96c8:	a811                	j	96dc <xvfprintf+0x4fe>
    96ca:	f6442783          	lw	a5,-156(s0)
    96ce:	00478713          	addi	a4,a5,4
    96d2:	f6e42223          	sw	a4,-156(s0)
    96d6:	439c                	lw	a5,0(a5)
    96d8:	8a3e                	mv	s4,a5
    96da:	4a81                	li	s5,0
    96dc:	fb442023          	sw	s4,-96(s0)
    96e0:	fb542223          	sw	s5,-92(s0)
			v = (long)va_arg(arp, long);
		} else {		/* int/short/char argument */
			v = (c == 'd') ? (long)va_arg(arp, int) : (long)va_arg(arp, unsigned int);
		}
#endif
		if (c == 'd' && v < 0) {	/* Negative value? */
    96e4:	fb344703          	lbu	a4,-77(s0)
    96e8:	06400793          	li	a5,100
    96ec:	04f71063          	bne	a4,a5,972c <xvfprintf+0x54e>
    96f0:	fa442783          	lw	a5,-92(s0)
    96f4:	0207dc63          	bgez	a5,972c <xvfprintf+0x54e>
			v = 0 - v; f |= 1;
    96f8:	4681                	li	a3,0
    96fa:	4701                	li	a4,0
    96fc:	fa042583          	lw	a1,-96(s0)
    9700:	fa442603          	lw	a2,-92(s0)
    9704:	40b687b3          	sub	a5,a3,a1
    9708:	853e                	mv	a0,a5
    970a:	00a6b533          	sltu	a0,a3,a0
    970e:	40c70833          	sub	a6,a4,a2
    9712:	40a80733          	sub	a4,a6,a0
    9716:	883a                	mv	a6,a4
    9718:	faf42023          	sw	a5,-96(s0)
    971c:	fb042223          	sw	a6,-92(s0)
    9720:	fbc42783          	lw	a5,-68(s0)
    9724:	0017e793          	ori	a5,a5,1
    9728:	faf42e23          	sw	a5,-68(s0)
		}
		i = 0; uv = v;
    972c:	fc042423          	sw	zero,-56(s0)
    9730:	fa042783          	lw	a5,-96(s0)
    9734:	fa442803          	lw	a6,-92(s0)
    9738:	f8f42c23          	sw	a5,-104(s0)
    973c:	f9042e23          	sw	a6,-100(s0)
		do {	/* Make an integer number string */
			d = (char)(uv % r); uv /= r;
    9740:	fcc42783          	lw	a5,-52(s0)
    9744:	8b3e                	mv	s6,a5
    9746:	4b81                	li	s7,0
    9748:	f9842783          	lw	a5,-104(s0)
    974c:	f9c42803          	lw	a6,-100(s0)
    9750:	865a                	mv	a2,s6
    9752:	86de                	mv	a3,s7
    9754:	853e                	mv	a0,a5
    9756:	85c2                	mv	a1,a6
    9758:	037000ef          	jal	ra,9f8e <__umoddi3>
    975c:	87aa                	mv	a5,a0
    975e:	882e                	mv	a6,a1
    9760:	faf40923          	sb	a5,-78(s0)
    9764:	fcc42783          	lw	a5,-52(s0)
    9768:	8c3e                	mv	s8,a5
    976a:	4c81                	li	s9,0
    976c:	8662                	mv	a2,s8
    976e:	86e6                	mv	a3,s9
    9770:	f9842503          	lw	a0,-104(s0)
    9774:	f9c42583          	lw	a1,-100(s0)
    9778:	29bd                	jal	9bf6 <__udivdi3>
    977a:	87aa                	mv	a5,a0
    977c:	882e                	mv	a6,a1
    977e:	f8f42c23          	sw	a5,-104(s0)
    9782:	f9042e23          	sw	a6,-100(s0)
			if (d > 9) d += (c == 'x') ? 0x27 : 0x07;
    9786:	fb244703          	lbu	a4,-78(s0)
    978a:	47a5                	li	a5,9
    978c:	02e7f163          	bgeu	a5,a4,97ae <xvfprintf+0x5d0>
    9790:	fb344703          	lbu	a4,-77(s0)
    9794:	07800793          	li	a5,120
    9798:	00f71563          	bne	a4,a5,97a2 <xvfprintf+0x5c4>
    979c:	02700793          	li	a5,39
    97a0:	a011                	j	97a4 <xvfprintf+0x5c6>
    97a2:	479d                	li	a5,7
    97a4:	fb244703          	lbu	a4,-78(s0)
    97a8:	97ba                	add	a5,a5,a4
    97aa:	faf40923          	sb	a5,-78(s0)
			str[i++] = d + '0';
    97ae:	fc842783          	lw	a5,-56(s0)
    97b2:	00178713          	addi	a4,a5,1
    97b6:	fce42423          	sw	a4,-56(s0)
    97ba:	fb244703          	lbu	a4,-78(s0)
    97be:	03070713          	addi	a4,a4,48
    97c2:	0ff77713          	andi	a4,a4,255
    97c6:	fd040693          	addi	a3,s0,-48
    97ca:	97b6                	add	a5,a5,a3
    97cc:	fae78423          	sb	a4,-88(a5)
		} while (uv != 0 && i < sizeof str);
    97d0:	f9842783          	lw	a5,-104(s0)
    97d4:	f9c42703          	lw	a4,-100(s0)
    97d8:	8fd9                	or	a5,a5,a4
    97da:	c791                	beqz	a5,97e6 <xvfprintf+0x608>
    97dc:	fc842703          	lw	a4,-56(s0)
    97e0:	47fd                	li	a5,31
    97e2:	f4e7ffe3          	bgeu	a5,a4,9740 <xvfprintf+0x562>
		if (f & 1) str[i++] = '-';					/* Sign */
    97e6:	fbc42783          	lw	a5,-68(s0)
    97ea:	8b85                	andi	a5,a5,1
    97ec:	cf91                	beqz	a5,9808 <xvfprintf+0x62a>
    97ee:	fc842783          	lw	a5,-56(s0)
    97f2:	00178713          	addi	a4,a5,1
    97f6:	fce42423          	sw	a4,-56(s0)
    97fa:	fd040713          	addi	a4,s0,-48
    97fe:	97ba                	add	a5,a5,a4
    9800:	02d00713          	li	a4,45
    9804:	fae78423          	sb	a4,-88(a5)
		for (j = i; !(f & 2) && j < w; j++) xfputc(func, pad);	/* Left pads */
    9808:	fc842783          	lw	a5,-56(s0)
    980c:	fcf42223          	sw	a5,-60(s0)
    9810:	a821                	j	9828 <xvfprintf+0x64a>
    9812:	fab44783          	lbu	a5,-85(s0)
    9816:	85be                	mv	a1,a5
    9818:	f6c42503          	lw	a0,-148(s0)
    981c:	3219                	jal	9122 <xfputc>
    981e:	fc442783          	lw	a5,-60(s0)
    9822:	0785                	addi	a5,a5,1
    9824:	fcf42223          	sw	a5,-60(s0)
    9828:	fbc42783          	lw	a5,-68(s0)
    982c:	8b89                	andi	a5,a5,2
    982e:	e799                	bnez	a5,983c <xvfprintf+0x65e>
    9830:	fc442703          	lw	a4,-60(s0)
    9834:	fc042783          	lw	a5,-64(s0)
    9838:	fcf76de3          	bltu	a4,a5,9812 <xvfprintf+0x634>
		do xfputc(func, str[--i]); while (i != 0);	/* Value */
    983c:	fc842783          	lw	a5,-56(s0)
    9840:	17fd                	addi	a5,a5,-1
    9842:	fcf42423          	sw	a5,-56(s0)
    9846:	fc842783          	lw	a5,-56(s0)
    984a:	fd040713          	addi	a4,s0,-48
    984e:	97ba                	add	a5,a5,a4
    9850:	fa87c783          	lbu	a5,-88(a5)
    9854:	85be                	mv	a1,a5
    9856:	f6c42503          	lw	a0,-148(s0)
    985a:	30e1                	jal	9122 <xfputc>
    985c:	fc842783          	lw	a5,-56(s0)
    9860:	fff1                	bnez	a5,983c <xvfprintf+0x65e>
		while (j++ < w) xfputc(func, ' ');			/* Right pads */
    9862:	a031                	j	986e <xvfprintf+0x690>
    9864:	02000593          	li	a1,32
    9868:	f6c42503          	lw	a0,-148(s0)
    986c:	385d                	jal	9122 <xfputc>
    986e:	fc442783          	lw	a5,-60(s0)
    9872:	00178713          	addi	a4,a5,1
    9876:	fce42223          	sw	a4,-60(s0)
    987a:	fc042703          	lw	a4,-64(s0)
    987e:	fee7e3e3          	bltu	a5,a4,9864 <xvfprintf+0x686>
		c = *fmt++;					/* Get a format character */
    9882:	b241                	j	9202 <xvfprintf+0x24>
		if (!c) break;				/* End of format? */
    9884:	0001                	nop
    9886:	a011                	j	988a <xvfprintf+0x6ac>
		if (!c) break;				/* End of format? */
    9888:	0001                	nop
	}
}
    988a:	0001                	nop
    988c:	40fa                	lw	ra,156(sp)
    988e:	446a                	lw	s0,152(sp)
    9890:	495a                	lw	s2,148(sp)
    9892:	49ca                	lw	s3,144(sp)
    9894:	4a3a                	lw	s4,140(sp)
    9896:	4aaa                	lw	s5,136(sp)
    9898:	4b1a                	lw	s6,132(sp)
    989a:	4b8a                	lw	s7,128(sp)
    989c:	5c76                	lw	s8,124(sp)
    989e:	5ce6                	lw	s9,120(sp)
    98a0:	610d                	addi	sp,sp,160
    98a2:	8082                	ret

000098a4 <xprintf>:

void xprintf (			/* Put a formatted string to the default device */
	const char*	fmt,	/* Pointer to the format string */
	...					/* Optional arguments */
)
{
    98a4:	715d                	addi	sp,sp,-80
    98a6:	d606                	sw	ra,44(sp)
    98a8:	d422                	sw	s0,40(sp)
    98aa:	1800                	addi	s0,sp,48
    98ac:	fca42e23          	sw	a0,-36(s0)
    98b0:	c04c                	sw	a1,4(s0)
    98b2:	c410                	sw	a2,8(s0)
    98b4:	c454                	sw	a3,12(s0)
    98b6:	c818                	sw	a4,16(s0)
    98b8:	c85c                	sw	a5,20(s0)
    98ba:	01042c23          	sw	a6,24(s0)
    98be:	01142e23          	sw	a7,28(s0)
	va_list arp;
	va_start(arp, fmt);
    98c2:	02040793          	addi	a5,s0,32
    98c6:	1791                	addi	a5,a5,-28
    98c8:	fef42623          	sw	a5,-20(s0)
	xvfprintf(xfunc_output, fmt, arp);
    98cc:	8241a783          	lw	a5,-2012(gp) # 20000044 <xfunc_output>
    98d0:	fec42703          	lw	a4,-20(s0)
    98d4:	863a                	mv	a2,a4
    98d6:	fdc42583          	lw	a1,-36(s0)
    98da:	853e                	mv	a0,a5
    98dc:	3209                	jal	91de <xvfprintf>
	va_end(arp);
}
    98de:	0001                	nop
    98e0:	50b2                	lw	ra,44(sp)
    98e2:	5422                	lw	s0,40(sp)
    98e4:	6161                	addi	sp,sp,80
    98e6:	8082                	ret

000098e8 <xfprintf>:
void xfprintf (			/* Put a formatted string to the specified device */
	void(*func)(int),	/* Pointer to the output function */
	const char*	fmt,	/* Pointer to the format string */
	...					/* Optional arguments */
)
{
    98e8:	715d                	addi	sp,sp,-80
    98ea:	d606                	sw	ra,44(sp)
    98ec:	d422                	sw	s0,40(sp)
    98ee:	1800                	addi	s0,sp,48
    98f0:	fca42e23          	sw	a0,-36(s0)
    98f4:	fcb42c23          	sw	a1,-40(s0)
    98f8:	c410                	sw	a2,8(s0)
    98fa:	c454                	sw	a3,12(s0)
    98fc:	c818                	sw	a4,16(s0)
    98fe:	c85c                	sw	a5,20(s0)
    9900:	01042c23          	sw	a6,24(s0)
    9904:	01142e23          	sw	a7,28(s0)
	va_list arp;


	va_start(arp, fmt);
    9908:	02040793          	addi	a5,s0,32
    990c:	17a1                	addi	a5,a5,-24
    990e:	fef42623          	sw	a5,-20(s0)
	xvfprintf(func, fmt, arp);
    9912:	fec42783          	lw	a5,-20(s0)
    9916:	863e                	mv	a2,a5
    9918:	fd842583          	lw	a1,-40(s0)
    991c:	fdc42503          	lw	a0,-36(s0)
    9920:	387d                	jal	91de <xvfprintf>
	va_end(arp);
}
    9922:	0001                	nop
    9924:	50b2                	lw	ra,44(sp)
    9926:	5422                	lw	s0,40(sp)
    9928:	6161                	addi	sp,sp,80
    992a:	8082                	ret

0000992c <xsprintf>:
void xsprintf (			/* Put a formatted string to the memory */
	char* buff,			/* Pointer to the output buffer */
	const char*	fmt,	/* Pointer to the format string */
	...					/* Optional arguments */
)
{
    992c:	715d                	addi	sp,sp,-80
    992e:	d606                	sw	ra,44(sp)
    9930:	d422                	sw	s0,40(sp)
    9932:	1800                	addi	s0,sp,48
    9934:	fca42e23          	sw	a0,-36(s0)
    9938:	fcb42c23          	sw	a1,-40(s0)
    993c:	c410                	sw	a2,8(s0)
    993e:	c454                	sw	a3,12(s0)
    9940:	c818                	sw	a4,16(s0)
    9942:	c85c                	sw	a5,20(s0)
    9944:	01042c23          	sw	a6,24(s0)
    9948:	01142e23          	sw	a7,28(s0)
	va_list arp;


	strptr = buff;		/* Enable destination for memory */
    994c:	fdc42703          	lw	a4,-36(s0)
    9950:	82e1a023          	sw	a4,-2016(gp) # 20000040 <strptr>
	va_start(arp, fmt);
    9954:	02040793          	addi	a5,s0,32
    9958:	17a1                	addi	a5,a5,-24
    995a:	fef42623          	sw	a5,-20(s0)
	xvfprintf(0, fmt, arp);
    995e:	fec42783          	lw	a5,-20(s0)
    9962:	863e                	mv	a2,a5
    9964:	fd842583          	lw	a1,-40(s0)
    9968:	4501                	li	a0,0
    996a:	3895                	jal	91de <xvfprintf>
	va_end(arp);
	*strptr = 0;		/* Terminate output string */
    996c:	8201a783          	lw	a5,-2016(gp) # 20000040 <strptr>
    9970:	00078023          	sb	zero,0(a5)
	strptr = 0;			/* Disable destination for memory */
    9974:	8201a023          	sw	zero,-2016(gp) # 20000040 <strptr>
}
    9978:	0001                	nop
    997a:	50b2                	lw	ra,44(sp)
    997c:	5422                	lw	s0,40(sp)
    997e:	6161                	addi	sp,sp,80
    9980:	8082                	ret

00009982 <bsp_console_send_char>:
#include "bsp_cfg.h"
#include "ch32x035_usart.h"

static void bsp_console_send_char(uint8_t c)
{
    9982:	1101                	addi	sp,sp,-32
    9984:	ce06                	sw	ra,28(sp)
    9986:	cc22                	sw	s0,24(sp)
    9988:	1000                	addi	s0,sp,32
    998a:	87aa                	mv	a5,a0
    998c:	fef407a3          	sb	a5,-17(s0)
      /* wait last transmission completed */
      while (USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
    9990:	0001                	nop
    9992:	08000593          	li	a1,128
    9996:	400047b7          	lui	a5,0x40004
    999a:	40078513          	addi	a0,a5,1024 # 40004400 <_eusrstack+0x20000400>
    999e:	da7fe0ef          	jal	ra,8744 <USART_GetFlagStatus>
    99a2:	87aa                	mv	a5,a0
    99a4:	d7fd                	beqz	a5,9992 <bsp_console_send_char+0x10>

      /* put transnission data */
      USART_SendData(USART2, (uint8_t)c);
    99a6:	fef44783          	lbu	a5,-17(s0)
    99aa:	07c2                	slli	a5,a5,0x10
    99ac:	83c1                	srli	a5,a5,0x10
    99ae:	85be                	mv	a1,a5
    99b0:	400047b7          	lui	a5,0x40004
    99b4:	40078513          	addi	a0,a5,1024 # 40004400 <_eusrstack+0x20000400>
    99b8:	a93fe0ef          	jal	ra,844a <USART_SendData>

      /* wait transmission completed */
      while (USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET);
    99bc:	0001                	nop
    99be:	04000593          	li	a1,64
    99c2:	400047b7          	lui	a5,0x40004
    99c6:	40078513          	addi	a0,a5,1024 # 40004400 <_eusrstack+0x20000400>
    99ca:	d7bfe0ef          	jal	ra,8744 <USART_GetFlagStatus>
    99ce:	87aa                	mv	a5,a0
    99d0:	d7fd                	beqz	a5,99be <bsp_console_send_char+0x3c>
}
    99d2:	0001                	nop
    99d4:	40f2                	lw	ra,28(sp)
    99d6:	4462                	lw	s0,24(sp)
    99d8:	6105                	addi	sp,sp,32
    99da:	8082                	ret

000099dc <bsp_console_init>:

void bsp_console_init(void)
{
    99dc:	7179                	addi	sp,sp,-48
    99de:	d606                	sw	ra,44(sp)
    99e0:	d422                	sw	s0,40(sp)
    99e2:	1800                	addi	s0,sp,48
      GPIO_InitTypeDef GPIO_InitStructure;
      USART_InitTypeDef USART_InitStructure;

      RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
    99e4:	4585                	li	a1,1
    99e6:	00020537          	lui	a0,0x20
    99ea:	914fb0ef          	jal	ra,4afe <RCC_APB1PeriphClockCmd>
      RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    99ee:	4585                	li	a1,1
    99f0:	4511                	li	a0,4
    99f2:	8c6fb0ef          	jal	ra,4ab8 <RCC_APB2PeriphClockCmd>

      GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
    99f6:	4791                	li	a5,4
    99f8:	fef42223          	sw	a5,-28(s0)
      GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    99fc:	4785                	li	a5,1
    99fe:	fef42423          	sw	a5,-24(s0)
      GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    9a02:	47e1                	li	a5,24
    9a04:	fef42623          	sw	a5,-20(s0)
      GPIO_Init(GPIOA, &GPIO_InitStructure);
    9a08:	fe440793          	addi	a5,s0,-28
    9a0c:	85be                	mv	a1,a5
    9a0e:	400117b7          	lui	a5,0x40011
    9a12:	80078513          	addi	a0,a5,-2048 # 40010800 <_eusrstack+0x2000c800>
    9a16:	a79f80ef          	jal	ra,248e <GPIO_Init>

      USART_InitStructure.USART_BaudRate = 115200;
    9a1a:	67f1                	lui	a5,0x1c
    9a1c:	20078793          	addi	a5,a5,512 # 1c200 <_data_lma+0xff4c>
    9a20:	fcf42a23          	sw	a5,-44(s0)
      USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    9a24:	fc041c23          	sh	zero,-40(s0)
      USART_InitStructure.USART_StopBits = USART_StopBits_1;
    9a28:	fc041d23          	sh	zero,-38(s0)
      USART_InitStructure.USART_Parity = USART_Parity_No;
    9a2c:	fc041e23          	sh	zero,-36(s0)
      USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    9a30:	fe041023          	sh	zero,-32(s0)
      USART_InitStructure.USART_Mode = USART_Mode_Tx;
    9a34:	47a1                	li	a5,8
    9a36:	fcf41f23          	sh	a5,-34(s0)

      USART_Init(USART2, &USART_InitStructure);
    9a3a:	fd440793          	addi	a5,s0,-44
    9a3e:	85be                	mv	a1,a5
    9a40:	400047b7          	lui	a5,0x40004
    9a44:	40078513          	addi	a0,a5,1024 # 40004400 <_eusrstack+0x20000400>
    9a48:	bd2fe0ef          	jal	ra,7e1a <USART_Init>
      USART_Cmd(USART2, ENABLE);
    9a4c:	4585                	li	a1,1
    9a4e:	400047b7          	lui	a5,0x40004
    9a52:	40078513          	addi	a0,a5,1024 # 40004400 <_eusrstack+0x20000400>
    9a56:	e98fe0ef          	jal	ra,80ee <USART_Cmd>

      xfunc_output = (void (*)(int))bsp_console_send_char;
    9a5a:	0000a737          	lui	a4,0xa
    9a5e:	98270713          	addi	a4,a4,-1662 # 9982 <bsp_console_send_char>
    9a62:	82e1a223          	sw	a4,-2012(gp) # 20000044 <xfunc_output>
}
    9a66:	0001                	nop
    9a68:	50b2                	lw	ra,44(sp)
    9a6a:	5422                	lw	s0,40(sp)
    9a6c:	6145                	addi	sp,sp,48
    9a6e:	8082                	ret

00009a70 <_Z10delay_loopm>:
constexpr uint32_t kLedPin = GPIO_Pin_12;
constexpr uint32_t kDelayTicks = 600000u;
}

void delay_loop(volatile uint32_t count)
{
    9a70:	1101                	addi	sp,sp,-32
    9a72:	ce22                	sw	s0,28(sp)
    9a74:	1000                	addi	s0,sp,32
    9a76:	fea42623          	sw	a0,-20(s0)
    while (count-- != 0u)
    9a7a:	fec42783          	lw	a5,-20(s0)
    9a7e:	fff78713          	addi	a4,a5,-1
    9a82:	fee42623          	sw	a4,-20(s0)
    9a86:	00f037b3          	snez	a5,a5
    9a8a:	0ff7f793          	andi	a5,a5,255
    9a8e:	c399                	beqz	a5,9a94 <_Z10delay_loopm+0x24>
    {
        __asm volatile("nop");
    9a90:	0001                	nop
    while (count-- != 0u)
    9a92:	b7e5                	j	9a7a <_Z10delay_loopm+0xa>
    }
}
    9a94:	0001                	nop
    9a96:	4472                	lw	s0,28(sp)
    9a98:	6105                	addi	sp,sp,32
    9a9a:	8082                	ret

00009a9c <main>:

int main()
{
    9a9c:	1101                	addi	sp,sp,-32
    9a9e:	ce06                	sw	ra,28(sp)
    9aa0:	cc22                	sw	s0,24(sp)
    9aa2:	1000                	addi	s0,sp,32
    GPIO_InitTypeDef gpio_init = {0};
    9aa4:	fe042223          	sw	zero,-28(s0)
    9aa8:	fe042423          	sw	zero,-24(s0)
    9aac:	fe042623          	sw	zero,-20(s0)

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
    9ab0:	4585                	li	a1,1
    9ab2:	4521                	li	a0,8
    9ab4:	804fb0ef          	jal	ra,4ab8 <RCC_APB2PeriphClockCmd>
    gpio_init.GPIO_Pin = kLedPin;
    9ab8:	6785                	lui	a5,0x1
    9aba:	fef42223          	sw	a5,-28(s0)
    gpio_init.GPIO_Mode = GPIO_Mode_Out_PP;
    9abe:	47c1                	li	a5,16
    9ac0:	fef42623          	sw	a5,-20(s0)
    gpio_init.GPIO_Speed = GPIO_Speed_50MHz;
    9ac4:	4785                	li	a5,1
    9ac6:	fef42423          	sw	a5,-24(s0)
    GPIO_Init(GPIOB, &gpio_init);
    9aca:	fe440793          	addi	a5,s0,-28
    9ace:	85be                	mv	a1,a5
    9ad0:	400117b7          	lui	a5,0x40011
    9ad4:	c0078513          	addi	a0,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    9ad8:	9b7f80ef          	jal	ra,248e <GPIO_Init>

    bsp_console_init();
    9adc:	3701                	jal	99dc <bsp_console_init>
    BSP_PRINT("CH32x035 bare-metal firmware ready\r\n");
    9ade:	67b1                	lui	a5,0xc
    9ae0:	0c078513          	addi	a0,a5,192 # c0c0 <strlen+0x176>
    9ae4:	33c1                	jal	98a4 <xprintf>

    while (1)
    {
        GPIOB->OUTDR ^= kLedPin;
    9ae6:	400117b7          	lui	a5,0x40011
    9aea:	c0078793          	addi	a5,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    9aee:	47d4                	lw	a3,12(a5)
    9af0:	400117b7          	lui	a5,0x40011
    9af4:	c0078793          	addi	a5,a5,-1024 # 40010c00 <_eusrstack+0x2000cc00>
    9af8:	6705                	lui	a4,0x1
    9afa:	8f35                	xor	a4,a4,a3
    9afc:	c7d8                	sw	a4,12(a5)
        BSP_PRINT("LED toggle\r\n");
    9afe:	67b1                	lui	a5,0xc
    9b00:	0e878513          	addi	a0,a5,232 # c0e8 <strlen+0x19e>
    9b04:	3345                	jal	98a4 <xprintf>
        delay_loop(kDelayTicks);
    9b06:	000927b7          	lui	a5,0x92
    9b0a:	7c078513          	addi	a0,a5,1984 # 927c0 <_data_lma+0x8650c>
    9b0e:	378d                	jal	9a70 <_Z10delay_loopm>
        GPIOB->OUTDR ^= kLedPin;
    9b10:	bfd9                	j	9ae6 <main+0x4a>

00009b12 <NMI_Handler>:
    .weak   TIM2_CC_IRQHandler         /* TIM2 Capture Compare */
    .weak   TIM2_TRG_COM_IRQHandler    /* TIM2 Trigger and Commutation */
    .weak   TIM2_BRK_IRQHandler        /* TIM2 Break */
    .weak   TIM3_IRQHandler            /* TIM3 */

NMI_Handler:  1:  j 1b
    9b12:	a001                	j	9b12 <NMI_Handler>

00009b14 <HardFault_Handler>:
HardFault_Handler:  1:  j 1b
    9b14:	a001                	j	9b14 <HardFault_Handler>

00009b16 <Ecall_M_Mode_Handler>:
Ecall_M_Mode_Handler:  1:  j 1b
    9b16:	a001                	j	9b16 <Ecall_M_Mode_Handler>

00009b18 <Ecall_U_Mode_Handler>:
Ecall_U_Mode_Handler:  1:  j 1b
    9b18:	a001                	j	9b18 <Ecall_U_Mode_Handler>

00009b1a <Break_Point_Handler>:
Break_Point_Handler:  1:  j 1b
    9b1a:	a001                	j	9b1a <Break_Point_Handler>

00009b1c <SysTick_Handler>:
SysTick_Handler:  1:  j 1b
    9b1c:	a001                	j	9b1c <SysTick_Handler>

00009b1e <SW_Handler>:
SW_Handler:  1:  j 1b
    9b1e:	a001                	j	9b1e <SW_Handler>

00009b20 <WWDG_IRQHandler>:
WWDG_IRQHandler:  1:  j 1b
    9b20:	a001                	j	9b20 <WWDG_IRQHandler>

00009b22 <PVD_IRQHandler>:
PVD_IRQHandler:  1:  j 1b
    9b22:	a001                	j	9b22 <PVD_IRQHandler>

00009b24 <FLASH_IRQHandler>:
FLASH_IRQHandler:  1:  j 1b
    9b24:	a001                	j	9b24 <FLASH_IRQHandler>

00009b26 <EXTI7_0_IRQHandler>:
EXTI7_0_IRQHandler:  1:  j 1b
    9b26:	a001                	j	9b26 <EXTI7_0_IRQHandler>

00009b28 <AWU_IRQHandler>:
AWU_IRQHandler:  1:  j 1b
    9b28:	a001                	j	9b28 <AWU_IRQHandler>

00009b2a <DMA1_Channel1_IRQHandler>:
DMA1_Channel1_IRQHandler:  1:  j 1b
    9b2a:	a001                	j	9b2a <DMA1_Channel1_IRQHandler>

00009b2c <DMA1_Channel2_IRQHandler>:
DMA1_Channel2_IRQHandler:  1:  j 1b
    9b2c:	a001                	j	9b2c <DMA1_Channel2_IRQHandler>

00009b2e <DMA1_Channel3_IRQHandler>:
DMA1_Channel3_IRQHandler:  1:  j 1b
    9b2e:	a001                	j	9b2e <DMA1_Channel3_IRQHandler>

00009b30 <DMA1_Channel4_IRQHandler>:
DMA1_Channel4_IRQHandler:  1:  j 1b
    9b30:	a001                	j	9b30 <DMA1_Channel4_IRQHandler>

00009b32 <DMA1_Channel5_IRQHandler>:
DMA1_Channel5_IRQHandler:  1:  j 1b
    9b32:	a001                	j	9b32 <DMA1_Channel5_IRQHandler>

00009b34 <DMA1_Channel6_IRQHandler>:
DMA1_Channel6_IRQHandler:  1:  j 1b
    9b34:	a001                	j	9b34 <DMA1_Channel6_IRQHandler>

00009b36 <DMA1_Channel7_IRQHandler>:
DMA1_Channel7_IRQHandler:  1:  j 1b
    9b36:	a001                	j	9b36 <DMA1_Channel7_IRQHandler>

00009b38 <ADC1_IRQHandler>:
ADC1_IRQHandler:  1:  j 1b
    9b38:	a001                	j	9b38 <ADC1_IRQHandler>

00009b3a <I2C1_EV_IRQHandler>:
I2C1_EV_IRQHandler:  1:  j 1b
    9b3a:	a001                	j	9b3a <I2C1_EV_IRQHandler>

00009b3c <I2C1_ER_IRQHandler>:
I2C1_ER_IRQHandler:  1:  j 1b
    9b3c:	a001                	j	9b3c <I2C1_ER_IRQHandler>

00009b3e <USART1_IRQHandler>:
USART1_IRQHandler:  1:  j 1b
    9b3e:	a001                	j	9b3e <USART1_IRQHandler>

00009b40 <SPI1_IRQHandler>:
SPI1_IRQHandler:  1:  j 1b
    9b40:	a001                	j	9b40 <SPI1_IRQHandler>

00009b42 <TIM1_BRK_IRQHandler>:
TIM1_BRK_IRQHandler:  1:  j 1b
    9b42:	a001                	j	9b42 <TIM1_BRK_IRQHandler>

00009b44 <TIM1_UP_IRQHandler>:
TIM1_UP_IRQHandler:  1:  j 1b
    9b44:	a001                	j	9b44 <TIM1_UP_IRQHandler>

00009b46 <TIM1_TRG_COM_IRQHandler>:
TIM1_TRG_COM_IRQHandler:  1:  j 1b
    9b46:	a001                	j	9b46 <TIM1_TRG_COM_IRQHandler>

00009b48 <TIM1_CC_IRQHandler>:
TIM1_CC_IRQHandler:  1:  j 1b
    9b48:	a001                	j	9b48 <TIM1_CC_IRQHandler>

00009b4a <TIM2_UP_IRQHandler>:
TIM2_UP_IRQHandler:  1:  j 1b
    9b4a:	a001                	j	9b4a <TIM2_UP_IRQHandler>

00009b4c <USART2_IRQHandler>:
USART2_IRQHandler:  1:  j 1b
    9b4c:	a001                	j	9b4c <USART2_IRQHandler>

00009b4e <EXTI15_8_IRQHandler>:
EXTI15_8_IRQHandler:  1:  j 1b
    9b4e:	a001                	j	9b4e <EXTI15_8_IRQHandler>

00009b50 <EXTI25_16_IRQHandler>:
EXTI25_16_IRQHandler:  1:  j 1b
    9b50:	a001                	j	9b50 <EXTI25_16_IRQHandler>

00009b52 <USART3_IRQHandler>:
USART3_IRQHandler:  1:  j 1b
    9b52:	a001                	j	9b52 <USART3_IRQHandler>

00009b54 <USART4_IRQHandler>:
USART4_IRQHandler:  1:  j 1b
    9b54:	a001                	j	9b54 <USART4_IRQHandler>

00009b56 <DMA1_Channel8_IRQHandler>:
DMA1_Channel8_IRQHandler:  1:  j 1b
    9b56:	a001                	j	9b56 <DMA1_Channel8_IRQHandler>

00009b58 <USBFS_IRQHandler>:
USBFS_IRQHandler:  1:  j 1b
    9b58:	a001                	j	9b58 <USBFS_IRQHandler>

00009b5a <USBFSWakeUp_IRQHandler>:
USBFSWakeUp_IRQHandler:  1:  j 1b
    9b5a:	a001                	j	9b5a <USBFSWakeUp_IRQHandler>

00009b5c <PIOC_IRQHandler>:
PIOC_IRQHandler:  1:  j 1b
    9b5c:	a001                	j	9b5c <PIOC_IRQHandler>

00009b5e <OPA_IRQHandler>:
OPA_IRQHandler:  1:  j 1b
    9b5e:	a001                	j	9b5e <OPA_IRQHandler>

00009b60 <USBPD_IRQHandler>:
USBPD_IRQHandler:  1:  j 1b
    9b60:	a001                	j	9b60 <USBPD_IRQHandler>

00009b62 <USBPDWakeUp_IRQHandler>:
USBPDWakeUp_IRQHandler:  1:  j 1b
    9b62:	a001                	j	9b62 <USBPDWakeUp_IRQHandler>

00009b64 <TIM2_CC_IRQHandler>:
TIM2_CC_IRQHandler:  1:  j 1b
    9b64:	a001                	j	9b64 <TIM2_CC_IRQHandler>

00009b66 <TIM2_TRG_COM_IRQHandler>:
TIM2_TRG_COM_IRQHandler:  1:  j 1b
    9b66:	a001                	j	9b66 <TIM2_TRG_COM_IRQHandler>

00009b68 <TIM2_BRK_IRQHandler>:
TIM2_BRK_IRQHandler:  1:  j 1b
    9b68:	a001                	j	9b68 <TIM2_BRK_IRQHandler>

00009b6a <TIM3_IRQHandler>:
TIM3_IRQHandler:  1:  j 1b
    9b6a:	a001                	j	9b6a <TIM3_IRQHandler>

00009b6c <handle_reset>:
	.weak	handle_reset
	.align	1
handle_reset:
.option push 
.option	norelax 
	la gp, __global_pointer$
    9b6c:	1fff7197          	auipc	gp,0x1fff7
    9b70:	cb418193          	addi	gp,gp,-844 # 20000820 <__global_pointer$>
.option	pop 
1:
	la sp, _eusrstack 
    9b74:	1fffa117          	auipc	sp,0x1fffa
    9b78:	48c10113          	addi	sp,sp,1164 # 20004000 <_eusrstack>
2:
	/* Load data section from flash to RAM */
	la a0, _data_lma
    9b7c:	00002517          	auipc	a0,0x2
    9b80:	73850513          	addi	a0,a0,1848 # c2b4 <_data_lma>
	la a1, _data_vma
    9b84:	1fff6597          	auipc	a1,0x1fff6
    9b88:	47c58593          	addi	a1,a1,1148 # 20000000 <_data_vma>
	la a2, _edata
    9b8c:	81818613          	addi	a2,gp,-2024 # 20000038 <_edata>
	bgeu a1, a2, 2f
    9b90:	00c5fa63          	bgeu	a1,a2,9ba4 <handle_reset+0x38>
1:
	lw t0, (a0)
    9b94:	00052283          	lw	t0,0(a0)
	sw t0, (a1)
    9b98:	0055a023          	sw	t0,0(a1)
	addi a0, a0, 4
    9b9c:	0511                	addi	a0,a0,4
	addi a1, a1, 4
    9b9e:	0591                	addi	a1,a1,4
	bltu a1, a2, 1b
    9ba0:	fec5eae3          	bltu	a1,a2,9b94 <handle_reset+0x28>
2:
	/* Clear bss section */
	la a0, _sbss
    9ba4:	81818513          	addi	a0,gp,-2024 # 20000038 <_edata>
	la a1, _ebss
    9ba8:	82818593          	addi	a1,gp,-2008 # 20000048 <_ebss>
	bgeu a0, a1, 2f
    9bac:	00b57763          	bgeu	a0,a1,9bba <handle_reset+0x4e>
1:
	sw zero, (a0)
    9bb0:	00052023          	sw	zero,0(a0)
	addi a0, a0, 4
    9bb4:	0511                	addi	a0,a0,4
	bltu a0, a1, 1b
    9bb6:	feb56de3          	bltu	a0,a1,9bb0 <handle_reset+0x44>
2:
    li t0, 0x1f
    9bba:	42fd                	li	t0,31
    csrw 0xbc0, t0
    9bbc:	bc029073          	csrw	0xbc0,t0

    /* Enable nested and disable hardware stack INTSYSCR*/
	li t0, 0x2
    9bc0:	4289                	li	t0,2
	csrw 0x804, t0
    9bc2:	80429073          	csrw	0x804,t0

/* Enable global interrupt and configure privileged mode */
   	li t0, 0x1800               
    9bc6:	000022b7          	lui	t0,0x2
    9bca:	80028293          	addi	t0,t0,-2048 # 1800 <EXTI_Init+0x8c>
   	csrw mstatus, t0
    9bce:	30029073          	csrw	mstatus,t0

 	la t0, _vector_base
    9bd2:	ffff6297          	auipc	t0,0xffff6
    9bd6:	43228293          	addi	t0,t0,1074 # 4 <_einit>
    ori t0, t0, 3           
    9bda:	0032e293          	ori	t0,t0,3
	csrw mtvec, t0
    9bde:	30529073          	csrw	mtvec,t0

    jal  SystemInit
    9be2:	f0af60ef          	jal	ra,2ec <SystemInit>
	la t0, main
    9be6:	00000297          	auipc	t0,0x0
    9bea:	eb628293          	addi	t0,t0,-330 # 9a9c <main>
	csrw mepc, t0
    9bee:	34129073          	csrw	mepc,t0
	mret
    9bf2:	30200073          	mret

00009bf6 <__udivdi3>:
    9bf6:	87b6                	mv	a5,a3
    9bf8:	88b2                	mv	a7,a2
    9bfa:	832a                	mv	t1,a0
    9bfc:	882e                	mv	a6,a1
    9bfe:	14069d63          	bnez	a3,9d58 <__udivdi3+0x162>
    9c02:	0ac5f963          	bgeu	a1,a2,9cb4 <__udivdi3+0xbe>
    9c06:	6741                	lui	a4,0x10
    9c08:	1ae66e63          	bltu	a2,a4,9dc4 <__udivdi3+0x1ce>
    9c0c:	010007b7          	lui	a5,0x1000
    9c10:	34f66363          	bltu	a2,a5,9f56 <__udivdi3+0x360>
    9c14:	01865693          	srli	a3,a2,0x18
    9c18:	47e1                	li	a5,24
    9c1a:	00002717          	auipc	a4,0x2
    9c1e:	55e70713          	addi	a4,a4,1374 # c178 <__clz_tab>
    9c22:	9736                	add	a4,a4,a3
    9c24:	00074703          	lbu	a4,0(a4)
    9c28:	97ba                	add	a5,a5,a4
    9c2a:	02000713          	li	a4,32
    9c2e:	8f1d                	sub	a4,a4,a5
    9c30:	cb19                	beqz	a4,9c46 <__udivdi3+0x50>
    9c32:	00e59833          	sll	a6,a1,a4
    9c36:	00f557b3          	srl	a5,a0,a5
    9c3a:	00e618b3          	sll	a7,a2,a4
    9c3e:	0107e833          	or	a6,a5,a6
    9c42:	00e51333          	sll	t1,a0,a4
    9c46:	0108d613          	srli	a2,a7,0x10
    9c4a:	02c85533          	divu	a0,a6,a2
    9c4e:	01089693          	slli	a3,a7,0x10
    9c52:	82c1                	srli	a3,a3,0x10
    9c54:	01035793          	srli	a5,t1,0x10
    9c58:	02c87733          	remu	a4,a6,a2
    9c5c:	02a685b3          	mul	a1,a3,a0
    9c60:	0742                	slli	a4,a4,0x10
    9c62:	00f76833          	or	a6,a4,a5
    9c66:	00b87a63          	bgeu	a6,a1,9c7a <__udivdi3+0x84>
    9c6a:	9846                	add	a6,a6,a7
    9c6c:	fff50793          	addi	a5,a0,-1
    9c70:	01186463          	bltu	a6,a7,9c78 <__udivdi3+0x82>
    9c74:	30b86763          	bltu	a6,a1,9f82 <__udivdi3+0x38c>
    9c78:	853e                	mv	a0,a5
    9c7a:	40b80833          	sub	a6,a6,a1
    9c7e:	02c85733          	divu	a4,a6,a2
    9c82:	0342                	slli	t1,t1,0x10
    9c84:	01035313          	srli	t1,t1,0x10
    9c88:	02c87833          	remu	a6,a6,a2
    9c8c:	02e686b3          	mul	a3,a3,a4
    9c90:	0842                	slli	a6,a6,0x10
    9c92:	00686833          	or	a6,a6,t1
    9c96:	00d87b63          	bgeu	a6,a3,9cac <__udivdi3+0xb6>
    9c9a:	9846                	add	a6,a6,a7
    9c9c:	fff70793          	addi	a5,a4,-1
    9ca0:	01186563          	bltu	a6,a7,9caa <__udivdi3+0xb4>
    9ca4:	1779                	addi	a4,a4,-2
    9ca6:	00d86363          	bltu	a6,a3,9cac <__udivdi3+0xb6>
    9caa:	873e                	mv	a4,a5
    9cac:	0542                	slli	a0,a0,0x10
    9cae:	8d59                	or	a0,a0,a4
    9cb0:	4581                	li	a1,0
    9cb2:	8082                	ret
    9cb4:	e601                	bnez	a2,9cbc <__udivdi3+0xc6>
    9cb6:	4705                	li	a4,1
    9cb8:	02c758b3          	divu	a7,a4,a2
    9cbc:	6741                	lui	a4,0x10
    9cbe:	0ee8ea63          	bltu	a7,a4,9db2 <__udivdi3+0x1bc>
    9cc2:	010007b7          	lui	a5,0x1000
    9cc6:	28f8ec63          	bltu	a7,a5,9f5e <__udivdi3+0x368>
    9cca:	0188d693          	srli	a3,a7,0x18
    9cce:	47e1                	li	a5,24
    9cd0:	00002717          	auipc	a4,0x2
    9cd4:	4a870713          	addi	a4,a4,1192 # c178 <__clz_tab>
    9cd8:	9736                	add	a4,a4,a3
    9cda:	00074683          	lbu	a3,0(a4)
    9cde:	96be                	add	a3,a3,a5
    9ce0:	02000793          	li	a5,32
    9ce4:	8f95                	sub	a5,a5,a3
    9ce6:	ebe5                	bnez	a5,9dd6 <__udivdi3+0x1e0>
    9ce8:	01089e93          	slli	t4,a7,0x10
    9cec:	41158733          	sub	a4,a1,a7
    9cf0:	0108df13          	srli	t5,a7,0x10
    9cf4:	010ede93          	srli	t4,t4,0x10
    9cf8:	4585                	li	a1,1
    9cfa:	01035793          	srli	a5,t1,0x10
    9cfe:	03e75533          	divu	a0,a4,t5
    9d02:	03e77733          	remu	a4,a4,t5
    9d06:	03d506b3          	mul	a3,a0,t4
    9d0a:	0742                	slli	a4,a4,0x10
    9d0c:	8fd9                	or	a5,a5,a4
    9d0e:	00d7fa63          	bgeu	a5,a3,9d22 <__udivdi3+0x12c>
    9d12:	97c6                	add	a5,a5,a7
    9d14:	fff50713          	addi	a4,a0,-1
    9d18:	0117e463          	bltu	a5,a7,9d20 <__udivdi3+0x12a>
    9d1c:	26d7e663          	bltu	a5,a3,9f88 <__udivdi3+0x392>
    9d20:	853a                	mv	a0,a4
    9d22:	8f95                	sub	a5,a5,a3
    9d24:	03e7d733          	divu	a4,a5,t5
    9d28:	0342                	slli	t1,t1,0x10
    9d2a:	01035313          	srli	t1,t1,0x10
    9d2e:	03e7f7b3          	remu	a5,a5,t5
    9d32:	03d70eb3          	mul	t4,a4,t4
    9d36:	07c2                	slli	a5,a5,0x10
    9d38:	0067e7b3          	or	a5,a5,t1
    9d3c:	01d7fb63          	bgeu	a5,t4,9d52 <__udivdi3+0x15c>
    9d40:	97c6                	add	a5,a5,a7
    9d42:	fff70693          	addi	a3,a4,-1
    9d46:	0117e563          	bltu	a5,a7,9d50 <__udivdi3+0x15a>
    9d4a:	1779                	addi	a4,a4,-2
    9d4c:	01d7e363          	bltu	a5,t4,9d52 <__udivdi3+0x15c>
    9d50:	8736                	mv	a4,a3
    9d52:	0542                	slli	a0,a0,0x10
    9d54:	8d59                	or	a0,a0,a4
    9d56:	8082                	ret
    9d58:	04d5e263          	bltu	a1,a3,9d9c <__udivdi3+0x1a6>
    9d5c:	67c1                	lui	a5,0x10
    9d5e:	04f6e263          	bltu	a3,a5,9da2 <__udivdi3+0x1ac>
    9d62:	010007b7          	lui	a5,0x1000
    9d66:	1ef6e463          	bltu	a3,a5,9f4e <__udivdi3+0x358>
    9d6a:	0186d713          	srli	a4,a3,0x18
    9d6e:	4861                	li	a6,24
    9d70:	00002797          	auipc	a5,0x2
    9d74:	40878793          	addi	a5,a5,1032 # c178 <__clz_tab>
    9d78:	97ba                	add	a5,a5,a4
    9d7a:	0007c703          	lbu	a4,0(a5)
    9d7e:	02000e13          	li	t3,32
    9d82:	9742                	add	a4,a4,a6
    9d84:	40ee0e33          	sub	t3,t3,a4
    9d88:	0c0e1a63          	bnez	t3,9e5c <__udivdi3+0x266>
    9d8c:	1cb6ed63          	bltu	a3,a1,9f66 <__udivdi3+0x370>
    9d90:	00c53533          	sltu	a0,a0,a2
    9d94:	00154513          	xori	a0,a0,1
    9d98:	4581                	li	a1,0
    9d9a:	8082                	ret
    9d9c:	4581                	li	a1,0
    9d9e:	4501                	li	a0,0
    9da0:	8082                	ret
    9da2:	0ff00793          	li	a5,255
    9da6:	1cd7f363          	bgeu	a5,a3,9f6c <__udivdi3+0x376>
    9daa:	0086d713          	srli	a4,a3,0x8
    9dae:	4821                	li	a6,8
    9db0:	b7c1                	j	9d70 <__udivdi3+0x17a>
    9db2:	0ff00713          	li	a4,255
    9db6:	86c6                	mv	a3,a7
    9db8:	f1177ce3          	bgeu	a4,a7,9cd0 <__udivdi3+0xda>
    9dbc:	0088d693          	srli	a3,a7,0x8
    9dc0:	47a1                	li	a5,8
    9dc2:	b739                	j	9cd0 <__udivdi3+0xda>
    9dc4:	0ff00713          	li	a4,255
    9dc8:	86b2                	mv	a3,a2
    9dca:	e4c778e3          	bgeu	a4,a2,9c1a <__udivdi3+0x24>
    9dce:	00865693          	srli	a3,a2,0x8
    9dd2:	47a1                	li	a5,8
    9dd4:	b599                	j	9c1a <__udivdi3+0x24>
    9dd6:	00f898b3          	sll	a7,a7,a5
    9dda:	00d5d633          	srl	a2,a1,a3
    9dde:	0108df13          	srli	t5,a7,0x10
    9de2:	03e65e33          	divu	t3,a2,t5
    9de6:	00f59733          	sll	a4,a1,a5
    9dea:	00d556b3          	srl	a3,a0,a3
    9dee:	8f55                	or	a4,a4,a3
    9df0:	01089e93          	slli	t4,a7,0x10
    9df4:	010ede93          	srli	t4,t4,0x10
    9df8:	00f51333          	sll	t1,a0,a5
    9dfc:	01075593          	srli	a1,a4,0x10
    9e00:	03e676b3          	remu	a3,a2,t5
    9e04:	03ce87b3          	mul	a5,t4,t3
    9e08:	06c2                	slli	a3,a3,0x10
    9e0a:	8ecd                	or	a3,a3,a1
    9e0c:	00f6fb63          	bgeu	a3,a5,9e22 <__udivdi3+0x22c>
    9e10:	96c6                	add	a3,a3,a7
    9e12:	fffe0613          	addi	a2,t3,-1
    9e16:	1716e463          	bltu	a3,a7,9f7e <__udivdi3+0x388>
    9e1a:	16f6f263          	bgeu	a3,a5,9f7e <__udivdi3+0x388>
    9e1e:	1e79                	addi	t3,t3,-2
    9e20:	96c6                	add	a3,a3,a7
    9e22:	8e9d                	sub	a3,a3,a5
    9e24:	03e6d633          	divu	a2,a3,t5
    9e28:	01071793          	slli	a5,a4,0x10
    9e2c:	83c1                	srli	a5,a5,0x10
    9e2e:	03e6f6b3          	remu	a3,a3,t5
    9e32:	02ce8533          	mul	a0,t4,a2
    9e36:	01069713          	slli	a4,a3,0x10
    9e3a:	8f5d                	or	a4,a4,a5
    9e3c:	00a77b63          	bgeu	a4,a0,9e52 <__udivdi3+0x25c>
    9e40:	9746                	add	a4,a4,a7
    9e42:	fff60793          	addi	a5,a2,-1
    9e46:	13176863          	bltu	a4,a7,9f76 <__udivdi3+0x380>
    9e4a:	12a77663          	bgeu	a4,a0,9f76 <__udivdi3+0x380>
    9e4e:	1679                	addi	a2,a2,-2
    9e50:	9746                	add	a4,a4,a7
    9e52:	010e1593          	slli	a1,t3,0x10
    9e56:	8f09                	sub	a4,a4,a0
    9e58:	8dd1                	or	a1,a1,a2
    9e5a:	b545                	j	9cfa <__udivdi3+0x104>
    9e5c:	00e657b3          	srl	a5,a2,a4
    9e60:	01c696b3          	sll	a3,a3,t3
    9e64:	8edd                	or	a3,a3,a5
    9e66:	00e5d333          	srl	t1,a1,a4
    9e6a:	0106df13          	srli	t5,a3,0x10
    9e6e:	03e357b3          	divu	a5,t1,t5
    9e72:	01069e93          	slli	t4,a3,0x10
    9e76:	010ede93          	srli	t4,t4,0x10
    9e7a:	01c59833          	sll	a6,a1,t3
    9e7e:	00e55733          	srl	a4,a0,a4
    9e82:	01076833          	or	a6,a4,a6
    9e86:	01085893          	srli	a7,a6,0x10
    9e8a:	01c61633          	sll	a2,a2,t3
    9e8e:	03e37333          	remu	t1,t1,t5
    9e92:	02fe85b3          	mul	a1,t4,a5
    9e96:	0342                	slli	t1,t1,0x10
    9e98:	011368b3          	or	a7,t1,a7
    9e9c:	00b8fb63          	bgeu	a7,a1,9eb2 <__udivdi3+0x2bc>
    9ea0:	98b6                	add	a7,a7,a3
    9ea2:	fff78713          	addi	a4,a5,-1
    9ea6:	0cd8ea63          	bltu	a7,a3,9f7a <__udivdi3+0x384>
    9eaa:	0cb8f863          	bgeu	a7,a1,9f7a <__udivdi3+0x384>
    9eae:	17f9                	addi	a5,a5,-2
    9eb0:	98b6                	add	a7,a7,a3
    9eb2:	40b888b3          	sub	a7,a7,a1
    9eb6:	03e8d733          	divu	a4,a7,t5
    9eba:	0842                	slli	a6,a6,0x10
    9ebc:	01085813          	srli	a6,a6,0x10
    9ec0:	03e8f8b3          	remu	a7,a7,t5
    9ec4:	02ee8333          	mul	t1,t4,a4
    9ec8:	08c2                	slli	a7,a7,0x10
    9eca:	0108e5b3          	or	a1,a7,a6
    9ece:	0065fb63          	bgeu	a1,t1,9ee4 <__udivdi3+0x2ee>
    9ed2:	95b6                	add	a1,a1,a3
    9ed4:	fff70813          	addi	a6,a4,-1
    9ed8:	08d5ed63          	bltu	a1,a3,9f72 <__udivdi3+0x37c>
    9edc:	0865fb63          	bgeu	a1,t1,9f72 <__udivdi3+0x37c>
    9ee0:	1779                	addi	a4,a4,-2
    9ee2:	95b6                	add	a1,a1,a3
    9ee4:	07c2                	slli	a5,a5,0x10
    9ee6:	6f41                	lui	t5,0x10
    9ee8:	8fd9                	or	a5,a5,a4
    9eea:	ffff0713          	addi	a4,t5,-1 # ffff <_data_lma+0x3d4b>
    9eee:	00e7f6b3          	and	a3,a5,a4
    9ef2:	0107d893          	srli	a7,a5,0x10
    9ef6:	8f71                	and	a4,a4,a2
    9ef8:	8241                	srli	a2,a2,0x10
    9efa:	02e68eb3          	mul	t4,a3,a4
    9efe:	406585b3          	sub	a1,a1,t1
    9f02:	02c686b3          	mul	a3,a3,a2
    9f06:	010ed813          	srli	a6,t4,0x10
    9f0a:	02e88733          	mul	a4,a7,a4
    9f0e:	96ba                	add	a3,a3,a4
    9f10:	96c2                	add	a3,a3,a6
    9f12:	02c88633          	mul	a2,a7,a2
    9f16:	00e6f363          	bgeu	a3,a4,9f1c <__udivdi3+0x326>
    9f1a:	967a                	add	a2,a2,t5
    9f1c:	0106d893          	srli	a7,a3,0x10
    9f20:	9646                	add	a2,a2,a7
    9f22:	02c5e263          	bltu	a1,a2,9f46 <__udivdi3+0x350>
    9f26:	00c58563          	beq	a1,a2,9f30 <__udivdi3+0x33a>
    9f2a:	853e                	mv	a0,a5
    9f2c:	4581                	li	a1,0
    9f2e:	8082                	ret
    9f30:	6741                	lui	a4,0x10
    9f32:	177d                	addi	a4,a4,-1
    9f34:	8ef9                	and	a3,a3,a4
    9f36:	06c2                	slli	a3,a3,0x10
    9f38:	00eefeb3          	and	t4,t4,a4
    9f3c:	01c51533          	sll	a0,a0,t3
    9f40:	96f6                	add	a3,a3,t4
    9f42:	fed574e3          	bgeu	a0,a3,9f2a <__udivdi3+0x334>
    9f46:	fff78513          	addi	a0,a5,-1
    9f4a:	4581                	li	a1,0
    9f4c:	8082                	ret
    9f4e:	0106d713          	srli	a4,a3,0x10
    9f52:	4841                	li	a6,16
    9f54:	bd31                	j	9d70 <__udivdi3+0x17a>
    9f56:	01065693          	srli	a3,a2,0x10
    9f5a:	47c1                	li	a5,16
    9f5c:	b97d                	j	9c1a <__udivdi3+0x24>
    9f5e:	0108d693          	srli	a3,a7,0x10
    9f62:	47c1                	li	a5,16
    9f64:	b3b5                	j	9cd0 <__udivdi3+0xda>
    9f66:	4581                	li	a1,0
    9f68:	4505                	li	a0,1
    9f6a:	8082                	ret
    9f6c:	8736                	mv	a4,a3
    9f6e:	4801                	li	a6,0
    9f70:	b501                	j	9d70 <__udivdi3+0x17a>
    9f72:	8742                	mv	a4,a6
    9f74:	bf85                	j	9ee4 <__udivdi3+0x2ee>
    9f76:	863e                	mv	a2,a5
    9f78:	bde9                	j	9e52 <__udivdi3+0x25c>
    9f7a:	87ba                	mv	a5,a4
    9f7c:	bf1d                	j	9eb2 <__udivdi3+0x2bc>
    9f7e:	8e32                	mv	t3,a2
    9f80:	b54d                	j	9e22 <__udivdi3+0x22c>
    9f82:	1579                	addi	a0,a0,-2
    9f84:	9846                	add	a6,a6,a7
    9f86:	b9d5                	j	9c7a <__udivdi3+0x84>
    9f88:	1579                	addi	a0,a0,-2
    9f8a:	97c6                	add	a5,a5,a7
    9f8c:	bb59                	j	9d22 <__udivdi3+0x12c>

00009f8e <__umoddi3>:
    9f8e:	87b6                	mv	a5,a3
    9f90:	8832                	mv	a6,a2
    9f92:	832a                	mv	t1,a0
    9f94:	872e                	mv	a4,a1
    9f96:	8e2e                	mv	t3,a1
    9f98:	14069363          	bnez	a3,a0de <__umoddi3+0x150>
    9f9c:	0ac5f163          	bgeu	a1,a2,a03e <__umoddi3+0xb0>
    9fa0:	6741                	lui	a4,0x10
    9fa2:	1ae67863          	bgeu	a2,a4,a152 <__umoddi3+0x1c4>
    9fa6:	0ff00713          	li	a4,255
    9faa:	86b2                	mv	a3,a2
    9fac:	00c77563          	bgeu	a4,a2,9fb6 <__umoddi3+0x28>
    9fb0:	00865693          	srli	a3,a2,0x8
    9fb4:	47a1                	li	a5,8
    9fb6:	00002717          	auipc	a4,0x2
    9fba:	1c270713          	addi	a4,a4,450 # c178 <__clz_tab>
    9fbe:	9736                	add	a4,a4,a3
    9fc0:	00074703          	lbu	a4,0(a4)
    9fc4:	02000893          	li	a7,32
    9fc8:	97ba                	add	a5,a5,a4
    9fca:	40f888b3          	sub	a7,a7,a5
    9fce:	00088c63          	beqz	a7,9fe6 <__umoddi3+0x58>
    9fd2:	011595b3          	sll	a1,a1,a7
    9fd6:	00f557b3          	srl	a5,a0,a5
    9fda:	01161833          	sll	a6,a2,a7
    9fde:	00b7ee33          	or	t3,a5,a1
    9fe2:	01151333          	sll	t1,a0,a7
    9fe6:	01085613          	srli	a2,a6,0x10
    9fea:	02ce57b3          	divu	a5,t3,a2
    9fee:	01081513          	slli	a0,a6,0x10
    9ff2:	8141                	srli	a0,a0,0x10
    9ff4:	01035693          	srli	a3,t1,0x10
    9ff8:	02ce7e33          	remu	t3,t3,a2
    9ffc:	02f507b3          	mul	a5,a0,a5
    a000:	0e42                	slli	t3,t3,0x10
    a002:	00de6733          	or	a4,t3,a3
    a006:	00f77863          	bgeu	a4,a5,a016 <__umoddi3+0x88>
    a00a:	9742                	add	a4,a4,a6
    a00c:	01076563          	bltu	a4,a6,a016 <__umoddi3+0x88>
    a010:	00f77363          	bgeu	a4,a5,a016 <__umoddi3+0x88>
    a014:	9742                	add	a4,a4,a6
    a016:	8f1d                	sub	a4,a4,a5
    a018:	02c756b3          	divu	a3,a4,a2
    a01c:	01031793          	slli	a5,t1,0x10
    a020:	83c1                	srli	a5,a5,0x10
    a022:	02c77733          	remu	a4,a4,a2
    a026:	02d50533          	mul	a0,a0,a3
    a02a:	0742                	slli	a4,a4,0x10
    a02c:	8fd9                	or	a5,a5,a4
    a02e:	08a7ec63          	bltu	a5,a0,a0c6 <__umoddi3+0x138>
    a032:	40a78533          	sub	a0,a5,a0
    a036:	01155533          	srl	a0,a0,a7
    a03a:	4581                	li	a1,0
    a03c:	8082                	ret
    a03e:	e601                	bnez	a2,a046 <__umoddi3+0xb8>
    a040:	4705                	li	a4,1
    a042:	02c75833          	divu	a6,a4,a2
    a046:	6741                	lui	a4,0x10
    a048:	0ee86c63          	bltu	a6,a4,a140 <__umoddi3+0x1b2>
    a04c:	010007b7          	lui	a5,0x1000
    a050:	2af86563          	bltu	a6,a5,a2fa <__umoddi3+0x36c>
    a054:	01885693          	srli	a3,a6,0x18
    a058:	47e1                	li	a5,24
    a05a:	00002717          	auipc	a4,0x2
    a05e:	11e70713          	addi	a4,a4,286 # c178 <__clz_tab>
    a062:	9736                	add	a4,a4,a3
    a064:	00074703          	lbu	a4,0(a4)
    a068:	02000893          	li	a7,32
    a06c:	97ba                	add	a5,a5,a4
    a06e:	40f888b3          	sub	a7,a7,a5
    a072:	1e089a63          	bnez	a7,a266 <__umoddi3+0x2d8>
    a076:	01081e13          	slli	t3,a6,0x10
    a07a:	410585b3          	sub	a1,a1,a6
    a07e:	01085613          	srli	a2,a6,0x10
    a082:	010e5e13          	srli	t3,t3,0x10
    a086:	01035713          	srli	a4,t1,0x10
    a08a:	02c5d6b3          	divu	a3,a1,a2
    a08e:	02c5f5b3          	remu	a1,a1,a2
    a092:	03c686b3          	mul	a3,a3,t3
    a096:	05c2                	slli	a1,a1,0x10
    a098:	8f4d                	or	a4,a4,a1
    a09a:	00d77763          	bgeu	a4,a3,a0a8 <__umoddi3+0x11a>
    a09e:	9742                	add	a4,a4,a6
    a0a0:	01076463          	bltu	a4,a6,a0a8 <__umoddi3+0x11a>
    a0a4:	26d76a63          	bltu	a4,a3,a318 <__umoddi3+0x38a>
    a0a8:	8f15                	sub	a4,a4,a3
    a0aa:	02c75533          	divu	a0,a4,a2
    a0ae:	0342                	slli	t1,t1,0x10
    a0b0:	01035313          	srli	t1,t1,0x10
    a0b4:	02c77733          	remu	a4,a4,a2
    a0b8:	03c50533          	mul	a0,a0,t3
    a0bc:	0742                	slli	a4,a4,0x10
    a0be:	006767b3          	or	a5,a4,t1
    a0c2:	00a7f863          	bgeu	a5,a0,a0d2 <__umoddi3+0x144>
    a0c6:	97c2                	add	a5,a5,a6
    a0c8:	0107e563          	bltu	a5,a6,a0d2 <__umoddi3+0x144>
    a0cc:	00a7f363          	bgeu	a5,a0,a0d2 <__umoddi3+0x144>
    a0d0:	97c2                	add	a5,a5,a6
    a0d2:	40a78533          	sub	a0,a5,a0
    a0d6:	01155533          	srl	a0,a0,a7
    a0da:	4581                	li	a1,0
    a0dc:	8082                	ret
    a0de:	882a                	mv	a6,a0
    a0e0:	f4d5eee3          	bltu	a1,a3,a03c <__umoddi3+0xae>
    a0e4:	67c1                	lui	a5,0x10
    a0e6:	04f6e563          	bltu	a3,a5,a130 <__umoddi3+0x1a2>
    a0ea:	010007b7          	lui	a5,0x1000
    a0ee:	20f6e263          	bltu	a3,a5,a2f2 <__umoddi3+0x364>
    a0f2:	0186d313          	srli	t1,a3,0x18
    a0f6:	48e1                	li	a7,24
    a0f8:	00002797          	auipc	a5,0x2
    a0fc:	08078793          	addi	a5,a5,128 # c178 <__clz_tab>
    a100:	979a                	add	a5,a5,t1
    a102:	0007ce03          	lbu	t3,0(a5)
    a106:	02000313          	li	t1,32
    a10a:	9e46                	add	t3,t3,a7
    a10c:	41c30333          	sub	t1,t1,t3
    a110:	04031963          	bnez	t1,a162 <__umoddi3+0x1d4>
    a114:	00b6e463          	bltu	a3,a1,a11c <__umoddi3+0x18e>
    a118:	00c56963          	bltu	a0,a2,a12a <__umoddi3+0x19c>
    a11c:	40c50833          	sub	a6,a0,a2
    a120:	8d95                	sub	a1,a1,a3
    a122:	01053733          	sltu	a4,a0,a6
    a126:	40e58733          	sub	a4,a1,a4
    a12a:	8542                	mv	a0,a6
    a12c:	85ba                	mv	a1,a4
    a12e:	8082                	ret
    a130:	0ff00793          	li	a5,255
    a134:	1cd7fb63          	bgeu	a5,a3,a30a <__umoddi3+0x37c>
    a138:	0086d313          	srli	t1,a3,0x8
    a13c:	48a1                	li	a7,8
    a13e:	bf6d                	j	a0f8 <__umoddi3+0x16a>
    a140:	0ff00713          	li	a4,255
    a144:	86c2                	mv	a3,a6
    a146:	f1077ae3          	bgeu	a4,a6,a05a <__umoddi3+0xcc>
    a14a:	00885693          	srli	a3,a6,0x8
    a14e:	47a1                	li	a5,8
    a150:	b729                	j	a05a <__umoddi3+0xcc>
    a152:	010007b7          	lui	a5,0x1000
    a156:	1af66663          	bltu	a2,a5,a302 <__umoddi3+0x374>
    a15a:	01865693          	srli	a3,a2,0x18
    a15e:	47e1                	li	a5,24
    a160:	bd99                	j	9fb6 <__umoddi3+0x28>
    a162:	01c657b3          	srl	a5,a2,t3
    a166:	006696b3          	sll	a3,a3,t1
    a16a:	8edd                	or	a3,a3,a5
    a16c:	01c5d8b3          	srl	a7,a1,t3
    a170:	0106d713          	srli	a4,a3,0x10
    a174:	02e8deb3          	divu	t4,a7,a4
    a178:	01069f13          	slli	t5,a3,0x10
    a17c:	01c557b3          	srl	a5,a0,t3
    a180:	010f5f13          	srli	t5,t5,0x10
    a184:	006595b3          	sll	a1,a1,t1
    a188:	8ddd                	or	a1,a1,a5
    a18a:	0105d813          	srli	a6,a1,0x10
    a18e:	00661633          	sll	a2,a2,t1
    a192:	00651533          	sll	a0,a0,t1
    a196:	02e8f8b3          	remu	a7,a7,a4
    a19a:	03df07b3          	mul	a5,t5,t4
    a19e:	08c2                	slli	a7,a7,0x10
    a1a0:	0108e833          	or	a6,a7,a6
    a1a4:	00f87b63          	bgeu	a6,a5,a1ba <__umoddi3+0x22c>
    a1a8:	9836                	add	a6,a6,a3
    a1aa:	fffe8893          	addi	a7,t4,-1
    a1ae:	16d86363          	bltu	a6,a3,a314 <__umoddi3+0x386>
    a1b2:	16f87163          	bgeu	a6,a5,a314 <__umoddi3+0x386>
    a1b6:	1ef9                	addi	t4,t4,-2
    a1b8:	9836                	add	a6,a6,a3
    a1ba:	40f80833          	sub	a6,a6,a5
    a1be:	02e857b3          	divu	a5,a6,a4
    a1c2:	05c2                	slli	a1,a1,0x10
    a1c4:	81c1                	srli	a1,a1,0x10
    a1c6:	02e87833          	remu	a6,a6,a4
    a1ca:	02ff0f33          	mul	t5,t5,a5
    a1ce:	01081713          	slli	a4,a6,0x10
    a1d2:	8f4d                	or	a4,a4,a1
    a1d4:	01e77b63          	bgeu	a4,t5,a1ea <__umoddi3+0x25c>
    a1d8:	9736                	add	a4,a4,a3
    a1da:	fff78593          	addi	a1,a5,-1 # ffffff <_data_lma+0xff3d4b>
    a1de:	12d76963          	bltu	a4,a3,a310 <__umoddi3+0x382>
    a1e2:	13e77763          	bgeu	a4,t5,a310 <__umoddi3+0x382>
    a1e6:	17f9                	addi	a5,a5,-2
    a1e8:	9736                	add	a4,a4,a3
    a1ea:	0ec2                	slli	t4,t4,0x10
    a1ec:	62c1                	lui	t0,0x10
    a1ee:	00feeeb3          	or	t4,t4,a5
    a1f2:	fff28813          	addi	a6,t0,-1 # ffff <_data_lma+0x3d4b>
    a1f6:	010ef8b3          	and	a7,t4,a6
    a1fa:	01065593          	srli	a1,a2,0x10
    a1fe:	010ede93          	srli	t4,t4,0x10
    a202:	01067833          	and	a6,a2,a6
    a206:	03088fb3          	mul	t6,a7,a6
    a20a:	41e70733          	sub	a4,a4,t5
    a20e:	030e8833          	mul	a6,t4,a6
    a212:	010fd793          	srli	a5,t6,0x10
    a216:	02b888b3          	mul	a7,a7,a1
    a21a:	98c2                	add	a7,a7,a6
    a21c:	97c6                	add	a5,a5,a7
    a21e:	02be8eb3          	mul	t4,t4,a1
    a222:	0107f363          	bgeu	a5,a6,a228 <__umoddi3+0x29a>
    a226:	9e96                	add	t4,t4,t0
    a228:	6841                	lui	a6,0x10
    a22a:	187d                	addi	a6,a6,-1
    a22c:	0107d593          	srli	a1,a5,0x10
    a230:	0107f7b3          	and	a5,a5,a6
    a234:	07c2                	slli	a5,a5,0x10
    a236:	010fffb3          	and	t6,t6,a6
    a23a:	95f6                	add	a1,a1,t4
    a23c:	97fe                	add	a5,a5,t6
    a23e:	0ab76263          	bltu	a4,a1,a2e2 <__umoddi3+0x354>
    a242:	08b70e63          	beq	a4,a1,a2de <__umoddi3+0x350>
    a246:	40f507b3          	sub	a5,a0,a5
    a24a:	00f53533          	sltu	a0,a0,a5
    a24e:	40b705b3          	sub	a1,a4,a1
    a252:	8d89                	sub	a1,a1,a0
    a254:	01c59e33          	sll	t3,a1,t3
    a258:	0067d533          	srl	a0,a5,t1
    a25c:	00ae6533          	or	a0,t3,a0
    a260:	0065d5b3          	srl	a1,a1,t1
    a264:	8082                	ret
    a266:	01181833          	sll	a6,a6,a7
    a26a:	00f5d733          	srl	a4,a1,a5
    a26e:	01085613          	srli	a2,a6,0x10
    a272:	02c756b3          	divu	a3,a4,a2
    a276:	01081e13          	slli	t3,a6,0x10
    a27a:	00f557b3          	srl	a5,a0,a5
    a27e:	010e5e13          	srli	t3,t3,0x10
    a282:	011595b3          	sll	a1,a1,a7
    a286:	8ddd                	or	a1,a1,a5
    a288:	0105de93          	srli	t4,a1,0x10
    a28c:	01151333          	sll	t1,a0,a7
    a290:	02c77733          	remu	a4,a4,a2
    a294:	02de07b3          	mul	a5,t3,a3
    a298:	01071693          	slli	a3,a4,0x10
    a29c:	01d6e6b3          	or	a3,a3,t4
    a2a0:	00f6f863          	bgeu	a3,a5,a2b0 <__umoddi3+0x322>
    a2a4:	96c2                	add	a3,a3,a6
    a2a6:	0106e563          	bltu	a3,a6,a2b0 <__umoddi3+0x322>
    a2aa:	00f6f363          	bgeu	a3,a5,a2b0 <__umoddi3+0x322>
    a2ae:	96c2                	add	a3,a3,a6
    a2b0:	8e9d                	sub	a3,a3,a5
    a2b2:	02c6d733          	divu	a4,a3,a2
    a2b6:	01059793          	slli	a5,a1,0x10
    a2ba:	83c1                	srli	a5,a5,0x10
    a2bc:	02c6f6b3          	remu	a3,a3,a2
    a2c0:	02ee0733          	mul	a4,t3,a4
    a2c4:	01069593          	slli	a1,a3,0x10
    a2c8:	8ddd                	or	a1,a1,a5
    a2ca:	00e5f863          	bgeu	a1,a4,a2da <__umoddi3+0x34c>
    a2ce:	95c2                	add	a1,a1,a6
    a2d0:	0105e563          	bltu	a1,a6,a2da <__umoddi3+0x34c>
    a2d4:	00e5f363          	bgeu	a1,a4,a2da <__umoddi3+0x34c>
    a2d8:	95c2                	add	a1,a1,a6
    a2da:	8d99                	sub	a1,a1,a4
    a2dc:	b36d                	j	a086 <__umoddi3+0xf8>
    a2de:	f6f574e3          	bgeu	a0,a5,a246 <__umoddi3+0x2b8>
    a2e2:	40c78633          	sub	a2,a5,a2
    a2e6:	00c7b7b3          	sltu	a5,a5,a2
    a2ea:	97b6                	add	a5,a5,a3
    a2ec:	8d9d                	sub	a1,a1,a5
    a2ee:	87b2                	mv	a5,a2
    a2f0:	bf99                	j	a246 <__umoddi3+0x2b8>
    a2f2:	0106d313          	srli	t1,a3,0x10
    a2f6:	48c1                	li	a7,16
    a2f8:	b501                	j	a0f8 <__umoddi3+0x16a>
    a2fa:	01085693          	srli	a3,a6,0x10
    a2fe:	47c1                	li	a5,16
    a300:	bba9                	j	a05a <__umoddi3+0xcc>
    a302:	01065693          	srli	a3,a2,0x10
    a306:	47c1                	li	a5,16
    a308:	b17d                	j	9fb6 <__umoddi3+0x28>
    a30a:	8336                	mv	t1,a3
    a30c:	4881                	li	a7,0
    a30e:	b3ed                	j	a0f8 <__umoddi3+0x16a>
    a310:	87ae                	mv	a5,a1
    a312:	bde1                	j	a1ea <__umoddi3+0x25c>
    a314:	8ec6                	mv	t4,a7
    a316:	b555                	j	a1ba <__umoddi3+0x22c>
    a318:	9742                	add	a4,a4,a6
    a31a:	b379                	j	a0a8 <__umoddi3+0x11a>

0000a31c <__adddf3>:
    a31c:	00100837          	lui	a6,0x100
    a320:	1101                	addi	sp,sp,-32
    a322:	187d                	addi	a6,a6,-1
    a324:	00b87733          	and	a4,a6,a1
    a328:	ca26                	sw	s1,20(sp)
    a32a:	00d87833          	and	a6,a6,a3
    a32e:	0145d493          	srli	s1,a1,0x14
    a332:	0146d313          	srli	t1,a3,0x14
    a336:	00371e13          	slli	t3,a4,0x3
    a33a:	c64e                	sw	s3,12(sp)
    a33c:	01d55713          	srli	a4,a0,0x1d
    a340:	080e                	slli	a6,a6,0x3
    a342:	01d65793          	srli	a5,a2,0x1d
    a346:	7ff4f493          	andi	s1,s1,2047
    a34a:	7ff37313          	andi	t1,t1,2047
    a34e:	ce06                	sw	ra,28(sp)
    a350:	cc22                	sw	s0,24(sp)
    a352:	c84a                	sw	s2,16(sp)
    a354:	01f5d993          	srli	s3,a1,0x1f
    a358:	01f6de93          	srli	t4,a3,0x1f
    a35c:	01c76733          	or	a4,a4,t3
    a360:	00351f13          	slli	t5,a0,0x3
    a364:	0107e833          	or	a6,a5,a6
    a368:	00361f93          	slli	t6,a2,0x3
    a36c:	40648e33          	sub	t3,s1,t1
    a370:	19d98063          	beq	s3,t4,a4f0 <__adddf3+0x1d4>
    a374:	13c05663          	blez	t3,a4a0 <__adddf3+0x184>
    a378:	1c030463          	beqz	t1,a540 <__adddf3+0x224>
    a37c:	008006b7          	lui	a3,0x800
    a380:	7ff00793          	li	a5,2047
    a384:	00d86833          	or	a6,a6,a3
    a388:	36f48f63          	beq	s1,a5,a706 <__adddf3+0x3ea>
    a38c:	03800793          	li	a5,56
    a390:	35c7c063          	blt	a5,t3,a6d0 <__adddf3+0x3b4>
    a394:	47fd                	li	a5,31
    a396:	47c7cd63          	blt	a5,t3,a810 <__adddf3+0x4f4>
    a39a:	02000513          	li	a0,32
    a39e:	41c50533          	sub	a0,a0,t3
    a3a2:	01cfd7b3          	srl	a5,t6,t3
    a3a6:	00a816b3          	sll	a3,a6,a0
    a3aa:	00af9933          	sll	s2,t6,a0
    a3ae:	8edd                	or	a3,a3,a5
    a3b0:	01203933          	snez	s2,s2
    a3b4:	01c857b3          	srl	a5,a6,t3
    a3b8:	0126e933          	or	s2,a3,s2
    a3bc:	8f1d                	sub	a4,a4,a5
    a3be:	412f0933          	sub	s2,t5,s2
    a3c2:	012f37b3          	sltu	a5,t5,s2
    a3c6:	40f70633          	sub	a2,a4,a5
    a3ca:	00861793          	slli	a5,a2,0x8
    a3ce:	2407d463          	bgez	a5,a616 <__adddf3+0x2fa>
    a3d2:	00800737          	lui	a4,0x800
    a3d6:	177d                	addi	a4,a4,-1
    a3d8:	00e67433          	and	s0,a2,a4
    a3dc:	2c040c63          	beqz	s0,a6b4 <__adddf3+0x398>
    a3e0:	8522                	mv	a0,s0
    a3e2:	2f3010ef          	jal	ra,bed4 <__clzsi2>
    a3e6:	ff850713          	addi	a4,a0,-8
    a3ea:	02000793          	li	a5,32
    a3ee:	8f99                	sub	a5,a5,a4
    a3f0:	00f957b3          	srl	a5,s2,a5
    a3f4:	00e41633          	sll	a2,s0,a4
    a3f8:	8fd1                	or	a5,a5,a2
    a3fa:	00e91933          	sll	s2,s2,a4
    a3fe:	2a974163          	blt	a4,s1,a6a0 <__adddf3+0x384>
    a402:	40970533          	sub	a0,a4,s1
    a406:	00150613          	addi	a2,a0,1
    a40a:	477d                	li	a4,31
    a40c:	38c74d63          	blt	a4,a2,a7a6 <__adddf3+0x48a>
    a410:	02000713          	li	a4,32
    a414:	8f11                	sub	a4,a4,a2
    a416:	00c956b3          	srl	a3,s2,a2
    a41a:	00e91933          	sll	s2,s2,a4
    a41e:	00e79733          	sll	a4,a5,a4
    a422:	8f55                	or	a4,a4,a3
    a424:	01203933          	snez	s2,s2
    a428:	01276933          	or	s2,a4,s2
    a42c:	00c7d633          	srl	a2,a5,a2
    a430:	4481                	li	s1,0
    a432:	00797793          	andi	a5,s2,7
    a436:	cf81                	beqz	a5,a44e <__adddf3+0x132>
    a438:	00f97713          	andi	a4,s2,15
    a43c:	4791                	li	a5,4
    a43e:	00f70863          	beq	a4,a5,a44e <__adddf3+0x132>
    a442:	00490713          	addi	a4,s2,4
    a446:	01273933          	sltu	s2,a4,s2
    a44a:	964a                	add	a2,a2,s2
    a44c:	893a                	mv	s2,a4
    a44e:	00861793          	slli	a5,a2,0x8
    a452:	1c07d663          	bgez	a5,a61e <__adddf3+0x302>
    a456:	00148513          	addi	a0,s1,1
    a45a:	7ff00793          	li	a5,2047
    a45e:	85ce                	mv	a1,s3
    a460:	20f50463          	beq	a0,a5,a668 <__adddf3+0x34c>
    a464:	ff8007b7          	lui	a5,0xff800
    a468:	17fd                	addi	a5,a5,-1
    a46a:	8ff1                	and	a5,a5,a2
    a46c:	01d79893          	slli	a7,a5,0x1d
    a470:	00395913          	srli	s2,s2,0x3
    a474:	07a6                	slli	a5,a5,0x9
    a476:	0128e8b3          	or	a7,a7,s2
    a47a:	83b1                	srli	a5,a5,0xc
    a47c:	7ff57513          	andi	a0,a0,2047
    a480:	00c79693          	slli	a3,a5,0xc
    a484:	0552                	slli	a0,a0,0x14
    a486:	40f2                	lw	ra,28(sp)
    a488:	4462                	lw	s0,24(sp)
    a48a:	82b1                	srli	a3,a3,0xc
    a48c:	05fe                	slli	a1,a1,0x1f
    a48e:	8ec9                	or	a3,a3,a0
    a490:	8ecd                	or	a3,a3,a1
    a492:	44d2                	lw	s1,20(sp)
    a494:	4942                	lw	s2,16(sp)
    a496:	49b2                	lw	s3,12(sp)
    a498:	8546                	mv	a0,a7
    a49a:	85b6                	mv	a1,a3
    a49c:	6105                	addi	sp,sp,32
    a49e:	8082                	ret
    a4a0:	0a0e1e63          	bnez	t3,a55c <__adddf3+0x240>
    a4a4:	00148313          	addi	t1,s1,1
    a4a8:	7fe37313          	andi	t1,t1,2046
    a4ac:	22031763          	bnez	t1,a6da <__adddf3+0x3be>
    a4b0:	01e767b3          	or	a5,a4,t5
    a4b4:	01f868b3          	or	a7,a6,t6
    a4b8:	1a049d63          	bnez	s1,a672 <__adddf3+0x356>
    a4bc:	40078763          	beqz	a5,a8ca <__adddf3+0x5ae>
    a4c0:	44088663          	beqz	a7,a90c <__adddf3+0x5f0>
    a4c4:	41ff0933          	sub	s2,t5,t6
    a4c8:	410707b3          	sub	a5,a4,a6
    a4cc:	012f3633          	sltu	a2,t5,s2
    a4d0:	40c78633          	sub	a2,a5,a2
    a4d4:	00861793          	slli	a5,a2,0x8
    a4d8:	4c07d663          	bgez	a5,a9a4 <__adddf3+0x688>
    a4dc:	41ef8933          	sub	s2,t6,t5
    a4e0:	40e807b3          	sub	a5,a6,a4
    a4e4:	012fb633          	sltu	a2,t6,s2
    a4e8:	40c78633          	sub	a2,a5,a2
    a4ec:	89f6                	mv	s3,t4
    a4ee:	b791                	j	a432 <__adddf3+0x116>
    a4f0:	0fc05063          	blez	t3,a5d0 <__adddf3+0x2b4>
    a4f4:	0c030063          	beqz	t1,a5b4 <__adddf3+0x298>
    a4f8:	008006b7          	lui	a3,0x800
    a4fc:	7ff00793          	li	a5,2047
    a500:	00d86833          	or	a6,a6,a3
    a504:	3af48a63          	beq	s1,a5,a8b8 <__adddf3+0x59c>
    a508:	03800793          	li	a5,56
    a50c:	13c7cb63          	blt	a5,t3,a642 <__adddf3+0x326>
    a510:	47fd                	li	a5,31
    a512:	35c7df63          	bge	a5,t3,a870 <__adddf3+0x554>
    a516:	fe0e0913          	addi	s2,t3,-32
    a51a:	02000793          	li	a5,32
    a51e:	012856b3          	srl	a3,a6,s2
    a522:	00fe0a63          	beq	t3,a5,a536 <__adddf3+0x21a>
    a526:	04000913          	li	s2,64
    a52a:	41c90933          	sub	s2,s2,t3
    a52e:	01281933          	sll	s2,a6,s2
    a532:	012fefb3          	or	t6,t6,s2
    a536:	01f03933          	snez	s2,t6
    a53a:	00d96933          	or	s2,s2,a3
    a53e:	a231                	j	a64a <__adddf3+0x32e>
    a540:	01f867b3          	or	a5,a6,t6
    a544:	1c078a63          	beqz	a5,a718 <__adddf3+0x3fc>
    a548:	fffe0793          	addi	a5,t3,-1
    a54c:	38078c63          	beqz	a5,a8e4 <__adddf3+0x5c8>
    a550:	7ff00693          	li	a3,2047
    a554:	1ade0963          	beq	t3,a3,a706 <__adddf3+0x3ea>
    a558:	8e3e                	mv	t3,a5
    a55a:	bd0d                	j	a38c <__adddf3+0x70>
    a55c:	409305b3          	sub	a1,t1,s1
    a560:	22049163          	bnez	s1,a782 <__adddf3+0x466>
    a564:	01e767b3          	or	a5,a4,t5
    a568:	32078763          	beqz	a5,a896 <__adddf3+0x57a>
    a56c:	fff58793          	addi	a5,a1,-1
    a570:	44078163          	beqz	a5,a9b2 <__adddf3+0x696>
    a574:	7ff00693          	li	a3,2047
    a578:	20d58c63          	beq	a1,a3,a790 <__adddf3+0x474>
    a57c:	85be                	mv	a1,a5
    a57e:	03800793          	li	a5,56
    a582:	2ab7cc63          	blt	a5,a1,a83a <__adddf3+0x51e>
    a586:	47fd                	li	a5,31
    a588:	3cb7cf63          	blt	a5,a1,a966 <__adddf3+0x64a>
    a58c:	02000793          	li	a5,32
    a590:	8f8d                	sub	a5,a5,a1
    a592:	00f71933          	sll	s2,a4,a5
    a596:	00bf56b3          	srl	a3,t5,a1
    a59a:	00ff17b3          	sll	a5,t5,a5
    a59e:	00d96933          	or	s2,s2,a3
    a5a2:	00f037b3          	snez	a5,a5
    a5a6:	00b75733          	srl	a4,a4,a1
    a5aa:	00f96933          	or	s2,s2,a5
    a5ae:	40e80833          	sub	a6,a6,a4
    a5b2:	ac41                	j	a842 <__adddf3+0x526>
    a5b4:	01f867b3          	or	a5,a6,t6
    a5b8:	34078063          	beqz	a5,a8f8 <__adddf3+0x5dc>
    a5bc:	fffe0793          	addi	a5,t3,-1
    a5c0:	20078a63          	beqz	a5,a7d4 <__adddf3+0x4b8>
    a5c4:	7ff00693          	li	a3,2047
    a5c8:	2ede0863          	beq	t3,a3,a8b8 <__adddf3+0x59c>
    a5cc:	8e3e                	mv	t3,a5
    a5ce:	bf2d                	j	a508 <__adddf3+0x1ec>
    a5d0:	140e1e63          	bnez	t3,a72c <__adddf3+0x410>
    a5d4:	00148693          	addi	a3,s1,1
    a5d8:	7fe6f793          	andi	a5,a3,2046
    a5dc:	34079163          	bnez	a5,a91e <__adddf3+0x602>
    a5e0:	01e767b3          	or	a5,a4,t5
    a5e4:	2c049563          	bnez	s1,a8ae <__adddf3+0x592>
    a5e8:	3e078063          	beqz	a5,a9c8 <__adddf3+0x6ac>
    a5ec:	01f867b3          	or	a5,a6,t6
    a5f0:	30078e63          	beqz	a5,a90c <__adddf3+0x5f0>
    a5f4:	01ff0933          	add	s2,t5,t6
    a5f8:	010707b3          	add	a5,a4,a6
    a5fc:	01e93f33          	sltu	t5,s2,t5
    a600:	01e78633          	add	a2,a5,t5
    a604:	00861793          	slli	a5,a2,0x8
    a608:	0007d763          	bgez	a5,a616 <__adddf3+0x2fa>
    a60c:	ff8007b7          	lui	a5,0xff800
    a610:	17fd                	addi	a5,a5,-1
    a612:	8e7d                	and	a2,a2,a5
    a614:	4485                	li	s1,1
    a616:	00797793          	andi	a5,s2,7
    a61a:	e0079fe3          	bnez	a5,a438 <__adddf3+0x11c>
    a61e:	01d61793          	slli	a5,a2,0x1d
    a622:	00395893          	srli	a7,s2,0x3
    a626:	00f8e8b3          	or	a7,a7,a5
    a62a:	00365793          	srli	a5,a2,0x3
    a62e:	7ff00713          	li	a4,2047
    a632:	04e48d63          	beq	s1,a4,a68c <__adddf3+0x370>
    a636:	07b2                	slli	a5,a5,0xc
    a638:	83b1                	srli	a5,a5,0xc
    a63a:	7ff4f513          	andi	a0,s1,2047
    a63e:	85ce                	mv	a1,s3
    a640:	b581                	j	a480 <__adddf3+0x164>
    a642:	01f86933          	or	s2,a6,t6
    a646:	01203933          	snez	s2,s2
    a64a:	997a                	add	s2,s2,t5
    a64c:	01e937b3          	sltu	a5,s2,t5
    a650:	00e78633          	add	a2,a5,a4
    a654:	00861793          	slli	a5,a2,0x8
    a658:	fa07dfe3          	bgez	a5,a616 <__adddf3+0x2fa>
    a65c:	0485                	addi	s1,s1,1
    a65e:	7ff00793          	li	a5,2047
    a662:	18f49663          	bne	s1,a5,a7ee <__adddf3+0x4d2>
    a666:	85ce                	mv	a1,s3
    a668:	7ff00513          	li	a0,2047
    a66c:	4781                	li	a5,0
    a66e:	4881                	li	a7,0
    a670:	bd01                	j	a480 <__adddf3+0x164>
    a672:	ebc1                	bnez	a5,a702 <__adddf3+0x3e6>
    a674:	3a088463          	beqz	a7,aa1c <__adddf3+0x700>
    a678:	00361693          	slli	a3,a2,0x3
    a67c:	01d81793          	slli	a5,a6,0x1d
    a680:	828d                	srli	a3,a3,0x3
    a682:	00d7e8b3          	or	a7,a5,a3
    a686:	89f6                	mv	s3,t4
    a688:	00385793          	srli	a5,a6,0x3
    a68c:	00f8e7b3          	or	a5,a7,a5
    a690:	dbf9                	beqz	a5,a666 <__adddf3+0x34a>
    a692:	4581                	li	a1,0
    a694:	7ff00513          	li	a0,2047
    a698:	000807b7          	lui	a5,0x80
    a69c:	4881                	li	a7,0
    a69e:	b3cd                	j	a480 <__adddf3+0x164>
    a6a0:	ff800637          	lui	a2,0xff800
    a6a4:	167d                	addi	a2,a2,-1
    a6a6:	8e7d                	and	a2,a2,a5
    a6a8:	00797793          	andi	a5,s2,7
    a6ac:	8c99                	sub	s1,s1,a4
    a6ae:	d80795e3          	bnez	a5,a438 <__adddf3+0x11c>
    a6b2:	b7b5                	j	a61e <__adddf3+0x302>
    a6b4:	854a                	mv	a0,s2
    a6b6:	01f010ef          	jal	ra,bed4 <__clzsi2>
    a6ba:	01850713          	addi	a4,a0,24
    a6be:	47fd                	li	a5,31
    a6c0:	d2e7d5e3          	bge	a5,a4,a3ea <__adddf3+0xce>
    a6c4:	ff850613          	addi	a2,a0,-8
    a6c8:	00c917b3          	sll	a5,s2,a2
    a6cc:	4901                	li	s2,0
    a6ce:	bb05                	j	a3fe <__adddf3+0xe2>
    a6d0:	01f86933          	or	s2,a6,t6
    a6d4:	01203933          	snez	s2,s2
    a6d8:	b1dd                	j	a3be <__adddf3+0xa2>
    a6da:	41ff0933          	sub	s2,t5,t6
    a6de:	41070633          	sub	a2,a4,a6
    a6e2:	012f3433          	sltu	s0,t5,s2
    a6e6:	40860433          	sub	s0,a2,s0
    a6ea:	00841793          	slli	a5,s0,0x8
    a6ee:	2407cd63          	bltz	a5,a948 <__adddf3+0x62c>
    a6f2:	008968b3          	or	a7,s2,s0
    a6f6:	ce0893e3          	bnez	a7,a3dc <__adddf3+0xc0>
    a6fa:	4781                	li	a5,0
    a6fc:	4981                	li	s3,0
    a6fe:	4481                	li	s1,0
    a700:	bf1d                	j	a636 <__adddf3+0x31a>
    a702:	f80898e3          	bnez	a7,a692 <__adddf3+0x376>
    a706:	050e                	slli	a0,a0,0x3
    a708:	01d71793          	slli	a5,a4,0x1d
    a70c:	810d                	srli	a0,a0,0x3
    a70e:	00a7e8b3          	or	a7,a5,a0
    a712:	00375793          	srli	a5,a4,0x3
    a716:	bf9d                	j	a68c <__adddf3+0x370>
    a718:	050e                	slli	a0,a0,0x3
    a71a:	01d71793          	slli	a5,a4,0x1d
    a71e:	810d                	srli	a0,a0,0x3
    a720:	00a7e8b3          	or	a7,a5,a0
    a724:	84f2                	mv	s1,t3
    a726:	00375793          	srli	a5,a4,0x3
    a72a:	b711                	j	a62e <__adddf3+0x312>
    a72c:	40930533          	sub	a0,t1,s1
    a730:	12048263          	beqz	s1,a854 <__adddf3+0x538>
    a734:	008006b7          	lui	a3,0x800
    a738:	7ff00793          	li	a5,2047
    a73c:	8f55                	or	a4,a4,a3
    a73e:	2ef30d63          	beq	t1,a5,aa38 <__adddf3+0x71c>
    a742:	03800793          	li	a5,56
    a746:	20a7cb63          	blt	a5,a0,a95c <__adddf3+0x640>
    a74a:	47fd                	li	a5,31
    a74c:	2aa7c363          	blt	a5,a0,a9f2 <__adddf3+0x6d6>
    a750:	02000793          	li	a5,32
    a754:	8f89                	sub	a5,a5,a0
    a756:	00f71933          	sll	s2,a4,a5
    a75a:	00af56b3          	srl	a3,t5,a0
    a75e:	00ff17b3          	sll	a5,t5,a5
    a762:	00d96933          	or	s2,s2,a3
    a766:	00f037b3          	snez	a5,a5
    a76a:	00a75733          	srl	a4,a4,a0
    a76e:	00f96933          	or	s2,s2,a5
    a772:	983a                	add	a6,a6,a4
    a774:	997e                	add	s2,s2,t6
    a776:	01f937b3          	sltu	a5,s2,t6
    a77a:	01078633          	add	a2,a5,a6
    a77e:	849a                	mv	s1,t1
    a780:	bdd1                	j	a654 <__adddf3+0x338>
    a782:	008006b7          	lui	a3,0x800
    a786:	7ff00793          	li	a5,2047
    a78a:	8f55                	or	a4,a4,a3
    a78c:	def319e3          	bne	t1,a5,a57e <__adddf3+0x262>
    a790:	00361793          	slli	a5,a2,0x3
    a794:	838d                	srli	a5,a5,0x3
    a796:	01d81893          	slli	a7,a6,0x1d
    a79a:	0117e8b3          	or	a7,a5,a7
    a79e:	89f6                	mv	s3,t4
    a7a0:	00385793          	srli	a5,a6,0x3
    a7a4:	b5e5                	j	a68c <__adddf3+0x370>
    a7a6:	fe150713          	addi	a4,a0,-31
    a7aa:	02000693          	li	a3,32
    a7ae:	00e7d733          	srl	a4,a5,a4
    a7b2:	00d60a63          	beq	a2,a3,a7c6 <__adddf3+0x4aa>
    a7b6:	04000693          	li	a3,64
    a7ba:	40c68633          	sub	a2,a3,a2
    a7be:	00c79633          	sll	a2,a5,a2
    a7c2:	00c96933          	or	s2,s2,a2
    a7c6:	01203933          	snez	s2,s2
    a7ca:	00e96933          	or	s2,s2,a4
    a7ce:	4601                	li	a2,0
    a7d0:	4481                	li	s1,0
    a7d2:	b591                	j	a616 <__adddf3+0x2fa>
    a7d4:	01ff0933          	add	s2,t5,t6
    a7d8:	010707b3          	add	a5,a4,a6
    a7dc:	01e93633          	sltu	a2,s2,t5
    a7e0:	963e                	add	a2,a2,a5
    a7e2:	00861793          	slli	a5,a2,0x8
    a7e6:	4485                	li	s1,1
    a7e8:	e207d7e3          	bgez	a5,a616 <__adddf3+0x2fa>
    a7ec:	4489                	li	s1,2
    a7ee:	ff8007b7          	lui	a5,0xff800
    a7f2:	17fd                	addi	a5,a5,-1
    a7f4:	8ff1                	and	a5,a5,a2
    a7f6:	00195713          	srli	a4,s2,0x1
    a7fa:	00197913          	andi	s2,s2,1
    a7fe:	01276933          	or	s2,a4,s2
    a802:	01f79893          	slli	a7,a5,0x1f
    a806:	0128e933          	or	s2,a7,s2
    a80a:	0017d613          	srli	a2,a5,0x1
    a80e:	b115                	j	a432 <__adddf3+0x116>
    a810:	fe0e0913          	addi	s2,t3,-32
    a814:	02000793          	li	a5,32
    a818:	012856b3          	srl	a3,a6,s2
    a81c:	00fe0a63          	beq	t3,a5,a830 <__adddf3+0x514>
    a820:	04000913          	li	s2,64
    a824:	41c90933          	sub	s2,s2,t3
    a828:	01281933          	sll	s2,a6,s2
    a82c:	012fefb3          	or	t6,t6,s2
    a830:	01f03933          	snez	s2,t6
    a834:	00d96933          	or	s2,s2,a3
    a838:	b659                	j	a3be <__adddf3+0xa2>
    a83a:	01e76933          	or	s2,a4,t5
    a83e:	01203933          	snez	s2,s2
    a842:	412f8933          	sub	s2,t6,s2
    a846:	012fb7b3          	sltu	a5,t6,s2
    a84a:	40f80633          	sub	a2,a6,a5
    a84e:	849a                	mv	s1,t1
    a850:	89f6                	mv	s3,t4
    a852:	bea5                	j	a3ca <__adddf3+0xae>
    a854:	01e767b3          	or	a5,a4,t5
    a858:	18078263          	beqz	a5,a9dc <__adddf3+0x6c0>
    a85c:	fff50793          	addi	a5,a0,-1
    a860:	1c078463          	beqz	a5,aa28 <__adddf3+0x70c>
    a864:	7ff00693          	li	a3,2047
    a868:	12d50463          	beq	a0,a3,a990 <__adddf3+0x674>
    a86c:	853e                	mv	a0,a5
    a86e:	bdd1                	j	a742 <__adddf3+0x426>
    a870:	02000793          	li	a5,32
    a874:	41c787b3          	sub	a5,a5,t3
    a878:	00f816b3          	sll	a3,a6,a5
    a87c:	00ff9933          	sll	s2,t6,a5
    a880:	01cfd633          	srl	a2,t6,t3
    a884:	8ed1                	or	a3,a3,a2
    a886:	01203933          	snez	s2,s2
    a88a:	01c857b3          	srl	a5,a6,t3
    a88e:	0126e933          	or	s2,a3,s2
    a892:	973e                	add	a4,a4,a5
    a894:	bb5d                	j	a64a <__adddf3+0x32e>
    a896:	00361793          	slli	a5,a2,0x3
    a89a:	838d                	srli	a5,a5,0x3
    a89c:	01d81893          	slli	a7,a6,0x1d
    a8a0:	0117e8b3          	or	a7,a5,a7
    a8a4:	84ae                	mv	s1,a1
    a8a6:	00385793          	srli	a5,a6,0x3
    a8aa:	89f6                	mv	s3,t4
    a8ac:	b349                	j	a62e <__adddf3+0x312>
    a8ae:	c3ed                	beqz	a5,a990 <__adddf3+0x674>
    a8b0:	01f86933          	or	s2,a6,t6
    a8b4:	dc091fe3          	bnez	s2,a692 <__adddf3+0x376>
    a8b8:	050e                	slli	a0,a0,0x3
    a8ba:	01d71793          	slli	a5,a4,0x1d
    a8be:	810d                	srli	a0,a0,0x3
    a8c0:	00f568b3          	or	a7,a0,a5
    a8c4:	00375793          	srli	a5,a4,0x3
    a8c8:	b3d1                	j	a68c <__adddf3+0x370>
    a8ca:	0e088163          	beqz	a7,a9ac <__adddf3+0x690>
    a8ce:	00361693          	slli	a3,a2,0x3
    a8d2:	01d81793          	slli	a5,a6,0x1d
    a8d6:	828d                	srli	a3,a3,0x3
    a8d8:	00d7e8b3          	or	a7,a5,a3
    a8dc:	89f6                	mv	s3,t4
    a8de:	00385793          	srli	a5,a6,0x3
    a8e2:	bb91                	j	a636 <__adddf3+0x31a>
    a8e4:	41ff0933          	sub	s2,t5,t6
    a8e8:	410707b3          	sub	a5,a4,a6
    a8ec:	012f3f33          	sltu	t5,t5,s2
    a8f0:	41e78633          	sub	a2,a5,t5
    a8f4:	4485                	li	s1,1
    a8f6:	bcd1                	j	a3ca <__adddf3+0xae>
    a8f8:	050e                	slli	a0,a0,0x3
    a8fa:	01d71793          	slli	a5,a4,0x1d
    a8fe:	810d                	srli	a0,a0,0x3
    a900:	00f568b3          	or	a7,a0,a5
    a904:	84f2                	mv	s1,t3
    a906:	00375793          	srli	a5,a4,0x3
    a90a:	b315                	j	a62e <__adddf3+0x312>
    a90c:	050e                	slli	a0,a0,0x3
    a90e:	01d71793          	slli	a5,a4,0x1d
    a912:	810d                	srli	a0,a0,0x3
    a914:	00a7e8b3          	or	a7,a5,a0
    a918:	00375793          	srli	a5,a4,0x3
    a91c:	bb29                	j	a636 <__adddf3+0x31a>
    a91e:	7ff00793          	li	a5,2047
    a922:	d4f682e3          	beq	a3,a5,a666 <__adddf3+0x34a>
    a926:	01ff0933          	add	s2,t5,t6
    a92a:	01e93633          	sltu	a2,s2,t5
    a92e:	010707b3          	add	a5,a4,a6
    a932:	97b2                	add	a5,a5,a2
    a934:	01f79893          	slli	a7,a5,0x1f
    a938:	00195913          	srli	s2,s2,0x1
    a93c:	0128e933          	or	s2,a7,s2
    a940:	0017d613          	srli	a2,a5,0x1
    a944:	84b6                	mv	s1,a3
    a946:	b9c1                	j	a616 <__adddf3+0x2fa>
    a948:	41ef8933          	sub	s2,t6,t5
    a94c:	40e80733          	sub	a4,a6,a4
    a950:	012fb633          	sltu	a2,t6,s2
    a954:	40c70433          	sub	s0,a4,a2
    a958:	89f6                	mv	s3,t4
    a95a:	b449                	j	a3dc <__adddf3+0xc0>
    a95c:	01e76933          	or	s2,a4,t5
    a960:	01203933          	snez	s2,s2
    a964:	bd01                	j	a774 <__adddf3+0x458>
    a966:	fe058793          	addi	a5,a1,-32
    a96a:	02000693          	li	a3,32
    a96e:	00f757b3          	srl	a5,a4,a5
    a972:	00d58a63          	beq	a1,a3,a986 <__adddf3+0x66a>
    a976:	04000693          	li	a3,64
    a97a:	40b685b3          	sub	a1,a3,a1
    a97e:	00b71733          	sll	a4,a4,a1
    a982:	00ef6f33          	or	t5,t5,a4
    a986:	01e03933          	snez	s2,t5
    a98a:	00f96933          	or	s2,s2,a5
    a98e:	bd55                	j	a842 <__adddf3+0x526>
    a990:	00361793          	slli	a5,a2,0x3
    a994:	838d                	srli	a5,a5,0x3
    a996:	01d81893          	slli	a7,a6,0x1d
    a99a:	0117e8b3          	or	a7,a5,a7
    a99e:	00385793          	srli	a5,a6,0x3
    a9a2:	b1ed                	j	a68c <__adddf3+0x370>
    a9a4:	00c968b3          	or	a7,s2,a2
    a9a8:	c60897e3          	bnez	a7,a616 <__adddf3+0x2fa>
    a9ac:	4781                	li	a5,0
    a9ae:	4981                	li	s3,0
    a9b0:	b159                	j	a636 <__adddf3+0x31a>
    a9b2:	41ef8933          	sub	s2,t6,t5
    a9b6:	40e807b3          	sub	a5,a6,a4
    a9ba:	012fb633          	sltu	a2,t6,s2
    a9be:	40c78633          	sub	a2,a5,a2
    a9c2:	89f6                	mv	s3,t4
    a9c4:	4485                	li	s1,1
    a9c6:	b411                	j	a3ca <__adddf3+0xae>
    a9c8:	00361693          	slli	a3,a2,0x3
    a9cc:	01d81793          	slli	a5,a6,0x1d
    a9d0:	828d                	srli	a3,a3,0x3
    a9d2:	00d7e8b3          	or	a7,a5,a3
    a9d6:	00385793          	srli	a5,a6,0x3
    a9da:	b9b1                	j	a636 <__adddf3+0x31a>
    a9dc:	00361693          	slli	a3,a2,0x3
    a9e0:	01d81793          	slli	a5,a6,0x1d
    a9e4:	828d                	srli	a3,a3,0x3
    a9e6:	00d7e8b3          	or	a7,a5,a3
    a9ea:	84aa                	mv	s1,a0
    a9ec:	00385793          	srli	a5,a6,0x3
    a9f0:	b93d                	j	a62e <__adddf3+0x312>
    a9f2:	fe050793          	addi	a5,a0,-32
    a9f6:	02000693          	li	a3,32
    a9fa:	00f757b3          	srl	a5,a4,a5
    a9fe:	00d50a63          	beq	a0,a3,aa12 <__adddf3+0x6f6>
    aa02:	04000693          	li	a3,64
    aa06:	40a68533          	sub	a0,a3,a0
    aa0a:	00a71733          	sll	a4,a4,a0
    aa0e:	00ef6f33          	or	t5,t5,a4
    aa12:	01e03933          	snez	s2,t5
    aa16:	00f96933          	or	s2,s2,a5
    aa1a:	bba9                	j	a774 <__adddf3+0x458>
    aa1c:	4581                	li	a1,0
    aa1e:	7ff00513          	li	a0,2047
    aa22:	000807b7          	lui	a5,0x80
    aa26:	bca9                	j	a480 <__adddf3+0x164>
    aa28:	01ff0933          	add	s2,t5,t6
    aa2c:	010707b3          	add	a5,a4,a6
    aa30:	01f93633          	sltu	a2,s2,t6
    aa34:	963e                	add	a2,a2,a5
    aa36:	b375                	j	a7e2 <__adddf3+0x4c6>
    aa38:	00361693          	slli	a3,a2,0x3
    aa3c:	01d81793          	slli	a5,a6,0x1d
    aa40:	828d                	srli	a3,a3,0x3
    aa42:	00d7e8b3          	or	a7,a5,a3
    aa46:	00385793          	srli	a5,a6,0x3
    aa4a:	b189                	j	a68c <__adddf3+0x370>

0000aa4c <__divdf3>:
    aa4c:	7139                	addi	sp,sp,-64
    aa4e:	0145d793          	srli	a5,a1,0x14
    aa52:	dc22                	sw	s0,56(sp)
    aa54:	d84a                	sw	s2,48(sp)
    aa56:	d256                	sw	s5,36(sp)
    aa58:	892a                	mv	s2,a0
    aa5a:	00c59413          	slli	s0,a1,0xc
    aa5e:	de06                	sw	ra,60(sp)
    aa60:	da26                	sw	s1,52(sp)
    aa62:	d64e                	sw	s3,44(sp)
    aa64:	d452                	sw	s4,40(sp)
    aa66:	d05a                	sw	s6,32(sp)
    aa68:	ce5e                	sw	s7,28(sp)
    aa6a:	7ff7f513          	andi	a0,a5,2047
    aa6e:	8031                	srli	s0,s0,0xc
    aa70:	01f5da93          	srli	s5,a1,0x1f
    aa74:	10050b63          	beqz	a0,ab8a <__divdf3+0x13e>
    aa78:	7ff00793          	li	a5,2047
    aa7c:	14f50b63          	beq	a0,a5,abd2 <__divdf3+0x186>
    aa80:	01d95a13          	srli	s4,s2,0x1d
    aa84:	040e                	slli	s0,s0,0x3
    aa86:	008a6433          	or	s0,s4,s0
    aa8a:	00800a37          	lui	s4,0x800
    aa8e:	01446a33          	or	s4,s0,s4
    aa92:	00391b13          	slli	s6,s2,0x3
    aa96:	c0150493          	addi	s1,a0,-1023
    aa9a:	4401                	li	s0,0
    aa9c:	4b81                	li	s7,0
    aa9e:	0146d813          	srli	a6,a3,0x14
    aaa2:	00c69913          	slli	s2,a3,0xc
    aaa6:	7ff87813          	andi	a6,a6,2047
    aaaa:	88b2                	mv	a7,a2
    aaac:	00c95913          	srli	s2,s2,0xc
    aab0:	01f6d993          	srli	s3,a3,0x1f
    aab4:	08080e63          	beqz	a6,ab50 <__divdf3+0x104>
    aab8:	7ff00793          	li	a5,2047
    aabc:	04f80063          	beq	a6,a5,aafc <__divdf3+0xb0>
    aac0:	01d65713          	srli	a4,a2,0x1d
    aac4:	090e                	slli	s2,s2,0x3
    aac6:	01276933          	or	s2,a4,s2
    aaca:	c0180813          	addi	a6,a6,-1023 # ffc01 <_data_lma+0xf394d>
    aace:	008007b7          	lui	a5,0x800
    aad2:	00f96733          	or	a4,s2,a5
    aad6:	00361893          	slli	a7,a2,0x3
    aada:	410484b3          	sub	s1,s1,a6
    aade:	4581                	li	a1,0
    aae0:	47bd                	li	a5,15
    aae2:	013ac833          	xor	a6,s5,s3
    aae6:	1a87e463          	bltu	a5,s0,ac8e <__divdf3+0x242>
    aaea:	00001797          	auipc	a5,0x1
    aaee:	60e78793          	addi	a5,a5,1550 # c0f8 <strlen+0x1ae>
    aaf2:	040a                	slli	s0,s0,0x2
    aaf4:	943e                	add	s0,s0,a5
    aaf6:	4010                	lw	a2,0(s0)
    aaf8:	963e                	add	a2,a2,a5
    aafa:	8602                	jr	a2
    aafc:	00c96733          	or	a4,s2,a2
    ab00:	80148493          	addi	s1,s1,-2047
    ab04:	10071263          	bnez	a4,ac08 <__divdf3+0x1bc>
    ab08:	00246413          	ori	s0,s0,2
    ab0c:	4881                	li	a7,0
    ab0e:	4589                	li	a1,2
    ab10:	bfc1                	j	aae0 <__divdf3+0x94>
    ab12:	7ff00613          	li	a2,2047
    ab16:	4781                	li	a5,0
    ab18:	4701                	li	a4,0
    ab1a:	07b2                	slli	a5,a5,0xc
    ab1c:	50f2                	lw	ra,60(sp)
    ab1e:	5462                	lw	s0,56(sp)
    ab20:	0652                	slli	a2,a2,0x14
    ab22:	83b1                	srli	a5,a5,0xc
    ab24:	087e                	slli	a6,a6,0x1f
    ab26:	8fd1                	or	a5,a5,a2
    ab28:	0107e7b3          	or	a5,a5,a6
    ab2c:	54d2                	lw	s1,52(sp)
    ab2e:	5942                	lw	s2,48(sp)
    ab30:	59b2                	lw	s3,44(sp)
    ab32:	5a22                	lw	s4,40(sp)
    ab34:	5a92                	lw	s5,36(sp)
    ab36:	5b02                	lw	s6,32(sp)
    ab38:	4bf2                	lw	s7,28(sp)
    ab3a:	853a                	mv	a0,a4
    ab3c:	85be                	mv	a1,a5
    ab3e:	6121                	addi	sp,sp,64
    ab40:	8082                	ret
    ab42:	4801                	li	a6,0
    ab44:	7ff00613          	li	a2,2047
    ab48:	000807b7          	lui	a5,0x80
    ab4c:	4701                	li	a4,0
    ab4e:	b7f1                	j	ab1a <__divdf3+0xce>
    ab50:	00c96733          	or	a4,s2,a2
    ab54:	c74d                	beqz	a4,abfe <__divdf3+0x1b2>
    ab56:	30090863          	beqz	s2,ae66 <__divdf3+0x41a>
    ab5a:	854a                	mv	a0,s2
    ab5c:	c432                	sw	a2,8(sp)
    ab5e:	376010ef          	jal	ra,bed4 <__clzsi2>
    ab62:	4622                	lw	a2,8(sp)
    ab64:	ff550713          	addi	a4,a0,-11
    ab68:	47f5                	li	a5,29
    ab6a:	ff850693          	addi	a3,a0,-8
    ab6e:	8f99                	sub	a5,a5,a4
    ab70:	00d91933          	sll	s2,s2,a3
    ab74:	00f657b3          	srl	a5,a2,a5
    ab78:	0127e733          	or	a4,a5,s2
    ab7c:	00d618b3          	sll	a7,a2,a3
    ab80:	9526                	add	a0,a0,s1
    ab82:	3f350493          	addi	s1,a0,1011
    ab86:	4581                	li	a1,0
    ab88:	bfa1                	j	aae0 <__divdf3+0x94>
    ab8a:	01246a33          	or	s4,s0,s2
    ab8e:	060a0363          	beqz	s4,abf4 <__divdf3+0x1a8>
    ab92:	c636                	sw	a3,12(sp)
    ab94:	c432                	sw	a2,8(sp)
    ab96:	2a040663          	beqz	s0,ae42 <__divdf3+0x3f6>
    ab9a:	8522                	mv	a0,s0
    ab9c:	338010ef          	jal	ra,bed4 <__clzsi2>
    aba0:	4622                	lw	a2,8(sp)
    aba2:	46b2                	lw	a3,12(sp)
    aba4:	84aa                	mv	s1,a0
    aba6:	ff550713          	addi	a4,a0,-11
    abaa:	4a75                	li	s4,29
    abac:	ff848b13          	addi	s6,s1,-8
    abb0:	40ea0a33          	sub	s4,s4,a4
    abb4:	01641433          	sll	s0,s0,s6
    abb8:	01495a33          	srl	s4,s2,s4
    abbc:	008a6a33          	or	s4,s4,s0
    abc0:	01691b33          	sll	s6,s2,s6
    abc4:	c0d00513          	li	a0,-1011
    abc8:	409504b3          	sub	s1,a0,s1
    abcc:	4401                	li	s0,0
    abce:	4b81                	li	s7,0
    abd0:	b5f9                	j	aa9e <__divdf3+0x52>
    abd2:	01246a33          	or	s4,s0,s2
    abd6:	000a1863          	bnez	s4,abe6 <__divdf3+0x19a>
    abda:	4421                	li	s0,8
    abdc:	4b01                	li	s6,0
    abde:	7ff00493          	li	s1,2047
    abe2:	4b89                	li	s7,2
    abe4:	bd6d                	j	aa9e <__divdf3+0x52>
    abe6:	8a22                	mv	s4,s0
    abe8:	8b4a                	mv	s6,s2
    abea:	4431                	li	s0,12
    abec:	7ff00493          	li	s1,2047
    abf0:	4b8d                	li	s7,3
    abf2:	b575                	j	aa9e <__divdf3+0x52>
    abf4:	4411                	li	s0,4
    abf6:	4b01                	li	s6,0
    abf8:	4481                	li	s1,0
    abfa:	4b85                	li	s7,1
    abfc:	b54d                	j	aa9e <__divdf3+0x52>
    abfe:	00146413          	ori	s0,s0,1
    ac02:	4881                	li	a7,0
    ac04:	4585                	li	a1,1
    ac06:	bde9                	j	aae0 <__divdf3+0x94>
    ac08:	00346413          	ori	s0,s0,3
    ac0c:	874a                	mv	a4,s2
    ac0e:	458d                	li	a1,3
    ac10:	bdc1                	j	aae0 <__divdf3+0x94>
    ac12:	2e050a63          	beqz	a0,af06 <__divdf3+0x4ba>
    ac16:	4785                	li	a5,1
    ac18:	8f89                	sub	a5,a5,a0
    ac1a:	03800693          	li	a3,56
    ac1e:	32f6dd63          	bge	a3,a5,af58 <__divdf3+0x50c>
    ac22:	4601                	li	a2,0
    ac24:	4781                	li	a5,0
    ac26:	4701                	li	a4,0
    ac28:	bdcd                	j	ab1a <__divdf3+0xce>
    ac2a:	86ce                	mv	a3,s3
    ac2c:	4789                	li	a5,2
    ac2e:	3af58d63          	beq	a1,a5,afe8 <__divdf3+0x59c>
    ac32:	478d                	li	a5,3
    ac34:	f0f587e3          	beq	a1,a5,ab42 <__divdf3+0xf6>
    ac38:	4785                	li	a5,1
    ac3a:	8836                	mv	a6,a3
    ac3c:	fef583e3          	beq	a1,a5,ac22 <__divdf3+0x1d6>
    ac40:	3ff48513          	addi	a0,s1,1023
    ac44:	fca057e3          	blez	a0,ac12 <__divdf3+0x1c6>
    ac48:	0078f793          	andi	a5,a7,7
    ac4c:	28079663          	bnez	a5,aed8 <__divdf3+0x48c>
    ac50:	0038d693          	srli	a3,a7,0x3
    ac54:	00771793          	slli	a5,a4,0x7
    ac58:	0007d863          	bgez	a5,ac68 <__divdf3+0x21c>
    ac5c:	ff0007b7          	lui	a5,0xff000
    ac60:	17fd                	addi	a5,a5,-1
    ac62:	8f7d                	and	a4,a4,a5
    ac64:	40048513          	addi	a0,s1,1024
    ac68:	7fe00793          	li	a5,2046
    ac6c:	eaa7c3e3          	blt	a5,a0,ab12 <__divdf3+0xc6>
    ac70:	01d71613          	slli	a2,a4,0x1d
    ac74:	00971793          	slli	a5,a4,0x9
    ac78:	83b1                	srli	a5,a5,0xc
    ac7a:	00d66733          	or	a4,a2,a3
    ac7e:	7ff57613          	andi	a2,a0,2047
    ac82:	bd61                	j	ab1a <__divdf3+0xce>
    ac84:	86d6                	mv	a3,s5
    ac86:	8752                	mv	a4,s4
    ac88:	88da                	mv	a7,s6
    ac8a:	85de                	mv	a1,s7
    ac8c:	b745                	j	ac2c <__divdf3+0x1e0>
    ac8e:	23476163          	bltu	a4,s4,aeb0 <__divdf3+0x464>
    ac92:	20ea0d63          	beq	s4,a4,aeac <__divdf3+0x460>
    ac96:	86da                	mv	a3,s6
    ac98:	14fd                	addi	s1,s1,-1
    ac9a:	8452                	mv	s0,s4
    ac9c:	4b01                	li	s6,0
    ac9e:	00871793          	slli	a5,a4,0x8
    aca2:	0188d313          	srli	t1,a7,0x18
    aca6:	00f36333          	or	t1,t1,a5
    acaa:	01035e93          	srli	t4,t1,0x10
    acae:	03d457b3          	divu	a5,s0,t4
    acb2:	01031f13          	slli	t5,t1,0x10
    acb6:	010f5f13          	srli	t5,t5,0x10
    acba:	0106d593          	srli	a1,a3,0x10
    acbe:	00889e13          	slli	t3,a7,0x8
    acc2:	03d47433          	remu	s0,s0,t4
    acc6:	02ff0733          	mul	a4,t5,a5
    acca:	0442                	slli	s0,s0,0x10
    accc:	8dc1                	or	a1,a1,s0
    acce:	00e5fb63          	bgeu	a1,a4,ace4 <__divdf3+0x298>
    acd2:	959a                	add	a1,a1,t1
    acd4:	fff78613          	addi	a2,a5,-1 # feffffff <_eusrstack+0xdeffbfff>
    acd8:	2665ee63          	bltu	a1,t1,af54 <__divdf3+0x508>
    acdc:	26e5fc63          	bgeu	a1,a4,af54 <__divdf3+0x508>
    ace0:	17f9                	addi	a5,a5,-2
    ace2:	959a                	add	a1,a1,t1
    ace4:	8d99                	sub	a1,a1,a4
    ace6:	03d5d733          	divu	a4,a1,t4
    acea:	06c2                	slli	a3,a3,0x10
    acec:	82c1                	srli	a3,a3,0x10
    acee:	03d5f5b3          	remu	a1,a1,t4
    acf2:	02ef0633          	mul	a2,t5,a4
    acf6:	05c2                	slli	a1,a1,0x10
    acf8:	8dd5                	or	a1,a1,a3
    acfa:	00c5fb63          	bgeu	a1,a2,ad10 <__divdf3+0x2c4>
    acfe:	959a                	add	a1,a1,t1
    ad00:	fff70693          	addi	a3,a4,-1 # 7fffff <_data_lma+0x7f3d4b>
    ad04:	2465e663          	bltu	a1,t1,af50 <__divdf3+0x504>
    ad08:	24c5f463          	bgeu	a1,a2,af50 <__divdf3+0x504>
    ad0c:	1779                	addi	a4,a4,-2
    ad0e:	959a                	add	a1,a1,t1
    ad10:	07c2                	slli	a5,a5,0x10
    ad12:	6441                	lui	s0,0x10
    ad14:	8f5d                	or	a4,a4,a5
    ad16:	fff40793          	addi	a5,s0,-1 # ffff <_data_lma+0x3d4b>
    ad1a:	00f77533          	and	a0,a4,a5
    ad1e:	01075893          	srli	a7,a4,0x10
    ad22:	010e5f93          	srli	t6,t3,0x10
    ad26:	00fe77b3          	and	a5,t3,a5
    ad2a:	02f502b3          	mul	t0,a0,a5
    ad2e:	40c586b3          	sub	a3,a1,a2
    ad32:	02f883b3          	mul	t2,a7,a5
    ad36:	0102d593          	srli	a1,t0,0x10
    ad3a:	02af8633          	mul	a2,t6,a0
    ad3e:	961e                	add	a2,a2,t2
    ad40:	962e                	add	a2,a2,a1
    ad42:	03f88533          	mul	a0,a7,t6
    ad46:	00767363          	bgeu	a2,t2,ad4c <__divdf3+0x300>
    ad4a:	9522                	add	a0,a0,s0
    ad4c:	68c1                	lui	a7,0x10
    ad4e:	18fd                	addi	a7,a7,-1
    ad50:	01065593          	srli	a1,a2,0x10
    ad54:	01167633          	and	a2,a2,a7
    ad58:	0642                	slli	a2,a2,0x10
    ad5a:	0112f8b3          	and	a7,t0,a7
    ad5e:	95aa                	add	a1,a1,a0
    ad60:	9646                	add	a2,a2,a7
    ad62:	12b6e663          	bltu	a3,a1,ae8e <__divdf3+0x442>
    ad66:	12b68263          	beq	a3,a1,ae8a <__divdf3+0x43e>
    ad6a:	40cb0633          	sub	a2,s6,a2
    ad6e:	8e8d                	sub	a3,a3,a1
    ad70:	00cb3b33          	sltu	s6,s6,a2
    ad74:	41668b33          	sub	s6,a3,s6
    ad78:	3ff48513          	addi	a0,s1,1023
    ad7c:	17630c63          	beq	t1,s6,aef4 <__divdf3+0x4a8>
    ad80:	03db58b3          	divu	a7,s6,t4
    ad84:	01065593          	srli	a1,a2,0x10
    ad88:	03db7b33          	remu	s6,s6,t4
    ad8c:	031f06b3          	mul	a3,t5,a7
    ad90:	0b42                	slli	s6,s6,0x10
    ad92:	0165eb33          	or	s6,a1,s6
    ad96:	00db7b63          	bgeu	s6,a3,adac <__divdf3+0x360>
    ad9a:	9b1a                	add	s6,s6,t1
    ad9c:	fff88593          	addi	a1,a7,-1 # ffff <_data_lma+0x3d4b>
    ada0:	206b6d63          	bltu	s6,t1,afba <__divdf3+0x56e>
    ada4:	20db7b63          	bgeu	s6,a3,afba <__divdf3+0x56e>
    ada8:	18f9                	addi	a7,a7,-2
    adaa:	9b1a                	add	s6,s6,t1
    adac:	40db0b33          	sub	s6,s6,a3
    adb0:	03db56b3          	divu	a3,s6,t4
    adb4:	0642                	slli	a2,a2,0x10
    adb6:	8241                	srli	a2,a2,0x10
    adb8:	03db7b33          	remu	s6,s6,t4
    adbc:	02df0f33          	mul	t5,t5,a3
    adc0:	0b42                	slli	s6,s6,0x10
    adc2:	01666633          	or	a2,a2,s6
    adc6:	01e67b63          	bgeu	a2,t5,addc <__divdf3+0x390>
    adca:	961a                	add	a2,a2,t1
    adcc:	fff68593          	addi	a1,a3,-1 # 7fffff <_data_lma+0x7f3d4b>
    add0:	1e666763          	bltu	a2,t1,afbe <__divdf3+0x572>
    add4:	1fe67563          	bgeu	a2,t5,afbe <__divdf3+0x572>
    add8:	16f9                	addi	a3,a3,-2
    adda:	961a                	add	a2,a2,t1
    addc:	08c2                	slli	a7,a7,0x10
    adde:	00d8e8b3          	or	a7,a7,a3
    ade2:	01089593          	slli	a1,a7,0x10
    ade6:	0108d293          	srli	t0,a7,0x10
    adea:	81c1                	srli	a1,a1,0x10
    adec:	02f58eb3          	mul	t4,a1,a5
    adf0:	41e60633          	sub	a2,a2,t5
    adf4:	02bf85b3          	mul	a1,t6,a1
    adf8:	010ed693          	srli	a3,t4,0x10
    adfc:	02f287b3          	mul	a5,t0,a5
    ae00:	95be                	add	a1,a1,a5
    ae02:	96ae                	add	a3,a3,a1
    ae04:	025f8fb3          	mul	t6,t6,t0
    ae08:	00f6f463          	bgeu	a3,a5,ae10 <__divdf3+0x3c4>
    ae0c:	67c1                	lui	a5,0x10
    ae0e:	9fbe                	add	t6,t6,a5
    ae10:	65c1                	lui	a1,0x10
    ae12:	15fd                	addi	a1,a1,-1
    ae14:	0106d793          	srli	a5,a3,0x10
    ae18:	8eed                	and	a3,a3,a1
    ae1a:	06c2                	slli	a3,a3,0x10
    ae1c:	00befeb3          	and	t4,t4,a1
    ae20:	9fbe                	add	t6,t6,a5
    ae22:	96f6                	add	a3,a3,t4
    ae24:	09f67f63          	bgeu	a2,t6,aec2 <__divdf3+0x476>
    ae28:	961a                	add	a2,a2,t1
    ae2a:	fff88793          	addi	a5,a7,-1
    ae2e:	1a666963          	bltu	a2,t1,afe0 <__divdf3+0x594>
    ae32:	19f66863          	bltu	a2,t6,afc2 <__divdf3+0x576>
    ae36:	1bf60f63          	beq	a2,t6,aff4 <__divdf3+0x5a8>
    ae3a:	88be                	mv	a7,a5
    ae3c:	0018e893          	ori	a7,a7,1
    ae40:	b511                	j	ac44 <__divdf3+0x1f8>
    ae42:	854a                	mv	a0,s2
    ae44:	090010ef          	jal	ra,bed4 <__clzsi2>
    ae48:	01550713          	addi	a4,a0,21
    ae4c:	45f1                	li	a1,28
    ae4e:	02050493          	addi	s1,a0,32
    ae52:	4622                	lw	a2,8(sp)
    ae54:	46b2                	lw	a3,12(sp)
    ae56:	d4e5dae3          	bge	a1,a4,abaa <__divdf3+0x15e>
    ae5a:	ff850413          	addi	s0,a0,-8
    ae5e:	00891a33          	sll	s4,s2,s0
    ae62:	4b01                	li	s6,0
    ae64:	b385                	j	abc4 <__divdf3+0x178>
    ae66:	8532                	mv	a0,a2
    ae68:	c432                	sw	a2,8(sp)
    ae6a:	06a010ef          	jal	ra,bed4 <__clzsi2>
    ae6e:	01550713          	addi	a4,a0,21
    ae72:	46f1                	li	a3,28
    ae74:	87aa                	mv	a5,a0
    ae76:	4622                	lw	a2,8(sp)
    ae78:	02050513          	addi	a0,a0,32
    ae7c:	cee6d6e3          	bge	a3,a4,ab68 <__divdf3+0x11c>
    ae80:	17e1                	addi	a5,a5,-8
    ae82:	00f61733          	sll	a4,a2,a5
    ae86:	4881                	li	a7,0
    ae88:	b9e5                	j	ab80 <__divdf3+0x134>
    ae8a:	eecb70e3          	bgeu	s6,a2,ad6a <__divdf3+0x31e>
    ae8e:	9b72                	add	s6,s6,t3
    ae90:	01cb3533          	sltu	a0,s6,t3
    ae94:	951a                	add	a0,a0,t1
    ae96:	96aa                	add	a3,a3,a0
    ae98:	fff70513          	addi	a0,a4,-1
    ae9c:	02d37863          	bgeu	t1,a3,aecc <__divdf3+0x480>
    aea0:	10b6e663          	bltu	a3,a1,afac <__divdf3+0x560>
    aea4:	10d58263          	beq	a1,a3,afa8 <__divdf3+0x55c>
    aea8:	872a                	mv	a4,a0
    aeaa:	b5c1                	j	ad6a <__divdf3+0x31e>
    aeac:	df1b65e3          	bltu	s6,a7,ac96 <__divdf3+0x24a>
    aeb0:	001b5593          	srli	a1,s6,0x1
    aeb4:	01fa1693          	slli	a3,s4,0x1f
    aeb8:	001a5413          	srli	s0,s4,0x1
    aebc:	8ecd                	or	a3,a3,a1
    aebe:	0b7e                	slli	s6,s6,0x1f
    aec0:	bbf9                	j	ac9e <__divdf3+0x252>
    aec2:	f7f61de3          	bne	a2,t6,ae3c <__divdf3+0x3f0>
    aec6:	d6068fe3          	beqz	a3,ac44 <__divdf3+0x1f8>
    aeca:	bfb9                	j	ae28 <__divdf3+0x3dc>
    aecc:	fcd31ee3          	bne	t1,a3,aea8 <__divdf3+0x45c>
    aed0:	fdcb78e3          	bgeu	s6,t3,aea0 <__divdf3+0x454>
    aed4:	872a                	mv	a4,a0
    aed6:	bd51                	j	ad6a <__divdf3+0x31e>
    aed8:	00f8f793          	andi	a5,a7,15
    aedc:	4691                	li	a3,4
    aede:	d6d789e3          	beq	a5,a3,ac50 <__divdf3+0x204>
    aee2:	ffc8b793          	sltiu	a5,a7,-4
    aee6:	00488693          	addi	a3,a7,4
    aeea:	0017c793          	xori	a5,a5,1
    aeee:	828d                	srli	a3,a3,0x3
    aef0:	973e                	add	a4,a4,a5
    aef2:	b38d                	j	ac54 <__divdf3+0x208>
    aef4:	4681                	li	a3,0
    aef6:	4785                	li	a5,1
    aef8:	fea04ce3          	bgtz	a0,aef0 <__divdf3+0x4a4>
    aefc:	58fd                	li	a7,-1
    aefe:	d0051ce3          	bnez	a0,ac16 <__divdf3+0x1ca>
    af02:	c0100493          	li	s1,-1023
    af06:	4785                	li	a5,1
    af08:	41e48513          	addi	a0,s1,1054
    af0c:	00a716b3          	sll	a3,a4,a0
    af10:	00f8d633          	srl	a2,a7,a5
    af14:	00a89533          	sll	a0,a7,a0
    af18:	8ed1                	or	a3,a3,a2
    af1a:	00a03533          	snez	a0,a0
    af1e:	8ec9                	or	a3,a3,a0
    af20:	0076f613          	andi	a2,a3,7
    af24:	00f75733          	srl	a4,a4,a5
    af28:	ce01                	beqz	a2,af40 <__divdf3+0x4f4>
    af2a:	00f6f793          	andi	a5,a3,15
    af2e:	4611                	li	a2,4
    af30:	00c78863          	beq	a5,a2,af40 <__divdf3+0x4f4>
    af34:	00468793          	addi	a5,a3,4
    af38:	00d7b6b3          	sltu	a3,a5,a3
    af3c:	9736                	add	a4,a4,a3
    af3e:	86be                	mv	a3,a5
    af40:	00871793          	slli	a5,a4,0x8
    af44:	0407d863          	bgez	a5,af94 <__divdf3+0x548>
    af48:	4605                	li	a2,1
    af4a:	4781                	li	a5,0
    af4c:	4701                	li	a4,0
    af4e:	b6f1                	j	ab1a <__divdf3+0xce>
    af50:	8736                	mv	a4,a3
    af52:	bb7d                	j	ad10 <__divdf3+0x2c4>
    af54:	87b2                	mv	a5,a2
    af56:	b379                	j	ace4 <__divdf3+0x298>
    af58:	46fd                	li	a3,31
    af5a:	faf6d7e3          	bge	a3,a5,af08 <__divdf3+0x4bc>
    af5e:	5605                	li	a2,-31
    af60:	8e09                	sub	a2,a2,a0
    af62:	02000693          	li	a3,32
    af66:	00c75633          	srl	a2,a4,a2
    af6a:	00d78863          	beq	a5,a3,af7a <__divdf3+0x52e>
    af6e:	43e48793          	addi	a5,s1,1086
    af72:	00f717b3          	sll	a5,a4,a5
    af76:	00f8e8b3          	or	a7,a7,a5
    af7a:	011036b3          	snez	a3,a7
    af7e:	8ed1                	or	a3,a3,a2
    af80:	0076f613          	andi	a2,a3,7
    af84:	4781                	li	a5,0
    af86:	ce01                	beqz	a2,af9e <__divdf3+0x552>
    af88:	00f6f793          	andi	a5,a3,15
    af8c:	4611                	li	a2,4
    af8e:	4701                	li	a4,0
    af90:	fac792e3          	bne	a5,a2,af34 <__divdf3+0x4e8>
    af94:	00971793          	slli	a5,a4,0x9
    af98:	01d71613          	slli	a2,a4,0x1d
    af9c:	83b1                	srli	a5,a5,0xc
    af9e:	0036d713          	srli	a4,a3,0x3
    afa2:	8f51                	or	a4,a4,a2
    afa4:	4601                	li	a2,0
    afa6:	be95                	j	ab1a <__divdf3+0xce>
    afa8:	f0cb70e3          	bgeu	s6,a2,aea8 <__divdf3+0x45c>
    afac:	9b72                	add	s6,s6,t3
    afae:	01cb3533          	sltu	a0,s6,t3
    afb2:	951a                	add	a0,a0,t1
    afb4:	1779                	addi	a4,a4,-2
    afb6:	96aa                	add	a3,a3,a0
    afb8:	bb4d                	j	ad6a <__divdf3+0x31e>
    afba:	88ae                	mv	a7,a1
    afbc:	bbc5                	j	adac <__divdf3+0x360>
    afbe:	86ae                	mv	a3,a1
    afc0:	bd31                	j	addc <__divdf3+0x390>
    afc2:	001e1793          	slli	a5,t3,0x1
    afc6:	01c7be33          	sltu	t3,a5,t3
    afca:	9372                	add	t1,t1,t3
    afcc:	961a                	add	a2,a2,t1
    afce:	18f9                	addi	a7,a7,-2
    afd0:	8e3e                	mv	t3,a5
    afd2:	e7f615e3          	bne	a2,t6,ae3c <__divdf3+0x3f0>
    afd6:	c6de07e3          	beq	t3,a3,ac44 <__divdf3+0x1f8>
    afda:	0018e893          	ori	a7,a7,1
    afde:	b19d                	j	ac44 <__divdf3+0x1f8>
    afe0:	88be                	mv	a7,a5
    afe2:	fff60ae3          	beq	a2,t6,afd6 <__divdf3+0x58a>
    afe6:	bd99                	j	ae3c <__divdf3+0x3f0>
    afe8:	8836                	mv	a6,a3
    afea:	7ff00613          	li	a2,2047
    afee:	4781                	li	a5,0
    aff0:	4701                	li	a4,0
    aff2:	b625                	j	ab1a <__divdf3+0xce>
    aff4:	fcde67e3          	bltu	t3,a3,afc2 <__divdf3+0x576>
    aff8:	88be                	mv	a7,a5
    affa:	fede10e3          	bne	t3,a3,afda <__divdf3+0x58e>
    affe:	b199                	j	ac44 <__divdf3+0x1f8>

0000b000 <__eqdf2>:
    b000:	0145d713          	srli	a4,a1,0x14
    b004:	001007b7          	lui	a5,0x100
    b008:	17fd                	addi	a5,a5,-1
    b00a:	0146d813          	srli	a6,a3,0x14
    b00e:	7ff77713          	andi	a4,a4,2047
    b012:	7ff00893          	li	a7,2047
    b016:	00b7fe33          	and	t3,a5,a1
    b01a:	8eaa                	mv	t4,a0
    b01c:	8ff5                	and	a5,a5,a3
    b01e:	81fd                	srli	a1,a1,0x1f
    b020:	8f32                	mv	t5,a2
    b022:	7ff87813          	andi	a6,a6,2047
    b026:	82fd                	srli	a3,a3,0x1f
    b028:	01170b63          	beq	a4,a7,b03e <__eqdf2+0x3e>
    b02c:	4305                	li	t1,1
    b02e:	01180663          	beq	a6,a7,b03a <__eqdf2+0x3a>
    b032:	01071463          	bne	a4,a6,b03a <__eqdf2+0x3a>
    b036:	00fe0d63          	beq	t3,a5,b050 <__eqdf2+0x50>
    b03a:	851a                	mv	a0,t1
    b03c:	8082                	ret
    b03e:	00ae68b3          	or	a7,t3,a0
    b042:	4305                	li	t1,1
    b044:	fe089be3          	bnez	a7,b03a <__eqdf2+0x3a>
    b048:	fee819e3          	bne	a6,a4,b03a <__eqdf2+0x3a>
    b04c:	8fd1                	or	a5,a5,a2
    b04e:	f7f5                	bnez	a5,b03a <__eqdf2+0x3a>
    b050:	4305                	li	t1,1
    b052:	ffee94e3          	bne	t4,t5,b03a <__eqdf2+0x3a>
    b056:	4301                	li	t1,0
    b058:	fed581e3          	beq	a1,a3,b03a <__eqdf2+0x3a>
    b05c:	4305                	li	t1,1
    b05e:	ff71                	bnez	a4,b03a <__eqdf2+0x3a>
    b060:	00ae6533          	or	a0,t3,a0
    b064:	00a03333          	snez	t1,a0
    b068:	bfc9                	j	b03a <__eqdf2+0x3a>

0000b06a <__gedf2>:
    b06a:	0145d713          	srli	a4,a1,0x14
    b06e:	001007b7          	lui	a5,0x100
    b072:	17fd                	addi	a5,a5,-1
    b074:	0146d813          	srli	a6,a3,0x14
    b078:	7ff77713          	andi	a4,a4,2047
    b07c:	7ff00893          	li	a7,2047
    b080:	00b7f333          	and	t1,a5,a1
    b084:	8e2a                	mv	t3,a0
    b086:	8ff5                	and	a5,a5,a3
    b088:	81fd                	srli	a1,a1,0x1f
    b08a:	8eb2                	mv	t4,a2
    b08c:	7ff87813          	andi	a6,a6,2047
    b090:	82fd                	srli	a3,a3,0x1f
    b092:	03170863          	beq	a4,a7,b0c2 <__gedf2+0x58>
    b096:	03180063          	beq	a6,a7,b0b6 <__gedf2+0x4c>
    b09a:	eb0d                	bnez	a4,b0cc <__gedf2+0x62>
    b09c:	00a368b3          	or	a7,t1,a0
    b0a0:	00081463          	bnez	a6,b0a8 <__gedf2+0x3e>
    b0a4:	8e5d                	or	a2,a2,a5
    b0a6:	ca29                	beqz	a2,b0f8 <__gedf2+0x8e>
    b0a8:	04088563          	beqz	a7,b0f2 <__gedf2+0x88>
    b0ac:	02d58863          	beq	a1,a3,b0dc <__gedf2+0x72>
    b0b0:	4505                	li	a0,1
    b0b2:	ed95                	bnez	a1,b0ee <__gedf2+0x84>
    b0b4:	8082                	ret
    b0b6:	00c7e8b3          	or	a7,a5,a2
    b0ba:	fe0880e3          	beqz	a7,b09a <__gedf2+0x30>
    b0be:	5579                	li	a0,-2
    b0c0:	8082                	ret
    b0c2:	00a36533          	or	a0,t1,a0
    b0c6:	fd65                	bnez	a0,b0be <__gedf2+0x54>
    b0c8:	02e80c63          	beq	a6,a4,b100 <__gedf2+0x96>
    b0cc:	00081463          	bnez	a6,b0d4 <__gedf2+0x6a>
    b0d0:	8e5d                	or	a2,a2,a5
    b0d2:	de79                	beqz	a2,b0b0 <__gedf2+0x46>
    b0d4:	fcd59ee3          	bne	a1,a3,b0b0 <__gedf2+0x46>
    b0d8:	fce84ce3          	blt	a6,a4,b0b0 <__gedf2+0x46>
    b0dc:	01074863          	blt	a4,a6,b0ec <__gedf2+0x82>
    b0e0:	fc67e8e3          	bltu	a5,t1,b0b0 <__gedf2+0x46>
    b0e4:	02f30363          	beq	t1,a5,b10a <__gedf2+0xa0>
    b0e8:	00f37f63          	bgeu	t1,a5,b106 <__gedf2+0x9c>
    b0ec:	e581                	bnez	a1,b0f4 <__gedf2+0x8a>
    b0ee:	557d                	li	a0,-1
    b0f0:	8082                	ret
    b0f2:	def5                	beqz	a3,b0ee <__gedf2+0x84>
    b0f4:	4505                	li	a0,1
    b0f6:	8082                	ret
    b0f8:	4501                	li	a0,0
    b0fa:	fa089be3          	bnez	a7,b0b0 <__gedf2+0x46>
    b0fe:	8082                	ret
    b100:	8e5d                	or	a2,a2,a5
    b102:	da69                	beqz	a2,b0d4 <__gedf2+0x6a>
    b104:	bf6d                	j	b0be <__gedf2+0x54>
    b106:	4501                	li	a0,0
    b108:	8082                	ret
    b10a:	fbcee3e3          	bltu	t4,t3,b0b0 <__gedf2+0x46>
    b10e:	4501                	li	a0,0
    b110:	fbde72e3          	bgeu	t3,t4,b0b4 <__gedf2+0x4a>
    b114:	f1e5                	bnez	a1,b0f4 <__gedf2+0x8a>
    b116:	bfe1                	j	b0ee <__gedf2+0x84>

0000b118 <__ledf2>:
    b118:	0145d713          	srli	a4,a1,0x14
    b11c:	001007b7          	lui	a5,0x100
    b120:	17fd                	addi	a5,a5,-1
    b122:	0146d813          	srli	a6,a3,0x14
    b126:	7ff77713          	andi	a4,a4,2047
    b12a:	7ff00893          	li	a7,2047
    b12e:	00b7fe33          	and	t3,a5,a1
    b132:	8eaa                	mv	t4,a0
    b134:	8ff5                	and	a5,a5,a3
    b136:	81fd                	srli	a1,a1,0x1f
    b138:	8f32                	mv	t5,a2
    b13a:	7ff87813          	andi	a6,a6,2047
    b13e:	82fd                	srli	a3,a3,0x1f
    b140:	03170e63          	beq	a4,a7,b17c <__ledf2+0x64>
    b144:	01180d63          	beq	a6,a7,b15e <__ledf2+0x46>
    b148:	e329                	bnez	a4,b18a <__ledf2+0x72>
    b14a:	00ae68b3          	or	a7,t3,a0
    b14e:	00081f63          	bnez	a6,b16c <__ledf2+0x54>
    b152:	8e5d                	or	a2,a2,a5
    b154:	ee01                	bnez	a2,b16c <__ledf2+0x54>
    b156:	4301                	li	t1,0
    b158:	04088c63          	beqz	a7,b1b0 <__ledf2+0x98>
    b15c:	a821                	j	b174 <__ledf2+0x5c>
    b15e:	00c7e8b3          	or	a7,a5,a2
    b162:	4309                	li	t1,2
    b164:	04089663          	bnez	a7,b1b0 <__ledf2+0x98>
    b168:	d36d                	beqz	a4,b14a <__ledf2+0x32>
    b16a:	a005                	j	b18a <__ledf2+0x72>
    b16c:	04088463          	beqz	a7,b1b4 <__ledf2+0x9c>
    b170:	02d58563          	beq	a1,a3,b19a <__ledf2+0x82>
    b174:	4305                	li	t1,1
    b176:	cd8d                	beqz	a1,b1b0 <__ledf2+0x98>
    b178:	537d                	li	t1,-1
    b17a:	a81d                	j	b1b0 <__ledf2+0x98>
    b17c:	00ae68b3          	or	a7,t3,a0
    b180:	4309                	li	t1,2
    b182:	02089763          	bnez	a7,b1b0 <__ledf2+0x98>
    b186:	02e80a63          	beq	a6,a4,b1ba <__ledf2+0xa2>
    b18a:	00081463          	bnez	a6,b192 <__ledf2+0x7a>
    b18e:	8e5d                	or	a2,a2,a5
    b190:	d275                	beqz	a2,b174 <__ledf2+0x5c>
    b192:	fed591e3          	bne	a1,a3,b174 <__ledf2+0x5c>
    b196:	fce84fe3          	blt	a6,a4,b174 <__ledf2+0x5c>
    b19a:	01074963          	blt	a4,a6,b1ac <__ledf2+0x94>
    b19e:	fdc7ebe3          	bltu	a5,t3,b174 <__ledf2+0x5c>
    b1a2:	00fe0f63          	beq	t3,a5,b1c0 <__ledf2+0xa8>
    b1a6:	4301                	li	t1,0
    b1a8:	00fe7463          	bgeu	t3,a5,b1b0 <__ledf2+0x98>
    b1ac:	d5f1                	beqz	a1,b178 <__ledf2+0x60>
    b1ae:	4305                	li	t1,1
    b1b0:	851a                	mv	a0,t1
    b1b2:	8082                	ret
    b1b4:	feed                	bnez	a3,b1ae <__ledf2+0x96>
    b1b6:	537d                	li	t1,-1
    b1b8:	bfe5                	j	b1b0 <__ledf2+0x98>
    b1ba:	8e5d                	or	a2,a2,a5
    b1bc:	da79                	beqz	a2,b192 <__ledf2+0x7a>
    b1be:	bfcd                	j	b1b0 <__ledf2+0x98>
    b1c0:	fbdf6ae3          	bltu	t5,t4,b174 <__ledf2+0x5c>
    b1c4:	4301                	li	t1,0
    b1c6:	ffeef5e3          	bgeu	t4,t5,b1b0 <__ledf2+0x98>
    b1ca:	f1f5                	bnez	a1,b1ae <__ledf2+0x96>
    b1cc:	b775                	j	b178 <__ledf2+0x60>

0000b1ce <__muldf3>:
    b1ce:	7139                	addi	sp,sp,-64
    b1d0:	d84a                	sw	s2,48(sp)
    b1d2:	0145d913          	srli	s2,a1,0x14
    b1d6:	d64e                	sw	s3,44(sp)
    b1d8:	d452                	sw	s4,40(sp)
    b1da:	d256                	sw	s5,36(sp)
    b1dc:	00c59993          	slli	s3,a1,0xc
    b1e0:	de06                	sw	ra,60(sp)
    b1e2:	dc22                	sw	s0,56(sp)
    b1e4:	da26                	sw	s1,52(sp)
    b1e6:	d05a                	sw	s6,32(sp)
    b1e8:	ce5e                	sw	s7,28(sp)
    b1ea:	7ff97913          	andi	s2,s2,2047
    b1ee:	8a2a                	mv	s4,a0
    b1f0:	00c9d993          	srli	s3,s3,0xc
    b1f4:	01f5da93          	srli	s5,a1,0x1f
    b1f8:	0e090d63          	beqz	s2,b2f2 <__muldf3+0x124>
    b1fc:	7ff00793          	li	a5,2047
    b200:	18f90663          	beq	s2,a5,b38c <__muldf3+0x1be>
    b204:	01d55413          	srli	s0,a0,0x1d
    b208:	098e                	slli	s3,s3,0x3
    b20a:	013469b3          	or	s3,s0,s3
    b20e:	00800437          	lui	s0,0x800
    b212:	0089e433          	or	s0,s3,s0
    b216:	00351493          	slli	s1,a0,0x3
    b21a:	c0190913          	addi	s2,s2,-1023
    b21e:	4981                	li	s3,0
    b220:	4b81                	li	s7,0
    b222:	0146d713          	srli	a4,a3,0x14
    b226:	00c69a13          	slli	s4,a3,0xc
    b22a:	7ff77713          	andi	a4,a4,2047
    b22e:	85b2                	mv	a1,a2
    b230:	00ca5a13          	srli	s4,s4,0xc
    b234:	01f6db13          	srli	s6,a3,0x1f
    b238:	10070b63          	beqz	a4,b34e <__muldf3+0x180>
    b23c:	7ff00793          	li	a5,2047
    b240:	04f70363          	beq	a4,a5,b286 <__muldf3+0xb8>
    b244:	01d65793          	srli	a5,a2,0x1d
    b248:	0a0e                	slli	s4,s4,0x3
    b24a:	0147ea33          	or	s4,a5,s4
    b24e:	c0170713          	addi	a4,a4,-1023
    b252:	008007b7          	lui	a5,0x800
    b256:	00fa67b3          	or	a5,s4,a5
    b25a:	00361593          	slli	a1,a2,0x3
    b25e:	993a                	add	s2,s2,a4
    b260:	4881                	li	a7,0
    b262:	016ac733          	xor	a4,s5,s6
    b266:	46bd                	li	a3,15
    b268:	853a                	mv	a0,a4
    b26a:	00190813          	addi	a6,s2,1
    b26e:	1736e863          	bltu	a3,s3,b3de <__muldf3+0x210>
    b272:	00001617          	auipc	a2,0x1
    b276:	ec660613          	addi	a2,a2,-314 # c138 <strlen+0x1ee>
    b27a:	098a                	slli	s3,s3,0x2
    b27c:	99b2                	add	s3,s3,a2
    b27e:	0009a683          	lw	a3,0(s3)
    b282:	96b2                	add	a3,a3,a2
    b284:	8682                	jr	a3
    b286:	00ca67b3          	or	a5,s4,a2
    b28a:	7ff90913          	addi	s2,s2,2047
    b28e:	12079963          	bnez	a5,b3c0 <__muldf3+0x1f2>
    b292:	0029e993          	ori	s3,s3,2
    b296:	4581                	li	a1,0
    b298:	4889                	li	a7,2
    b29a:	b7e1                	j	b262 <__muldf3+0x94>
    b29c:	4701                	li	a4,0
    b29e:	7ff00793          	li	a5,2047
    b2a2:	00080437          	lui	s0,0x80
    b2a6:	4481                	li	s1,0
    b2a8:	0432                	slli	s0,s0,0xc
    b2aa:	07d2                	slli	a5,a5,0x14
    b2ac:	8031                	srli	s0,s0,0xc
    b2ae:	077e                	slli	a4,a4,0x1f
    b2b0:	8c5d                	or	s0,s0,a5
    b2b2:	8c59                	or	s0,s0,a4
    b2b4:	85a2                	mv	a1,s0
    b2b6:	50f2                	lw	ra,60(sp)
    b2b8:	5462                	lw	s0,56(sp)
    b2ba:	8526                	mv	a0,s1
    b2bc:	5942                	lw	s2,48(sp)
    b2be:	54d2                	lw	s1,52(sp)
    b2c0:	59b2                	lw	s3,44(sp)
    b2c2:	5a22                	lw	s4,40(sp)
    b2c4:	5a92                	lw	s5,36(sp)
    b2c6:	5b02                	lw	s6,32(sp)
    b2c8:	4bf2                	lw	s7,28(sp)
    b2ca:	6121                	addi	sp,sp,64
    b2cc:	8082                	ret
    b2ce:	855a                	mv	a0,s6
    b2d0:	843e                	mv	s0,a5
    b2d2:	84ae                	mv	s1,a1
    b2d4:	8bc6                	mv	s7,a7
    b2d6:	4789                	li	a5,2
    b2d8:	0efb8d63          	beq	s7,a5,b3d2 <__muldf3+0x204>
    b2dc:	478d                	li	a5,3
    b2de:	fafb8fe3          	beq	s7,a5,b29c <__muldf3+0xce>
    b2e2:	4785                	li	a5,1
    b2e4:	872a                	mv	a4,a0
    b2e6:	38fb9e63          	bne	s7,a5,b682 <__muldf3+0x4b4>
    b2ea:	4781                	li	a5,0
    b2ec:	4401                	li	s0,0
    b2ee:	4481                	li	s1,0
    b2f0:	bf65                	j	b2a8 <__muldf3+0xda>
    b2f2:	00a9e433          	or	s0,s3,a0
    b2f6:	c061                	beqz	s0,b3b6 <__muldf3+0x1e8>
    b2f8:	c636                	sw	a3,12(sp)
    b2fa:	c432                	sw	a2,8(sp)
    b2fc:	2a098c63          	beqz	s3,b5b4 <__muldf3+0x3e6>
    b300:	854e                	mv	a0,s3
    b302:	3d3000ef          	jal	ra,bed4 <__clzsi2>
    b306:	4622                	lw	a2,8(sp)
    b308:	46b2                	lw	a3,12(sp)
    b30a:	87aa                	mv	a5,a0
    b30c:	ff550713          	addi	a4,a0,-11
    b310:	4475                	li	s0,29
    b312:	ff878493          	addi	s1,a5,-8 # 7ffff8 <_data_lma+0x7f3d44>
    b316:	8c19                	sub	s0,s0,a4
    b318:	009999b3          	sll	s3,s3,s1
    b31c:	008a5433          	srl	s0,s4,s0
    b320:	01346433          	or	s0,s0,s3
    b324:	009a14b3          	sll	s1,s4,s1
    b328:	0146d713          	srli	a4,a3,0x14
    b32c:	c0d00913          	li	s2,-1011
    b330:	00c69a13          	slli	s4,a3,0xc
    b334:	7ff77713          	andi	a4,a4,2047
    b338:	40f90933          	sub	s2,s2,a5
    b33c:	4981                	li	s3,0
    b33e:	4b81                	li	s7,0
    b340:	85b2                	mv	a1,a2
    b342:	00ca5a13          	srli	s4,s4,0xc
    b346:	01f6db13          	srli	s6,a3,0x1f
    b34a:	ee0719e3          	bnez	a4,b23c <__muldf3+0x6e>
    b34e:	00ca67b3          	or	a5,s4,a2
    b352:	c7b1                	beqz	a5,b39e <__muldf3+0x1d0>
    b354:	220a0f63          	beqz	s4,b592 <__muldf3+0x3c4>
    b358:	8552                	mv	a0,s4
    b35a:	c432                	sw	a2,8(sp)
    b35c:	379000ef          	jal	ra,bed4 <__clzsi2>
    b360:	4622                	lw	a2,8(sp)
    b362:	872a                	mv	a4,a0
    b364:	ff550693          	addi	a3,a0,-11
    b368:	47f5                	li	a5,29
    b36a:	ff870593          	addi	a1,a4,-8
    b36e:	8f95                	sub	a5,a5,a3
    b370:	00ba1a33          	sll	s4,s4,a1
    b374:	00f657b3          	srl	a5,a2,a5
    b378:	0147e7b3          	or	a5,a5,s4
    b37c:	00b615b3          	sll	a1,a2,a1
    b380:	40e90933          	sub	s2,s2,a4
    b384:	c0d90913          	addi	s2,s2,-1011
    b388:	4881                	li	a7,0
    b38a:	bde1                	j	b262 <__muldf3+0x94>
    b38c:	00a9e433          	or	s0,s3,a0
    b390:	ec01                	bnez	s0,b3a8 <__muldf3+0x1da>
    b392:	49a1                	li	s3,8
    b394:	4481                	li	s1,0
    b396:	7ff00913          	li	s2,2047
    b39a:	4b89                	li	s7,2
    b39c:	b559                	j	b222 <__muldf3+0x54>
    b39e:	0019e993          	ori	s3,s3,1
    b3a2:	4581                	li	a1,0
    b3a4:	4885                	li	a7,1
    b3a6:	bd75                	j	b262 <__muldf3+0x94>
    b3a8:	844e                	mv	s0,s3
    b3aa:	84aa                	mv	s1,a0
    b3ac:	49b1                	li	s3,12
    b3ae:	7ff00913          	li	s2,2047
    b3b2:	4b8d                	li	s7,3
    b3b4:	b5bd                	j	b222 <__muldf3+0x54>
    b3b6:	4991                	li	s3,4
    b3b8:	4481                	li	s1,0
    b3ba:	4901                	li	s2,0
    b3bc:	4b85                	li	s7,1
    b3be:	b595                	j	b222 <__muldf3+0x54>
    b3c0:	0039e993          	ori	s3,s3,3
    b3c4:	87d2                	mv	a5,s4
    b3c6:	488d                	li	a7,3
    b3c8:	bd69                	j	b262 <__muldf3+0x94>
    b3ca:	4789                	li	a5,2
    b3cc:	8556                	mv	a0,s5
    b3ce:	f0fb97e3          	bne	s7,a5,b2dc <__muldf3+0x10e>
    b3d2:	872a                	mv	a4,a0
    b3d4:	7ff00793          	li	a5,2047
    b3d8:	4401                	li	s0,0
    b3da:	4481                	li	s1,0
    b3dc:	b5f1                	j	b2a8 <__muldf3+0xda>
    b3de:	6ec1                	lui	t4,0x10
    b3e0:	fffe8613          	addi	a2,t4,-1 # ffff <_data_lma+0x3d4b>
    b3e4:	0104d693          	srli	a3,s1,0x10
    b3e8:	0105de13          	srli	t3,a1,0x10
    b3ec:	8cf1                	and	s1,s1,a2
    b3ee:	8df1                	and	a1,a1,a2
    b3f0:	02958633          	mul	a2,a1,s1
    b3f4:	02b68333          	mul	t1,a3,a1
    b3f8:	01065893          	srli	a7,a2,0x10
    b3fc:	029e0533          	mul	a0,t3,s1
    b400:	951a                	add	a0,a0,t1
    b402:	98aa                	add	a7,a7,a0
    b404:	03c682b3          	mul	t0,a3,t3
    b408:	0068f363          	bgeu	a7,t1,b40e <__muldf3+0x240>
    b40c:	92f6                	add	t0,t0,t4
    b40e:	6fc1                	lui	t6,0x10
    b410:	ffff8313          	addi	t1,t6,-1 # ffff <_data_lma+0x3d4b>
    b414:	0067f533          	and	a0,a5,t1
    b418:	0107d393          	srli	t2,a5,0x10
    b41c:	0068f7b3          	and	a5,a7,t1
    b420:	07c2                	slli	a5,a5,0x10
    b422:	00667333          	and	t1,a2,t1
    b426:	933e                	add	t1,t1,a5
    b428:	02950633          	mul	a2,a0,s1
    b42c:	0108d893          	srli	a7,a7,0x10
    b430:	02a687b3          	mul	a5,a3,a0
    b434:	01065f13          	srli	t5,a2,0x10
    b438:	029384b3          	mul	s1,t2,s1
    b43c:	94be                	add	s1,s1,a5
    b43e:	94fa                	add	s1,s1,t5
    b440:	02768eb3          	mul	t4,a3,t2
    b444:	00f4f363          	bgeu	s1,a5,b44a <__muldf3+0x27c>
    b448:	9efe                	add	t4,t4,t6
    b44a:	6a41                	lui	s4,0x10
    b44c:	fffa0793          	addi	a5,s4,-1 # ffff <_data_lma+0x3d4b>
    b450:	01045f93          	srli	t6,s0,0x10
    b454:	00f476b3          	and	a3,s0,a5
    b458:	00f4f9b3          	and	s3,s1,a5
    b45c:	8e7d                	and	a2,a2,a5
    b45e:	80c1                	srli	s1,s1,0x10
    b460:	02d58433          	mul	s0,a1,a3
    b464:	09c2                	slli	s3,s3,0x10
    b466:	01d48f33          	add	t5,s1,t4
    b46a:	99b2                	add	s3,s3,a2
    b46c:	98ce                	add	a7,a7,s3
    b46e:	02de07b3          	mul	a5,t3,a3
    b472:	01045e93          	srli	t4,s0,0x10
    b476:	02bf85b3          	mul	a1,t6,a1
    b47a:	97ae                	add	a5,a5,a1
    b47c:	9ebe                	add	t4,t4,a5
    b47e:	03fe0e33          	mul	t3,t3,t6
    b482:	00bef363          	bgeu	t4,a1,b488 <__muldf3+0x2ba>
    b486:	9e52                	add	t3,t3,s4
    b488:	67c1                	lui	a5,0x10
    b48a:	fff78593          	addi	a1,a5,-1 # ffff <_data_lma+0x3d4b>
    b48e:	00bef633          	and	a2,t4,a1
    b492:	8c6d                	and	s0,s0,a1
    b494:	0642                	slli	a2,a2,0x10
    b496:	9622                	add	a2,a2,s0
    b498:	010ede93          	srli	t4,t4,0x10
    b49c:	02d505b3          	mul	a1,a0,a3
    b4a0:	9e76                	add	t3,t3,t4
    b4a2:	02af8533          	mul	a0,t6,a0
    b4a6:	0105d413          	srli	s0,a1,0x10
    b4aa:	02d386b3          	mul	a3,t2,a3
    b4ae:	96aa                	add	a3,a3,a0
    b4b0:	96a2                	add	a3,a3,s0
    b4b2:	03f38fb3          	mul	t6,t2,t6
    b4b6:	00a6f363          	bgeu	a3,a0,b4bc <__muldf3+0x2ee>
    b4ba:	9fbe                	add	t6,t6,a5
    b4bc:	6541                	lui	a0,0x10
    b4be:	157d                	addi	a0,a0,-1
    b4c0:	00a6f7b3          	and	a5,a3,a0
    b4c4:	07c2                	slli	a5,a5,0x10
    b4c6:	8d6d                	and	a0,a0,a1
    b4c8:	97aa                	add	a5,a5,a0
    b4ca:	005885b3          	add	a1,a7,t0
    b4ce:	0135b9b3          	sltu	s3,a1,s3
    b4d2:	97fa                	add	a5,a5,t5
    b4d4:	95b2                	add	a1,a1,a2
    b4d6:	01378433          	add	s0,a5,s3
    b4da:	00c5b633          	sltu	a2,a1,a2
    b4de:	01c40eb3          	add	t4,s0,t3
    b4e2:	00ce8533          	add	a0,t4,a2
    b4e6:	01343433          	sltu	s0,s0,s3
    b4ea:	01e7b7b3          	sltu	a5,a5,t5
    b4ee:	8fc1                	or	a5,a5,s0
    b4f0:	01cebe33          	sltu	t3,t4,t3
    b4f4:	0106d413          	srli	s0,a3,0x10
    b4f8:	00c53633          	sltu	a2,a0,a2
    b4fc:	943e                	add	s0,s0,a5
    b4fe:	00ce6633          	or	a2,t3,a2
    b502:	00959493          	slli	s1,a1,0x9
    b506:	9432                	add	s0,s0,a2
    b508:	947e                	add	s0,s0,t6
    b50a:	0064e4b3          	or	s1,s1,t1
    b50e:	0426                	slli	s0,s0,0x9
    b510:	01755693          	srli	a3,a0,0x17
    b514:	009034b3          	snez	s1,s1
    b518:	81dd                	srli	a1,a1,0x17
    b51a:	00951793          	slli	a5,a0,0x9
    b51e:	8ccd                	or	s1,s1,a1
    b520:	8c55                	or	s0,s0,a3
    b522:	8cdd                	or	s1,s1,a5
    b524:	00741793          	slli	a5,s0,0x7
    b528:	0007db63          	bgez	a5,b53e <__muldf3+0x370>
    b52c:	0014d793          	srli	a5,s1,0x1
    b530:	8885                	andi	s1,s1,1
    b532:	01f41693          	slli	a3,s0,0x1f
    b536:	8cdd                	or	s1,s1,a5
    b538:	8cd5                	or	s1,s1,a3
    b53a:	8005                	srli	s0,s0,0x1
    b53c:	8942                	mv	s2,a6
    b53e:	3ff90793          	addi	a5,s2,1023
    b542:	08f05963          	blez	a5,b5d4 <__muldf3+0x406>
    b546:	0074f693          	andi	a3,s1,7
    b54a:	ce81                	beqz	a3,b562 <__muldf3+0x394>
    b54c:	00f4f693          	andi	a3,s1,15
    b550:	4611                	li	a2,4
    b552:	00c68863          	beq	a3,a2,b562 <__muldf3+0x394>
    b556:	00448693          	addi	a3,s1,4
    b55a:	0096b4b3          	sltu	s1,a3,s1
    b55e:	9426                	add	s0,s0,s1
    b560:	84b6                	mv	s1,a3
    b562:	00741693          	slli	a3,s0,0x7
    b566:	0006d863          	bgez	a3,b576 <__muldf3+0x3a8>
    b56a:	ff0007b7          	lui	a5,0xff000
    b56e:	17fd                	addi	a5,a5,-1
    b570:	8c7d                	and	s0,s0,a5
    b572:	40090793          	addi	a5,s2,1024
    b576:	7fe00693          	li	a3,2046
    b57a:	0ef6cf63          	blt	a3,a5,b678 <__muldf3+0x4aa>
    b57e:	0034d693          	srli	a3,s1,0x3
    b582:	01d41493          	slli	s1,s0,0x1d
    b586:	0426                	slli	s0,s0,0x9
    b588:	8cd5                	or	s1,s1,a3
    b58a:	8031                	srli	s0,s0,0xc
    b58c:	7ff7f793          	andi	a5,a5,2047
    b590:	bb21                	j	b2a8 <__muldf3+0xda>
    b592:	8532                	mv	a0,a2
    b594:	c432                	sw	a2,8(sp)
    b596:	13f000ef          	jal	ra,bed4 <__clzsi2>
    b59a:	01550693          	addi	a3,a0,21 # 10015 <_data_lma+0x3d61>
    b59e:	47f1                	li	a5,28
    b5a0:	02050713          	addi	a4,a0,32
    b5a4:	4622                	lw	a2,8(sp)
    b5a6:	dcd7d1e3          	bge	a5,a3,b368 <__muldf3+0x19a>
    b5aa:	1561                	addi	a0,a0,-8
    b5ac:	00a617b3          	sll	a5,a2,a0
    b5b0:	4581                	li	a1,0
    b5b2:	b3f9                	j	b380 <__muldf3+0x1b2>
    b5b4:	121000ef          	jal	ra,bed4 <__clzsi2>
    b5b8:	01550713          	addi	a4,a0,21
    b5bc:	45f1                	li	a1,28
    b5be:	02050793          	addi	a5,a0,32
    b5c2:	4622                	lw	a2,8(sp)
    b5c4:	46b2                	lw	a3,12(sp)
    b5c6:	d4e5d5e3          	bge	a1,a4,b310 <__muldf3+0x142>
    b5ca:	1561                	addi	a0,a0,-8
    b5cc:	00aa1433          	sll	s0,s4,a0
    b5d0:	4481                	li	s1,0
    b5d2:	bb99                	j	b328 <__muldf3+0x15a>
    b5d4:	4685                	li	a3,1
    b5d6:	8e9d                	sub	a3,a3,a5
    b5d8:	e7b1                	bnez	a5,b624 <__muldf3+0x456>
    b5da:	41e90913          	addi	s2,s2,1054
    b5de:	012497b3          	sll	a5,s1,s2
    b5e2:	00d4d4b3          	srl	s1,s1,a3
    b5e6:	01241933          	sll	s2,s0,s2
    b5ea:	00f037b3          	snez	a5,a5
    b5ee:	009964b3          	or	s1,s2,s1
    b5f2:	8cdd                	or	s1,s1,a5
    b5f4:	0074f793          	andi	a5,s1,7
    b5f8:	00d456b3          	srl	a3,s0,a3
    b5fc:	cf81                	beqz	a5,b614 <__muldf3+0x446>
    b5fe:	00f4f793          	andi	a5,s1,15
    b602:	4611                	li	a2,4
    b604:	00c78863          	beq	a5,a2,b614 <__muldf3+0x446>
    b608:	00448793          	addi	a5,s1,4
    b60c:	0097b4b3          	sltu	s1,a5,s1
    b610:	96a6                	add	a3,a3,s1
    b612:	84be                	mv	s1,a5
    b614:	00869793          	slli	a5,a3,0x8
    b618:	0407d863          	bgez	a5,b668 <__muldf3+0x49a>
    b61c:	4785                	li	a5,1
    b61e:	4401                	li	s0,0
    b620:	4481                	li	s1,0
    b622:	b159                	j	b2a8 <__muldf3+0xda>
    b624:	03800613          	li	a2,56
    b628:	ccd641e3          	blt	a2,a3,b2ea <__muldf3+0x11c>
    b62c:	467d                	li	a2,31
    b62e:	fad656e3          	bge	a2,a3,b5da <__muldf3+0x40c>
    b632:	5605                	li	a2,-31
    b634:	40f607b3          	sub	a5,a2,a5
    b638:	02000593          	li	a1,32
    b63c:	00f45633          	srl	a2,s0,a5
    b640:	00b68763          	beq	a3,a1,b64e <__muldf3+0x480>
    b644:	43e90913          	addi	s2,s2,1086
    b648:	012417b3          	sll	a5,s0,s2
    b64c:	8cdd                	or	s1,s1,a5
    b64e:	009034b3          	snez	s1,s1
    b652:	8cd1                	or	s1,s1,a2
    b654:	0074f693          	andi	a3,s1,7
    b658:	4401                	li	s0,0
    b65a:	ca99                	beqz	a3,b670 <__muldf3+0x4a2>
    b65c:	00f4f793          	andi	a5,s1,15
    b660:	4611                	li	a2,4
    b662:	4681                	li	a3,0
    b664:	fac792e3          	bne	a5,a2,b608 <__muldf3+0x43a>
    b668:	00969413          	slli	s0,a3,0x9
    b66c:	8031                	srli	s0,s0,0xc
    b66e:	06f6                	slli	a3,a3,0x1d
    b670:	808d                	srli	s1,s1,0x3
    b672:	8cd5                	or	s1,s1,a3
    b674:	4781                	li	a5,0
    b676:	b90d                	j	b2a8 <__muldf3+0xda>
    b678:	7ff00793          	li	a5,2047
    b67c:	4401                	li	s0,0
    b67e:	4481                	li	s1,0
    b680:	b125                	j	b2a8 <__muldf3+0xda>
    b682:	8942                	mv	s2,a6
    b684:	bd6d                	j	b53e <__muldf3+0x370>

0000b686 <__subdf3>:
    b686:	00100737          	lui	a4,0x100
    b68a:	177d                	addi	a4,a4,-1
    b68c:	1101                	addi	sp,sp,-32
    b68e:	00b77333          	and	t1,a4,a1
    b692:	0146d893          	srli	a7,a3,0x14
    b696:	8f75                	and	a4,a4,a3
    b698:	01d65e93          	srli	t4,a2,0x1d
    b69c:	cc22                	sw	s0,24(sp)
    b69e:	ca26                	sw	s1,20(sp)
    b6a0:	030e                	slli	t1,t1,0x3
    b6a2:	0145d493          	srli	s1,a1,0x14
    b6a6:	01d55793          	srli	a5,a0,0x1d
    b6aa:	070e                	slli	a4,a4,0x3
    b6ac:	ce06                	sw	ra,28(sp)
    b6ae:	c84a                	sw	s2,16(sp)
    b6b0:	c64e                	sw	s3,12(sp)
    b6b2:	7ff8f893          	andi	a7,a7,2047
    b6b6:	7ff00e13          	li	t3,2047
    b6ba:	00eee733          	or	a4,t4,a4
    b6be:	7ff4f493          	andi	s1,s1,2047
    b6c2:	01f5d413          	srli	s0,a1,0x1f
    b6c6:	0067e333          	or	t1,a5,t1
    b6ca:	00351f13          	slli	t5,a0,0x3
    b6ce:	82fd                	srli	a3,a3,0x1f
    b6d0:	00361e93          	slli	t4,a2,0x3
    b6d4:	17c88f63          	beq	a7,t3,b852 <__subdf3+0x1cc>
    b6d8:	0016c693          	xori	a3,a3,1
    b6dc:	411485b3          	sub	a1,s1,a7
    b6e0:	12d40463          	beq	s0,a3,b808 <__subdf3+0x182>
    b6e4:	18b05063          	blez	a1,b864 <__subdf3+0x1de>
    b6e8:	1a088a63          	beqz	a7,b89c <__subdf3+0x216>
    b6ec:	008007b7          	lui	a5,0x800
    b6f0:	8f5d                	or	a4,a4,a5
    b6f2:	57c48f63          	beq	s1,t3,bc70 <__subdf3+0x5ea>
    b6f6:	03800793          	li	a5,56
    b6fa:	34b7c263          	blt	a5,a1,ba3e <__subdf3+0x3b8>
    b6fe:	47fd                	li	a5,31
    b700:	48b7c363          	blt	a5,a1,bb86 <__subdf3+0x500>
    b704:	02000793          	li	a5,32
    b708:	8f8d                	sub	a5,a5,a1
    b70a:	00bed9b3          	srl	s3,t4,a1
    b70e:	00f71833          	sll	a6,a4,a5
    b712:	00fe9eb3          	sll	t4,t4,a5
    b716:	01386833          	or	a6,a6,s3
    b71a:	00b75733          	srl	a4,a4,a1
    b71e:	01d039b3          	snez	s3,t4
    b722:	01386833          	or	a6,a6,s3
    b726:	40e30333          	sub	t1,t1,a4
    b72a:	410f09b3          	sub	s3,t5,a6
    b72e:	013f37b3          	sltu	a5,t5,s3
    b732:	40f30633          	sub	a2,t1,a5
    b736:	00861793          	slli	a5,a2,0x8
    b73a:	2407d263          	bgez	a5,b97e <__subdf3+0x2f8>
    b73e:	00800937          	lui	s2,0x800
    b742:	197d                	addi	s2,s2,-1
    b744:	01267933          	and	s2,a2,s2
    b748:	2c090e63          	beqz	s2,ba24 <__subdf3+0x39e>
    b74c:	854a                	mv	a0,s2
    b74e:	2759                	jal	bed4 <__clzsi2>
    b750:	ff850713          	addi	a4,a0,-8
    b754:	02000793          	li	a5,32
    b758:	8f99                	sub	a5,a5,a4
    b75a:	00f9d7b3          	srl	a5,s3,a5
    b75e:	00e91633          	sll	a2,s2,a4
    b762:	8fd1                	or	a5,a5,a2
    b764:	00e999b3          	sll	s3,s3,a4
    b768:	2a974463          	blt	a4,s1,ba10 <__subdf3+0x38a>
    b76c:	8f05                	sub	a4,a4,s1
    b76e:	00170613          	addi	a2,a4,1 # 100001 <_data_lma+0xf3d4d>
    b772:	46fd                	li	a3,31
    b774:	3ac6c463          	blt	a3,a2,bb1c <__subdf3+0x496>
    b778:	02000713          	li	a4,32
    b77c:	8f11                	sub	a4,a4,a2
    b77e:	00c9d6b3          	srl	a3,s3,a2
    b782:	00e99833          	sll	a6,s3,a4
    b786:	00e79733          	sll	a4,a5,a4
    b78a:	8f55                	or	a4,a4,a3
    b78c:	01003833          	snez	a6,a6
    b790:	010769b3          	or	s3,a4,a6
    b794:	00c7d633          	srl	a2,a5,a2
    b798:	4481                	li	s1,0
    b79a:	0079f793          	andi	a5,s3,7
    b79e:	cf81                	beqz	a5,b7b6 <__subdf3+0x130>
    b7a0:	00f9f693          	andi	a3,s3,15
    b7a4:	4791                	li	a5,4
    b7a6:	00f68863          	beq	a3,a5,b7b6 <__subdf3+0x130>
    b7aa:	00498693          	addi	a3,s3,4
    b7ae:	0136b833          	sltu	a6,a3,s3
    b7b2:	9642                	add	a2,a2,a6
    b7b4:	89b6                	mv	s3,a3
    b7b6:	00861793          	slli	a5,a2,0x8
    b7ba:	1c07d663          	bgez	a5,b986 <__subdf3+0x300>
    b7be:	00148713          	addi	a4,s1,1
    b7c2:	7ff00793          	li	a5,2047
    b7c6:	8805                	andi	s0,s0,1
    b7c8:	20f70663          	beq	a4,a5,b9d4 <__subdf3+0x34e>
    b7cc:	ff8007b7          	lui	a5,0xff800
    b7d0:	17fd                	addi	a5,a5,-1
    b7d2:	8ff1                	and	a5,a5,a2
    b7d4:	01d79813          	slli	a6,a5,0x1d
    b7d8:	0039d993          	srli	s3,s3,0x3
    b7dc:	07a6                	slli	a5,a5,0x9
    b7de:	01386833          	or	a6,a6,s3
    b7e2:	83b1                	srli	a5,a5,0xc
    b7e4:	7ff77713          	andi	a4,a4,2047
    b7e8:	00c79693          	slli	a3,a5,0xc
    b7ec:	0752                	slli	a4,a4,0x14
    b7ee:	82b1                	srli	a3,a3,0xc
    b7f0:	047e                	slli	s0,s0,0x1f
    b7f2:	8ed9                	or	a3,a3,a4
    b7f4:	8ec1                	or	a3,a3,s0
    b7f6:	40f2                	lw	ra,28(sp)
    b7f8:	4462                	lw	s0,24(sp)
    b7fa:	44d2                	lw	s1,20(sp)
    b7fc:	4942                	lw	s2,16(sp)
    b7fe:	49b2                	lw	s3,12(sp)
    b800:	8542                	mv	a0,a6
    b802:	85b6                	mv	a1,a3
    b804:	6105                	addi	sp,sp,32
    b806:	8082                	ret
    b808:	0ab05663          	blez	a1,b8b4 <__subdf3+0x22e>
    b80c:	12088a63          	beqz	a7,b940 <__subdf3+0x2ba>
    b810:	008007b7          	lui	a5,0x800
    b814:	8f5d                	or	a4,a4,a5
    b816:	2dc48663          	beq	s1,t3,bae2 <__subdf3+0x45c>
    b81a:	03800793          	li	a5,56
    b81e:	18b7c763          	blt	a5,a1,b9ac <__subdf3+0x326>
    b822:	47fd                	li	a5,31
    b824:	3cb7d163          	bge	a5,a1,bbe6 <__subdf3+0x560>
    b828:	fe058813          	addi	a6,a1,-32 # ffe0 <_data_lma+0x3d2c>
    b82c:	02000793          	li	a5,32
    b830:	010759b3          	srl	s3,a4,a6
    b834:	00f58a63          	beq	a1,a5,b848 <__subdf3+0x1c2>
    b838:	04000793          	li	a5,64
    b83c:	40b785b3          	sub	a1,a5,a1
    b840:	00b71733          	sll	a4,a4,a1
    b844:	00eeeeb3          	or	t4,t4,a4
    b848:	01d03833          	snez	a6,t4
    b84c:	01386833          	or	a6,a6,s3
    b850:	a295                	j	b9b4 <__subdf3+0x32e>
    b852:	01d767b3          	or	a5,a4,t4
    b856:	80148593          	addi	a1,s1,-2047
    b85a:	e399                	bnez	a5,b860 <__subdf3+0x1da>
    b85c:	0016c693          	xori	a3,a3,1
    b860:	04d40a63          	beq	s0,a3,b8b4 <__subdf3+0x22e>
    b864:	e1d1                	bnez	a1,b8e8 <__subdf3+0x262>
    b866:	00148793          	addi	a5,s1,1
    b86a:	7fe7f793          	andi	a5,a5,2046
    b86e:	1e079863          	bnez	a5,ba5e <__subdf3+0x3d8>
    b872:	01e367b3          	or	a5,t1,t5
    b876:	01d76833          	or	a6,a4,t4
    b87a:	16049263          	bnez	s1,b9de <__subdf3+0x358>
    b87e:	3c078163          	beqz	a5,bc40 <__subdf3+0x5ba>
    b882:	42081563          	bnez	a6,bcac <__subdf3+0x626>
    b886:	00351813          	slli	a6,a0,0x3
    b88a:	01d31693          	slli	a3,t1,0x1d
    b88e:	00385813          	srli	a6,a6,0x3
    b892:	0106e833          	or	a6,a3,a6
    b896:	00335793          	srli	a5,t1,0x3
    b89a:	a219                	j	b9a0 <__subdf3+0x31a>
    b89c:	01d767b3          	or	a5,a4,t4
    b8a0:	1a078463          	beqz	a5,ba48 <__subdf3+0x3c2>
    b8a4:	fff58793          	addi	a5,a1,-1
    b8a8:	3a078a63          	beqz	a5,bc5c <__subdf3+0x5d6>
    b8ac:	23c58b63          	beq	a1,t3,bae2 <__subdf3+0x45c>
    b8b0:	85be                	mv	a1,a5
    b8b2:	b591                	j	b6f6 <__subdf3+0x70>
    b8b4:	1c059863          	bnez	a1,ba84 <__subdf3+0x3fe>
    b8b8:	00148693          	addi	a3,s1,1
    b8bc:	7fe6f793          	andi	a5,a3,2046
    b8c0:	efc1                	bnez	a5,b958 <__subdf3+0x2d2>
    b8c2:	01e367b3          	or	a5,t1,t5
    b8c6:	34049f63          	bnez	s1,bc24 <__subdf3+0x59e>
    b8ca:	44078c63          	beqz	a5,bd22 <__subdf3+0x69c>
    b8ce:	01d767b3          	or	a5,a4,t4
    b8d2:	46079363          	bnez	a5,bd38 <__subdf3+0x6b2>
    b8d6:	050e                	slli	a0,a0,0x3
    b8d8:	01d31813          	slli	a6,t1,0x1d
    b8dc:	810d                	srli	a0,a0,0x3
    b8de:	00a86833          	or	a6,a6,a0
    b8e2:	00335793          	srli	a5,t1,0x3
    b8e6:	a86d                	j	b9a0 <__subdf3+0x31a>
    b8e8:	409885b3          	sub	a1,a7,s1
    b8ec:	20049663          	bnez	s1,baf8 <__subdf3+0x472>
    b8f0:	01e367b3          	or	a5,t1,t5
    b8f4:	30078c63          	beqz	a5,bc0c <__subdf3+0x586>
    b8f8:	fff58793          	addi	a5,a1,-1
    b8fc:	40078863          	beqz	a5,bd0c <__subdf3+0x686>
    b900:	7ff00513          	li	a0,2047
    b904:	20a58263          	beq	a1,a0,bb08 <__subdf3+0x482>
    b908:	85be                	mv	a1,a5
    b90a:	03800793          	li	a5,56
    b90e:	2ab7c163          	blt	a5,a1,bbb0 <__subdf3+0x52a>
    b912:	47fd                	li	a5,31
    b914:	3cb7c763          	blt	a5,a1,bce2 <__subdf3+0x65c>
    b918:	02000793          	li	a5,32
    b91c:	8f8d                	sub	a5,a5,a1
    b91e:	00f31833          	sll	a6,t1,a5
    b922:	00bf5633          	srl	a2,t5,a1
    b926:	00ff17b3          	sll	a5,t5,a5
    b92a:	00c86833          	or	a6,a6,a2
    b92e:	00f039b3          	snez	s3,a5
    b932:	00b35333          	srl	t1,t1,a1
    b936:	01386833          	or	a6,a6,s3
    b93a:	40670733          	sub	a4,a4,t1
    b93e:	acad                	j	bbb8 <__subdf3+0x532>
    b940:	01d767b3          	or	a5,a4,t4
    b944:	10078263          	beqz	a5,ba48 <__subdf3+0x3c2>
    b948:	fff58793          	addi	a5,a1,-1
    b94c:	1e078e63          	beqz	a5,bb48 <__subdf3+0x4c2>
    b950:	2dc58f63          	beq	a1,t3,bc2e <__subdf3+0x5a8>
    b954:	85be                	mv	a1,a5
    b956:	b5d1                	j	b81a <__subdf3+0x194>
    b958:	7ff00793          	li	a5,2047
    b95c:	06f68b63          	beq	a3,a5,b9d2 <__subdf3+0x34c>
    b960:	9efa                	add	t4,t4,t5
    b962:	01eeb633          	sltu	a2,t4,t5
    b966:	00e307b3          	add	a5,t1,a4
    b96a:	97b2                	add	a5,a5,a2
    b96c:	01f79813          	slli	a6,a5,0x1f
    b970:	001ede93          	srli	t4,t4,0x1
    b974:	01d869b3          	or	s3,a6,t4
    b978:	0017d613          	srli	a2,a5,0x1
    b97c:	84b6                	mv	s1,a3
    b97e:	0079f793          	andi	a5,s3,7
    b982:	e0079fe3          	bnez	a5,b7a0 <__subdf3+0x11a>
    b986:	01d61793          	slli	a5,a2,0x1d
    b98a:	0039d813          	srli	a6,s3,0x3
    b98e:	00f86833          	or	a6,a6,a5
    b992:	85a6                	mv	a1,s1
    b994:	00365793          	srli	a5,a2,0x3
    b998:	7ff00713          	li	a4,2047
    b99c:	06e58063          	beq	a1,a4,b9fc <__subdf3+0x376>
    b9a0:	07b2                	slli	a5,a5,0xc
    b9a2:	83b1                	srli	a5,a5,0xc
    b9a4:	7ff5f713          	andi	a4,a1,2047
    b9a8:	8805                	andi	s0,s0,1
    b9aa:	bd3d                	j	b7e8 <__subdf3+0x162>
    b9ac:	01d76733          	or	a4,a4,t4
    b9b0:	00e03833          	snez	a6,a4
    b9b4:	01e809b3          	add	s3,a6,t5
    b9b8:	01e9b7b3          	sltu	a5,s3,t5
    b9bc:	00678633          	add	a2,a5,t1
    b9c0:	00861793          	slli	a5,a2,0x8
    b9c4:	fa07dde3          	bgez	a5,b97e <__subdf3+0x2f8>
    b9c8:	0485                	addi	s1,s1,1
    b9ca:	7ff00793          	li	a5,2047
    b9ce:	18f49b63          	bne	s1,a5,bb64 <__subdf3+0x4de>
    b9d2:	8805                	andi	s0,s0,1
    b9d4:	7ff00713          	li	a4,2047
    b9d8:	4781                	li	a5,0
    b9da:	4801                	li	a6,0
    b9dc:	b531                	j	b7e8 <__subdf3+0x162>
    b9de:	10079063          	bnez	a5,bade <__subdf3+0x458>
    b9e2:	3c080063          	beqz	a6,bda2 <__subdf3+0x71c>
    b9e6:	00361813          	slli	a6,a2,0x3
    b9ea:	01d71793          	slli	a5,a4,0x1d
    b9ee:	00385813          	srli	a6,a6,0x3
    b9f2:	00f86833          	or	a6,a6,a5
    b9f6:	8436                	mv	s0,a3
    b9f8:	00375793          	srli	a5,a4,0x3
    b9fc:	00f867b3          	or	a5,a6,a5
    ba00:	dbe9                	beqz	a5,b9d2 <__subdf3+0x34c>
    ba02:	4401                	li	s0,0
    ba04:	7ff00713          	li	a4,2047
    ba08:	000807b7          	lui	a5,0x80
    ba0c:	4801                	li	a6,0
    ba0e:	bbe9                	j	b7e8 <__subdf3+0x162>
    ba10:	ff800637          	lui	a2,0xff800
    ba14:	167d                	addi	a2,a2,-1
    ba16:	8e7d                	and	a2,a2,a5
    ba18:	0079f793          	andi	a5,s3,7
    ba1c:	8c99                	sub	s1,s1,a4
    ba1e:	d80791e3          	bnez	a5,b7a0 <__subdf3+0x11a>
    ba22:	b795                	j	b986 <__subdf3+0x300>
    ba24:	854e                	mv	a0,s3
    ba26:	217d                	jal	bed4 <__clzsi2>
    ba28:	01850713          	addi	a4,a0,24
    ba2c:	47fd                	li	a5,31
    ba2e:	d2e7d3e3          	bge	a5,a4,b754 <__subdf3+0xce>
    ba32:	ff850613          	addi	a2,a0,-8
    ba36:	00c997b3          	sll	a5,s3,a2
    ba3a:	4981                	li	s3,0
    ba3c:	b335                	j	b768 <__subdf3+0xe2>
    ba3e:	01d76833          	or	a6,a4,t4
    ba42:	01003833          	snez	a6,a6
    ba46:	b1d5                	j	b72a <__subdf3+0xa4>
    ba48:	00351813          	slli	a6,a0,0x3
    ba4c:	01d31793          	slli	a5,t1,0x1d
    ba50:	00385813          	srli	a6,a6,0x3
    ba54:	00f86833          	or	a6,a6,a5
    ba58:	00335793          	srli	a5,t1,0x3
    ba5c:	bf35                	j	b998 <__subdf3+0x312>
    ba5e:	41df09b3          	sub	s3,t5,t4
    ba62:	40e30933          	sub	s2,t1,a4
    ba66:	013f3633          	sltu	a2,t5,s3
    ba6a:	40c90933          	sub	s2,s2,a2
    ba6e:	00891793          	slli	a5,s2,0x8
    ba72:	2007ca63          	bltz	a5,bc86 <__subdf3+0x600>
    ba76:	0129e833          	or	a6,s3,s2
    ba7a:	cc0817e3          	bnez	a6,b748 <__subdf3+0xc2>
    ba7e:	4781                	li	a5,0
    ba80:	4401                	li	s0,0
    ba82:	bf39                	j	b9a0 <__subdf3+0x31a>
    ba84:	409885b3          	sub	a1,a7,s1
    ba88:	14048163          	beqz	s1,bbca <__subdf3+0x544>
    ba8c:	008006b7          	lui	a3,0x800
    ba90:	7ff00793          	li	a5,2047
    ba94:	00d36333          	or	t1,t1,a3
    ba98:	20f88163          	beq	a7,a5,bc9a <__subdf3+0x614>
    ba9c:	03800793          	li	a5,56
    baa0:	22b7cc63          	blt	a5,a1,bcd8 <__subdf3+0x652>
    baa4:	47fd                	li	a5,31
    baa6:	2cb7c963          	blt	a5,a1,bd78 <__subdf3+0x6f2>
    baaa:	02000793          	li	a5,32
    baae:	8f8d                	sub	a5,a5,a1
    bab0:	00f31833          	sll	a6,t1,a5
    bab4:	00bf56b3          	srl	a3,t5,a1
    bab8:	00ff17b3          	sll	a5,t5,a5
    babc:	00d86833          	or	a6,a6,a3
    bac0:	00f039b3          	snez	s3,a5
    bac4:	00b35333          	srl	t1,t1,a1
    bac8:	01386833          	or	a6,a6,s3
    bacc:	971a                	add	a4,a4,t1
    bace:	01d809b3          	add	s3,a6,t4
    bad2:	01d9b7b3          	sltu	a5,s3,t4
    bad6:	00e78633          	add	a2,a5,a4
    bada:	84c6                	mv	s1,a7
    badc:	b5d5                	j	b9c0 <__subdf3+0x33a>
    bade:	f20812e3          	bnez	a6,ba02 <__subdf3+0x37c>
    bae2:	00351813          	slli	a6,a0,0x3
    bae6:	01d31793          	slli	a5,t1,0x1d
    baea:	00385813          	srli	a6,a6,0x3
    baee:	00f86833          	or	a6,a6,a5
    baf2:	00335793          	srli	a5,t1,0x3
    baf6:	b719                	j	b9fc <__subdf3+0x376>
    baf8:	00800537          	lui	a0,0x800
    bafc:	7ff00793          	li	a5,2047
    bb00:	00a36333          	or	t1,t1,a0
    bb04:	e0f893e3          	bne	a7,a5,b90a <__subdf3+0x284>
    bb08:	060e                	slli	a2,a2,0x3
    bb0a:	01d71813          	slli	a6,a4,0x1d
    bb0e:	820d                	srli	a2,a2,0x3
    bb10:	00c86833          	or	a6,a6,a2
    bb14:	00375793          	srli	a5,a4,0x3
    bb18:	8436                	mv	s0,a3
    bb1a:	b5cd                	j	b9fc <__subdf3+0x376>
    bb1c:	1705                	addi	a4,a4,-31
    bb1e:	02000693          	li	a3,32
    bb22:	00e7d733          	srl	a4,a5,a4
    bb26:	00d60a63          	beq	a2,a3,bb3a <__subdf3+0x4b4>
    bb2a:	04000693          	li	a3,64
    bb2e:	40c68633          	sub	a2,a3,a2
    bb32:	00c79633          	sll	a2,a5,a2
    bb36:	00c9e9b3          	or	s3,s3,a2
    bb3a:	01303833          	snez	a6,s3
    bb3e:	00e869b3          	or	s3,a6,a4
    bb42:	4601                	li	a2,0
    bb44:	4481                	li	s1,0
    bb46:	bd25                	j	b97e <__subdf3+0x2f8>
    bb48:	01df09b3          	add	s3,t5,t4
    bb4c:	00e307b3          	add	a5,t1,a4
    bb50:	01e9bf33          	sltu	t5,s3,t5
    bb54:	01e78633          	add	a2,a5,t5
    bb58:	00861793          	slli	a5,a2,0x8
    bb5c:	4485                	li	s1,1
    bb5e:	e207d0e3          	bgez	a5,b97e <__subdf3+0x2f8>
    bb62:	4489                	li	s1,2
    bb64:	ff8007b7          	lui	a5,0xff800
    bb68:	17fd                	addi	a5,a5,-1
    bb6a:	8ff1                	and	a5,a5,a2
    bb6c:	0019d713          	srli	a4,s3,0x1
    bb70:	0019f813          	andi	a6,s3,1
    bb74:	01076833          	or	a6,a4,a6
    bb78:	01f79993          	slli	s3,a5,0x1f
    bb7c:	0109e9b3          	or	s3,s3,a6
    bb80:	0017d613          	srli	a2,a5,0x1
    bb84:	b919                	j	b79a <__subdf3+0x114>
    bb86:	fe058813          	addi	a6,a1,-32
    bb8a:	02000793          	li	a5,32
    bb8e:	010759b3          	srl	s3,a4,a6
    bb92:	00f58a63          	beq	a1,a5,bba6 <__subdf3+0x520>
    bb96:	04000793          	li	a5,64
    bb9a:	40b785b3          	sub	a1,a5,a1
    bb9e:	00b71733          	sll	a4,a4,a1
    bba2:	00eeeeb3          	or	t4,t4,a4
    bba6:	01d03833          	snez	a6,t4
    bbaa:	01386833          	or	a6,a6,s3
    bbae:	beb5                	j	b72a <__subdf3+0xa4>
    bbb0:	01e36333          	or	t1,t1,t5
    bbb4:	00603833          	snez	a6,t1
    bbb8:	410e89b3          	sub	s3,t4,a6
    bbbc:	013eb7b3          	sltu	a5,t4,s3
    bbc0:	40f70633          	sub	a2,a4,a5
    bbc4:	84c6                	mv	s1,a7
    bbc6:	8436                	mv	s0,a3
    bbc8:	b6bd                	j	b736 <__subdf3+0xb0>
    bbca:	01e367b3          	or	a5,t1,t5
    bbce:	18078763          	beqz	a5,bd5c <__subdf3+0x6d6>
    bbd2:	fff58793          	addi	a5,a1,-1
    bbd6:	1c078c63          	beqz	a5,bdae <__subdf3+0x728>
    bbda:	7ff00693          	li	a3,2047
    bbde:	0ad58e63          	beq	a1,a3,bc9a <__subdf3+0x614>
    bbe2:	85be                	mv	a1,a5
    bbe4:	bd65                	j	ba9c <__subdf3+0x416>
    bbe6:	02000793          	li	a5,32
    bbea:	8f8d                	sub	a5,a5,a1
    bbec:	00bed9b3          	srl	s3,t4,a1
    bbf0:	00f71833          	sll	a6,a4,a5
    bbf4:	00fe9eb3          	sll	t4,t4,a5
    bbf8:	01386833          	or	a6,a6,s3
    bbfc:	00b75733          	srl	a4,a4,a1
    bc00:	01d039b3          	snez	s3,t4
    bc04:	01386833          	or	a6,a6,s3
    bc08:	933a                	add	t1,t1,a4
    bc0a:	b36d                	j	b9b4 <__subdf3+0x32e>
    bc0c:	00361813          	slli	a6,a2,0x3
    bc10:	01d71793          	slli	a5,a4,0x1d
    bc14:	00385813          	srli	a6,a6,0x3
    bc18:	0107e833          	or	a6,a5,a6
    bc1c:	8436                	mv	s0,a3
    bc1e:	00375793          	srli	a5,a4,0x3
    bc22:	bb9d                	j	b998 <__subdf3+0x312>
    bc24:	cbbd                	beqz	a5,bc9a <__subdf3+0x614>
    bc26:	01d76733          	or	a4,a4,t4
    bc2a:	dc071ce3          	bnez	a4,ba02 <__subdf3+0x37c>
    bc2e:	050e                	slli	a0,a0,0x3
    bc30:	01d31813          	slli	a6,t1,0x1d
    bc34:	810d                	srli	a0,a0,0x3
    bc36:	00a86833          	or	a6,a6,a0
    bc3a:	00335793          	srli	a5,t1,0x3
    bc3e:	bb7d                	j	b9fc <__subdf3+0x376>
    bc40:	e2080fe3          	beqz	a6,ba7e <__subdf3+0x3f8>
    bc44:	00361813          	slli	a6,a2,0x3
    bc48:	01d71793          	slli	a5,a4,0x1d
    bc4c:	00385813          	srli	a6,a6,0x3
    bc50:	00f86833          	or	a6,a6,a5
    bc54:	8436                	mv	s0,a3
    bc56:	00375793          	srli	a5,a4,0x3
    bc5a:	b399                	j	b9a0 <__subdf3+0x31a>
    bc5c:	41df09b3          	sub	s3,t5,t4
    bc60:	40e307b3          	sub	a5,t1,a4
    bc64:	013f3f33          	sltu	t5,t5,s3
    bc68:	41e78633          	sub	a2,a5,t5
    bc6c:	4485                	li	s1,1
    bc6e:	b4e1                	j	b736 <__subdf3+0xb0>
    bc70:	00351813          	slli	a6,a0,0x3
    bc74:	01d31693          	slli	a3,t1,0x1d
    bc78:	00385813          	srli	a6,a6,0x3
    bc7c:	0106e833          	or	a6,a3,a6
    bc80:	00335793          	srli	a5,t1,0x3
    bc84:	bba5                	j	b9fc <__subdf3+0x376>
    bc86:	41ee89b3          	sub	s3,t4,t5
    bc8a:	40670633          	sub	a2,a4,t1
    bc8e:	013eb933          	sltu	s2,t4,s3
    bc92:	41260933          	sub	s2,a2,s2
    bc96:	8436                	mv	s0,a3
    bc98:	bc45                	j	b748 <__subdf3+0xc2>
    bc9a:	060e                	slli	a2,a2,0x3
    bc9c:	01d71813          	slli	a6,a4,0x1d
    bca0:	820d                	srli	a2,a2,0x3
    bca2:	00c86833          	or	a6,a6,a2
    bca6:	00375793          	srli	a5,a4,0x3
    bcaa:	bb89                	j	b9fc <__subdf3+0x376>
    bcac:	41df09b3          	sub	s3,t5,t4
    bcb0:	40e307b3          	sub	a5,t1,a4
    bcb4:	013f3633          	sltu	a2,t5,s3
    bcb8:	40c78633          	sub	a2,a5,a2
    bcbc:	00861793          	slli	a5,a2,0x8
    bcc0:	0a07d763          	bgez	a5,bd6e <__subdf3+0x6e8>
    bcc4:	41ee89b3          	sub	s3,t4,t5
    bcc8:	406707b3          	sub	a5,a4,t1
    bccc:	013ebeb3          	sltu	t4,t4,s3
    bcd0:	41d78633          	sub	a2,a5,t4
    bcd4:	8436                	mv	s0,a3
    bcd6:	b4d1                	j	b79a <__subdf3+0x114>
    bcd8:	01e36333          	or	t1,t1,t5
    bcdc:	00603833          	snez	a6,t1
    bce0:	b3fd                	j	bace <__subdf3+0x448>
    bce2:	fe058813          	addi	a6,a1,-32
    bce6:	02000793          	li	a5,32
    bcea:	010359b3          	srl	s3,t1,a6
    bcee:	00f58a63          	beq	a1,a5,bd02 <__subdf3+0x67c>
    bcf2:	04000793          	li	a5,64
    bcf6:	40b785b3          	sub	a1,a5,a1
    bcfa:	00b31333          	sll	t1,t1,a1
    bcfe:	006f6f33          	or	t5,t5,t1
    bd02:	01e03833          	snez	a6,t5
    bd06:	01386833          	or	a6,a6,s3
    bd0a:	b57d                	j	bbb8 <__subdf3+0x532>
    bd0c:	41ee89b3          	sub	s3,t4,t5
    bd10:	406707b3          	sub	a5,a4,t1
    bd14:	013ebeb3          	sltu	t4,t4,s3
    bd18:	41d78633          	sub	a2,a5,t4
    bd1c:	8436                	mv	s0,a3
    bd1e:	4485                	li	s1,1
    bd20:	bc19                	j	b736 <__subdf3+0xb0>
    bd22:	00361813          	slli	a6,a2,0x3
    bd26:	01d71793          	slli	a5,a4,0x1d
    bd2a:	00385813          	srli	a6,a6,0x3
    bd2e:	00f86833          	or	a6,a6,a5
    bd32:	00375793          	srli	a5,a4,0x3
    bd36:	b1ad                	j	b9a0 <__subdf3+0x31a>
    bd38:	01df09b3          	add	s3,t5,t4
    bd3c:	00e307b3          	add	a5,t1,a4
    bd40:	01e9bf33          	sltu	t5,s3,t5
    bd44:	01e78633          	add	a2,a5,t5
    bd48:	00861793          	slli	a5,a2,0x8
    bd4c:	c207d9e3          	bgez	a5,b97e <__subdf3+0x2f8>
    bd50:	ff8007b7          	lui	a5,0xff800
    bd54:	17fd                	addi	a5,a5,-1
    bd56:	8e7d                	and	a2,a2,a5
    bd58:	4485                	li	s1,1
    bd5a:	b115                	j	b97e <__subdf3+0x2f8>
    bd5c:	060e                	slli	a2,a2,0x3
    bd5e:	01d71813          	slli	a6,a4,0x1d
    bd62:	820d                	srli	a2,a2,0x3
    bd64:	00c86833          	or	a6,a6,a2
    bd68:	00375793          	srli	a5,a4,0x3
    bd6c:	b135                	j	b998 <__subdf3+0x312>
    bd6e:	00c9e833          	or	a6,s3,a2
    bd72:	d00806e3          	beqz	a6,ba7e <__subdf3+0x3f8>
    bd76:	b121                	j	b97e <__subdf3+0x2f8>
    bd78:	fe058813          	addi	a6,a1,-32
    bd7c:	02000793          	li	a5,32
    bd80:	010359b3          	srl	s3,t1,a6
    bd84:	00f58a63          	beq	a1,a5,bd98 <__subdf3+0x712>
    bd88:	04000793          	li	a5,64
    bd8c:	40b785b3          	sub	a1,a5,a1
    bd90:	00b31333          	sll	t1,t1,a1
    bd94:	006f6f33          	or	t5,t5,t1
    bd98:	01e03833          	snez	a6,t5
    bd9c:	01386833          	or	a6,a6,s3
    bda0:	b33d                	j	bace <__subdf3+0x448>
    bda2:	4401                	li	s0,0
    bda4:	7ff00713          	li	a4,2047
    bda8:	000807b7          	lui	a5,0x80
    bdac:	bc35                	j	b7e8 <__subdf3+0x162>
    bdae:	01df09b3          	add	s3,t5,t4
    bdb2:	00e307b3          	add	a5,t1,a4
    bdb6:	01d9beb3          	sltu	t4,s3,t4
    bdba:	01d78633          	add	a2,a5,t4
    bdbe:	bb69                	j	bb58 <__subdf3+0x4d2>

0000bdc0 <__unorddf2>:
    bdc0:	0145d713          	srli	a4,a1,0x14
    bdc4:	001007b7          	lui	a5,0x100
    bdc8:	17fd                	addi	a5,a5,-1
    bdca:	fff74713          	not	a4,a4
    bdce:	0146d813          	srli	a6,a3,0x14
    bdd2:	8dfd                	and	a1,a1,a5
    bdd4:	8ff5                	and	a5,a5,a3
    bdd6:	01571693          	slli	a3,a4,0x15
    bdda:	7ff87813          	andi	a6,a6,2047
    bdde:	ca99                	beqz	a3,bdf4 <__unorddf2+0x34>
    bde0:	7ff00713          	li	a4,2047
    bde4:	4501                	li	a0,0
    bde6:	00e80363          	beq	a6,a4,bdec <__unorddf2+0x2c>
    bdea:	8082                	ret
    bdec:	8fd1                	or	a5,a5,a2
    bdee:	00f03533          	snez	a0,a5
    bdf2:	8082                	ret
    bdf4:	8dc9                	or	a1,a1,a0
    bdf6:	4505                	li	a0,1
    bdf8:	d5e5                	beqz	a1,bde0 <__unorddf2+0x20>
    bdfa:	8082                	ret

0000bdfc <__fixdfsi>:
    bdfc:	0145d793          	srli	a5,a1,0x14
    be00:	001006b7          	lui	a3,0x100
    be04:	fff68713          	addi	a4,a3,-1 # fffff <_data_lma+0xf3d4b>
    be08:	7ff7f793          	andi	a5,a5,2047
    be0c:	3fe00613          	li	a2,1022
    be10:	8f6d                	and	a4,a4,a1
    be12:	81fd                	srli	a1,a1,0x1f
    be14:	00f65c63          	bge	a2,a5,be2c <__fixdfsi+0x30>
    be18:	41d00613          	li	a2,1053
    be1c:	00f65a63          	bge	a2,a5,be30 <__fixdfsi+0x34>
    be20:	80000537          	lui	a0,0x80000
    be24:	fff54513          	not	a0,a0
    be28:	952e                	add	a0,a0,a1
    be2a:	8082                	ret
    be2c:	4501                	li	a0,0
    be2e:	8082                	ret
    be30:	43300613          	li	a2,1075
    be34:	8e1d                	sub	a2,a2,a5
    be36:	487d                	li	a6,31
    be38:	8f55                	or	a4,a4,a3
    be3a:	00c85d63          	bge	a6,a2,be54 <__fixdfsi+0x58>
    be3e:	41300693          	li	a3,1043
    be42:	40f687b3          	sub	a5,a3,a5
    be46:	00f757b3          	srl	a5,a4,a5
    be4a:	40f00533          	neg	a0,a5
    be4e:	f1e5                	bnez	a1,be2e <__fixdfsi+0x32>
    be50:	853e                	mv	a0,a5
    be52:	8082                	ret
    be54:	bed78793          	addi	a5,a5,-1043 # ffbed <_data_lma+0xf3939>
    be58:	00f717b3          	sll	a5,a4,a5
    be5c:	00c55533          	srl	a0,a0,a2
    be60:	8fc9                	or	a5,a5,a0
    be62:	b7e5                	j	be4a <__fixdfsi+0x4e>

0000be64 <__floatsidf>:
    be64:	1141                	addi	sp,sp,-16
    be66:	c606                	sw	ra,12(sp)
    be68:	c422                	sw	s0,8(sp)
    be6a:	c226                	sw	s1,4(sp)
    be6c:	cd05                	beqz	a0,bea4 <__floatsidf+0x40>
    be6e:	41f55793          	srai	a5,a0,0x1f
    be72:	00a7c4b3          	xor	s1,a5,a0
    be76:	8c9d                	sub	s1,s1,a5
    be78:	842a                	mv	s0,a0
    be7a:	8526                	mv	a0,s1
    be7c:	28a1                	jal	bed4 <__clzsi2>
    be7e:	41e00693          	li	a3,1054
    be82:	8e89                	sub	a3,a3,a0
    be84:	47a9                	li	a5,10
    be86:	807d                	srli	s0,s0,0x1f
    be88:	7ff6f693          	andi	a3,a3,2047
    be8c:	02a7cd63          	blt	a5,a0,bec6 <__floatsidf+0x62>
    be90:	472d                	li	a4,11
    be92:	8f09                	sub	a4,a4,a0
    be94:	00e4d7b3          	srl	a5,s1,a4
    be98:	0555                	addi	a0,a0,21
    be9a:	07b2                	slli	a5,a5,0xc
    be9c:	00a494b3          	sll	s1,s1,a0
    bea0:	83b1                	srli	a5,a5,0xc
    bea2:	a029                	j	beac <__floatsidf+0x48>
    bea4:	4401                	li	s0,0
    bea6:	4681                	li	a3,0
    bea8:	4781                	li	a5,0
    beaa:	4481                	li	s1,0
    beac:	07b2                	slli	a5,a5,0xc
    beae:	06d2                	slli	a3,a3,0x14
    beb0:	83b1                	srli	a5,a5,0xc
    beb2:	047e                	slli	s0,s0,0x1f
    beb4:	8fd5                	or	a5,a5,a3
    beb6:	8fc1                	or	a5,a5,s0
    beb8:	40b2                	lw	ra,12(sp)
    beba:	4422                	lw	s0,8(sp)
    bebc:	8526                	mv	a0,s1
    bebe:	85be                	mv	a1,a5
    bec0:	4492                	lw	s1,4(sp)
    bec2:	0141                	addi	sp,sp,16
    bec4:	8082                	ret
    bec6:	1555                	addi	a0,a0,-11
    bec8:	00a497b3          	sll	a5,s1,a0
    becc:	07b2                	slli	a5,a5,0xc
    bece:	83b1                	srli	a5,a5,0xc
    bed0:	4481                	li	s1,0
    bed2:	bfe9                	j	beac <__floatsidf+0x48>

0000bed4 <__clzsi2>:
    bed4:	67c1                	lui	a5,0x10
    bed6:	02f57e63          	bgeu	a0,a5,bf12 <__clzsi2+0x3e>
    beda:	0ff00793          	li	a5,255
    bede:	02000713          	li	a4,32
    bee2:	00a7ec63          	bltu	a5,a0,befa <__clzsi2+0x26>
    bee6:	00000797          	auipc	a5,0x0
    beea:	29278793          	addi	a5,a5,658 # c178 <__clz_tab>
    beee:	97aa                	add	a5,a5,a0
    bef0:	0007c503          	lbu	a0,0(a5)
    bef4:	40a70533          	sub	a0,a4,a0
    bef8:	8082                	ret
    befa:	8121                	srli	a0,a0,0x8
    befc:	00000797          	auipc	a5,0x0
    bf00:	27c78793          	addi	a5,a5,636 # c178 <__clz_tab>
    bf04:	97aa                	add	a5,a5,a0
    bf06:	0007c503          	lbu	a0,0(a5)
    bf0a:	4761                	li	a4,24
    bf0c:	40a70533          	sub	a0,a4,a0
    bf10:	8082                	ret
    bf12:	010007b7          	lui	a5,0x1000
    bf16:	00f56e63          	bltu	a0,a5,bf32 <__clzsi2+0x5e>
    bf1a:	8161                	srli	a0,a0,0x18
    bf1c:	00000797          	auipc	a5,0x0
    bf20:	25c78793          	addi	a5,a5,604 # c178 <__clz_tab>
    bf24:	97aa                	add	a5,a5,a0
    bf26:	0007c503          	lbu	a0,0(a5)
    bf2a:	4721                	li	a4,8
    bf2c:	40a70533          	sub	a0,a4,a0
    bf30:	8082                	ret
    bf32:	8141                	srli	a0,a0,0x10
    bf34:	00000797          	auipc	a5,0x0
    bf38:	24478793          	addi	a5,a5,580 # c178 <__clz_tab>
    bf3c:	97aa                	add	a5,a5,a0
    bf3e:	0007c503          	lbu	a0,0(a5)
    bf42:	4741                	li	a4,16
    bf44:	40a70533          	sub	a0,a4,a0
    bf48:	8082                	ret

0000bf4a <strlen>:
    bf4a:	00357793          	andi	a5,a0,3
    bf4e:	872a                	mv	a4,a0
    bf50:	e3a1                	bnez	a5,bf90 <strlen+0x46>
    bf52:	7f7f86b7          	lui	a3,0x7f7f8
    bf56:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <_eusrstack+0x5f7f3f7f>
    bf5a:	55fd                	li	a1,-1
    bf5c:	0711                	addi	a4,a4,4
    bf5e:	ffc72603          	lw	a2,-4(a4)
    bf62:	00d677b3          	and	a5,a2,a3
    bf66:	97b6                	add	a5,a5,a3
    bf68:	8fd1                	or	a5,a5,a2
    bf6a:	8fd5                	or	a5,a5,a3
    bf6c:	feb788e3          	beq	a5,a1,bf5c <strlen+0x12>
    bf70:	ffc74683          	lbu	a3,-4(a4)
    bf74:	40a707b3          	sub	a5,a4,a0
    bf78:	ffd74603          	lbu	a2,-3(a4)
    bf7c:	ffe74503          	lbu	a0,-2(a4)
    bf80:	c68d                	beqz	a3,bfaa <strlen+0x60>
    bf82:	c20d                	beqz	a2,bfa4 <strlen+0x5a>
    bf84:	00a03533          	snez	a0,a0
    bf88:	953e                	add	a0,a0,a5
    bf8a:	1579                	addi	a0,a0,-2
    bf8c:	8082                	ret
    bf8e:	d2f1                	beqz	a3,bf52 <strlen+0x8>
    bf90:	00074783          	lbu	a5,0(a4)
    bf94:	0705                	addi	a4,a4,1
    bf96:	00377693          	andi	a3,a4,3
    bf9a:	fbf5                	bnez	a5,bf8e <strlen+0x44>
    bf9c:	8f09                	sub	a4,a4,a0
    bf9e:	fff70513          	addi	a0,a4,-1
    bfa2:	8082                	ret
    bfa4:	ffd78513          	addi	a0,a5,-3
    bfa8:	8082                	ret
    bfaa:	ffc78513          	addi	a0,a5,-4
    bfae:	8082                	ret
    bfb0:	614e                	flw	ft2,208(sp)
    bfb2:	004e                	c.slli	zero,0x13
    bfb4:	4e49                	li	t3,18
    bfb6:	0046                	c.slli	zero,0x11
    bfb8:	0000564f          	fnmadd.s	fa2,ft0,ft0,ft0,unknown
    bfbc:	0000                	unimp
    bfbe:	0000                	unimp
    bfc0:	957c                	0x957c
    bfc2:	0000                	unimp
    bfc4:	962c                	0x962c
    bfc6:	0000                	unimp
    bfc8:	962c                	0x962c
    bfca:	0000                	unimp
    bfcc:	962c                	0x962c
    bfce:	0000                	unimp
    bfd0:	962c                	0x962c
    bfd2:	0000                	unimp
    bfd4:	962c                	0x962c
    bfd6:	0000                	unimp
    bfd8:	962c                	0x962c
    bfda:	0000                	unimp
    bfdc:	962c                	0x962c
    bfde:	0000                	unimp
    bfe0:	962c                	0x962c
    bfe2:	0000                	unimp
    bfe4:	962c                	0x962c
    bfe6:	0000                	unimp
    bfe8:	962c                	0x962c
    bfea:	0000                	unimp
    bfec:	962c                	0x962c
    bfee:	0000                	unimp
    bff0:	962c                	0x962c
    bff2:	0000                	unimp
    bff4:	962c                	0x962c
    bff6:	0000                	unimp
    bff8:	962c                	0x962c
    bffa:	0000                	unimp
    bffc:	962c                	0x962c
    bffe:	0000                	unimp
    c000:	962c                	0x962c
    c002:	0000                	unimp
    c004:	962c                	0x962c
    c006:	0000                	unimp
    c008:	962c                	0x962c
    c00a:	0000                	unimp
    c00c:	948e                	add	s1,s1,gp
    c00e:	0000                	unimp
    c010:	962c                	0x962c
    c012:	0000                	unimp
    c014:	962c                	0x962c
    c016:	0000                	unimp
    c018:	962c                	0x962c
    c01a:	0000                	unimp
    c01c:	962c                	0x962c
    c01e:	0000                	unimp
    c020:	962c                	0x962c
    c022:	0000                	unimp
    c024:	962c                	0x962c
    c026:	0000                	unimp
    c028:	962c                	0x962c
    c02a:	0000                	unimp
    c02c:	962c                	0x962c
    c02e:	0000                	unimp
    c030:	962c                	0x962c
    c032:	0000                	unimp
    c034:	9476                	add	s0,s0,t4
    c036:	0000                	unimp
    c038:	9496                	add	s1,s1,t0
    c03a:	0000                	unimp
    c03c:	9486                	add	s1,s1,ra
    c03e:	0000                	unimp
    c040:	957c                	0x957c
    c042:	0000                	unimp
    c044:	957c                	0x957c
    c046:	0000                	unimp
    c048:	962c                	0x962c
    c04a:	0000                	unimp
    c04c:	962c                	0x962c
    c04e:	0000                	unimp
    c050:	962c                	0x962c
    c052:	0000                	unimp
    c054:	962c                	0x962c
    c056:	0000                	unimp
    c058:	962c                	0x962c
    c05a:	0000                	unimp
    c05c:	962c                	0x962c
    c05e:	0000                	unimp
    c060:	962c                	0x962c
    c062:	0000                	unimp
    c064:	962c                	0x962c
    c066:	0000                	unimp
    c068:	947e                	add	s0,s0,t6
    c06a:	0000                	unimp
    c06c:	962c                	0x962c
    c06e:	0000                	unimp
    c070:	962c                	0x962c
    c072:	0000                	unimp
    c074:	962c                	0x962c
    c076:	0000                	unimp
    c078:	94b2                	add	s1,s1,a2
    c07a:	0000                	unimp
    c07c:	962c                	0x962c
    c07e:	0000                	unimp
    c080:	9486                	add	s1,s1,ra
    c082:	0000                	unimp
    c084:	962c                	0x962c
    c086:	0000                	unimp
    c088:	962c                	0x962c
    c08a:	0000                	unimp
    c08c:	948e                	add	s1,s1,gp
    c08e:	0000                	unimp
    c090:	0000                	unimp
    c092:	0000                	unimp
    c094:	6a00                	flw	fs0,16(a2)
    c096:	40f8                	lw	a4,68(s1)
    c098:	0000                	unimp
    c09a:	0000                	unimp
    c09c:	0000                	unimp
    c09e:	4024                	lw	s1,64(s0)
    c0a0:	68f1                	lui	a7,0x1c
    c0a2:	f8b588e3          	beq	a1,a1,c032 <strlen+0xe8>
    c0a6:	3ee4                	fld	fs1,248(a3)
    c0a8:	0000                	unimp
    c0aa:	0000                	unimp
    c0ac:	0000                	unimp
    c0ae:	3ff0                	fld	fa2,248(a5)
    c0b0:	ffff                	0xffff
    c0b2:	ffff                	0xffff
    c0b4:	ffff                	0xffff
    c0b6:	00007fef          	jal	t6,130b6 <_data_lma+0x6e02>
    c0ba:	0000                	unimp
    c0bc:	0000                	unimp
    c0be:	4000                	lw	s0,0(s0)
    c0c0:	32334843          	fmadd.d	fa6,ft6,ft3,ft6,rmm
    c0c4:	3078                	fld	fa4,224(s0)
    c0c6:	62203533          	0x62203533
    c0ca:	7261                	lui	tp,0xffff8
    c0cc:	2d65                	jal	c784 <_data_lma+0x4d0>
    c0ce:	656d                	lui	a0,0x1b
    c0d0:	6174                	flw	fa3,68(a0)
    c0d2:	206c                	fld	fa1,192(s0)
    c0d4:	6966                	flw	fs2,88(sp)
    c0d6:	6d72                	flw	fs10,28(sp)
    c0d8:	65726177          	0x65726177
    c0dc:	7220                	flw	fs0,96(a2)
    c0de:	6165                	addi	sp,sp,112
    c0e0:	7964                	flw	fs1,116(a0)
    c0e2:	0a0d                	addi	s4,s4,3
    c0e4:	0000                	unimp
    c0e6:	0000                	unimp
    c0e8:	454c                	lw	a1,12(a0)
    c0ea:	2044                	fld	fs1,128(s0)
    c0ec:	6f74                	flw	fa3,92(a4)
    c0ee:	656c6767          	0x656c6767
    c0f2:	0a0d                	addi	s4,s4,3
    c0f4:	0000                	unimp
    c0f6:	0000                	unimp
    c0f8:	eb96                	fsw	ft5,212(sp)
    c0fa:	ffff                	0xffff
    c0fc:	ea1a                	fsw	ft6,20(sp)
    c0fe:	ffff                	0xffff
    c100:	eb2a                	fsw	fa0,148(sp)
    c102:	ffff                	0xffff
    c104:	eb32                	fsw	fa2,148(sp)
    c106:	ffff                	0xffff
    c108:	eb2a                	fsw	fa0,148(sp)
    c10a:	ffff                	0xffff
    c10c:	ea4a                	fsw	fs2,20(sp)
    c10e:	ffff                	0xffff
    c110:	eb2a                	fsw	fa0,148(sp)
    c112:	ffff                	0xffff
    c114:	eb32                	fsw	fa2,148(sp)
    c116:	ffff                	0xffff
    c118:	ea1a                	fsw	ft6,20(sp)
    c11a:	ffff                	0xffff
    c11c:	ea1a                	fsw	ft6,20(sp)
    c11e:	ffff                	0xffff
    c120:	ea4a                	fsw	fs2,20(sp)
    c122:	ffff                	0xffff
    c124:	eb32                	fsw	fa2,148(sp)
    c126:	ffff                	0xffff
    c128:	eb8c                	fsw	fa1,16(a5)
    c12a:	ffff                	0xffff
    c12c:	eb8c                	fsw	fa1,16(a5)
    c12e:	ffff                	0xffff
    c130:	eb8c                	fsw	fa1,16(a5)
    c132:	ffff                	0xffff
    c134:	ea4a                	fsw	fs2,20(sp)
    c136:	ffff                	0xffff
    c138:	f2a6                	fsw	fs1,100(sp)
    c13a:	ffff                	0xffff
    c13c:	f198                	fsw	fa4,32(a1)
    c13e:	ffff                	0xffff
    c140:	f198                	fsw	fa4,32(a1)
    c142:	ffff                	0xffff
    c144:	f196                	fsw	ft5,224(sp)
    c146:	ffff                	0xffff
    c148:	f19e                	fsw	ft7,224(sp)
    c14a:	ffff                	0xffff
    c14c:	f19e                	fsw	ft7,224(sp)
    c14e:	ffff                	0xffff
    c150:	f164                	fsw	fs1,100(a0)
    c152:	ffff                	0xffff
    c154:	f196                	fsw	ft5,224(sp)
    c156:	ffff                	0xffff
    c158:	f19e                	fsw	ft7,224(sp)
    c15a:	ffff                	0xffff
    c15c:	f164                	fsw	fs1,100(a0)
    c15e:	ffff                	0xffff
    c160:	f19e                	fsw	ft7,224(sp)
    c162:	ffff                	0xffff
    c164:	f196                	fsw	ft5,224(sp)
    c166:	ffff                	0xffff
    c168:	f292                	fsw	ft4,100(sp)
    c16a:	ffff                	0xffff
    c16c:	f292                	fsw	ft4,100(sp)
    c16e:	ffff                	0xffff
    c170:	f292                	fsw	ft4,100(sp)
    c172:	ffff                	0xffff
    c174:	f164                	fsw	fs1,100(a0)
    c176:	ffff                	0xffff

0000c178 <__clz_tab>:
    c178:	0100 0202 0303 0303 0404 0404 0404 0404     ................
    c188:	0505 0505 0505 0505 0505 0505 0505 0505     ................
    c198:	0606 0606 0606 0606 0606 0606 0606 0606     ................
    c1a8:	0606 0606 0606 0606 0606 0606 0606 0606     ................
    c1b8:	0707 0707 0707 0707 0707 0707 0707 0707     ................
    c1c8:	0707 0707 0707 0707 0707 0707 0707 0707     ................
    c1d8:	0707 0707 0707 0707 0707 0707 0707 0707     ................
    c1e8:	0707 0707 0707 0707 0707 0707 0707 0707     ................
    c1f8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    c208:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    c218:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    c228:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    c238:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    c248:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    c258:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    c268:	0808 0808 0808 0808 0808 0808 0808 0808     ................
