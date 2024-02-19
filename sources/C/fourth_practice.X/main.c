/*
 * Dispositivos Programables - 4NV40
 * Práctica 4
 * File:   main.c
 * Authors: 
 *  Roque Ramírez Jesus Guadalupe
 *  Urtiz López Dan Jair
 */

#include <xc.h>
#include "configuration_bits.h"

void main(void) {
    for (;;) {
        unsigned char display[5] = { 0x48, 0x45, 0x4C, 0x4C, 0x4F };
        
        for (int i = 0; i < 5; i++) {
            PORTB = display[i];
        }
    }
    
    return;
}
