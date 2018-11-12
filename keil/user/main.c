#include "N76E003.h"
#include "SFR_Macro.h"
#include "define.h"
#include "common.h"
#include "Delay.h"


unsigned char ADCdataH[4], ADCdataL[4];

void adc(void) 
{
	unsigned char i;	
	while(1)
	{
		CKDIV = 0x02;				// IMPORTANT!! Modify system clock to 4MHz ,then add the ADC sampling clock base to add the sampling timing.
		i = 0;
			Enable_ADC_AIN0;
			clr_ADCF;
			set_ADCS;																
      while(ADCF == 0);
			ADCdataH[i] = ADCRH;
			ADCdataL[i] = ADCRL;
			Disable_ADC;
		i++;
		
			Enable_ADC_BandGap;
			clr_ADCF;
			set_ADCS;																
      while(ADCF == 0);
			ADCdataH[i] = ADCRH;
			ADCdataL[i] = ADCRL;
			Disable_ADC;
		i++;
		
			Enable_ADC_AIN3;
			clr_ADCF;
			set_ADCS;																
      while(ADCF == 0);
			ADCdataH[i] = ADCRH;
			ADCdataL[i] = ADCRL;
			Disable_ADC;
		CKDIV = 0x00;
	   Timer0_Delay1ms(100);		
	}
	
}

 
void main()
{ 	
	Set_All_GPIO_Quasi_Mode;					// Define in define.h
	InitialUART0_Timer1(115200);
	adc();

}



