; Listing generated by Microsoft (R) Optimizing Compiler Version 14.00.50727.762 

	TITLE	i:\os\09\g\krnl\krnl\wait.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?wait@@YAHPAH@Z					; wait
EXTRN	?send_recv@@YAHHHPAU_tagMESSAGE@@@Z:PROC	; send_recv
; Function compile flags: /Ogtpy
; File i:\os\09\g\krnl\krnl\wait.cpp
;	COMDAT ?wait@@YAHPAH@Z
_TEXT	SEGMENT
_msg$ = -48						; size = 48
_code$ = 8						; size = 4
?wait@@YAHPAH@Z PROC					; wait, COMDAT

; 4    : {

	sub	esp, 48					; 00000030H

; 5    : 	MESSAGE msg;
; 6    : 
; 7    : 	msg.type = WAIT;
; 8    : 	send_recv(BOTH,ANY_TASK,&msg);

	lea	eax, DWORD PTR _msg$[esp+48]
	push	eax
	push	46					; 0000002eH
	push	3
	mov	DWORD PTR _msg$[esp+64], 1013		; 000003f5H
	call	?send_recv@@YAHHHPAU_tagMESSAGE@@@Z	; send_recv

; 9    : 	*code = msg.STATUS;

	mov	ecx, DWORD PTR _code$[esp+56]
	mov	edx, DWORD PTR _msg$[esp+68]

; 10   : 
; 11   : 	return msg.PID;

	mov	eax, DWORD PTR _msg$[esp+72]
	mov	DWORD PTR [ecx], edx

; 12   : }

	add	esp, 60					; 0000003cH
	ret	0
?wait@@YAHPAH@Z ENDP					; wait
_TEXT	ENDS
END