
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



void test32( PCIE_HANDLE hPCIe, DWORD addr );
void testDMA( PCIE_HANDLE hPCIe, DWORD addr);
BOOL WriteStartByte(PCIE_HANDLE hPCIe);
 BOOL WriteWave(PCIE_HANDLE hPCIe, char *filename, DWORD *wavSize);
BOOL checkWaveDone(PCIE_HANDLE hPCIe);
BOOL clearMem(PCIE_HANDLE hPCIe, DWORD *wavSize);
BOOL NewReadWave(PCIE_HANDLE hPCIe, DWORD *wavSize);
void Demo(PCIE_HANDLE hPCIe, char *filename);
BOOL WriteInfo2(PCIE_HANDLE hPCIe,DWORD *wavSize);

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

 
  	DWORD dataSize = 15;
        printf("\n\n");
	printf("Startingg\n");
	printf("%d\n",dataSize);
	printf("%p\n\n\n", &dataSize);
	if(!WriteWave(hPCIe, filename, &dataSize)) {
		printf("Exited out of WriteWave due to error\n\n");
		return; 
	}
	printf("Function WriteWave finished\n\n");
	if(!WriteInfo2(hPCIe, &dataSize))
		return; 
	printf("Function WriteInfo2 finished\n\n");
	if(!WriteStartByte(hPCIe))
		return;

	printf("\nNow press **KEY1** on board to start processing.\n");
	while(!checkWaveDone(hPCIe));
	printf("\nProcessing finished.\n");
	if(!NewReadWave(hPCIe, &dataSize))
		return; //dancing.bmp
	if(!clearMem(hPCIe, &dataSize))
		return;
	printf("To copy the output wave to your own account, use\n scp out.wav mgXXX@ecegrid.ecn.purdue.edu:~/Desktop/. \n");
	printf("\n\n");
	return;
}

