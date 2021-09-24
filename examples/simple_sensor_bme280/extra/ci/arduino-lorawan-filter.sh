#!/bin/bash

##############################################################################
#
# Module: simple_sensor_bme280.ino/extra/ci/arduino-lorawan-filter.sh
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
#	Terry Moore, MCCI	February 2021
#
##############################################################################

#### use the common code.
# shellcheck source=../../../../ci/arduino-lorawan-filter-common.sh
source "$(dirname "$MCCI_CI_FILTER_NAME")"/../../../../ci/arduino-lorawan-filter-common.sh

#### end of file ####
