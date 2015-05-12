#SingleInstance force
#NoEnv

MyVar1 = 0
MyVar2 =

global Data
Data =
(
vH	1.0079	1	Hydrogen
vHe	4.0026	2	Helium
vLi	6.941	3	Lithium
vBe	9.0122	4	Beryllium
vB	10.811	5	Boron
vC	12.011	6	Carbon
vN	14.007	7	Nitrogen
vO	15.999	8	Oxygen
vF	18.998	9	Fluorine
vNe	20.18	10	Neon
vNa	22.99	11	Sodium
vMg	24.305	12	Magnesium
vAl	26.982	13	Aluminium
vSi	28.086	14	Silicon
vP	30.974	15	Phosphorous
vS	32.065	16	Sulphur
vCl	35.453	17	Chlorine
vAr	39.948	18	Argon
vK	39.098	19	Potassium
vCa	40.078	20	Calcium
vSc	44.956	21	Scandium
vTi	47.867	22	Titanium
vV	50.942	23	Vanadium
vCr	51.996	24	Chromium
vMn	54.938	25	Manganese
vFe	55.845	26	Iron
vCo	58.933	27	Cobalt
vNi	58.693	28	Nickel
vCu	63.546	29	Copper
vZn	65.39	30	Zinc
vGa	69.723	31	Gallium
vGe	72.64	32	Germanium
vAs	74.922	33	Arsenic
vSe	78.96	34	Selenium
vBr	79.904	35	Bromine
vKr	83.8	36	Krypton
vRb	85.468	37	Rubidium
vSr	87.62	38	Strontium
vY	88.906	39	Yttrium
vZr	91.224	40	Zirconium
vNb	92.906	41	Niobium
vMo	95.94	42	Molybdenum
vTc	98.0	43	Techntium
vRu	101.07	44	Ruthenium
vRh	102.91	45	Rhodium
vPd	106.42	46	Palladium
vAg	107.87	47	Silver
vCd	112.41	48	Cadmium
vIn	114.82	49	Indium
vSn	118.71	50	Tin
vSb	121.76	51	Antimony
vTe	127.6	52	Tellerium
vI	126.9	53	Iodine
vXe	131.29	54	Xenon
vCs	132.91	55	Caesium
vBa	137.33	56	Barium
vLa	138.91	57	Lanthanum
vCe	140.12	58	Cerium
vPr	140.91	59	Praseodymium
vNd	144.24	60	Neodynium
vPm	145.0	61	Promethium
vSm	150.36	62	Samarium
vEu	151.96	63	Europium
vGd	157.25	64	Gadolinium
vTb	158.93	65	Terbium
vDy	162.5	66	Dysprosium
vHo	164.93	67	Holmium
vEr	167.26	68	Erbium
vTm	168.93	69	Thulium
vYb	173.04	70	Ytterbium
vLu	174.97	71	Lutetium
vHf	178.49	72	Hafnium
vTa	180.95	73	Tantalum
vW	183.84	74	Tungsten
vRe	186.21	75	Rhenium
vOs	190.23	76	Osmium
vIr	192.22	77	Iridium
vPt	195.08	78	Platinum
vAu	196.97	79	Gold
vHg	200.59	80	Mercury
vTl	204.38	81	Thallium
vPb	207.2	82	Lead
vBi	208.98	83	Bismuth
vPo	209.0	84	Polonium
vAt	210.0	85	Astatine
vRn	222.0	86	Radon
vFr	223.0	87	Francium
vRa	226.0	88	Radium
vAc	227.0	89	Actinium
vTh	232.04	90	Thorium
vPa	231.04	91	Protactinium
vU	238.03	92	Uranium
vNp	237.0	93	Neptunium
vPu	244.0	94	Plutonium
vAm	243.0	95	Americium
vCm	247.0	96	Curium
vBk	247.0	97	Berkelium
vCf	251.0	98	Califormium
vEs	252.0	99	Einsteinium
vFm	257.0	100	Fermium
vMd	258.0	101	Mendelevium
vNo	259.0	102	Nobelium
vLr	262.0	103	Lawrencium
vRf	262.0	104	Rutherfordium
vDb	262.0	105	Dubnium
vSg	266.0	106	Seaborgium
vBh	264.0	107	Bohrium
vHs	277.0	108	Hassium
vMt	268.0	109	Meitnerium
vDs	281.0	110	Darmstadtium
vRg	272.0	111	Roentgenium
vCn	272.0	112	Copernicium
vUut	284	113	Ununtrium
vFl	289.0	114	Flerovium
vUup	288	115	Ununpentium
vLv	292.0	116	Livermorium
vUus	294	117	Ununseptium
vUuo	294	118	Ununoctium
vPhenyl	77.1055	x	Phenyl group
vH2O	18.0148	x	Water
)

