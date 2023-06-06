	.include "asm/macros.inc"
	.include "overlay_12_02265E28.inc"
	.include "global.inc"

	.text

    thumb_func_start ov12_02265E28
ov12_02265E28: ; 0x02265E28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl ov12_0223A8E4
	str r0, [sp, #0x24]
	ldr r0, [r5, #4]
	bl ov12_0223A8EC
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	bl ov12_0223B52C
	add r7, r0, #0
	ldrb r0, [r5, #8]
	cmp r0, #0
	ldrb r0, [r5, #9]
	bne _02265E6E
	lsl r1, r0, #1
	ldr r0, _02265F1C ; =ov12_0226E0D0
	ldrh r3, [r0, r1]
	ldr r0, _02265F20 ; =0x00004E2D
	mov r1, #0x80
	str r1, [sp, #0x1c]
	add r6, r0, #0
	mov r1, #0x81
	sub r6, #8
	str r1, [sp, #0x18]
	b _02265E82
_02265E6E:
	lsl r1, r0, #1
	ldr r0, _02265F24 ; =ov12_0226E0A0
	ldrh r3, [r0, r1]
	ldr r0, _02265F28 ; =0x00004E2E
	mov r1, #0x83
	str r1, [sp, #0x1c]
	add r6, r0, #0
	mov r1, #0x84
	sub r6, #8
	str r1, [sp, #0x18]
_02265E82:
	mov r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	add r2, r4, #0
	bl sub_0200D504
	ldr r0, [r5, #4]
	bl ov12_0223A938
	str r4, [sp]
	ldrb r1, [r5, #9]
	mov r2, #6
	add r3, r1, #0
	mul r3, r2
	ldr r2, _02265F2C ; =ov12_0226E168
	lsl r1, r7, #1
	add r2, r2, r3
	ldrh r1, [r1, r2]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, _02265F30 ; =0x00004E29
	str r1, [sp, #0x14]
	mov r1, #2
	bl sub_0200D68C
	ldr r0, [r5, #4]
	bl ov12_0223A938
	mov r1, #0
	str r1, [sp]
	mov r1, #0x20
	str r1, [sp, #4]
	mov r1, #0x70
	str r1, [sp, #8]
	ldrb r2, [r5, #9]
	mov r3, #6
	lsl r5, r7, #1
	mul r3, r2
	ldr r2, _02265F2C ; =ov12_0226E168
	mov r1, #8
	add r2, r2, r3
	ldrh r2, [r5, r2]
	mov r3, #5
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x1c]
	add r2, r4, #0
	str r6, [sp, #4]
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x18]
	add r2, r4, #0
	str r6, [sp, #4]
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_Delete
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02265F1C: .word ov12_0226E0D0
_02265F20: .word 0x00004E2D
_02265F24: .word ov12_0226E0A0
_02265F28: .word 0x00004E2E
_02265F2C: .word ov12_0226E168
_02265F30: .word 0x00004E29
	thumb_func_end ov12_02265E28

	thumb_func_start ov12_02265F34
ov12_02265F34: ; 0x02265F34
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov12_0223A8E4
	add r5, r0, #0
	ldr r0, [r4, #4]
	bl ov12_0223A8EC
	add r1, r0, #0
	add r0, r5, #0
	ldrb r3, [r4, #8]
	mov r2, #0x34
	ldr r5, _02265F64 ; =ov12_0226E100
	mul r2, r3
	add r2, r5, r2
	bl sub_0200D734
	str r0, [r4]
	ldr r0, [r0]
	bl sub_0200DC0C
	pop {r3, r4, r5, pc}
	nop
_02265F64: .word ov12_0226E100
	thumb_func_end ov12_02265F34

	thumb_func_start ov12_02265F68
ov12_02265F68: ; 0x02265F68
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02265F7A
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r4]
_02265F7A:
	pop {r4, pc}
	thumb_func_end ov12_02265F68

	thumb_func_start ov12_02265F7C
ov12_02265F7C: ; 0x02265F7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl ov12_0223A8EC
	add r4, r0, #0
	ldrb r0, [r5, #8]
	cmp r0, #0
	bne _02265F92
	ldr r1, _02265FB8 ; =0x00004E2D
	b _02265F94
_02265F92:
	ldr r1, _02265FBC ; =0x00004E2E
_02265F94:
	add r5, r1, #0
	add r0, r4, #0
	sub r5, #8
	bl sub_0200D958
	ldr r1, _02265FC0 ; =0x00004E29
	add r0, r4, #0
	bl sub_0200D968
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0200D978
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0200D988
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02265FB8: .word 0x00004E2D
_02265FBC: .word 0x00004E2E
_02265FC0: .word 0x00004E29
	thumb_func_end ov12_02265F7C

	thumb_func_start ov12_02265FC4
ov12_02265FC4: ; 0x02265FC4
	push {r3, lr}
	ldr r0, [r0]
	cmp r0, #0
	beq _02265FD0
	bl sub_0200DCE8
_02265FD0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02265FC4

	thumb_func_start ov12_02265FD4
ov12_02265FD4: ; 0x02265FD4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #0
	add r1, r5, #0
	mov r2, #0x10
	add r7, r3, #0
	bl MIi_CpuClearFast
	str r4, [r5, #4]
	strb r6, [r5, #8]
	strb r7, [r5, #9]
	cmp r7, #0x18
	blt _02265FFA
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r5, #9]
_02265FFA:
	add r0, r5, #0
	bl ov12_02265E28
	add r0, r5, #0
	bl ov12_02265F34
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02265FD4

	thumb_func_start ov12_02266008
ov12_02266008: ; 0x02266008
	push {r4, lr}
	add r4, r0, #0
	bl ov12_02265F68
	add r0, r4, #0
	bl ov12_02265F7C
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x10
	bl MIi_CpuClearFast
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_02266008

    .rodata

    ov12_0226E0A0: ; 0x0226E0A0
	.byte 0x88, 0x00, 0x92, 0x00, 0x82, 0x00, 0x98, 0x00, 0x8C, 0x00, 0x96, 0x00, 0x8E, 0x00, 0x86, 0x00
	.byte 0x8A, 0x00, 0x90, 0x00, 0x94, 0x00, 0x94, 0x00, 0x9A, 0x00, 0x9C, 0x00, 0x9E, 0x00, 0xA0, 0x00
	.byte 0xA2, 0x00, 0xA4, 0x00, 0xA6, 0x00, 0xA8, 0x00, 0xAA, 0x00, 0xAC, 0x00, 0xAE, 0x00, 0xB0, 0x00

ov12_0226E0D0: ; 0x0226E0D0
	.byte 0x87, 0x00, 0x91, 0x00, 0x7F, 0x00, 0x97, 0x00, 0x8B, 0x00, 0x95, 0x00, 0x8D, 0x00, 0x85, 0x00
	.byte 0x89, 0x00, 0x8F, 0x00, 0x93, 0x00, 0x97, 0x00, 0x99, 0x00, 0x9B, 0x00, 0x9D, 0x00, 0x9F, 0x00
	.byte 0xA1, 0x00, 0xA3, 0x00, 0xA5, 0x00, 0xA7, 0x00, 0xA9, 0x00, 0xAB, 0x00, 0xAD, 0x00, 0xAF, 0x00

ov12_0226E100: ; 0x0226E100
	.byte 0x50, 0x01, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x2D, 0x4E, 0x00, 0x00, 0x29, 0x4E, 0x00, 0x00, 0x25, 0x4E, 0x00, 0x00
	.byte 0x25, 0x4E, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0xFF, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2E, 0x4E, 0x00, 0x00, 0x29, 0x4E, 0x00, 0x00
	.byte 0x26, 0x4E, 0x00, 0x00, 0x26, 0x4E, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226E168: ; 0x0226E168
	.byte 0x07, 0x00, 0x08, 0x00, 0x09, 0x00, 0x16, 0x00
	.byte 0x17, 0x00, 0x18, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x21, 0x00
	.byte 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x12, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x13, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x1B, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x1B, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x29, 0x00
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00
	.byte 0x32, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00, 0x39, 0x00
	.byte 0x3A, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x40, 0x00, 0x41, 0x00
	.byte 0x42, 0x00, 0x43, 0x00, 0x44, 0x00, 0x45, 0x00
