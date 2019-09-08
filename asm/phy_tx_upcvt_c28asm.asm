_PHY_txUpCvt_c28asm:
	MOVL         *SP++, XAR1
	MOVL         *SP++, XAR2
	MOVL         *SP++, XAR3
	SETC         SXM|OVM
	MOVZ         AR2, AL
	SUBB         XAR2, #1
	SPM          #0
	MOVL         XAR7, XAR5
	MOVL         XAR6, #_PHY_rxDnCvtLut	
	MOV          AL, *+XAR4[0]
	MOV          AR0, AL
_phy_txUpCvt_loop:
	MOVL         ACC, *+XAR6[AR0]
	MOV          T, AH
	MPY          P, T, *+XAR7[1]
	MOV          T, AL
	MPY          ACC, T, *+XAR7[0]
	ADDL         ACC, P
	ADD          ACC, #2048	
	MOVH         *+XAR7[0], ACC << 4	
	ADDB         XAR7, #2
	ADDB         XAR0, #2
	AND          AR0, #0x01ff	
	BANZ         _phy_txUpCvt_loop,AR2--	
	MOV          AL, AR0
	MOV          *+XAR4[0], AL
	SPM          #0
	MOVL         XAR3, *--SP
	MOVL         XAR2, *--SP
	MOVL         XAR1, *--SP
	LRETR        
