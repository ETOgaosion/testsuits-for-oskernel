
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/munmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	1140006f          	j	1116 <__start_main>

0000000000001006 <test_munmap>:
 * "  Hello, mmap success"
 * 测试失败时输出：
 * "mmap error."
 */
static struct kstat kst;
void test_munmap(void){
    1006:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	04850513          	addi	a0,a0,72 # 2050 <__clone+0x2a>
void test_munmap(void){
    1010:	ec06                	sd	ra,24(sp)
    1012:	e822                	sd	s0,16(sp)
    1014:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1016:	300000ef          	jal	ra,1316 <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	1ae50513          	addi	a0,a0,430 # 21c8 <__func__.1213>
    1022:	2f4000ef          	jal	ra,1316 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	04250513          	addi	a0,a0,66 # 2068 <__clone+0x42>
    102e:	2e8000ef          	jal	ra,1316 <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1032:	04200593          	li	a1,66
    1036:	00001517          	auipc	a0,0x1
    103a:	04250513          	addi	a0,a0,66 # 2078 <__clone+0x52>
    103e:	571000ef          	jal	ra,1dae <open>
    1042:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1044:	00001517          	auipc	a0,0x1
    1048:	04450513          	addi	a0,a0,68 # 2088 <__clone+0x62>
    104c:	085000ef          	jal	ra,18d0 <strlen>
    1050:	862a                	mv	a2,a0
    1052:	00001597          	auipc	a1,0x1
    1056:	03658593          	addi	a1,a1,54 # 2088 <__clone+0x62>
    105a:	8522                	mv	a0,s0
    105c:	591000ef          	jal	ra,1dec <write>
    fstat(fd, &kst);
    1060:	00001497          	auipc	s1,0x1
    1064:	0e848493          	addi	s1,s1,232 # 2148 <kst>
    1068:	85a6                	mv	a1,s1
    106a:	8522                	mv	a0,s0
    106c:	6cf000ef          	jal	ra,1f3a <fstat>
    printf("file len: %d\n", kst.st_size);
    1070:	788c                	ld	a1,48(s1)
    1072:	00001517          	auipc	a0,0x1
    1076:	03650513          	addi	a0,a0,54 # 20a8 <__clone+0x82>
    107a:	2be000ef          	jal	ra,1338 <printf>
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    107e:	788c                	ld	a1,48(s1)
    1080:	4781                	li	a5,0
    1082:	8722                	mv	a4,s0
    1084:	4685                	li	a3,1
    1086:	460d                	li	a2,3
    1088:	4501                	li	a0,0
    108a:	663000ef          	jal	ra,1eec <mmap>
    //printf("return array: %x\n", array);

    if (array == MAP_FAILED) {
    108e:	57fd                	li	a5,-1
    1090:	06f50463          	beq	a0,a5,10f8 <test_munmap+0xf2>
	printf("mmap error.\n");
    }else{
	//printf("mmap content: %s\n", array);

    	int ret = munmap(array, kst.st_size);
    1094:	788c                	ld	a1,48(s1)
    1096:	661000ef          	jal	ra,1ef6 <munmap>
    109a:	84aa                	mv	s1,a0
	printf("munmap return: %d\n",ret);
    109c:	85aa                	mv	a1,a0
    109e:	00001517          	auipc	a0,0x1
    10a2:	02a50513          	addi	a0,a0,42 # 20c8 <__clone+0xa2>
    10a6:	292000ef          	jal	ra,1338 <printf>
	assert(ret == 0);
    10aa:	e0a1                	bnez	s1,10ea <test_munmap+0xe4>

	if (ret == 0)
		printf("munmap successfully!\n");
    10ac:	00001517          	auipc	a0,0x1
    10b0:	06450513          	addi	a0,a0,100 # 2110 <__clone+0xea>
    10b4:	284000ef          	jal	ra,1338 <printf>
    }
    close(fd);
    10b8:	8522                	mv	a0,s0
    10ba:	51d000ef          	jal	ra,1dd6 <close>

    TEST_END(__func__);
    10be:	00001517          	auipc	a0,0x1
    10c2:	04250513          	addi	a0,a0,66 # 2100 <__clone+0xda>
    10c6:	250000ef          	jal	ra,1316 <puts>
    10ca:	00001517          	auipc	a0,0x1
    10ce:	0fe50513          	addi	a0,a0,254 # 21c8 <__func__.1213>
    10d2:	244000ef          	jal	ra,1316 <puts>
}
    10d6:	6442                	ld	s0,16(sp)
    10d8:	60e2                	ld	ra,24(sp)
    10da:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    10dc:	00001517          	auipc	a0,0x1
    10e0:	f8c50513          	addi	a0,a0,-116 # 2068 <__clone+0x42>
}
    10e4:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    10e6:	2300006f          	j	1316 <puts>
	assert(ret == 0);
    10ea:	00001517          	auipc	a0,0x1
    10ee:	ff650513          	addi	a0,a0,-10 # 20e0 <__clone+0xba>
    10f2:	4ea000ef          	jal	ra,15dc <panic>
	if (ret == 0)
    10f6:	b7c9                	j	10b8 <test_munmap+0xb2>
	printf("mmap error.\n");
    10f8:	00001517          	auipc	a0,0x1
    10fc:	fc050513          	addi	a0,a0,-64 # 20b8 <__clone+0x92>
    1100:	238000ef          	jal	ra,1338 <printf>
    1104:	bf55                	j	10b8 <test_munmap+0xb2>

0000000000001106 <main>:

int main(void){
    1106:	1141                	addi	sp,sp,-16
    1108:	e406                	sd	ra,8(sp)
    test_munmap();
    110a:	efdff0ef          	jal	ra,1006 <test_munmap>
    return 0;
}
    110e:	60a2                	ld	ra,8(sp)
    1110:	4501                	li	a0,0
    1112:	0141                	addi	sp,sp,16
    1114:	8082                	ret