;Buttons
Gui, Add, Button, x62 y52 w30 h30 , H
Gui, Add, Button, x572 y52 w30 h30 , He
Gui, Add, Button, x62 y82 w30 h30 , Li
Gui, Add, Button, x92 y82 w30 h30 , Be
Gui, Add, Button, x422 y82 w30 h30 , B
Gui, Add, Button, x452 y82 w30 h30 , C
Gui, Add, Button, x482 y82 w30 h30 , N
Gui, Add, Button, x512 y82 w30 h30 , O
Gui, Add, Button, x542 y82 w30 h30 , F
Gui, Add, Button, x572 y82 w30 h30 , Ne
Gui, Add, Button, x62 y112 w30 h30 , Na
Gui, Add, Button, x92 y112 w30 h30 , Mg
Gui, Add, Button, x422 y112 w30 h30 , Al
Gui, Add, Button, x452 y112 w30 h30 , Si
Gui, Add, Button, x482 y112 w30 h30 , P
Gui, Add, Button, x512 y112 w30 h30 , S
Gui, Add, Button, x542 y112 w30 h30 , Cl
Gui, Add, Button, x572 y112 w30 h30 , Ar
Gui, Add, Button, x62 y142 w30 h30 , K
Gui, Add, Button, x92 y142 w30 h30 , Ca
Gui, Add, Button, x122 y142 w30 h30 , Sc
Gui, Add, Button, x152 y142 w30 h30 , Ti
Gui, Add, Button, x182 y142 w30 h30 , V
Gui, Add, Button, x212 y142 w30 h30 , Cr
Gui, Add, Button, x242 y142 w30 h30 , Mn
Gui, Add, Button, x272 y142 w30 h30 , Fe
Gui, Add, Button, x302 y142 w30 h30 , Co
Gui, Add, Button, x332 y142 w30 h30 , Ni
Gui, Add, Button, x362 y142 w30 h30 , Cu
Gui, Add, Button, x392 y142 w30 h30 , Zn
Gui, Add, Button, x422 y142 w30 h30 , Ga
Gui, Add, Button, x452 y142 w30 h30 , Ge
Gui, Add, Button, x482 y142 w30 h30 , As
Gui, Add, Button, x512 y142 w30 h30 , Se
Gui, Add, Button, x542 y142 w30 h30 , Br
Gui, Add, Button, x572 y142 w30 h30 , Kr
Gui, Add, Button, x62 y172 w30 h30 , Rb
Gui, Add, Button, x92 y172 w30 h30 , Sr
Gui, Add, Button, x122 y172 w30 h30 , Y
Gui, Add, Button, x152 y172 w30 h30 , Zr
Gui, Add, Button, x182 y172 w30 h30 , Nb
Gui, Add, Button, x212 y172 w30 h30 , Mo
Gui, Add, Button, x242 y172 w30 h30 , Tc
Gui, Add, Button, x272 y172 w30 h30 , Ru
Gui, Add, Button, x302 y172 w30 h30 , Rh
Gui, Add, Button, x332 y172 w30 h30 , Pd
Gui, Add, Button, x362 y172 w30 h30 , Ag
Gui, Add, Button, x392 y172 w30 h30 , Cd
Gui, Add, Button, x422 y172 w30 h30 , In
Gui, Add, Button, x452 y172 w30 h30 , Sn
Gui, Add, Button, x482 y172 w30 h30 , Sb
Gui, Add, Button, x512 y172 w30 h30 , Te
Gui, Add, Button, x542 y172 w30 h30 , Br
Gui, Add, Button, x572 y172 w30 h30 , Xe
Gui, Add, Button, x62 y202 w30 h30 , Cs
Gui, Add, Button, x92 y202 w30 h30 , Ba
Gui, Add, Button, x122 y202 w30 h30 , Lu
Gui, Add, Button, x152 y202 w30 h30 , Hf
Gui, Add, Button, x182 y202 w30 h30 , Ta
Gui, Add, Button, x212 y202 w30 h30 , W
Gui, Add, Button, x242 y202 w30 h30 , Re
Gui, Add, Button, x272 y202 w30 h30 , Os
Gui, Add, Button, x302 y202 w30 h30 , Ir
Gui, Add, Button, x332 y202 w30 h30 , Pt
Gui, Add, Button, x362 y202 w30 h30 , Au
Gui, Add, Button, x392 y202 w30 h30 , Hg
Gui, Add, Button, x422 y202 w30 h30 , Tl
Gui, Add, Button, x452 y202 w30 h30 , Pb
Gui, Add, Button, x482 y202 w30 h30 , Bi
Gui, Add, Button, x512 y202 w30 h30 , Po
Gui, Add, Button, x542 y202 w30 h30 , I
Gui, Add, Button, x572 y202 w30 h30 , Rn
Gui, Add, Button, x62 y232 w30 h30 , Fr
Gui, Add, Button, x92 y232 w30 h30 , Ra
Gui, Add, Button, x122 y232 w30 h30 , Lr
Gui, Add, Button, x152 y232 w30 h30 , Rf
Gui, Add, Button, x182 y232 w30 h30 , La
Gui, Add, Button, x212 y232 w30 h30 , Sg
Gui, Add, Button, x242 y232 w30 h30 , Bh
Gui, Add, Button, x272 y232 w30 h30 , Hs
Gui, Add, Button, x302 y232 w30 h30 , Mt
Gui, Add, Button, x332 y232 w30 h30 , Ds
Gui, Add, Button, x362 y232 w30 h30 , Rg
Gui, Add, Button, x392 y232 w30 h30 , Cn
Gui, Add, Button, x422 y232 w30 h30 , Uut
Gui, Add, Button, x452 y232 w30 h30 , Fl
Gui, Add, Button, x482 y232 w30 h30 , Uup
Gui, Add, Button, x512 y232 w30 h30 , Lv
Gui, Add, Button, x542 y232 w30 h30 , Uus
Gui, Add, Button, x572 y232 w30 h30 , Uuo

