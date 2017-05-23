
#include <stdio.h> //1
#include <stdlib.h>
#include <string.h>
#include <memory.h>

#include "PCIE.h"

//MAX BUFFER FOR DMA
#define MAXDMA 20

//BASE ADDRESS FOR CONTROL REGISTER
#define CRA 0x00000000

//BASE ADDRESS TO SDRAM
#define SDRAM 0x08000000

#define RWSIZE (32 / 16)
int gi = 0;
PCIE_BAR pcie_bars[] = { PCIE_BAR0, PCIE_BAR1 , PCIE_BAR2 , PCIE_BAR3 , PCIE_BAR4 , PCIE_BAR5 };

typedef struct tagWAVBITMAPFILEHEADER
{
    DWORD type;  
    DWORD fileSize; 
    DWORD typeHeader;
    DWORD formatLength; 
    WORD  formatType; 
  WORD  channelCount;
  DWORD sampleRate;
  DWORD sampleCount;
  WORD channelType;
  WORD bitCount;
  DWORD chunkHeader;
  DWORD dataSize;
}WAVFILEHEADER;

/*
typedef struct tagBITMAPINFOHEADER
{
    WORD dummy1;  //specifies the number of bytes required by the struct
    /*signed int*/ /*WORD  width;  //specifies width in pixels
    /*signed int*/ /* WORD dummy2;  //species height in pixels
    WORD height;
    DWORD dummy3;
    WORD biPlanes; //specifies the number of color planes, must be 1
    WORD biBitCount; //specifies the number of bit per pixel
    DWORD biCompression;//spcifies the type of compression
    DWORD biSizeImage;  //size of image in bytes
    signed int biXPelsPerMeter;  //number of pixels per meter in x axis
    signed int biYPelsPerMeter;  //number of pixels per meter in y axis
    DWORD biClrUsed;  //number of colors used by th ebitmap
    DWORD biClrImportant;  //number of colors that are important
}BITMAPINFOHEADER;
*/

void test32( PCIE_HANDLE hPCIe, DWORD addr );
void testDMA( PCIE_HANDLE hPCIe, DWORD addr);
BOOL WriteStartByte(PCIE_HANDLE hPCIe);
 BOOL WriteImage(PCIE_HANDLE hPCIe, char *filename, DWORD *wavSize);//, BITMAPINFOHEADER *info);
BOOL checkImageDone(PCIE_HANDLE hPCIe);
BOOL clearMem(PCIE_HANDLE hPCIe, DWORD *wavSize);//, BITMAPINFOHEADER *info);
BOOL NewReadImage(PCIE_HANDLE hPCIe, DWORD *wavSize);//, BITMAPINFOHEADER *info);
void Demo(PCIE_HANDLE hPCIe, char *filename);
BOOL WriteInfo2(PCIE_HANDLE hPCIe,DWORD *wavSize);//, BITMAPINFOHEADER *info);

int main( int argc, char *argv[])
{
	if(argc != 3 && argc != 2)
	{
	 	printf("Wrong command. Use **./app -h** for help.\n");
	 	return 0;
	 }
	
	void *lib_handle;
	PCIE_HANDLE hPCIe;

	lib_handle = PCIE_Load();
	if (!lib_handle)
	{
		printf("PCIE_Load failed\n");
		return 0;
	}
	hPCIe = PCIE_Open(0,0,0);

	if (!hPCIe)
	{
		printf("PCIE_Open failed\n");
		return 0;
	}
	
	char* input = argv[1];
	if (strcmp("-d",input)==0)
	{
		printf("%s",argv[2]);
		Demo(hPCIe, argv[2]);
	}
	else if(strcmp("-h",input)==0)
	{
		printf("Use **./app -d <imagefilename>** to start demo.\n");	
	}
	else {
		printf("Wrong command. Use **./app -h** for help.\n");
	}
	PCIE_Close(hPCIe);
	return 0;
}