0000000000001116 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1116:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1118:	4108                	lw	a0,0(a0)
{
    111a:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    111c:	05a1                	addi	a1,a1,8
{
    111e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1120:	fe7ff0ef          	jal	ra,1106 <main>
    1124:	51b000ef          	jal	ra,1e3e <exit>
	return 0;
}
    1128:	60a2                	ld	ra,8(sp)
    112a:	4501                	li	a0,0
    112c:	0141                	addi	sp,sp,16
    112e:	8082                	ret

0000000000001130 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1130:	7179                	addi	sp,sp,-48
    1132:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1134:	12054e63          	bltz	a0,1270 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1138:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    113c:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    113e:	02b7f6bb          	remuw	a3,a5,a1
    1142:	00001717          	auipc	a4,0x1
    1146:	09670713          	addi	a4,a4,150 # 21d8 <digits>
    buf[16] = 0;
    114a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    114e:	1682                	slli	a3,a3,0x20
    1150:	9281                	srli	a3,a3,0x20
    1152:	96ba                	add	a3,a3,a4
    1154:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1158:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    115c:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1160:	16b7e363          	bltu	a5,a1,12c6 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1164:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1168:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    116c:	1602                	slli	a2,a2,0x20
    116e:	9201                	srli	a2,a2,0x20
    1170:	963a                	add	a2,a2,a4
    1172:	00064603          	lbu	a2,0(a2)
    1176:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    117a:	0007861b          	sext.w	a2,a5
    117e:	12b6e863          	bltu	a3,a1,12ae <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1182:	02b7f6bb          	remuw	a3,a5,a1
    1186:	1682                	slli	a3,a3,0x20
    1188:	9281                	srli	a3,a3,0x20
    118a:	96ba                	add	a3,a3,a4
    118c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1190:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1194:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1198:	10b66e63          	bltu	a2,a1,12b4 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    119c:	02b876bb          	remuw	a3,a6,a1
    11a0:	1682                	slli	a3,a3,0x20
    11a2:	9281                	srli	a3,a3,0x20
    11a4:	96ba                	add	a3,a3,a4
    11a6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11aa:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11ae:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    11b2:	10b86463          	bltu	a6,a1,12ba <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    11b6:	02b676bb          	remuw	a3,a2,a1
    11ba:	1682                	slli	a3,a3,0x20
    11bc:	9281                	srli	a3,a3,0x20
    11be:	96ba                	add	a3,a3,a4
    11c0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c4:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11c8:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11cc:	0eb66a63          	bltu	a2,a1,12c0 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    11d0:	02b876bb          	remuw	a3,a6,a1
    11d4:	1682                	slli	a3,a3,0x20
    11d6:	9281                	srli	a3,a3,0x20
    11d8:	96ba                	add	a3,a3,a4
    11da:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11de:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11e2:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11e6:	0cb86163          	bltu	a6,a1,12a8 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11ea:	02b676bb          	remuw	a3,a2,a1
    11ee:	1682                	slli	a3,a3,0x20
    11f0:	9281                	srli	a3,a3,0x20
    11f2:	96ba                	add	a3,a3,a4
    11f4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11f8:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11fc:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1200:	0cb66563          	bltu	a2,a1,12ca <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1204:	02b876bb          	remuw	a3,a6,a1
    1208:	1682                	slli	a3,a3,0x20
    120a:	9281                	srli	a3,a3,0x20
    120c:	96ba                	add	a3,a3,a4
    120e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1212:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1216:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    121a:	0ab86b63          	bltu	a6,a1,12d0 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    121e:	02b676bb          	remuw	a3,a2,a1
    1222:	1682                	slli	a3,a3,0x20
    1224:	9281                	srli	a3,a3,0x20
    1226:	96ba                	add	a3,a3,a4
    1228:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    122c:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    1230:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1234:	0ab66163          	bltu	a2,a1,12d6 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1238:	1782                	slli	a5,a5,0x20
    123a:	9381                	srli	a5,a5,0x20
    123c:	97ba                	add	a5,a5,a4
    123e:	0007c703          	lbu	a4,0(a5)
    1242:	4599                	li	a1,6
    1244:	4795                	li	a5,5
    1246:	00e10723          	sb	a4,14(sp)

    if (sign)
    124a:	00055963          	bgez	a0,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    124e:	1018                	addi	a4,sp,32
    1250:	973e                	add	a4,a4,a5
    1252:	02d00693          	li	a3,45
    1256:	fed70423          	sb	a3,-24(a4)
    125a:	85be                	mv	a1,a5
    write(f, s, l);
    125c:	003c                	addi	a5,sp,8
    125e:	4641                	li	a2,16
    1260:	9e0d                	subw	a2,a2,a1
    1262:	4505                	li	a0,1
    1264:	95be                	add	a1,a1,a5
    1266:	387000ef          	jal	ra,1dec <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    126a:	70a2                	ld	ra,40(sp)
    126c:	6145                	addi	sp,sp,48
    126e:	8082                	ret
        x = -xx;
    1270:	40a0063b          	negw	a2,a0
    1274:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1276:	02b677bb          	remuw	a5,a2,a1
    127a:	00001717          	auipc	a4,0x1
    127e:	f5e70713          	addi	a4,a4,-162 # 21d8 <digits>
    buf[16] = 0;
    1282:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1286:	1782                	slli	a5,a5,0x20
    1288:	9381                	srli	a5,a5,0x20
    128a:	97ba                	add	a5,a5,a4
    128c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1290:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1294:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1298:	ecb676e3          	bleu	a1,a2,1164 <printint.constprop.0+0x34>
        buf[i--] = '-';
    129c:	02d00793          	li	a5,45
    12a0:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12a4:	45b9                	li	a1,14
    12a6:	bf5d                	j	125c <printint.constprop.0+0x12c>
    12a8:	47a5                	li	a5,9
    12aa:	45a9                	li	a1,10
    12ac:	bf79                	j	124a <printint.constprop.0+0x11a>
    12ae:	47b5                	li	a5,13
    12b0:	45b9                	li	a1,14
    12b2:	bf61                	j	124a <printint.constprop.0+0x11a>
    12b4:	47b1                	li	a5,12
    12b6:	45b5                	li	a1,13
    12b8:	bf49                	j	124a <printint.constprop.0+0x11a>
    12ba:	47ad                	li	a5,11
    12bc:	45b1                	li	a1,12
    12be:	b771                	j	124a <printint.constprop.0+0x11a>
    12c0:	47a9                	li	a5,10
    12c2:	45ad                	li	a1,11
    12c4:	b759                	j	124a <printint.constprop.0+0x11a>
    i = 15;
    12c6:	45bd                	li	a1,15
    12c8:	bf51                	j	125c <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    12ca:	47a1                	li	a5,8
    12cc:	45a5                	li	a1,9
    12ce:	bfb5                	j	124a <printint.constprop.0+0x11a>
    12d0:	479d                	li	a5,7
    12d2:	45a1                	li	a1,8
    12d4:	bf9d                	j	124a <printint.constprop.0+0x11a>
    12d6:	4799                	li	a5,6
    12d8:	459d                	li	a1,7
    12da:	bf85                	j	124a <printint.constprop.0+0x11a>

00000000000012dc <getchar>:
{
    12dc:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12de:	00f10593          	addi	a1,sp,15
    12e2:	4605                	li	a2,1
    12e4:	4501                	li	a0,0
{
    12e6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12e8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12ec:	2f7000ef          	jal	ra,1de2 <read>
}
    12f0:	60e2                	ld	ra,24(sp)
    12f2:	00f14503          	lbu	a0,15(sp)
    12f6:	6105                	addi	sp,sp,32
    12f8:	8082                	ret

00000000000012fa <putchar>:
{
    12fa:	1101                	addi	sp,sp,-32
    char byte = c;
    12fc:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    1300:	00f10593          	addi	a1,sp,15
    1304:	4605                	li	a2,1
    1306:	4505                	li	a0,1
{
    1308:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    130a:	2e3000ef          	jal	ra,1dec <write>
}
    130e:	60e2                	ld	ra,24(sp)
    1310:	2501                	sext.w	a0,a0
    1312:	6105                	addi	sp,sp,32
    1314:	8082                	ret

0000000000001316 <puts>:
{
    1316:	1141                	addi	sp,sp,-16
    1318:	e406                	sd	ra,8(sp)
    131a:	e022                	sd	s0,0(sp)
    131c:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    131e:	5b2000ef          	jal	ra,18d0 <strlen>
    1322:	862a                	mv	a2,a0
    1324:	85a2                	mv	a1,s0
    1326:	4505                	li	a0,1
    1328:	2c5000ef          	jal	ra,1dec <write>
}
    132c:	60a2                	ld	ra,8(sp)
    132e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1330:	957d                	srai	a0,a0,0x3f
    return r;
    1332:	2501                	sext.w	a0,a0
}
    1334:	0141                	addi	sp,sp,16
    1336:	8082                	ret

0000000000001338 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1338:	7131                	addi	sp,sp,-192
    133a:	e0da                	sd	s6,64(sp)
    133c:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    133e:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1340:	013c                	addi	a5,sp,136
{
    1342:	f0ca                	sd	s2,96(sp)
    1344:	ecce                	sd	s3,88(sp)
    1346:	e8d2                	sd	s4,80(sp)
    1348:	e4d6                	sd	s5,72(sp)
    134a:	fc5e                	sd	s7,56(sp)
    134c:	fc86                	sd	ra,120(sp)
    134e:	f8a2                	sd	s0,112(sp)
    1350:	f4a6                	sd	s1,104(sp)
    1352:	89aa                	mv	s3,a0
    1354:	e52e                	sd	a1,136(sp)
    1356:	e932                	sd	a2,144(sp)
    1358:	ed36                	sd	a3,152(sp)
    135a:	f13a                	sd	a4,160(sp)
    135c:	f942                	sd	a6,176(sp)
    135e:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1360:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1362:	02500913          	li	s2,37
    1366:	07000a93          	li	s5,112
    buf[i++] = '0';
    136a:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    136e:	00001a17          	auipc	s4,0x1
    1372:	e6aa0a13          	addi	s4,s4,-406 # 21d8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1376:	00001b97          	auipc	s7,0x1
    137a:	db2b8b93          	addi	s7,s7,-590 # 2128 <__clone+0x102>
        if (!*s)
    137e:	0009c783          	lbu	a5,0(s3)
    1382:	cfb9                	beqz	a5,13e0 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1384:	23278d63          	beq	a5,s2,15be <printf+0x286>
    1388:	864e                	mv	a2,s3
    138a:	a019                	j	1390 <printf+0x58>
    138c:	07278563          	beq	a5,s2,13f6 <printf+0xbe>
    1390:	0605                	addi	a2,a2,1
    1392:	00064783          	lbu	a5,0(a2)
    1396:	fbfd                	bnez	a5,138c <printf+0x54>
    1398:	84b2                	mv	s1,a2
        l = z - a;
    139a:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    139e:	8622                	mv	a2,s0
    13a0:	85ce                	mv	a1,s3
    13a2:	4505                	li	a0,1
    13a4:	249000ef          	jal	ra,1dec <write>
        if (l)
    13a8:	ec3d                	bnez	s0,1426 <printf+0xee>
        if (s[1] == 0)
    13aa:	0014c783          	lbu	a5,1(s1)
    13ae:	cb8d                	beqz	a5,13e0 <printf+0xa8>
        switch (s[1])
    13b0:	09578b63          	beq	a5,s5,1446 <printf+0x10e>
    13b4:	06fafb63          	bleu	a5,s5,142a <printf+0xf2>
    13b8:	07300713          	li	a4,115
    13bc:	1ce78e63          	beq	a5,a4,1598 <printf+0x260>
    13c0:	07800713          	li	a4,120
    13c4:	1ae79563          	bne	a5,a4,156e <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    13c8:	6782                	ld	a5,0(sp)
    13ca:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    13cc:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    13d0:	4388                	lw	a0,0(a5)
    13d2:	07a1                	addi	a5,a5,8
    13d4:	e03e                	sd	a5,0(sp)
    13d6:	d5bff0ef          	jal	ra,1130 <printint.constprop.0>
        if (!*s)
    13da:	0009c783          	lbu	a5,0(s3)
    13de:	f3dd                	bnez	a5,1384 <printf+0x4c>
    }
    va_end(ap);
}
    13e0:	70e6                	ld	ra,120(sp)
    13e2:	7446                	ld	s0,112(sp)
    13e4:	74a6                	ld	s1,104(sp)
    13e6:	7906                	ld	s2,96(sp)
    13e8:	69e6                	ld	s3,88(sp)
    13ea:	6a46                	ld	s4,80(sp)
    13ec:	6aa6                	ld	s5,72(sp)
    13ee:	6b06                	ld	s6,64(sp)
    13f0:	7be2                	ld	s7,56(sp)
    13f2:	6129                	addi	sp,sp,192
    13f4:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13f6:	00164783          	lbu	a5,1(a2)
    13fa:	84b2                	mv	s1,a2
    13fc:	01278763          	beq	a5,s2,140a <printf+0xd2>
    1400:	bf69                	j	139a <printf+0x62>
    1402:	0014c783          	lbu	a5,1(s1)
    1406:	f9279ae3          	bne	a5,s2,139a <printf+0x62>
    140a:	0489                	addi	s1,s1,2
    140c:	0004c783          	lbu	a5,0(s1)
    1410:	0605                	addi	a2,a2,1
    1412:	ff2788e3          	beq	a5,s2,1402 <printf+0xca>
        l = z - a;
    1416:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    141a:	8622                	mv	a2,s0
    141c:	85ce                	mv	a1,s3
    141e:	4505                	li	a0,1
    1420:	1cd000ef          	jal	ra,1dec <write>
        if (l)
    1424:	d059                	beqz	s0,13aa <printf+0x72>
    1426:	89a6                	mv	s3,s1
    1428:	bf99                	j	137e <printf+0x46>
    142a:	06400713          	li	a4,100
    142e:	14e79063          	bne	a5,a4,156e <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    1432:	6782                	ld	a5,0(sp)
    1434:	45a9                	li	a1,10
        s += 2;
    1436:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    143a:	4388                	lw	a0,0(a5)
    143c:	07a1                	addi	a5,a5,8
    143e:	e03e                	sd	a5,0(sp)
    1440:	cf1ff0ef          	jal	ra,1130 <printint.constprop.0>
        s += 2;
    1444:	bf59                	j	13da <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1446:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1448:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    144c:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    144e:	631c                	ld	a5,0(a4)
    1450:	0721                	addi	a4,a4,8
    1452:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1454:	00479293          	slli	t0,a5,0x4
    1458:	00879f93          	slli	t6,a5,0x8
    145c:	00c79f13          	slli	t5,a5,0xc
    1460:	01079e93          	slli	t4,a5,0x10
    1464:	01479e13          	slli	t3,a5,0x14
    1468:	01879313          	slli	t1,a5,0x18
    146c:	01c79893          	slli	a7,a5,0x1c
    1470:	02479813          	slli	a6,a5,0x24
    1474:	02879513          	slli	a0,a5,0x28
    1478:	02c79593          	slli	a1,a5,0x2c
    147c:	03079693          	slli	a3,a5,0x30
    1480:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1484:	03c7d413          	srli	s0,a5,0x3c
    1488:	01c7d39b          	srliw	t2,a5,0x1c
    148c:	03c2d293          	srli	t0,t0,0x3c
    1490:	03cfdf93          	srli	t6,t6,0x3c
    1494:	03cf5f13          	srli	t5,t5,0x3c
    1498:	03cede93          	srli	t4,t4,0x3c
    149c:	03ce5e13          	srli	t3,t3,0x3c
    14a0:	03c35313          	srli	t1,t1,0x3c
    14a4:	03c8d893          	srli	a7,a7,0x3c
    14a8:	03c85813          	srli	a6,a6,0x3c
    14ac:	9171                	srli	a0,a0,0x3c
    14ae:	91f1                	srli	a1,a1,0x3c
    14b0:	92f1                	srli	a3,a3,0x3c
    14b2:	9371                	srli	a4,a4,0x3c
    14b4:	96d2                	add	a3,a3,s4
    14b6:	9752                	add	a4,a4,s4
    14b8:	9452                	add	s0,s0,s4
    14ba:	92d2                	add	t0,t0,s4
    14bc:	9fd2                	add	t6,t6,s4
    14be:	9f52                	add	t5,t5,s4
    14c0:	9ed2                	add	t4,t4,s4
    14c2:	9e52                	add	t3,t3,s4
    14c4:	9352                	add	t1,t1,s4
    14c6:	98d2                	add	a7,a7,s4
    14c8:	93d2                	add	t2,t2,s4
    14ca:	9852                	add	a6,a6,s4
    14cc:	9552                	add	a0,a0,s4
    14ce:	95d2                	add	a1,a1,s4
    14d0:	0006c983          	lbu	s3,0(a3)
    14d4:	0002c283          	lbu	t0,0(t0)
    14d8:	00074683          	lbu	a3,0(a4)
    14dc:	000fcf83          	lbu	t6,0(t6)
    14e0:	000f4f03          	lbu	t5,0(t5)
    14e4:	000ece83          	lbu	t4,0(t4)
    14e8:	000e4e03          	lbu	t3,0(t3)
    14ec:	00034303          	lbu	t1,0(t1)
    14f0:	0008c883          	lbu	a7,0(a7)
    14f4:	0003c383          	lbu	t2,0(t2)
    14f8:	00084803          	lbu	a6,0(a6)
    14fc:	00054503          	lbu	a0,0(a0)
    1500:	0005c583          	lbu	a1,0(a1)
    1504:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1508:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    150c:	9371                	srli	a4,a4,0x3c
    150e:	8bbd                	andi	a5,a5,15
    1510:	9752                	add	a4,a4,s4
    1512:	97d2                	add	a5,a5,s4
    1514:	005105a3          	sb	t0,11(sp)
    1518:	01f10623          	sb	t6,12(sp)
    151c:	01e106a3          	sb	t5,13(sp)
    1520:	01d10723          	sb	t4,14(sp)
    1524:	01c107a3          	sb	t3,15(sp)
    1528:	00610823          	sb	t1,16(sp)
    152c:	011108a3          	sb	a7,17(sp)
    1530:	00710923          	sb	t2,18(sp)
    1534:	010109a3          	sb	a6,19(sp)
    1538:	00a10a23          	sb	a0,20(sp)
    153c:	00b10aa3          	sb	a1,21(sp)
    1540:	01310b23          	sb	s3,22(sp)
    1544:	00d10ba3          	sb	a3,23(sp)
    1548:	00810523          	sb	s0,10(sp)
    154c:	00074703          	lbu	a4,0(a4)
    1550:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1554:	002c                	addi	a1,sp,8
    1556:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1558:	00e10c23          	sb	a4,24(sp)
    155c:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1560:	00010d23          	sb	zero,26(sp)
        s += 2;
    1564:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1568:	085000ef          	jal	ra,1dec <write>
        s += 2;
    156c:	b5bd                	j	13da <printf+0xa2>
    char byte = c;
    156e:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1572:	4605                	li	a2,1
    1574:	002c                	addi	a1,sp,8
    1576:	4505                	li	a0,1
    char byte = c;
    1578:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157c:	071000ef          	jal	ra,1dec <write>
    char byte = c;
    1580:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1584:	4605                	li	a2,1
    1586:	002c                	addi	a1,sp,8
    1588:	4505                	li	a0,1
    char byte = c;
    158a:	00f10423          	sb	a5,8(sp)
        s += 2;
    158e:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1592:	05b000ef          	jal	ra,1dec <write>
        s += 2;
    1596:	b591                	j	13da <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1598:	6782                	ld	a5,0(sp)
    159a:	6380                	ld	s0,0(a5)
    159c:	07a1                	addi	a5,a5,8
    159e:	e03e                	sd	a5,0(sp)
    15a0:	cc05                	beqz	s0,15d8 <printf+0x2a0>
            l = strnlen(a, 200);
    15a2:	0c800593          	li	a1,200
    15a6:	8522                	mv	a0,s0
    15a8:	45a000ef          	jal	ra,1a02 <strnlen>
    write(f, s, l);
    15ac:	0005061b          	sext.w	a2,a0
    15b0:	85a2                	mv	a1,s0
    15b2:	4505                	li	a0,1
    15b4:	039000ef          	jal	ra,1dec <write>
        s += 2;
    15b8:	00248993          	addi	s3,s1,2
    15bc:	bd39                	j	13da <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15be:	0019c783          	lbu	a5,1(s3)
    15c2:	84ce                	mv	s1,s3
    15c4:	864e                	mv	a2,s3
    15c6:	e52782e3          	beq	a5,s2,140a <printf+0xd2>
    write(f, s, l);
    15ca:	4601                	li	a2,0
    15cc:	85ce                	mv	a1,s3
    15ce:	4505                	li	a0,1
    15d0:	01d000ef          	jal	ra,1dec <write>
    15d4:	84ce                	mv	s1,s3
    15d6:	bbd1                	j	13aa <printf+0x72>
                a = "(null)";
    15d8:	845e                	mv	s0,s7
    15da:	b7e1                	j	15a2 <printf+0x26a>

00000000000015dc <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15dc:	1141                	addi	sp,sp,-16
    15de:	e406                	sd	ra,8(sp)
    puts(m);
    15e0:	d37ff0ef          	jal	ra,1316 <puts>
    exit(-100);
}
    15e4:	60a2                	ld	ra,8(sp)
    exit(-100);
    15e6:	f9c00513          	li	a0,-100
}
    15ea:	0141                	addi	sp,sp,16
    exit(-100);
    15ec:	0530006f          	j	1e3e <exit>

