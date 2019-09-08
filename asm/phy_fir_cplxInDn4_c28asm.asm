_PHY_firCplxInDn4_c28asm:
	MOVL         *SP++, XAR1
	MOVL         *SP++, XAR2
	MOVL         *SP++, XAR3
	LSR          AL, 2
	ADDB         SP, #2
	MOVL         XAR3, *-SP[12]
	SETC         SXM|OVM
	MOVZ         AR2, AL
	SUBB         XAR2, #1
	MOVB         XAR0, #0x4
	SPM          #0
	MOVL         XAR7, XAR5
	MOVL         XAR6, *+XAR4[0]
	MOVL         XAR5, *+XAR4[2]
	MOV          AL, *+XAR4[2]
	SUBB         XAR5, #1
	LSL          AL, 1
	MOVZ         AR1, AL
	SUBB         XAR1, #2
	MOVL         XAR0, XAR7
_phy_firCplxInDn4_loop:
	ZAPA         
	RPT          AR5
	||DMAC       ACC:P, *AR6%++, *XAR7++
	ADD          ACC, #512
	SFR          ACC, 10
	MOV          AR4, AL
	MOVL         ACC, P
	ADDB         XAR0, #8
	MOVL         XAR7, XAR0
	ADD          ACC, #512
	SFR          ACC, 10
	MOV          *XAR3++, AL
	MOV          *XAR3++, AR4
	BANZ         _phy_firCplxInDn4_loop,AR2--
	SPM          #0
	SUBB         SP, #2
	MOVL         XAR3, *--SP
	MOVL         XAR2, *--SP
	MOVL         XAR1, *--SP
	LRETR        