void Demo(PCIE_HANDLE hPCIe, char *filename)
{

  //BITMAPINFOHEADER info;
  	DWORD dataSize = 15;
        printf("\n\n");
	printf("Startingg\n");
	printf("%d\n",dataSize);
	printf("%p\n\n\n", &dataSize);
	if(!WriteImage(hPCIe, filename, &dataSize)) {
		printf("Exited out of WriteImage due to error\n\n");
		return; //dancing.bmp
	}
	printf("Function WriteImage finished\n\n");
	if(!WriteInfo2(hPCIe, &dataSize))
		return; //dancing.bmp
	printf("Function WriteInfo2 finished\n\n");
	if(!WriteStartByte(hPCIe))
		return;

	printf("\nNow press **KEY1** on board to start processing.\n");
	while(!checkImageDone(hPCIe));
	printf("\nProcessing finished.\n");
	if(!NewReadImage(hPCIe, &dataSize))
		return; //dancing.bmp
	if(!clearMem(hPCIe, &dataSize))
		return;
	printf("To copy the output image to your own account, use\n scp out.bmp mgXXX@ecegrid.ecn.purdue.edu:~/Desktop/. \n");
	printf("\n\n");
	return;
}

BOOL NewReadImage(PCIE_HANDLE hPCIe, DWORD *wavSize)//, BITMAPINFOHEADER *info)
{
	//checkImageDone(hPCIe);
	FILE* fp = fopen("out.wav", "wb");

    static unsigned char //color[1], /* 1 byte = 8 bits */
                         byte[1];
    unsigned short word[1]; /* 2 bytes */
    unsigned long  dword[1]; /* 4 bytes */

    dword[0]="RIFF";                                         fwrite(dword,1,4,fp); /* file Type signature = BM */
    //dword[0]="RIFF";                                         fprintf(dword,1,4,fp); /* file Type signature = BM */
    dword[0]=*wavSize + 44;                                  fwrite(dword,1,4,fp); /* FileSize */
    dword[0]="WAVE";                                         fwrite(dword,1,4,fp);
    dword[0]="fmt";                                         fwrite(dword,1,4,fp);
    dword[0]=16;                                         fwrite(dword,1,4,fp);
    word[0]=1;                                         fwrite(word,1,2,fp);
    word[0]=2;                                         fwrite(word,1,2,fp);
    dword[0]=44100 ;                                         fwrite(dword,1,4,fp);
    dword[0]=176400 ;                                         fwrite(dword,1,4,fp);
    word[0]=4;                                         fwrite(word,1,2,fp);
    word[0]=16;                                         fwrite(word,1,2,fp);
    dword[0]="data";                                         fwrite(dword,1,4,fp);
    dword[0]=*wavSize;                                         fwrite(dword,1,4,fp);

 
    /*    int i;
    for (i = 0; i < 256; i++)
    {
    	byte[0]=i;                                            fwrite(byte,1,1,fp); 
		byte[0]=i;                                            fwrite(byte,1,1,fp);                                    
		byte[0]=i;                                            fwrite(byte,1,1,fp);  
		byte[0]=i;                                            fwrite(byte,1,1,fp); 
    }  */        

    DWORD addr = 0x08500000; //new image starts from 0x08500000

	unsigned char *testImage;//test image buffer
	testImage = (unsigned char*)malloc(*wavSize*2*sizeof(unsigned char)); //CHANGE *wavSize to & if need be
	BOOL bPass = PCIE_DmaRead(hPCIe, addr, testImage, 48000); 
	if(!bPass)
	{
		printf("ERROR: unsuccessful wav reading.\n");
		return FALSE;
	}
	else
		printf("Wav read by the Atom.\n");


	unsigned char *bitmapImage;//image buffer
	bitmapImage = (unsigned char*)malloc(*wavSize*sizeof(unsigned char));
	int index = 0;
	int j;
	for (j = 0; j < *wavSize; ++j)
	{
		unsigned char buff;
		buff = testImage[index++];   //IF PROGRAM IS CAUSING PROBLEMS, MOVE ORDER OR CHANGE # OF THIS LINE BEFORE OR AFTER (ORIGNALLY 1 BEFORE, 3 AFTER)
		bitmapImage[j] = buff;
		buff = testImage[index++];
	}
	print("bitmap Image written");
	if(!bitmapImage)
	{
		printf("ERROR: new wav is empty.\n");
		return FALSE;
	}
	fwrite(bitmapImage, *wavSize*sizeof(unsigned char),1,fp);
	free(bitmapImage);
	free(testImage);
	fclose(fp);
	printf("New wav written to **out.wav**.\n");
	return TRUE;
}