00000000000015f0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f0:	02000793          	li	a5,32
    15f4:	00f50663          	beq	a0,a5,1600 <isspace+0x10>
    15f8:	355d                	addiw	a0,a0,-9
    15fa:	00553513          	sltiu	a0,a0,5
    15fe:	8082                	ret
    1600:	4505                	li	a0,1
}
    1602:	8082                	ret

0000000000001604 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1604:	fd05051b          	addiw	a0,a0,-48
}
    1608:	00a53513          	sltiu	a0,a0,10
    160c:	8082                	ret

000000000000160e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    160e:	02000613          	li	a2,32
    1612:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1614:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1618:	0007079b          	sext.w	a5,a4
    161c:	ff77869b          	addiw	a3,a5,-9
    1620:	04c70b63          	beq	a4,a2,1676 <atoi+0x68>
    1624:	04d5f963          	bleu	a3,a1,1676 <atoi+0x68>
        s++;
    switch (*s)
    1628:	02b00693          	li	a3,43
    162c:	04d70a63          	beq	a4,a3,1680 <atoi+0x72>
    1630:	02d00693          	li	a3,45
    1634:	06d70463          	beq	a4,a3,169c <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1638:	fd07859b          	addiw	a1,a5,-48
    163c:	4625                	li	a2,9
    163e:	873e                	mv	a4,a5
    1640:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1642:	4e01                	li	t3,0
    while (isdigit(*s))
    1644:	04b66a63          	bltu	a2,a1,1698 <atoi+0x8a>
    int n = 0, neg = 0;
    1648:	4501                	li	a0,0
    while (isdigit(*s))
    164a:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    164c:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    164e:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1652:	0025179b          	slliw	a5,a0,0x2
    1656:	9d3d                	addw	a0,a0,a5
    1658:	fd07031b          	addiw	t1,a4,-48
    165c:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1660:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1664:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1668:	0006071b          	sext.w	a4,a2
    166c:	feb870e3          	bleu	a1,a6,164c <atoi+0x3e>
    return neg ? n : -n;
    1670:	000e0563          	beqz	t3,167a <atoi+0x6c>
}
    1674:	8082                	ret
        s++;
    1676:	0505                	addi	a0,a0,1
    1678:	bf71                	j	1614 <atoi+0x6>
    167a:	4113053b          	subw	a0,t1,a7
    167e:	8082                	ret
    while (isdigit(*s))
    1680:	00154783          	lbu	a5,1(a0)
    1684:	4625                	li	a2,9
        s++;
    1686:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    168a:	fd07859b          	addiw	a1,a5,-48
    168e:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1692:	4e01                	li	t3,0
    while (isdigit(*s))
    1694:	fab67ae3          	bleu	a1,a2,1648 <atoi+0x3a>
    1698:	4501                	li	a0,0
}
    169a:	8082                	ret
    while (isdigit(*s))
    169c:	00154783          	lbu	a5,1(a0)
    16a0:	4625                	li	a2,9
        s++;
    16a2:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16a6:	fd07859b          	addiw	a1,a5,-48
    16aa:	0007871b          	sext.w	a4,a5
    16ae:	feb665e3          	bltu	a2,a1,1698 <atoi+0x8a>
        neg = 1;
    16b2:	4e05                	li	t3,1
    16b4:	bf51                	j	1648 <atoi+0x3a>