Gui, Add, Button, x92 y272 w30 h30 , La
Gui, Add, Button, x122 y272 w30 h30 , Ce
Gui, Add, Button, x152 y272 w30 h30 , Pr
Gui, Add, Button, x182 y272 w30 h30 , Nd
Gui, Add, Button, x212 y272 w30 h30 , Pm
Gui, Add, Button, x242 y272 w30 h30 , Sm
Gui, Add, Button, x272 y272 w30 h30 , Eu
Gui, Add, Button, x302 y272 w30 h30 , Gd
Gui, Add, Button, x332 y272 w30 h30 , Tb
Gui, Add, Button, x362 y272 w30 h30 , Dy
Gui, Add, Button, x392 y272 w30 h30 , Ho
Gui, Add, Button, x422 y272 w30 h30 , Er
Gui, Add, Button, x452 y272 w30 h30 , Tm
Gui, Add, Button, x482 y272 w30 h30 , Yb

Gui, Add, Button, x92 y302 w30 h30 , Ac
Gui, Add, Button, x122 y302 w30 h30 , Th
Gui, Add, Button, x152 y302 w30 h30 , Pa
Gui, Add, Button, x182 y302 w30 h30 , U
Gui, Add, Button, x212 y302 w30 h30 , Np
Gui, Add, Button, x242 y302 w30 h30 , Pu
Gui, Add, Button, x272 y302 w30 h30 , Am
Gui, Add, Button, x302 y302 w30 h30 , Cm
Gui, Add, Button, x332 y302 w30 h30 , Bk
Gui, Add, Button, x362 y302 w30 h30 , Cf
Gui, Add, Button, x392 y302 w30 h30 , Es
Gui, Add, Button, x422 y302 w30 h30 , Fm
Gui, Add, Button, x452 y302 w30 h30 , Md
Gui, Add, Button, x482 y302 w30 h30 , No