BOOL WriteStartByte(PCIE_HANDLE hPCIe)
{
	DWORD addr = 0x00000000;
	BYTE start = 0x53;

	BOOL bPass = PCIE_Write32( hPCIe, pcie_bars[0], addr, start);
	if(!bPass)
	{
		printf("ERROR: unsuccessful start byte writing.\n");
		return FALSE;
	}
	else
		printf("Start byte written.\n");
	return TRUE;
}

BOOL WriteInfo2(PCIE_HANDLE hPCIe, DWORD *wavSize)//, BITMAPINFOHEADER *info)
{

	DWORD addr = 0x04;
	//BYTE start = 0x04;
	PCIE_Write32( hPCIe, pcie_bars[0], addr, *((unsigned char *)(wavSize) + 1) ) ;  //01
	addr = addr+4;
	BOOL bPass = PCIE_Write32( hPCIe, pcie_bars[0], addr, *((unsigned char *)(wavSize)+0)); //4d
	//addr = addr+4;

	if(!bPass)
	{
		printf("ERROR: unsuccessful wav info writing.\n");
		return FALSE;
	}
	else
		printf("Wav info written.\n");
	return TRUE;
}

 BOOL WriteImage(PCIE_HANDLE hPCIe,  char *filename, DWORD *wavSize)//, BITMAPINFOHEADER *info)
{
	printf("Entered WriteImage\n\n\n");
	FILE * pFile;
 	pFile = fopen(filename,"rb");
	printf("Successfully opened file\n\n\n");
	WAVFILEHEADER * wavFileHeader = malloc(sizeof(WAVFILEHEADER));
  	fread(wavFileHeader, sizeof(WAVFILEHEADER),1,pFile);
	printf("Successfully read into wavFileHeader\n\n");
	printf("type: %c \n\n fileSize: %d \n\n typeHeader: %c \n\n",wavFileHeader->type, wavFileHeader->fileSize, wavFileHeader->typeHeader);
	//read the info header
	//fread(info, sizeof(BITMAPINFOHEADER),1,pFile);

	unsigned char *bitmapImage;//image buffer
	*wavSize = wavFileHeader->fileSize - 44;

	printf("dataSize = %d\n\n", wavFileHeader->dataSize);
	bitmapImage = (unsigned char*)malloc(*wavSize*sizeof(unsigned char));
	if (!bitmapImage)
   	{
        	free(bitmapImage);
        	fclose(pFile);
			printf("WAV loading failed.\n");
        	return FALSE;
	}
	printf("Allocated 'bitmapImage'\n\n");

	//read in the bitmap image data
  	fread(bitmapImage,*wavSize*sizeof(unsigned char),1,pFile);
	
	//BYTE tempRGB;
	DWORD addr = 0x08000000;  //original image written starting from 0x08000000
	unsigned char *imageDataBuffer;
	printf("Allocating imageDataBuffer\n\n");
	imageDataBuffer = (unsigned char*)malloc(*wavSize*2*sizeof(unsigned char));
	if(!imageDataBuffer)
	{
		printf("Unsuccessfully allocated memory for imageDataBuffer");
		return FALSE;

	}
	printf("Successfuly allocated imageDataBuffer\n\n");
	int index = 0;
	int i;
	for (i = 0; i < *wavSize; i += 2)
	{	
		//printf("%c  %c \n",bitmapImage[i],bitmapImage[i+1]);
		//printf("%d\n\n",i);
		//printf("imageDataBuffer is %c\n",imageDataBuffer[index]);
		imageDataBuffer[index++] = bitmapImage[i];
		//printf("Wrote to imageDataBuffer\n");
		imageDataBuffer[index++] = bitmapImage[i + 1];
		imageDataBuffer[index++] = 0;
		imageDataBuffer[index++] = 0;
		//printf("Finished %d th iteration\n\n",i);
		
	}
	printf("Allocating buffer 0's in imageDataBuffer\n\n");
        BOOL bPass = PCIE_DmaWrite(hPCIe, addr, imageDataBuffer, *wavSize*2);
	if(!bPass)
	{
		printf("ERROR: unsuccessful WAV writing.\n");
		return FALSE;
	}
	else
		printf("WAV written.\n");

	free(bitmapImage);
	free(imageDataBuffer);
	free(wavFileHeader);
	return TRUE;
}