00000000000016b6 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16b6:	16060d63          	beqz	a2,1830 <memset+0x17a>
    16ba:	40a007b3          	neg	a5,a0
    16be:	8b9d                	andi	a5,a5,7
    16c0:	00778713          	addi	a4,a5,7
    16c4:	482d                	li	a6,11
    16c6:	0ff5f593          	andi	a1,a1,255
    16ca:	fff60693          	addi	a3,a2,-1
    16ce:	17076263          	bltu	a4,a6,1832 <memset+0x17c>
    16d2:	16e6ea63          	bltu	a3,a4,1846 <memset+0x190>
    16d6:	16078563          	beqz	a5,1840 <memset+0x18a>
    16da:	00b50023          	sb	a1,0(a0)
    16de:	4705                	li	a4,1
    16e0:	00150e93          	addi	t4,a0,1
    16e4:	14e78c63          	beq	a5,a4,183c <memset+0x186>
    16e8:	00b500a3          	sb	a1,1(a0)
    16ec:	4709                	li	a4,2
    16ee:	00250e93          	addi	t4,a0,2
    16f2:	14e78d63          	beq	a5,a4,184c <memset+0x196>
    16f6:	00b50123          	sb	a1,2(a0)
    16fa:	470d                	li	a4,3
    16fc:	00350e93          	addi	t4,a0,3
    1700:	12e78b63          	beq	a5,a4,1836 <memset+0x180>
    1704:	00b501a3          	sb	a1,3(a0)
    1708:	4711                	li	a4,4
    170a:	00450e93          	addi	t4,a0,4
    170e:	14e78163          	beq	a5,a4,1850 <memset+0x19a>
    1712:	00b50223          	sb	a1,4(a0)
    1716:	4715                	li	a4,5
    1718:	00550e93          	addi	t4,a0,5
    171c:	12e78c63          	beq	a5,a4,1854 <memset+0x19e>
    1720:	00b502a3          	sb	a1,5(a0)
    1724:	471d                	li	a4,7
    1726:	00650e93          	addi	t4,a0,6
    172a:	12e79763          	bne	a5,a4,1858 <memset+0x1a2>
    172e:	00750e93          	addi	t4,a0,7
    1732:	00b50323          	sb	a1,6(a0)
    1736:	4f1d                	li	t5,7
    1738:	00859713          	slli	a4,a1,0x8
    173c:	8f4d                	or	a4,a4,a1
    173e:	01059e13          	slli	t3,a1,0x10
    1742:	01c76e33          	or	t3,a4,t3
    1746:	01859313          	slli	t1,a1,0x18
    174a:	006e6333          	or	t1,t3,t1
    174e:	02059893          	slli	a7,a1,0x20
    1752:	011368b3          	or	a7,t1,a7
    1756:	02859813          	slli	a6,a1,0x28
    175a:	40f60333          	sub	t1,a2,a5
    175e:	0108e833          	or	a6,a7,a6
    1762:	03059693          	slli	a3,a1,0x30
    1766:	00d866b3          	or	a3,a6,a3
    176a:	03859713          	slli	a4,a1,0x38
    176e:	97aa                	add	a5,a5,a0
    1770:	ff837813          	andi	a6,t1,-8
    1774:	8f55                	or	a4,a4,a3
    1776:	00f806b3          	add	a3,a6,a5
    177a:	e398                	sd	a4,0(a5)
    177c:	07a1                	addi	a5,a5,8
    177e:	fed79ee3          	bne	a5,a3,177a <memset+0xc4>
    1782:	ff837693          	andi	a3,t1,-8
    1786:	00de87b3          	add	a5,t4,a3
    178a:	01e6873b          	addw	a4,a3,t5
    178e:	0ad30663          	beq	t1,a3,183a <memset+0x184>
    1792:	00b78023          	sb	a1,0(a5)
    1796:	0017069b          	addiw	a3,a4,1
    179a:	08c6fb63          	bleu	a2,a3,1830 <memset+0x17a>
    179e:	00b780a3          	sb	a1,1(a5)
    17a2:	0027069b          	addiw	a3,a4,2
    17a6:	08c6f563          	bleu	a2,a3,1830 <memset+0x17a>
    17aa:	00b78123          	sb	a1,2(a5)
    17ae:	0037069b          	addiw	a3,a4,3
    17b2:	06c6ff63          	bleu	a2,a3,1830 <memset+0x17a>
    17b6:	00b781a3          	sb	a1,3(a5)
    17ba:	0047069b          	addiw	a3,a4,4
    17be:	06c6f963          	bleu	a2,a3,1830 <memset+0x17a>
    17c2:	00b78223          	sb	a1,4(a5)
    17c6:	0057069b          	addiw	a3,a4,5
    17ca:	06c6f363          	bleu	a2,a3,1830 <memset+0x17a>
    17ce:	00b782a3          	sb	a1,5(a5)
    17d2:	0067069b          	addiw	a3,a4,6
    17d6:	04c6fd63          	bleu	a2,a3,1830 <memset+0x17a>
    17da:	00b78323          	sb	a1,6(a5)
    17de:	0077069b          	addiw	a3,a4,7
    17e2:	04c6f763          	bleu	a2,a3,1830 <memset+0x17a>
    17e6:	00b783a3          	sb	a1,7(a5)
    17ea:	0087069b          	addiw	a3,a4,8
    17ee:	04c6f163          	bleu	a2,a3,1830 <memset+0x17a>
    17f2:	00b78423          	sb	a1,8(a5)
    17f6:	0097069b          	addiw	a3,a4,9
    17fa:	02c6fb63          	bleu	a2,a3,1830 <memset+0x17a>
    17fe:	00b784a3          	sb	a1,9(a5)
    1802:	00a7069b          	addiw	a3,a4,10
    1806:	02c6f563          	bleu	a2,a3,1830 <memset+0x17a>
    180a:	00b78523          	sb	a1,10(a5)
    180e:	00b7069b          	addiw	a3,a4,11
    1812:	00c6ff63          	bleu	a2,a3,1830 <memset+0x17a>
    1816:	00b785a3          	sb	a1,11(a5)
    181a:	00c7069b          	addiw	a3,a4,12
    181e:	00c6f963          	bleu	a2,a3,1830 <memset+0x17a>
    1822:	00b78623          	sb	a1,12(a5)
    1826:	2735                	addiw	a4,a4,13
    1828:	00c77463          	bleu	a2,a4,1830 <memset+0x17a>
    182c:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1830:	8082                	ret
    1832:	472d                	li	a4,11
    1834:	bd79                	j	16d2 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1836:	4f0d                	li	t5,3
    1838:	b701                	j	1738 <memset+0x82>
    183a:	8082                	ret
    183c:	4f05                	li	t5,1
    183e:	bded                	j	1738 <memset+0x82>
    1840:	8eaa                	mv	t4,a0
    1842:	4f01                	li	t5,0
    1844:	bdd5                	j	1738 <memset+0x82>
    1846:	87aa                	mv	a5,a0
    1848:	4701                	li	a4,0
    184a:	b7a1                	j	1792 <memset+0xdc>
    184c:	4f09                	li	t5,2
    184e:	b5ed                	j	1738 <memset+0x82>
    1850:	4f11                	li	t5,4
    1852:	b5dd                	j	1738 <memset+0x82>
    1854:	4f15                	li	t5,5
    1856:	b5cd                	j	1738 <memset+0x82>
    1858:	4f19                	li	t5,6
    185a:	bdf9                	j	1738 <memset+0x82>

