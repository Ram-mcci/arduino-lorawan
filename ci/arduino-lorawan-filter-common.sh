#!/bin/bash

##############################################################################
#
# Module: arduino-lorawan-filter-common.sh
#
# Function:
#	This script must be sourced; it sets variables used by other
#	scripts in this directory.
#
# Usage:
#	source ci/arduino-lorawan-filter.sh
#
# Copyright and License:
#	See accompanying LICENSE.md file
#
# Author:
#	RamaSubbu, MCCI	August 2021
#
##############################################################################

#### Capture the file path ####
MCCI_THISFILE="$0"

#### mandatory function: do the filtering
function _arduino-lorawan_filter {
	declare -r CMD="$1"
	shift
	case "$CMD" in

	# return 0 (success) if should process this sketch.
	"process")
		case "$MCCI_CI_ARCH:$(basename "$1")" in
			# we need to skip this sketch until the SAMD
			# bsp is updated; the Time library uses prog_read_ptr()
			# which is broken in v2.3.0
			"samd:header_test.ino" | \
			"samd:header_test_lmic.ino" | \
			"samd:header_test_ttn.ino" | \
			"samd:simple.ino" | \
			"samd:simple_feather.ino" | \)
				return 1
				;;
			# some of the feather sketches fail on non-Feathers
			"stm32:header_test.ino" | \
			"stm32:header_test_lmic.ino" | \
			"stm32:header_test_ttn.ino" | \
			"stm32:simple.ino" | \)	
				return 1
				;;
			*)
				return 0
				;;
		esac
		;;
	esac
}
