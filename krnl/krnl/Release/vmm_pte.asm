; Listing generated by Microsoft (R) Optimizing Compiler Version 14.00.50727.762 

	TITLE	i:\os\10\a\krnl\krnl\vmm_pte.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?pt_entry_add_attrib@@YAXPAII@Z			; pt_entry_add_attrib
; Function compile flags: /Ogtpy
; File i:\os\10\a\krnl\krnl\vmm_pte.cpp
;	COMDAT ?pt_entry_add_attrib@@YAXPAII@Z
_TEXT	SEGMENT
_e$ = 8							; size = 4
_attrib$ = 12						; size = 4
?pt_entry_add_attrib@@YAXPAII@Z PROC			; pt_entry_add_attrib, COMDAT

; 6    : 	*e |= attrib;

	mov	eax, DWORD PTR _e$[esp-4]
	mov	ecx, DWORD PTR _attrib$[esp-4]
	or	DWORD PTR [eax], ecx

; 7    : }

	ret	0
?pt_entry_add_attrib@@YAXPAII@Z ENDP			; pt_entry_add_attrib
_TEXT	ENDS
PUBLIC	?pt_entry_del_attrib@@YAXPAII@Z			; pt_entry_del_attrib
; Function compile flags: /Ogtpy
;	COMDAT ?pt_entry_del_attrib@@YAXPAII@Z
_TEXT	SEGMENT
_e$ = 8							; size = 4
_attrib$ = 12						; size = 4
?pt_entry_del_attrib@@YAXPAII@Z PROC			; pt_entry_del_attrib, COMDAT

; 11   : 	*e &= ~attrib;

	mov	ecx, DWORD PTR _attrib$[esp-4]
	mov	eax, DWORD PTR _e$[esp-4]
	not	ecx
	and	DWORD PTR [eax], ecx

; 12   : }

	ret	0
?pt_entry_del_attrib@@YAXPAII@Z ENDP			; pt_entry_del_attrib
_TEXT	ENDS
PUBLIC	?pt_entry_set_frame@@YAXPAII@Z			; pt_entry_set_frame
; Function compile flags: /Ogtpy
;	COMDAT ?pt_entry_set_frame@@YAXPAII@Z
_TEXT	SEGMENT
_e$ = 8							; size = 4
_addr$ = 12						; size = 4
?pt_entry_set_frame@@YAXPAII@Z PROC			; pt_entry_set_frame, COMDAT

; 16   : 	*e = (*e & ~I86_PTE_FRAME) | addr;

	mov	eax, DWORD PTR _e$[esp-4]
	mov	ecx, DWORD PTR [eax]
	and	ecx, -2147479553			; 80000fffH
	or	ecx, DWORD PTR _addr$[esp-4]
	mov	DWORD PTR [eax], ecx

; 17   : }

	ret	0
?pt_entry_set_frame@@YAXPAII@Z ENDP			; pt_entry_set_frame
_TEXT	ENDS
PUBLIC	?pt_entry_is_present@@YA_NI@Z			; pt_entry_is_present
; Function compile flags: /Ogtpy
;	COMDAT ?pt_entry_is_present@@YA_NI@Z
_TEXT	SEGMENT
_e$ = 8							; size = 4
?pt_entry_is_present@@YA_NI@Z PROC			; pt_entry_is_present, COMDAT

; 21   : 	return e & I86_PTE_PRESENT;

	mov	eax, DWORD PTR _e$[esp-4]
	and	eax, 1

; 22   : }

	ret	0
?pt_entry_is_present@@YA_NI@Z ENDP			; pt_entry_is_present
_TEXT	ENDS
PUBLIC	?pt_entry_is_writable@@YA_NI@Z			; pt_entry_is_writable
; Function compile flags: /Ogtpy
;	COMDAT ?pt_entry_is_writable@@YA_NI@Z
_TEXT	SEGMENT
_e$ = 8							; size = 4
?pt_entry_is_writable@@YA_NI@Z PROC			; pt_entry_is_writable, COMDAT

; 26   : 	return e & I86_PTE_WRITABLE;

	mov	eax, DWORD PTR _e$[esp-4]
	shr	eax, 1
	and	al, 1

; 27   : }

	ret	0
?pt_entry_is_writable@@YA_NI@Z ENDP			; pt_entry_is_writable
_TEXT	ENDS
PUBLIC	?pt_entry_pfn@@YAII@Z				; pt_entry_pfn
; Function compile flags: /Ogtpy
;	COMDAT ?pt_entry_pfn@@YAII@Z
_TEXT	SEGMENT
_e$ = 8							; size = 4
?pt_entry_pfn@@YAII@Z PROC				; pt_entry_pfn, COMDAT

; 31   : 	return e & I86_PTE_FRAME;

	mov	eax, DWORD PTR _e$[esp-4]
	and	eax, 2147479552				; 7ffff000H

; 32   : }

	ret	0
?pt_entry_pfn@@YAII@Z ENDP				; pt_entry_pfn
_TEXT	ENDS
END