000000000000185c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    185c:	00054703          	lbu	a4,0(a0)
    1860:	0005c783          	lbu	a5,0(a1)
    1864:	00e79b63          	bne	a5,a4,187a <strcmp+0x1e>
    1868:	cf89                	beqz	a5,1882 <strcmp+0x26>
    186a:	0505                	addi	a0,a0,1
    186c:	0585                	addi	a1,a1,1
    186e:	0005c783          	lbu	a5,0(a1)
    1872:	00054703          	lbu	a4,0(a0)
    1876:	fef709e3          	beq	a4,a5,1868 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    187a:	0007051b          	sext.w	a0,a4
}
    187e:	9d1d                	subw	a0,a0,a5
    1880:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1882:	4501                	li	a0,0
}
    1884:	9d1d                	subw	a0,a0,a5
    1886:	8082                	ret

0000000000001888 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1888:	c231                	beqz	a2,18cc <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    188a:	00054783          	lbu	a5,0(a0)
    188e:	0005c683          	lbu	a3,0(a1)
    1892:	c795                	beqz	a5,18be <strncmp+0x36>
    1894:	ca85                	beqz	a3,18c4 <strncmp+0x3c>
    if (!n--)
    1896:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1898:	c615                	beqz	a2,18c4 <strncmp+0x3c>
    189a:	00150713          	addi	a4,a0,1
    189e:	9532                	add	a0,a0,a2
    18a0:	00d78963          	beq	a5,a3,18b2 <strncmp+0x2a>
    18a4:	a005                	j	18c4 <strncmp+0x3c>
    18a6:	ce99                	beqz	a3,18c4 <strncmp+0x3c>
    18a8:	00e50e63          	beq	a0,a4,18c4 <strncmp+0x3c>
    18ac:	0705                	addi	a4,a4,1
    18ae:	00d79b63          	bne	a5,a3,18c4 <strncmp+0x3c>
    18b2:	00074783          	lbu	a5,0(a4)
    18b6:	0585                	addi	a1,a1,1
    18b8:	0005c683          	lbu	a3,0(a1)
    18bc:	f7ed                	bnez	a5,18a6 <strncmp+0x1e>
    18be:	4501                	li	a0,0
        ;
    return *l - *r;
    18c0:	9d15                	subw	a0,a0,a3
    18c2:	8082                	ret
    18c4:	0007851b          	sext.w	a0,a5
    18c8:	9d15                	subw	a0,a0,a3
    18ca:	8082                	ret
        return 0;
    18cc:	4501                	li	a0,0
}
    18ce:	8082                	ret

00000000000018d0 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18d0:	00757793          	andi	a5,a0,7
    18d4:	cfa1                	beqz	a5,192c <strlen+0x5c>
        if (!*s)
    18d6:	00054783          	lbu	a5,0(a0)
    18da:	cbb9                	beqz	a5,1930 <strlen+0x60>
    18dc:	87aa                	mv	a5,a0
    18de:	a021                	j	18e6 <strlen+0x16>
    18e0:	0007c703          	lbu	a4,0(a5)
    18e4:	c329                	beqz	a4,1926 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18e6:	0785                	addi	a5,a5,1
    18e8:	0077f713          	andi	a4,a5,7
    18ec:	fb75                	bnez	a4,18e0 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ee:	00001717          	auipc	a4,0x1
    18f2:	84270713          	addi	a4,a4,-1982 # 2130 <__clone+0x10a>
    18f6:	630c                	ld	a1,0(a4)
    18f8:	00001717          	auipc	a4,0x1
    18fc:	84070713          	addi	a4,a4,-1984 # 2138 <__clone+0x112>
    1900:	6394                	ld	a3,0(a5)
    1902:	6310                	ld	a2,0(a4)
    1904:	a019                	j	190a <strlen+0x3a>
    1906:	07a1                	addi	a5,a5,8
    1908:	6394                	ld	a3,0(a5)
    190a:	00b68733          	add	a4,a3,a1
    190e:	fff6c693          	not	a3,a3
    1912:	8f75                	and	a4,a4,a3
    1914:	8f71                	and	a4,a4,a2
    1916:	db65                	beqz	a4,1906 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    1918:	0007c703          	lbu	a4,0(a5)
    191c:	c709                	beqz	a4,1926 <strlen+0x56>
    191e:	0785                	addi	a5,a5,1
    1920:	0007c703          	lbu	a4,0(a5)
    1924:	ff6d                	bnez	a4,191e <strlen+0x4e>
        ;
    return s - a;
    1926:	40a78533          	sub	a0,a5,a0
}
    192a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    192c:	87aa                	mv	a5,a0
    192e:	b7c1                	j	18ee <strlen+0x1e>
        if (!*s)
    1930:	4501                	li	a0,0
            return s - a;
    1932:	8082                	ret

0000000000001934 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1934:	00757793          	andi	a5,a0,7
    1938:	0ff5f593          	andi	a1,a1,255
    193c:	cb99                	beqz	a5,1952 <memchr+0x1e>
    193e:	c655                	beqz	a2,19ea <memchr+0xb6>
    1940:	00054783          	lbu	a5,0(a0)
    1944:	0ab78663          	beq	a5,a1,19f0 <memchr+0xbc>
    1948:	0505                	addi	a0,a0,1
    194a:	00757793          	andi	a5,a0,7
    194e:	167d                	addi	a2,a2,-1
    1950:	f7fd                	bnez	a5,193e <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1952:	4701                	li	a4,0
    if (n && *s != c)
    1954:	ca49                	beqz	a2,19e6 <memchr+0xb2>
    1956:	00054783          	lbu	a5,0(a0)
    195a:	08b78b63          	beq	a5,a1,19f0 <memchr+0xbc>
        size_t k = ONES * c;
    195e:	00000797          	auipc	a5,0x0
    1962:	7e278793          	addi	a5,a5,2018 # 2140 <__clone+0x11a>
    1966:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1968:	479d                	li	a5,7
        size_t k = ONES * c;
    196a:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    196e:	08c7f863          	bleu	a2,a5,19fe <memchr+0xca>
    1972:	611c                	ld	a5,0(a0)
    1974:	00000317          	auipc	t1,0x0
    1978:	7c430313          	addi	t1,t1,1988 # 2138 <__clone+0x112>
    197c:	00033803          	ld	a6,0(t1)
    1980:	00f8c7b3          	xor	a5,a7,a5
    1984:	fff7c713          	not	a4,a5
    1988:	8f95                	sub	a5,a5,a3
    198a:	8ff9                	and	a5,a5,a4
    198c:	0107f7b3          	and	a5,a5,a6
    1990:	e7bd                	bnez	a5,19fe <memchr+0xca>
    1992:	4e1d                	li	t3,7
    1994:	00000e97          	auipc	t4,0x0
    1998:	79ce8e93          	addi	t4,t4,1948 # 2130 <__clone+0x10a>
    199c:	a005                	j	19bc <memchr+0x88>
    199e:	6514                	ld	a3,8(a0)
    19a0:	000eb783          	ld	a5,0(t4)
    19a4:	00033803          	ld	a6,0(t1)
    19a8:	00d8c6b3          	xor	a3,a7,a3
    19ac:	97b6                	add	a5,a5,a3
    19ae:	fff6c693          	not	a3,a3
    19b2:	8ff5                	and	a5,a5,a3
    19b4:	0107f7b3          	and	a5,a5,a6
    19b8:	e3a1                	bnez	a5,19f8 <memchr+0xc4>
    19ba:	853a                	mv	a0,a4
    19bc:	1661                	addi	a2,a2,-8
    19be:	00850713          	addi	a4,a0,8
    19c2:	fcce6ee3          	bltu	t3,a2,199e <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    19c6:	c215                	beqz	a2,19ea <memchr+0xb6>
    19c8:	00074783          	lbu	a5,0(a4)
    19cc:	00f58d63          	beq	a1,a5,19e6 <memchr+0xb2>
    19d0:	00170793          	addi	a5,a4,1
    19d4:	963a                	add	a2,a2,a4
    19d6:	873e                	mv	a4,a5
    19d8:	00f60963          	beq	a2,a5,19ea <memchr+0xb6>
    19dc:	0007c683          	lbu	a3,0(a5)
    19e0:	0785                	addi	a5,a5,1
    19e2:	feb69ae3          	bne	a3,a1,19d6 <memchr+0xa2>
}
    19e6:	853a                	mv	a0,a4
    19e8:	8082                	ret
    return n ? (void *)s : 0;
    19ea:	4701                	li	a4,0
}
    19ec:	853a                	mv	a0,a4
    19ee:	8082                	ret
    19f0:	872a                	mv	a4,a0
    19f2:	00074783          	lbu	a5,0(a4)
    19f6:	bfd9                	j	19cc <memchr+0x98>
    19f8:	00854783          	lbu	a5,8(a0)
    19fc:	bfc1                	j	19cc <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19fe:	872a                	mv	a4,a0
    1a00:	bfc1                	j	19d0 <memchr+0x9c>

