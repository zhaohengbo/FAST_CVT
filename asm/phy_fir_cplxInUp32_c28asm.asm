_PHY_firCplxInUp32_c28asm:
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
	MOVL         XAR6, *+XAR4[0]
	MOV          AL, *+XAR4[2]
	MOV          AH, *+XAR4[2]
	LSL          AH, 1
	MOVZ         AR1, AH
	SUBB         XAR1, #2
	LSR          AL, 1
	ADDB         AL, #-1
	MOVZ         AR5, AL
	MOVZ         AR0, @AR5
_phy_firCplxInUp32_loop1:
	ZAPA         
	DMAC         ACC:P, *AR6%++, *XAR7++
	DMAC         ACC:P, *AR6%++, *XAR7++
	SUBB         XAR7, #4
	ADD          ACC, #1024
	MOVH         AR4, ACC << 5
	MOVL         ACC, P
	ADD          ACC, #1024
	MOVH         *XAR3++, ACC << 5
	MOV          *XAR3++, AR4
	BANZ         _phy_firCplxInUp32_loop1,AR5--
	ADDB         XAR7, #2
	MOV          AR5, AR0
	BANZ         _phy_firCplxInUp32_loop1,AR2--
	SPM          #0
	SUBB         SP, #2
	MOVL         XAR3, *--SP
	MOVL         XAR2, *--SP
	MOVL         XAR1, *--SP
	LRETR        