Gui, Add, Button, x572 y262 w60 h30 , Phenyl
Gui, Add, Button, x572 y292 w60 h30 , H2O

;Lanth Act labels
Gui, Add, Text, x62 y272 w30 h30 , Lan
Gui, Add, Text, x62 y302 w30 h30 , Act

;Groups
Gui, Add, Text, x62 y22 w30 h30 +Center, 1
Gui, Add, Text, x92 y22 w30 h30 +Center, 2
Gui, Add, Text, x122 y22 w30 h30 +Center, 3
Gui, Add, Text, x152 y22 w30 h30 +Center, 4
Gui, Add, Text, x182 y22 w30 h30 +Center, 5
Gui, Add, Text, x212 y22 w30 h30 +Center, 6
Gui, Add, Text, x242 y22 w30 h30 +Center, 7
Gui, Add, Text, x272 y22 w30 h30 +Center, 8
Gui, Add, Text, x302 y22 w30 h30 +Center, 9
Gui, Add, Text, x332 y22 w30 h30 +Center, 10
Gui, Add, Text, x362 y22 w30 h30 +Center, 11
Gui, Add, Text, x392 y22 w30 h30 +Center, 12
Gui, Add, Text, x422 y22 w30 h30 +Center, 13
Gui, Add, Text, x452 y22 w30 h30 +Center, 14
Gui, Add, Text, x482 y22 w30 h30 +Center, 15
Gui, Add, Text, x512 y22 w30 h30 +Center, 16
Gui, Add, Text, x542 y22 w30 h30 +Center, 17
Gui, Add, Text, x572 y22 w30 h30 +Center, 18

;Periods
Gui, Add, Text, x32 y52 w30 h30 , 1
Gui, Add, Text, x32 y82 w30 h30 , 2
Gui, Add, Text, x32 y112 w30 h30 , 3
Gui, Add, Text, x32 y142 w30 h30 , 4
Gui, Add, Text, x32 y172 w30 h30 , 5
Gui, Add, Text, x32 y202 w30 h30 , 6
Gui, Add, Text, x32 y232 w30 h30 , 7

;Atomic number
Gui, Add, Checkbox, x62 y-8 w230 h30 vCheckbox, Checkbox to output as Atomic number.

;Formula work
Gui, Add, Text, x52 y332 w200 h20 vText1, %MyVar2%
Gui, Add, Text, x52 y352 w140 h20 vSum1, %MyVar1%
Gui, Add, Button, x52 y372 w60 h20 , Reset
Gui, Add, Button, x112 y372 w60 h20 , Clipboard

;Store button
Gui, Add, Button, x280 y342 w60 h20 , Store

;Stored formula
Gui, Add, Text, x352 y352 w200 h20 vText2, %MyVar3%
Gui, Add, Text, x352 y332 w140 h20 vSum2, %MyVar4%
Gui, Add, Button, x352 y372 w60 h20 , Reset.
Gui, Add, Button, x412 y372 w60 h20 , Clipboard.

;Info
Gui, Add, Text, x137 y48 w265 h90 , Left click to add an element, right click to subtract.`r`nHover for the name.

;Display GUI
Gui, Show, , Atomic and Molecular mass calc
OnMessage(0x200, "WM_MOUSEMOVE")
Return

GuiClose:
ExitApp

Esc::ExitApp

