#include <stdint.h>
#include "RCC_interface.h"
#include "GPIO_interface.h"

void main()
{
    RCC_voidAHB1EnablePeripheralClock(0); // GPIOA

    GPIO_PinConfig_t LED = {
        .mode = GENERAL_PURPOSE_OUTPUT,
        .outputSpeed = HIGH_SPEED,
        .outputType = PUSH_PULL,
        .pin = PIN5,
        .port = PORTA,
        .pullType = NO_PULL};
    GPIO_u8InitPin(&LED);

    GPIO_u8SetPinValue(PORTA, PIN5, HIGH);

    while (1)
        ;
}