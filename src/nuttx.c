//  LoRaWAN Platform-Specific Functions for NuttX
#ifdef __NuttX__  //  This file is for NuttX only
#include <assert.h>
#include <stdio.h>
#include <stdbool.h>
#include <fcntl.h>

///////////////////////////////////////////////////////////////////////////////
//  Board

#include "boards/board.h"

/*!
 * \brief Initializes the mcu.
 */
void BoardInitMcu( void ) {
    puts("TODO: BoardInitMcu");
}

/*!
 * \brief Resets the mcu.
 */
void BoardResetMcu( void ) {
    puts("TODO: BoardResetMcu");
}

/*!
 * \brief Initializes the boards peripherals.
 */
void BoardInitPeriph( void ) {
    puts("TODO: BoardInitPeriph");
}

/*!
 * \brief Gets the board 64 bits unique ID
 *
 * \param [IN] id Pointer to an array that will contain the Unique ID
 */
void BoardGetUniqueId( uint8_t *id ) {
    puts("TODO: BoardGetUniqueId");
}

/*!
 * \brief Manages the entry into ARM cortex deep-sleep mode
 */
void BoardLowPowerHandler( void ) {
    puts("TODO: BoardLowPowerHandler");
    sleep(10);
}

/*!
 * Disable interrupts, begins critical section
 *
 * \param [IN] mask Pointer to a variable where to store the CPU IRQ mask
 */
void BoardCriticalSectionBegin( uint32_t *mask ) {
    puts("TODO: BoardCriticalSectionBegin");
}

/*!
 * Ends critical section
 *
 * \param [IN] mask Pointer to a variable where the CPU IRQ mask was stored
 */
void BoardCriticalSectionEnd( uint32_t *mask ) {
    puts("TODO: BoardCriticalSectionEnd");
}

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
    return LMN_STATUS_ERROR;
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
    return LMN_STATUS_ERROR;
}

///////////////////////////////////////////////////////////////////////////////
//  Real Time Clock

#include "boards/rtc-board.h"

/*!
 * \brief Gets the system time with the number of seconds elapsed since epoch
 *
 * \param [OUT] milliseconds Number of milliseconds elapsed since epoch
 * \retval seconds Number of seconds elapsed since epoch
 */
uint32_t RtcGetCalendarTime( uint16_t *milliseconds ) {
    puts("TODO: RtcGetCalendarTime");
    return 0;
}

/*!
 * \brief Writes data0 and data1 to the RTC backup registers
 *
 * \param [IN] data0 1st Data to be written
 * \param [IN] data1 2nd Data to be written
 */
void RtcBkupWrite( uint32_t data0, uint32_t data1 ) {
    puts("TODO: RtcBkupWrite");
}

/*!
 * \brief Reads data0 and data1 from the RTC backup registers
 *
 * \param [OUT] data0 1st Data to be read
 * \param [OUT] data1 2nd Data to be read
 */
void RtcBkupRead( uint32_t* data0, uint32_t* data1 ) {
    puts("TODO: RtcBkupRead");
}

///////////////////////////////////////////////////////////////////////////////
//  Secure Element

#include "mac/secure-element.h"

/// Get random devnonce from the Random Number Generator
SecureElementStatus_t SecureElementRandomNumber( uint32_t* randomNum ) {
    //  Open the Random Number Generator /dev/urandom
    int fd = open("/dev/urandom", O_RDONLY);
    assert(fd > 0);

    //  Read the random number
    read(fd, randomNum, sizeof(uint32_t));
    close(fd);

    printf("SecureElementRandomNumber: 0x%08lx\n", *randomNum);
    return SECURE_ELEMENT_SUCCESS;
}

#endif  //  __NuttX__