WM_MOUSEMOVE()
{
    static CurrControl, PrevControl, _TT
	global Disp_Text
    CurrControl := A_GuiControl
	
	If ( CurrControl <> PrevControl ) and ( CurrControl <> "" )
    {
        PrevControl := CurrControl
		ToolTip  ; Turn off any previous tooltip.
		Match_Splash := 0
		Loop, Parse, Data, `n , `r
		{
			StringSplit, Temp, A_LoopField, %A_Tab%
			If ( Temp0 < 4 )
				Temp4 := ,DispText :=
			StringTrimLeft, temp1, temp1, 1
			If ( Temp1 = CurrControl )
			{
				Disp_Text := Temp4
				Match_Splash = 1
				break
			}
		}
		If ( Match_Splash = 1 )
			SetTimer, DisplayToolTip, 250
    }
    return

    DisplayToolTip:
    SetTimer, DisplayToolTip, Off
    ToolTip %Disp_Text%
    SetTimer, RemoveToolTip, 3000
    return

    RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return
}

;~ ---------------------------------------------------------------------------------------------------------------
;~ Right click

GuiContextMenu:
StringLen, Length, A_GuiControl
If ( A_GuiControl = "Phenyl" )
{
	Loop, 5
	{
		This_Label := "GuiContextMenu"
		Gosub, ButtonH
	}
	Loop, 6
	{
		This_Label := "GuiContextMenu"
		Gosub, ButtonC
	}
	return
}
else If ( A_GuiControl = "H2O" )
{
	This_Label := "GuiContextMenu"
	Gosub, ButtonH2O
	return
}
else if ( A_GuiControl = "Uus" ) or ( A_GuiControl = "Uuo" ) or ( A_GuiControl = "Uut" ) or ( A_GuiControl = "Uup" )
{
	Three_letters := 1
}
else If ( Length > 2 )
	return
else If ( A_GuiControl = "" )
	return
else if A_GuiControl is number
	return

This_Label := A_ThisLabel
Gosub, Button%A_GuiControl%
Return

;~ ---------------------------------------------------------------------------------------------------------------
;Buttons

ButtonStore:
MyVar3 = %MyVar1%
MyVar4 = %Myvar2%
GuiControl, , Text2, %MyVar3%
GuiControl, , Sum2, %MyVar4%
This_Label := A_ThisLabel
Return

ButtonReset:
EleString :=
Loop, Parse, Data, `n, `r
{
	StringSplit, Temp, A_LoopField, %A_Tab%
	Ele_Temp :=
	Ele_Temp := Temp1
	StringTrimLeft, Ele_Temp, Ele_Temp, 1
	%Ele_Temp% :=
}
MyVar1 = 0
MyVar2 =
GuiControl, , Text1, %MyVar2%
GuiControl, , Sum1, %MyVar1%
This_Label := A_ThisLabel
Return

ButtonReset.:
MyVar3 = 0
MyVar4 = 
GuiControl, , Text2, %MyVar3%
GuiControl, , Sum2, %MyVar4%
This_Label := A_ThisLabel
Return

ButtonClipboard:
Clipboard = %MyVar1%
TrayTip, Atomic/Molecular weight ouputter, Copied "%MyVar1%", 1, 16
This_Label := A_ThisLabel
Return

ButtonClipboard.:
Clipboard = %MyVar3%
TrayTip, Atomic/Molecular weight ouputter, Copied "%MyVar3%", 1, 16
This_Label := A_ThisLabel
Return