0000000000001a02 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a02:	00757793          	andi	a5,a0,7
    1a06:	cfc5                	beqz	a5,1abe <strnlen+0xbc>
    1a08:	c1c5                	beqz	a1,1aa8 <strnlen+0xa6>
    1a0a:	00054783          	lbu	a5,0(a0)
    1a0e:	cfd9                	beqz	a5,1aac <strnlen+0xaa>
    1a10:	87ae                	mv	a5,a1
    1a12:	86aa                	mv	a3,a0
    1a14:	a029                	j	1a1e <strnlen+0x1c>
    1a16:	cbc9                	beqz	a5,1aa8 <strnlen+0xa6>
    1a18:	0006c703          	lbu	a4,0(a3)
    1a1c:	cb51                	beqz	a4,1ab0 <strnlen+0xae>
    1a1e:	0685                	addi	a3,a3,1
    1a20:	0076f713          	andi	a4,a3,7
    1a24:	17fd                	addi	a5,a5,-1
    1a26:	fb65                	bnez	a4,1a16 <strnlen+0x14>
    if (n && *s != c)
    1a28:	c3c1                	beqz	a5,1aa8 <strnlen+0xa6>
    1a2a:	0006c703          	lbu	a4,0(a3)
    1a2e:	c349                	beqz	a4,1ab0 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a30:	471d                	li	a4,7
    1a32:	08f77a63          	bleu	a5,a4,1ac6 <strnlen+0xc4>
    1a36:	00000e17          	auipc	t3,0x0
    1a3a:	6fae0e13          	addi	t3,t3,1786 # 2130 <__clone+0x10a>
    1a3e:	6290                	ld	a2,0(a3)
    1a40:	000e3703          	ld	a4,0(t3)
    1a44:	00000e97          	auipc	t4,0x0
    1a48:	6f4e8e93          	addi	t4,t4,1780 # 2138 <__clone+0x112>
    1a4c:	000eb803          	ld	a6,0(t4)
    1a50:	9732                	add	a4,a4,a2
    1a52:	fff64613          	not	a2,a2
    1a56:	8f71                	and	a4,a4,a2
    1a58:	01077733          	and	a4,a4,a6
    1a5c:	e72d                	bnez	a4,1ac6 <strnlen+0xc4>
    1a5e:	4f1d                	li	t5,7
    1a60:	a839                	j	1a7e <strnlen+0x7c>
    1a62:	6698                	ld	a4,8(a3)
    1a64:	000e3303          	ld	t1,0(t3)
    1a68:	000eb803          	ld	a6,0(t4)
    1a6c:	fff74893          	not	a7,a4
    1a70:	971a                	add	a4,a4,t1
    1a72:	01177733          	and	a4,a4,a7
    1a76:	01077733          	and	a4,a4,a6
    1a7a:	ef1d                	bnez	a4,1ab8 <strnlen+0xb6>
    1a7c:	86b2                	mv	a3,a2
    1a7e:	17e1                	addi	a5,a5,-8
    1a80:	00868613          	addi	a2,a3,8
    1a84:	fcff6fe3          	bltu	t5,a5,1a62 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a88:	c385                	beqz	a5,1aa8 <strnlen+0xa6>
    1a8a:	00064703          	lbu	a4,0(a2)
    1a8e:	cb19                	beqz	a4,1aa4 <strnlen+0xa2>
    1a90:	00160713          	addi	a4,a2,1
    1a94:	97b2                	add	a5,a5,a2
    1a96:	863a                	mv	a2,a4
    1a98:	00e78863          	beq	a5,a4,1aa8 <strnlen+0xa6>
    1a9c:	0705                	addi	a4,a4,1
    1a9e:	fff74683          	lbu	a3,-1(a4)
    1aa2:	faf5                	bnez	a3,1a96 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1aa4:	40a605b3          	sub	a1,a2,a0
}
    1aa8:	852e                	mv	a0,a1
    1aaa:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1aac:	87ae                	mv	a5,a1
    1aae:	86aa                	mv	a3,a0
    if (n && *s != c)
    1ab0:	8636                	mv	a2,a3
    1ab2:	00064703          	lbu	a4,0(a2)
    1ab6:	bfe1                	j	1a8e <strnlen+0x8c>
    1ab8:	0086c703          	lbu	a4,8(a3)
    1abc:	bfc9                	j	1a8e <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1abe:	87ae                	mv	a5,a1
    1ac0:	86aa                	mv	a3,a0
    if (n && *s != c)
    1ac2:	f7a5                	bnez	a5,1a2a <strnlen+0x28>
    1ac4:	b7d5                	j	1aa8 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ac6:	8636                	mv	a2,a3
    1ac8:	b7e1                	j	1a90 <strnlen+0x8e>

0000000000001aca <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1aca:	00b547b3          	xor	a5,a0,a1
    1ace:	8b9d                	andi	a5,a5,7
    1ad0:	efa9                	bnez	a5,1b2a <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1ad2:	0075f793          	andi	a5,a1,7
    1ad6:	c38d                	beqz	a5,1af8 <strcpy+0x2e>
            if (!(*d = *s))
    1ad8:	0005c783          	lbu	a5,0(a1)
    1adc:	00f50023          	sb	a5,0(a0)
    1ae0:	e799                	bnez	a5,1aee <strcpy+0x24>
    1ae2:	a095                	j	1b46 <strcpy+0x7c>
    1ae4:	0005c783          	lbu	a5,0(a1)
    1ae8:	00f50023          	sb	a5,0(a0)
    1aec:	cbb9                	beqz	a5,1b42 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1aee:	0585                	addi	a1,a1,1
    1af0:	0075f793          	andi	a5,a1,7
    1af4:	0505                	addi	a0,a0,1
    1af6:	f7fd                	bnez	a5,1ae4 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1af8:	00000797          	auipc	a5,0x0
    1afc:	63878793          	addi	a5,a5,1592 # 2130 <__clone+0x10a>
    1b00:	0007b803          	ld	a6,0(a5)
    1b04:	00000797          	auipc	a5,0x0
    1b08:	63478793          	addi	a5,a5,1588 # 2138 <__clone+0x112>
    1b0c:	6198                	ld	a4,0(a1)
    1b0e:	6390                	ld	a2,0(a5)
    1b10:	a031                	j	1b1c <strcpy+0x52>
    1b12:	0521                	addi	a0,a0,8
    1b14:	05a1                	addi	a1,a1,8
    1b16:	fee53c23          	sd	a4,-8(a0)
    1b1a:	6198                	ld	a4,0(a1)
    1b1c:	010707b3          	add	a5,a4,a6
    1b20:	fff74693          	not	a3,a4
    1b24:	8ff5                	and	a5,a5,a3
    1b26:	8ff1                	and	a5,a5,a2
    1b28:	d7ed                	beqz	a5,1b12 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b2a:	0005c783          	lbu	a5,0(a1)
    1b2e:	00f50023          	sb	a5,0(a0)
    1b32:	cb89                	beqz	a5,1b44 <strcpy+0x7a>
    1b34:	0585                	addi	a1,a1,1
    1b36:	0005c783          	lbu	a5,0(a1)
    1b3a:	0505                	addi	a0,a0,1
    1b3c:	00f50023          	sb	a5,0(a0)
    1b40:	fbf5                	bnez	a5,1b34 <strcpy+0x6a>
        ;
    return d;
}
    1b42:	8082                	ret
    1b44:	8082                	ret
    1b46:	8082                	ret

