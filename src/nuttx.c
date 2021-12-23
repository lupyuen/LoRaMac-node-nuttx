//  LoRaWAN Platform-Specific Functions for NuttX

#include <assert.h>
#include <stdio.h>
#include <stdbool.h>

///////////////////////////////////////////////////////////////////////////////
//  EEPROM

#include "boards/eeprom-board.h"

/*!
 * Writes the given buffer to the EEPROM at the specified address.
 *
 * \param[IN] addr EEPROM address to write to
 * \param[IN] buffer Pointer to the buffer to be written.
 * \param[IN] size Size of the buffer to be written.
 * \retval status [LMN_STATUS_OK, LMN_STATUS_ERROR]
 */
LmnStatus_t EepromMcuWriteBuffer( uint16_t addr, uint8_t *buffer, uint16_t size ) {
    puts("TODO: EepromMcuWriteBuffer");
    assert(false);
}

/*!
 * Reads the EEPROM at the specified address to the given buffer.
 *
 * \param[IN] addr EEPROM address to read from
 * \param[OUT] buffer Pointer to the buffer to be written with read data.
 * \param[IN] size Size of the buffer to be read.
 * \retval status [LMN_STATUS_OK, LMN_STATUS_ERROR]
 */
LmnStatus_t EepromMcuReadBuffer( uint16_t addr, uint8_t *buffer, uint16_t size ) {
    puts("TODO: EepromMcuReadBuffer");
    assert(false);
}

///////////////////////////////////////////////////////////////////////////////
//  Real Time Clock

//  RtcGetCalendarTime
//  RtcBkupWrite
//  RtcBkupRead

///////////////////////////////////////////////////////////////////////////////
//  Board

//  BoardInitMcu
//  BoardInitPeriph
//  BoardLowPowerHandler
//  BoardResetMcu
//  BoardCriticalSectionBegin
//  BoardCriticalSectionEnd