ButtonH:
ButtonHe:
ButtonLi:
ButtonBe:
ButtonB:
ButtonC:
ButtonN:
ButtonO:
ButtonF:
ButtonNe:
ButtonNa:
ButtonMg:
ButtonAl:
ButtonSi:
ButtonP:
ButtonS:
ButtonCl:
ButtonAr:
ButtonK:
ButtonCa:
ButtonSc:
ButtonTi:
ButtonV:
ButtonCr:
ButtonMn:
ButtonFe:
ButtonCo:
ButtonNi:
ButtonCu:
ButtonZn:
ButtonGa:
ButtonGe:
ButtonAs:
ButtonSe:
ButtonBr:
ButtonKr:
ButtonRb:
ButtonSr:
ButtonY:
ButtonZr:
ButtonNb:
ButtonMo:
ButtonTc:
ButtonRu:
ButtonRh:
ButtonPd:
ButtonAg:
ButtonCd:
ButtonIn:
ButtonSn:
ButtonSb:
ButtonTe:
ButtonI:
ButtonXe:
ButtonCs:
ButtonBa:
ButtonLa:
ButtonCe:
ButtonPr:
ButtonNd:
ButtonPm:
ButtonSm:
ButtonEu:
ButtonGd:
ButtonTb:
ButtonDy:
ButtonHo:
ButtonEr:
ButtonTm:
ButtonYb:
ButtonLu:
ButtonHf:
ButtonTa:
ButtonW:
ButtonRe:
ButtonOs:
ButtonIr:
ButtonPt:
ButtonAu:
ButtonHg:
ButtonTl:
ButtonPb:
ButtonBi:
ButtonPo:
ButtonAt:
ButtonRn:
ButtonFr:
ButtonRa:
ButtonAc:
ButtonTh:
ButtonPa:
ButtonU:
ButtonNp:
ButtonPu:
ButtonAm:
ButtonCm:
ButtonBk:
ButtonCf:
ButtonEs:
ButtonFm:
ButtonMd:
ButtonNo:
ButtonLr:
ButtonRf:
ButtonDb:
ButtonSg:
ButtonBh:
ButtonHs:
ButtonMt:
ButtonDs:
ButtonRg:
ButtonCn:
ButtonUut:
ButtonFl:
ButtonUup:
ButtonLv:
ButtonUus:
ButtonUuo:
ButtonH2O:

StringReplace, Element, A_ThisLabel, Button, v
StringTrimLeft, Ele, Element, 1
Loop, Parse, Data, `n, `r
{
	StringSplit, Temp, A_LoopField, %A_Tab%
	If ( Element = Temp1 )
	{
		Atomic_m := Temp2
		An := Temp3
		Break
	}
}

Gui, submit, nohide
if ( Checkbox = 1 )
{
	Clipboard := An
}
else
{
	None_to_sub := 0
	If ( This_Label = "GuiContextMenu" ) ;right click (subtract)
	{
		If ( %Ele% = 0 ) or ( %Ele% = "" )
			None_to_sub := 1
		%Ele% := ( %Ele% = "" ) ? ( "" ) : ( %Ele% > 1 ) ? ( %Ele% - 1 ) : ( "" )
		
	}
	else
		%Ele% := ( %Ele% = "" ) ? ( 1 ) : ( %Ele% + 1 )
	

	EleString :=
	Loop, Parse, Data, `n, `r
	{
		StringSplit, Temp, A_LoopField, %A_Tab%
		Ele_Temp :=
		Ele_Temp := Temp1
		StringTrimLeft, Ele_Temp, Ele_Temp, 1
		
		If ( %Ele_Temp% <> "" )
			EleString := ( EleString = "" ) ? ( Ele_Temp . "." . %Ele_Temp% ) : ( EleString . " " . Ele_Temp . "." . %Ele_Temp% )
	}

	If ( This_Label = "GuiContextMenu" ) 
	{
		if  ( None_to_sub = 0 )
			MyVar1 := MyVar1+(Atomic_m*-1)
	}
	else
		MyVar1 := MyVar1+Atomic_m
	
	MyVar1 := ( MyVar1 = 0 ) ? ( "0" ) : ( Myvar1 < 0.001 ) ? ( "0" ) : ( MyVar1 )
	
	MyVar2 := EleString
	GuiControl, , Text1, %EleString%
	GuiControl, , Sum1, %MyVar1%
}

This_Label := A_ThisLabel
return

ButtonPhenyl:
loop, 6
	Gosub, ButtonC
Loop, 5
	Gosub, ButtonH

This_Label := A_ThisLabel
return