BOOL checkImageDone(PCIE_HANDLE hPCIe)
{
   BYTE b;
   DWORD addr = 0x00000000;
   BOOL bPass = PCIE_Read8( hPCIe, pcie_bars[0], addr, &b);
   BYTE check = 0x12;
   if(bPass)
   {
      if(b == check)
      {
      	printf("Image done\n");
		return TRUE;
      }
      else
      {

      	printf("Image not done yeti %d\n",gi++);
      	return FALSE;
      }
   }
   return FALSE;
}

void test32( PCIE_HANDLE hPCIe, DWORD addr )
{
	BOOL bPass;
	DWORD testVal = 0xf;
	DWORD readVal;

	WORD i = 0;
	for (i = 0; i < 16 ; i++ )
	{
		printf("Testing register %d at addr %x with value %x\n", i, addr, testVal);
		bPass = PCIE_Write32( hPCIe, pcie_bars[0], addr, testVal);
		if (!bPass)
		{
			printf("test FAILED: write did not return success\n");
			return;
		}
		bPass = PCIE_Read32( hPCIe, pcie_bars[0], addr, &readVal);
		if (!bPass)
		{
			printf("test FAILED: read did not return success\n");
			return;
		}
		if (testVal == readVal)
		{
			printf("Test PASSED: expected %x, received %x\n", testVal, readVal);
		}
		else
		{
			printf("Test FAILED: expected %x, received %x\n", testVal, readVal);
		}
		testVal = testVal + 1;
		addr = addr + 4;
	}
	return;
}

BOOL clearMem(PCIE_HANDLE hPCIe, DWORD *wavSize)
{

	DWORD addr = 0x00;
	//BYTE start = 0x04;
	PCIE_Write8( hPCIe, pcie_bars[0], addr, 0x00);
	addr = addr+4;
	PCIE_Write8( hPCIe, pcie_bars[0], addr, 0x00);
	addr = addr+4;
    PCIE_Write8( hPCIe, pcie_bars[0], addr, 0x00);//r_addr


	unsigned char *testImage;//test image buffer
	testImage = (unsigned char*)malloc(*wavSize*2*sizeof(unsigned char));
	
	addr = 0x08000000;
	BOOL bPass = PCIE_DmaWrite(hPCIe, addr, testImage, *wavSize*2);

	if (!bPass)
	{
		printf("ERROR: unsuccessful memory clearing 1.\n");
		return FALSE;
	}

	addr = 0x08500000;
	int i;
	for ( i = 0; i < *wavSize*2; ++i)
	{
		testImage[i] = 0;
	}

	bPass = PCIE_DmaWrite(hPCIe, addr, testImage, *wavSize*2);

	if (!bPass)
	{
		printf("ERROR: unsuccessful memory clearing 2.\n");
		return FALSE;
	}

//	printf("All memory cleared.\n");
	return TRUE;
}

//tests DMA write of buffer to address
void testDMA( PCIE_HANDLE hPCIe, DWORD addr)
{
	BOOL bPass;
	DWORD testArray[MAXDMA];
	DWORD readArray[MAXDMA];
	
	WORD i = 0;
	
	while ( i < MAXDMA )
	{
		testArray[i] = i  + 0xfd;
		i++;
	}

	bPass = PCIE_DmaWrite(hPCIe, addr, testArray, MAXDMA * RWSIZE );
	if (!bPass)
	{
		printf("test FAILED: write did not return success");
		return;
	}
	bPass = PCIE_DmaRead(hPCIe, addr, readArray, MAXDMA * RWSIZE );
	if (!bPass)
	{
		printf("test FAILED: read did not return success");
		return;
	}
	i = 0;
	while ( i < MAXDMA )
	{
		if (testArray[i] == readArray[i])
		{
			//printf("Test PASSED: expected %x, received %x\n", testArray[i], readArray[i]);
		}
		else
		{
			printf("Test FAILED: expected %x, received %x\n", testArray[i], readArray[i]);
		}
		i++;
	}
	return;
}