0000000000001b48 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b48:	00b547b3          	xor	a5,a0,a1
    1b4c:	8b9d                	andi	a5,a5,7
    1b4e:	ebc1                	bnez	a5,1bde <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b50:	0075f793          	andi	a5,a1,7
    1b54:	cf91                	beqz	a5,1b70 <strncpy+0x28>
    1b56:	20060e63          	beqz	a2,1d72 <strncpy+0x22a>
    1b5a:	0005c783          	lbu	a5,0(a1)
    1b5e:	00f50023          	sb	a5,0(a0)
    1b62:	c3d5                	beqz	a5,1c06 <strncpy+0xbe>
    1b64:	0585                	addi	a1,a1,1
    1b66:	0075f793          	andi	a5,a1,7
    1b6a:	167d                	addi	a2,a2,-1
    1b6c:	0505                	addi	a0,a0,1
    1b6e:	f7e5                	bnez	a5,1b56 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b70:	20060163          	beqz	a2,1d72 <strncpy+0x22a>
    1b74:	0005c683          	lbu	a3,0(a1)
    1b78:	c6d9                	beqz	a3,1c06 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b7a:	479d                	li	a5,7
    1b7c:	22c7f563          	bleu	a2,a5,1da6 <strncpy+0x25e>
    1b80:	00000317          	auipc	t1,0x0
    1b84:	5b030313          	addi	t1,t1,1456 # 2130 <__clone+0x10a>
    1b88:	6198                	ld	a4,0(a1)
    1b8a:	00033783          	ld	a5,0(t1)
    1b8e:	00000e17          	auipc	t3,0x0
    1b92:	5aae0e13          	addi	t3,t3,1450 # 2138 <__clone+0x112>
    1b96:	000e3803          	ld	a6,0(t3)
    1b9a:	97ba                	add	a5,a5,a4
    1b9c:	fff74893          	not	a7,a4
    1ba0:	0117f7b3          	and	a5,a5,a7
    1ba4:	0107f7b3          	and	a5,a5,a6
    1ba8:	1e079f63          	bnez	a5,1da6 <strncpy+0x25e>
    1bac:	4e9d                	li	t4,7
    1bae:	a005                	j	1bce <strncpy+0x86>
    1bb0:	6598                	ld	a4,8(a1)
    1bb2:	00033783          	ld	a5,0(t1)
    1bb6:	000e3803          	ld	a6,0(t3)
    1bba:	fff74893          	not	a7,a4
    1bbe:	97ba                	add	a5,a5,a4
    1bc0:	0117f7b3          	and	a5,a5,a7
    1bc4:	0107f7b3          	and	a5,a5,a6
    1bc8:	1a079f63          	bnez	a5,1d86 <strncpy+0x23e>
    1bcc:	85b6                	mv	a1,a3
            *wd = *ws;
    1bce:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bd0:	1661                	addi	a2,a2,-8
    1bd2:	00858693          	addi	a3,a1,8
    1bd6:	0521                	addi	a0,a0,8
    1bd8:	fcceece3          	bltu	t4,a2,1bb0 <strncpy+0x68>
    1bdc:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bde:	18060a63          	beqz	a2,1d72 <strncpy+0x22a>
    1be2:	0005c783          	lbu	a5,0(a1)
    1be6:	872a                	mv	a4,a0
    1be8:	00f50023          	sb	a5,0(a0)
    1bec:	e799                	bnez	a5,1bfa <strncpy+0xb2>
    1bee:	a829                	j	1c08 <strncpy+0xc0>
    1bf0:	0005c783          	lbu	a5,0(a1)
    1bf4:	00f70023          	sb	a5,0(a4)
    1bf8:	cb81                	beqz	a5,1c08 <strncpy+0xc0>
    1bfa:	167d                	addi	a2,a2,-1
    1bfc:	0585                	addi	a1,a1,1
    1bfe:	0705                	addi	a4,a4,1
    1c00:	fa65                	bnez	a2,1bf0 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1c02:	853a                	mv	a0,a4
    1c04:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1c06:	872a                	mv	a4,a0
    1c08:	4805                	li	a6,1
    1c0a:	14061c63          	bnez	a2,1d62 <strncpy+0x21a>
    1c0e:	40e007b3          	neg	a5,a4
    1c12:	8b9d                	andi	a5,a5,7
    1c14:	4581                	li	a1,0
    1c16:	12061e63          	bnez	a2,1d52 <strncpy+0x20a>
    1c1a:	00778693          	addi	a3,a5,7
    1c1e:	452d                	li	a0,11
    1c20:	12a6e763          	bltu	a3,a0,1d4e <strncpy+0x206>
    1c24:	16d5e663          	bltu	a1,a3,1d90 <strncpy+0x248>
    1c28:	14078c63          	beqz	a5,1d80 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2c:	00070023          	sb	zero,0(a4)
    1c30:	4585                	li	a1,1
    1c32:	00170693          	addi	a3,a4,1
    1c36:	14b78363          	beq	a5,a1,1d7c <strncpy+0x234>
    1c3a:	000700a3          	sb	zero,1(a4)
    1c3e:	4589                	li	a1,2
    1c40:	00270693          	addi	a3,a4,2
    1c44:	14b78963          	beq	a5,a1,1d96 <strncpy+0x24e>
    1c48:	00070123          	sb	zero,2(a4)
    1c4c:	458d                	li	a1,3
    1c4e:	00370693          	addi	a3,a4,3
    1c52:	12b78363          	beq	a5,a1,1d78 <strncpy+0x230>
    1c56:	000701a3          	sb	zero,3(a4)
    1c5a:	4591                	li	a1,4
    1c5c:	00470693          	addi	a3,a4,4
    1c60:	12b78d63          	beq	a5,a1,1d9a <strncpy+0x252>
    1c64:	00070223          	sb	zero,4(a4)
    1c68:	4595                	li	a1,5
    1c6a:	00570693          	addi	a3,a4,5
    1c6e:	12b78863          	beq	a5,a1,1d9e <strncpy+0x256>
    1c72:	000702a3          	sb	zero,5(a4)
    1c76:	459d                	li	a1,7
    1c78:	00670693          	addi	a3,a4,6
    1c7c:	12b79363          	bne	a5,a1,1da2 <strncpy+0x25a>
    1c80:	00770693          	addi	a3,a4,7
    1c84:	00070323          	sb	zero,6(a4)
    1c88:	40f80833          	sub	a6,a6,a5
    1c8c:	ff887513          	andi	a0,a6,-8
    1c90:	97ba                	add	a5,a5,a4
    1c92:	953e                	add	a0,a0,a5
    1c94:	0007b023          	sd	zero,0(a5)
    1c98:	07a1                	addi	a5,a5,8
    1c9a:	fea79de3          	bne	a5,a0,1c94 <strncpy+0x14c>
    1c9e:	ff887513          	andi	a0,a6,-8
    1ca2:	9da9                	addw	a1,a1,a0
    1ca4:	00a687b3          	add	a5,a3,a0
    1ca8:	f4a80de3          	beq	a6,a0,1c02 <strncpy+0xba>
    1cac:	00078023          	sb	zero,0(a5)
    1cb0:	0015869b          	addiw	a3,a1,1
    1cb4:	f4c6f7e3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1cb8:	000780a3          	sb	zero,1(a5)
    1cbc:	0025869b          	addiw	a3,a1,2
    1cc0:	f4c6f1e3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1cc4:	00078123          	sb	zero,2(a5)
    1cc8:	0035869b          	addiw	a3,a1,3
    1ccc:	f2c6fbe3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1cd0:	000781a3          	sb	zero,3(a5)
    1cd4:	0045869b          	addiw	a3,a1,4
    1cd8:	f2c6f5e3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1cdc:	00078223          	sb	zero,4(a5)
    1ce0:	0055869b          	addiw	a3,a1,5
    1ce4:	f0c6ffe3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1ce8:	000782a3          	sb	zero,5(a5)
    1cec:	0065869b          	addiw	a3,a1,6
    1cf0:	f0c6f9e3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1cf4:	00078323          	sb	zero,6(a5)
    1cf8:	0075869b          	addiw	a3,a1,7
    1cfc:	f0c6f3e3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1d00:	000783a3          	sb	zero,7(a5)
    1d04:	0085869b          	addiw	a3,a1,8
    1d08:	eec6fde3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1d0c:	00078423          	sb	zero,8(a5)
    1d10:	0095869b          	addiw	a3,a1,9
    1d14:	eec6f7e3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1d18:	000784a3          	sb	zero,9(a5)
    1d1c:	00a5869b          	addiw	a3,a1,10
    1d20:	eec6f1e3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1d24:	00078523          	sb	zero,10(a5)
    1d28:	00b5869b          	addiw	a3,a1,11
    1d2c:	ecc6fbe3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1d30:	000785a3          	sb	zero,11(a5)
    1d34:	00c5869b          	addiw	a3,a1,12
    1d38:	ecc6f5e3          	bleu	a2,a3,1c02 <strncpy+0xba>
    1d3c:	00078623          	sb	zero,12(a5)
    1d40:	25b5                	addiw	a1,a1,13
    1d42:	ecc5f0e3          	bleu	a2,a1,1c02 <strncpy+0xba>
    1d46:	000786a3          	sb	zero,13(a5)
}
    1d4a:	853a                	mv	a0,a4
    1d4c:	8082                	ret
    1d4e:	46ad                	li	a3,11
    1d50:	bdd1                	j	1c24 <strncpy+0xdc>
    1d52:	00778693          	addi	a3,a5,7
    1d56:	452d                	li	a0,11
    1d58:	fff60593          	addi	a1,a2,-1
    1d5c:	eca6f4e3          	bleu	a0,a3,1c24 <strncpy+0xdc>
    1d60:	b7fd                	j	1d4e <strncpy+0x206>
    1d62:	40e007b3          	neg	a5,a4
    1d66:	8832                	mv	a6,a2
    1d68:	8b9d                	andi	a5,a5,7
    1d6a:	4581                	li	a1,0
    1d6c:	ea0607e3          	beqz	a2,1c1a <strncpy+0xd2>
    1d70:	b7cd                	j	1d52 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d72:	872a                	mv	a4,a0
}
    1d74:	853a                	mv	a0,a4
    1d76:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d78:	458d                	li	a1,3
    1d7a:	b739                	j	1c88 <strncpy+0x140>
    1d7c:	4585                	li	a1,1
    1d7e:	b729                	j	1c88 <strncpy+0x140>
    1d80:	86ba                	mv	a3,a4
    1d82:	4581                	li	a1,0
    1d84:	b711                	j	1c88 <strncpy+0x140>
    1d86:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d8a:	872a                	mv	a4,a0
    1d8c:	85b6                	mv	a1,a3
    1d8e:	bda9                	j	1be8 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d90:	87ba                	mv	a5,a4
    1d92:	4581                	li	a1,0
    1d94:	bf21                	j	1cac <strncpy+0x164>
    1d96:	4589                	li	a1,2
    1d98:	bdc5                	j	1c88 <strncpy+0x140>
    1d9a:	4591                	li	a1,4
    1d9c:	b5f5                	j	1c88 <strncpy+0x140>
    1d9e:	4595                	li	a1,5
    1da0:	b5e5                	j	1c88 <strncpy+0x140>
    1da2:	4599                	li	a1,6
    1da4:	b5d5                	j	1c88 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1da6:	00d50023          	sb	a3,0(a0)
    1daa:	872a                	mv	a4,a0
    1dac:	b5b9                	j	1bfa <strncpy+0xb2>