BOOL NewReadWave(PCIE_HANDLE hPCIe, DWORD *wavSize)//, BITMAPINFOHEADER *info)
{

	FILE* fp = fopen("out.wav", "wb");

   
    unsigned short word[1]; /* 2 bytes */
    unsigned long  dword[1]; /* 4 bytes */

    // dword[0]="RIFF";                                         
    fwrite("R",1,1,fp); 
    fwrite("I",1,1,fp);
    fwrite("F",1,1,fp);
    fwrite("F",1,1,fp);
    //dword[0]="RIFF";                                         fprintf(dword,1,4,fp); 
    dword[0]=*wavSize + 44;                                  fwrite(dword,1,4,fp); 
    //dword[0]="WAVE";                                         fwrite(dword,1,4,fp);
    fwrite("W",1,1,fp);
    fwrite("A",1,1,fp);
    fwrite("V",1,1,fp);
    fwrite("E",1,1,fp);
    // dword[0]="fmt";                                         fwrite(dword,1,4,fp);
    fwrite("f",1,1,fp);
    fwrite("m",1,1,fp);
    fwrite("t",1,1,fp);
    fwrite(" ",1,1,fp);
    dword[0]=16;                                         fwrite(dword,1,4,fp);
    word[0]=1;                                         fwrite(word,1,2,fp);
    word[0]=2;                                         fwrite(word,1,2,fp);
    dword[0]=44100 ;                                         fwrite(dword,1,4,fp);
    dword[0]=176400 ;                                         fwrite(dword,1,4,fp);
    word[0]=4;                                         fwrite(word,1,2,fp);
    word[0]=16;                                         fwrite(word,1,2,fp);
    // dword[0]="data";                                         fwrite(dword,1,4,fp);
    fwrite("d",1,1,fp);
    fwrite("a",1,1,fp);
    fwrite("t",1,1,fp);
    fwrite("a",1,1,fp);
    dword[0]=*wavSize;                                         fwrite(dword,1,4,fp);

 
 

    DWORD addr = 0x08500000; //new image starts from 0x08500000

	unsigned char *testWave;
	testWave = (unsigned char*)malloc(*wavSize*2*sizeof(unsigned char)); //CHANGE *wavSize to & if need be
	BOOL bPass = PCIE_DmaRead(hPCIe, addr, testImage, 44100*8); 
	if(!bPass)
	{
		printf("ERROR: unsuccessful wav reading.\n");
		return FALSE;
	}
	else
		printf("Wav read by the Atom.\n");


	unsigned char * tmpWave;
	tmpWave = (unsigned char*)malloc(*wavSize*sizeof(unsigned char));
	int ind = 0;
	
	int k;
	for (k = 0; k < *wavSize; ++k)
	{
		unsigned char buffer;
		buffer = testWave[ind++];   //IF PROGRAM IS CAUSING PROBLEMS, MOVE ORDER OR CHANGE # OF THIS LINE BEFORE OR AFTER (ORIGNALLY 1 BEFORE, 3 AFTER)
		tmpWave[k] = buffer;
		buffer = testWave[ind++];
	}
	print(" Wave written");
	if(!tmpWave)
	{
		printf("ERROR: new wav is empty.\n");
		return FALSE;
	}

	fwrite(tmpWave, *wavSize*sizeof(unsigned char),1,fp);
	free(tmpWave);
	free(testWave);
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

BOOL WriteInfo2(PCIE_HANDLE hPCIe, DWORD *wavSize)
{

	DWORD addr = 0x04;

	PCIE_Write32( hPCIe, pcie_bars[0], addr, *((unsigned char *)(wavSize) + 1) ) ; 
	addr = addr+4;
	BOOL bPass = PCIE_Write32( hPCIe, pcie_bars[0], addr, *((unsigned char *)(wavSize)+0)); 


	if(!bPass)
	{
		printf("ERROR: unsuccessful wav info writing.\n");
		return FALSE;
	}
	else
		printf("Wav info written.\n");
	return TRUE;
}

 BOOL WriteWave(PCIE_HANDLE hPCIe,  char *filename, DWORD *wavSize)
{
	printf("Entered WriteImage\n\n\n");
	FILE * fp;
 	
	fp = fopen(filename,"rb");
	printf("Successfully opened file\n\n\n");
	WAVFILEHEADER * wavFileHeader = malloc(sizeof(WAVFILEHEADER));
  	fread(wavFileHeader, sizeof(WAVFILEHEADER),1,fp);
	printf("Successfully read into wavFileHeader\n\n");
	printf("type: %c \n\n fileSize: %d \n\n typeHeader: %c \n\n",wavFileHeader->type, wavFileHeader->fileSize, wavFileHeader->typeHeader);

	unsigned char * tmpWave;
	*wavSize = wavFileHeader->fileSize - 44;

	printf("dataSize = %d\n\n", wavFileHeader->dataSize);
	tmpWave = (unsigned char*)malloc(*wavSize*sizeof(unsigned char));
	if (!tmpWave)
   	{
        	free(tmpWave);
        	fclose(fp);
			printf("WAV loading failed.\n");
        	return FALSE;
	}
	printf("Allocated 'bitmapImage'\n\n");


  	fread(tmpWave,*wavSize*sizeof(unsigned char),1,fp);
	
	
	DWORD addr = 0x08000000;  
	unsigned char * WaveData;
	printf("Allocating WaveData\n\n");
	
	WaveData = (unsigned char*)malloc(*wavSize*2*sizeof(unsigned char));
	if(!WaveData)
	{
		printf("Unsuccessfully allocated memory for WaveData");
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
		WaveData[index++] = tmpWave[i];
		//printf("Wrote to imageDataBuffer\n");
		WaveData[index++] = tmpWave[i + 1];
		WaveeData[index++] = 0;
		WaveData[index++] = 0;
		//printf("Finished %d th iteration\n\n",i);
		
	}
	printf("Allocating buffer 0's in imageDataBuffer\n\n");
        BOOL bPass = PCIE_DmaWrite(hPCIe, addr, WaveData, *wavSize*2);
	if(!bPass)
	{
		printf("ERROR: unsuccessful WAV writing.\n");
		return FALSE;
	}
	else
		printf("WAV written.\n");

	free(tmpWave);
	free(WaveData);
	free(wavFileHeader);
	return TRUE;
}

BOOL checkWaveDone(PCIE_HANDLE hPCIe)
{
   BYTE b;
   DWORD addr = 0x00000000;
   BOOL bPass = PCIE_Read8( hPCIe, pcie_bars[0], addr, &b);
   BYTE check = 0x12;
   if(bPass)
   {
      if(b == check)
      {
      	printf("Wave done\n");
		return TRUE;
      }
      else
      {

      	printf("Wave not done yeti %d\n",gi++);
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


	unsigned char *testWave;
	testWave = (unsigned char*)malloc(*wavSize*2*sizeof(unsigned char));
	
	addr = 0x08000000;
	BOOL bPass = PCIE_DmaWrite(hPCIe, addr, testWave, *wavSize*2);

	if (!bPass)
	{
		printf("ERROR: unsuccessful memory clearing 1.\n");
		return FALSE;
	}

	addr = 0x08500000;
	int i;
	for ( i = 0; i < *wavSize*2; ++i)
	{
		testWave[i] = 0;
	}

	bPass = PCIE_DmaWrite(hPCIe, addr, testWave, *wavSize*2);

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
