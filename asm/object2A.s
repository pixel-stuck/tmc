	.include "asm/macros.inc"

	.include "constants/constants.inc"

	.syntax unified

	.text


	thumb_func_start Object2A
Object2A: @ 0x08089B00
	push {lr}
	ldr r2, _08089B14 @ =gUnk_08120DD0
	ldrb r1, [r0, #0xc]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {pc}
	.align 2, 0
_08089B14: .4byte gUnk_08120DD0

	thumb_func_start sub_08089B18
sub_08089B18: @ 0x08089B18
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r2, #1
	movs r6, #1
	strb r6, [r4, #0xc]
	ldrb r1, [r4, #0x18]
	movs r5, #4
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #0x18]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _08089B38
	strb r0, [r4, #0xe]
_08089B38:
	adds r0, r4, #0
	movs r1, #0
	bl InitializeAnimation
	ldrb r0, [r4, #0xa]
	cmp r0, #2
	beq _08089B66
	cmp r0, #2
	bgt _08089B50
	cmp r0, #1
	beq _08089B5A
	b _08089B96
_08089B50:
	cmp r0, #3
	beq _08089B72
	cmp r0, #4
	beq _08089B7C
	b _08089B96
_08089B5A:
	ldrh r0, [r4, #0x32]
	subs r0, #8
	strh r0, [r4, #0x32]
	movs r0, #0x28
	strb r0, [r4, #0xe]
	b _08089B96
_08089B66:
	movs r0, #0xf
	strb r0, [r4, #0xe]
	adds r0, r4, #0
	bl sub_08004168
	b _08089B96
_08089B72:
	ldr r0, [r4, #0x50]
	adds r1, r4, #0
	bl CopyPosition
	b _08089B96
_08089B7C:
	adds r0, r4, #0
	adds r0, #0x86
	ldrh r0, [r0]
	bl CheckFlags
	cmp r0, #0
	bne _08089B96
	ldrb r1, [r4, #0x18]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #0x18]
	strb r6, [r4, #0xd]
	b _08089B9E
_08089B96:
	movs r0, #0x92
	lsls r0, r0, #1
	bl sub_08004488
_08089B9E:
	pop {r4, r5, r6, pc}

	thumb_func_start sub_08089BA0
sub_08089BA0: @ 0x08089BA0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetNextFrame
	ldrb r0, [r5, #0xa]
	cmp r0, #4
	bhi _08089BD0
	lsls r0, r0, #2
	ldr r1, _08089BB8 @ =_08089BBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08089BB8: .4byte _08089BBC
_08089BBC: @ jump table
	.4byte _08089BD0 @ case 0
	.4byte _08089BD6 @ case 1
	.4byte _08089BD6 @ case 2
	.4byte _08089C4C @ case 3
	.4byte _08089C72 @ case 4
_08089BD0:
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	beq _08089CBA
_08089BD6:
	ldrb r0, [r5, #0xe]
	subs r0, #1
	strb r0, [r5, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08089CBA
	ldrb r0, [r5, #0xa]
	cmp r0, #2
	bne _08089C42
	ldr r0, [r5, #0x54]
	ldrh r0, [r0, #6]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r3, _08089C48 @ =gRoomControls
	ldrh r2, [r3, #6]
	subs r1, r1, r2
	asrs r1, r1, #4
	movs r4, #0x3f
	ands r1, r4
	movs r6, #0x32
	ldrsh r2, [r5, r6]
	ldrh r3, [r3, #8]
	subs r2, r2, r3
	asrs r2, r2, #4
	ands r2, r4
	lsls r2, r2, #6
	orrs r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	bl sub_0807B7D8
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_0807AB44
	subs r4, #0x4f
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl sub_0807AB44
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_0807AB44
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807AB44
_08089C42:
	bl DeleteThisEntity
	b _08089CBA
	.align 2, 0
_08089C48: .4byte gRoomControls
_08089C4C:
	ldr r0, [r5, #0x50]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _08089C58
	bl DeleteThisEntity
_08089C58:
	ldrb r0, [r5, #0xe]
	subs r0, #1
	strb r0, [r5, #0xe]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08089C68
	bl DeleteThisEntity
_08089C68:
	ldr r0, [r5, #0x50]
	adds r1, r5, #0
	bl CopyPosition
	b _08089CBA
_08089C72:
	adds r0, r5, #0
	adds r0, #0x86
	ldrh r0, [r0]
	bl CheckFlags
	adds r1, r0, #0
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	bne _08089C96
	cmp r1, #0
	bne _08089CBA
	movs r0, #1
	strb r0, [r5, #0xd]
	ldrb r1, [r5, #0x18]
	subs r0, #5
	ands r0, r1
	strb r0, [r5, #0x18]
	b _08089CBA
_08089C96:
	cmp r1, #0
	beq _08089CBA
	movs r0, #0
	strb r0, [r5, #0xd]
	ldrb r1, [r5, #0x18]
	subs r0, #4
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0x18]
	adds r0, r5, #0
	movs r1, #0
	bl InitializeAnimation
	movs r0, #0x92
	lsls r0, r0, #1
	bl sub_08004488
_08089CBA:
	pop {r4, r5, r6, pc}
