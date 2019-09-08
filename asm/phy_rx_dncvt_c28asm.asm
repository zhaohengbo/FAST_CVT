_PHY_rxDnCvt_c28asm:
	MOVL         *SP++, XAR1
	MOVL         *SP++, XAR2
	MOVL         *SP++, XAR3
	ADDB         SP, #2
	MOVL         XAR3, *-SP[12]
	SETC         SXM|OVM
	MOVZ         AR2, AL
	SUBB         XAR2, #1
	SPM          #0
	MOVL         XAR7, XAR5
	MOVL         XAR6, #_PHY_rxDnCvtLut
	MOVB         XAR1, #0x7f
	MOVL         ACC, XAR6
	ADD          ACC, *+XAR4[0]
	ADD          ACC, *+XAR4[0]
	MOVL         XAR6, ACC
_phy_rxDnCvt_loop:
	MOV          T, *+XAR7[0]
	MPY          ACC, T, *AR6%++
	MOVH         *XAR3++, ACC << 4
	MOV          T, *XAR7++
	MPY          ACC, T, *AR6%++
	MOVH         *XAR3++, ACC << 4
	BANZ         _phy_rxDnCvt_loop,AR2--
	MOVL         XAR5, #_PHY_rxDnCvtLut
	MOVL         ACC, XAR6
	SUBL         ACC, XAR5
	SFR          ACC, 1
	MOV          *+XAR4[0], AL
	SPM          #0
	SUBB         SP, #2
	MOVL         XAR3, *--SP
	MOVL         XAR2, *--SP
	MOVL         XAR1, *--SP
	LRETR        
