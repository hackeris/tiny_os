; Listing generated by Microsoft (R) Optimizing Compiler Version 14.00.50727.762 

	TITLE	i:\os\10\a\krnl\krnl\size.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?size@@YAHH@Z					; size
EXTRN	?send_recv@@YAHHHPAU_tagMESSAGE@@@Z:PROC	; send_recv
; Function compile flags: /Ogtpy
; File i:\os\10\a\krnl\krnl\size.cpp
;	COMDAT ?size@@YAHH@Z
_TEXT	SEGMENT
_msg$ = -48						; size = 48
_fd$ = 8						; size = 4
?size@@YAHH@Z PROC					; size, COMDAT

; 7    : {

	sub	esp, 48					; 00000030H

; 8    : 	MESSAGE msg;
; 9    : 
; 10   : 	msg.FD = fd;

	mov	eax, DWORD PTR _fd$[esp+44]

; 11   : 	msg.type = SIZE;
; 12   : 
; 13   : 	send_recv(BOTH,TASK_FS,&msg);

	lea	ecx, DWORD PTR _msg$[esp+48]
	push	ecx
	push	3
	push	3
	mov	DWORD PTR _msg$[esp+68], eax
	mov	DWORD PTR _msg$[esp+64], 1010		; 000003f2H
	call	?send_recv@@YAHHHPAU_tagMESSAGE@@@Z	; send_recv

; 14   : 
; 15   : 	return msg.RETVAL;

	mov	eax, DWORD PTR _msg$[esp+68]

; 16   : }

	add	esp, 60					; 0000003cH
	ret	0
?size@@YAHH@Z ENDP					; size
_TEXT	ENDS
END