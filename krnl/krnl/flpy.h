#ifndef _H_FLPY
#define _H_FLPY
#include "ctype.h"
#include "irq.h"
#include "config.h"

enum FLPYDSK_IO {
	FLPYDSK_DOR		=	0x3f2,
	FLPYDSK_MSR		=	0x3f4,
	FLPYDSK_FIFO	=	0x3f5,	//data register
	FLPYDSK_CTRL	=	0x3f7
};

enum FLPYDSK_DOR_MASK {
 
	FLPYDSK_DOR_MASK_DRIVE0				=	0,	//00000000	= here for completeness sake
	FLPYDSK_DOR_MASK_DRIVE1				=	1,	//00000001
	FLPYDSK_DOR_MASK_DRIVE2				=	2,	//00000010
	FLPYDSK_DOR_MASK_DRIVE3				=	3,	//00000011
	FLPYDSK_DOR_MASK_RESET				=	4,	//00000100
	FLPYDSK_DOR_MASK_DMA				=	8,	//00001000
	FLPYDSK_DOR_MASK_DRIVE0_MOTOR		=	16,	//00010000
	FLPYDSK_DOR_MASK_DRIVE1_MOTOR		=	32,	//00100000
	FLPYDSK_DOR_MASK_DRIVE2_MOTOR		=	64,	//01000000
	FLPYDSK_DOR_MASK_DRIVE3_MOTOR		=	128	//10000000
};

enum FLPYDSK_MSR_MASK {
 
	FLPYDSK_MSR_MASK_DRIVE1_POS_MODE	=	1,	//00000001
	FLPYDSK_MSR_MASK_DRIVE2_POS_MODE	=	2,	//00000010
	FLPYDSK_MSR_MASK_DRIVE3_POS_MODE	=	4,	//00000100
	FLPYDSK_MSR_MASK_DRIVE4_POS_MODE	=	8,	//00001000
	FLPYDSK_MSR_MASK_BUSY				=	16,	//00010000
	FLPYDSK_MSR_MASK_DMA				=	32,	//00100000
	FLPYDSK_MSR_MASK_DATAIO				=	64, //01000000
	FLPYDSK_MSR_MASK_DATAREG			=	128	//10000000
};

enum FLPYDSK_CMD {

	FDC_CMD_READ_TRACK		=	2,
	FDC_CMD_SPECIFY			=	3,
	FDC_CMD_CHECK_STAT		=	4,
	FDC_CMD_WRITE_SECT		=	5,
	FDC_CMD_READ_SECT		=	6,
	FDC_CMD_CALIBRATE		=	7,
	FDC_CMD_CHECK_INT		=	8,
	FDC_CMD_WRITE_DEL_S		=	9,
	FDC_CMD_READ_ID_S		=	0xa,
	FDC_CMD_READ_DEL_S		=	0xc,
	FDC_CMD_FORMAT_TRACK	=	0xd,
	FDC_CMD_SEEK			=	0xf
};

enum FLPYDSK_CMD_EXT {
	FDC_CMD_EXT_SKIP		=	0x20,	//00100000
	FDC_CMD_EXT_DENSITY		=	0x40,	//01000000
	FDC_CMD_EXT_MULTITRACK	=	0x80	//10000000
};

enum FLPYDSK_GAP3_LENGTH {
 
	FLPYDSK_GAP3_LENGTH_STD		= 42,
	FLPYDSK_GAP3_LENGTH_5_14	= 32,
	FLPYDSK_GAP3_LENGTH_3_5		= 27
};

enum FLPYDSK_SECTOR_DTL {

	FLPYDSK_SECTOR_DTL_128	=	0,
	FLPYDSK_SECTOR_DTL_256	=	1,
	FLPYDSK_SECTOR_DTL_512	=	2,
	FLPYDSK_SECTOR_DTL_1024	=	4
};

#define FLPY_SECTORS_PER_TRACK		18

//	FDC uses DMA channel 2
#define FDC_DMA_CHANNEL		2

void task_flpy();

//! install floppy driver
void flpydsk_install (int irq);

//! set current working drive
void flpydsk_set_working_drive (uint8_t drive);

//! get current working drive
uint8_t flpydsk_get_working_drive ();

//! read a sector
uint8_t* flpydsk_read_sector (int sectorLBA);

//! converts an LBA address to CHS
void flpydsk_lba_to_chs (int lba,int *head,int *track,int *sector);

uint8_t* flpy_do_read_sector(int sectorLBA);

#endif