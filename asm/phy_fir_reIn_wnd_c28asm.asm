_PHY_firReIn_wnd_c28asm:
   MOVL         *SP++, XAR1
   MOVL         *SP++, XAR2
   MOVL         *SP++, XAR3
   ADDB         SP, #2
   MOVL         XAR3, *-SP[12]
   SETC         SXM|OVM
   MOVZ         AR2, AL
   SUBB         XAR2, #1
   MOVL         XAR0, #_PHY_txWnd
   SPM          #0
   MOVL         XAR7, XAR5
   MOVL         XAR6, *+XAR4[0]
   MOV          AL, *+XAR4[2]
   MOVL         XAR1, *+XAR4[2]
   MOVZ         AR4, AL
   SUBB         XAR1, #1
   SUBB         XAR4, #1
_phy_firReIn_wnd_loop:
   ZAPA         
   RPT          AR4
 ||MAC          P, *AR6%++, *XAR7++
   ADDB         XAR5, #1
   MOVL         XAR7, XAR5
   ADDL         ACC, P
   SFR          ACC, 5
   MOV          T, AL
   MPY          ACC, T, *XAR0++
   SFR          ACC, 12
   MOV          DP, #_PHY_txClipLev
   MOV          AH, @_PHY_txClipLev
   MIN          AL, @AH
   NEG          AH
   MAX          AL, @AH
   MOV          DP, #_PHY_tx_data_s
   MOV          T, @_PHY_tx_data_s
   MPY          ACC, T, AL
   SFR          ACC, 13
   MOV          DP, #_HAL_afe_epwm_handle_s
   MOV          T, @_HAL_afe_epwm_handle_s+0x7
   MPY          ACC, T, AL
   ADD          ACC, @_HAL_afe_epwm_handle_s+0x7 << 15
   MOV          DP, #_HAL_afe_epwm_handle_s
   MOV          T, @_HAL_afe_epwm_handle_s+0x6
   MPYU         P, T, AL
   SPM          #1
   MOVH         AL, P
   LSL          AL, 7
   ADD          ACC, #384
   MOVL         *XAR3++, ACC
   SPM          #0
   BANZ         _phy_firReIn_wnd_loop,AR2--
   SPM          #0
   SUBB         SP, #2
   MOVL         XAR3, *--SP
   MOVL         XAR2, *--SP
   MOVL         XAR1, *--SP
   LRETR        