0000000000001dae <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1dae:	87aa                	mv	a5,a0
    1db0:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1db2:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1db6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dba:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1dbc:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dbe:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1dc2:	2501                	sext.w	a0,a0
    1dc4:	8082                	ret

0000000000001dc6 <openat>:
    register long a7 __asm__("a7") = n;
    1dc6:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1dca:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dce:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <close>:
    register long a7 __asm__("a7") = n;
    1dd6:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dda:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <read>:
    register long a7 __asm__("a7") = n;
    1de2:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de6:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dea:	8082                	ret

0000000000001dec <write>:
    register long a7 __asm__("a7") = n;
    1dec:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df0:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1df4:	8082                	ret

0000000000001df6 <getpid>:
    register long a7 __asm__("a7") = n;
    1df6:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dfa:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <getppid>:
    register long a7 __asm__("a7") = n;
    1e02:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1e06:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e0e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e12:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <fork>:
    register long a7 __asm__("a7") = n;
    1e1a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1e1e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1e20:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e22:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1e2a:	85b2                	mv	a1,a2
    1e2c:	863a                	mv	a2,a4
    if (stack)
    1e2e:	c191                	beqz	a1,1e32 <clone+0x8>
	stack += stack_size;
    1e30:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1e32:	4781                	li	a5,0
    1e34:	4701                	li	a4,0
    1e36:	4681                	li	a3,0
    1e38:	2601                	sext.w	a2,a2
    1e3a:	1ec0006f          	j	2026 <__clone>

0000000000001e3e <exit>:
    register long a7 __asm__("a7") = n;
    1e3e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e42:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e46:	8082                	ret

0000000000001e48 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e48:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e4c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e4e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <exec>:
    register long a7 __asm__("a7") = n;
    1e56:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e5a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <execve>:
    register long a7 __asm__("a7") = n;
    1e62:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e66:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <times>:
    register long a7 __asm__("a7") = n;
    1e6e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e72:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <get_time>:

int64 get_time()
{
    1e7a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e7c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e80:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e82:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e84:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e88:	2501                	sext.w	a0,a0
    1e8a:	ed09                	bnez	a0,1ea4 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e8c:	67a2                	ld	a5,8(sp)
    1e8e:	3e800713          	li	a4,1000
    1e92:	00015503          	lhu	a0,0(sp)
    1e96:	02e7d7b3          	divu	a5,a5,a4
    1e9a:	02e50533          	mul	a0,a0,a4
    1e9e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ea0:	0141                	addi	sp,sp,16
    1ea2:	8082                	ret
        return -1;
    1ea4:	557d                	li	a0,-1
    1ea6:	bfed                	j	1ea0 <get_time+0x26>

0000000000001ea8 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ea8:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eac:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <time>:
    register long a7 __asm__("a7") = n;
    1eb4:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1eb8:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <sleep>:

int sleep(unsigned long long time)
{
    1ec0:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1ec2:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ec4:	850a                	mv	a0,sp
    1ec6:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ec8:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1ecc:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ece:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ed2:	e501                	bnez	a0,1eda <sleep+0x1a>
    return 0;
    1ed4:	4501                	li	a0,0
}
    1ed6:	0141                	addi	sp,sp,16
    1ed8:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1eda:	4502                	lw	a0,0(sp)
}
    1edc:	0141                	addi	sp,sp,16
    1ede:	8082                	ret

0000000000001ee0 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ee0:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ee4:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1eec:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ef0:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1ef4:	8082                	ret

0000000000001ef6 <munmap>:
    register long a7 __asm__("a7") = n;
    1ef6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efa:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <wait>:

int wait(int *code)
{
    1f02:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f04:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f08:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1f0a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1f0c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1f0e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1f12:	2501                	sext.w	a0,a0
    1f14:	8082                	ret

0000000000001f16 <spawn>:
    register long a7 __asm__("a7") = n;
    1f16:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f1a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <mailread>:
    register long a7 __asm__("a7") = n;
    1f22:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f26:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f2e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f32:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <fstat>:
    register long a7 __asm__("a7") = n;
    1f3a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f46:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f48:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f4c:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f4e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f52:	2501                	sext.w	a0,a0
    1f54:	8082                	ret

0000000000001f56 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f56:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f58:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f5c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f62:	2501                	sext.w	a0,a0
    1f64:	8082                	ret

0000000000001f66 <link>:

int link(char *old_path, char *new_path)
{
    1f66:	87aa                	mv	a5,a0
    1f68:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f6a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f6e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f72:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f74:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f78:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f7a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f7e:	2501                	sext.w	a0,a0
    1f80:	8082                	ret

0000000000001f82 <unlink>:

int unlink(char *path)
{
    1f82:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f84:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f88:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f8c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f92:	2501                	sext.w	a0,a0
    1f94:	8082                	ret

0000000000001f96 <uname>:
    register long a7 __asm__("a7") = n;
    1f96:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f9a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f9e:	2501                	sext.w	a0,a0
    1fa0:	8082                	ret

0000000000001fa2 <brk>:
    register long a7 __asm__("a7") = n;
    1fa2:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1fa6:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1faa:	2501                	sext.w	a0,a0
    1fac:	8082                	ret

0000000000001fae <getcwd>:
    register long a7 __asm__("a7") = n;
    1fae:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fb0:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1fb4:	8082                	ret

0000000000001fb6 <chdir>:
    register long a7 __asm__("a7") = n;
    1fb6:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1fba:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1fbe:	2501                	sext.w	a0,a0
    1fc0:	8082                	ret

0000000000001fc2 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1fc2:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1fc4:	02059613          	slli	a2,a1,0x20
    1fc8:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fca:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1fce:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fd2:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fd4:	00000073          	ecall
}
    1fd8:	2501                	sext.w	a0,a0
    1fda:	8082                	ret

0000000000001fdc <getdents>:
    register long a7 __asm__("a7") = n;
    1fdc:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fe0:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fe4:	2501                	sext.w	a0,a0
    1fe6:	8082                	ret

0000000000001fe8 <pipe>:
    register long a7 __asm__("a7") = n;
    1fe8:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fec:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fee:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ff2:	2501                	sext.w	a0,a0
    1ff4:	8082                	ret

0000000000001ff6 <dup>:
    register long a7 __asm__("a7") = n;
    1ff6:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ff8:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ffc:	2501                	sext.w	a0,a0
    1ffe:	8082                	ret

0000000000002000 <dup2>:
    register long a7 __asm__("a7") = n;
    2000:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    2002:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2004:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    2008:	2501                	sext.w	a0,a0
    200a:	8082                	ret

000000000000200c <mount>:
    register long a7 __asm__("a7") = n;
    200c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2010:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    2014:	2501                	sext.w	a0,a0
    2016:	8082                	ret

0000000000002018 <umount>:
    register long a7 __asm__("a7") = n;
    2018:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    201c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    201e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    2022:	2501                	sext.w	a0,a0
    2024:	8082                	ret

0000000000002026 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    2026:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    2028:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    202a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    202c:	8532                	mv	a0,a2
	mv a2, a4
    202e:	863a                	mv	a2,a4
	mv a3, a5
    2030:	86be                	mv	a3,a5
	mv a4, a6
    2032:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    2034:	0dc00893          	li	a7,220
	ecall
    2038:	00000073          	ecall

	beqz a0, 1f
    203c:	c111                	beqz	a0,2040 <__clone+0x1a>
	# Parent
	ret
    203e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    2040:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    2042:	6522                	ld	a0,8(sp)
	jalr a1
    2044:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2046:	05d00893          	li	a7,93
	ecall
    204a:	00000073          	ecall
