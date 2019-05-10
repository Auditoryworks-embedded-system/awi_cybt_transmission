#
# Copyright 2018, Cypress Semiconductor Corporation or a subsidiary of Cypress Semiconductor 
#  Corporation. All rights reserved. This software, including source code, documentation and  related 
# materials ("Software"), is owned by Cypress Semiconductor  Corporation or one of its 
#  subsidiaries ("Cypress") and is protected by and subject to worldwide patent protection  
# (United States and foreign), United States copyright laws and international treaty provisions. 
# Therefore, you may use this Software only as provided in the license agreement accompanying the 
# software package from which you obtained this Software ("EULA"). If no EULA applies, Cypress 
# hereby grants you a personal, nonexclusive, non-transferable license to  copy, modify, and 
# compile the Software source code solely for use in connection with Cypress's  integrated circuit 
# products. Any reproduction, modification, translation, compilation,  or representation of this 
# Software except as specified above is prohibited without the express written permission of 
# Cypress. Disclaimer: THIS SOFTWARE IS PROVIDED AS-IS, WITH NO  WARRANTY OF ANY KIND, EXPRESS 
# OR IMPLIED, INCLUDING,  BUT NOT LIMITED TO, NONINFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
# AND FITNESS FOR A PARTICULAR PURPOSE. Cypress reserves the right to make changes to 
# the Software without notice. Cypress does not assume any liability arising out of the application 
# or use of the Software or any product or circuit  described in the Software. Cypress does 
# not authorize its products for use in any products where a malfunction or failure of the 
# Cypress product may reasonably be expected to result  in significant property damage, injury 
# or death ("High Risk Product"). By including Cypress's product in a High Risk Product, the 
#  manufacturer of such system or application assumes  all risk of such use and in doing so agrees 
# to indemnify Cypress against all liability.
#

NAME := awi_cybt_transmission

########################################################################
# Add Application sources here.
########################################################################

APP_PATCHES_AND_LIBS := a2dp_sink_profile.a
APP_PATCHES_AND_LIBS += handsfree_profile.a
APP_PATCHES_AND_LIBS += avrc_controller.a
APP_PATCHES_AND_LIBS += wiced_audio_sink.a
APP_PATCHES_AND_LIBS += wiced_voice_path.a

APP_PATCHES_AND_LIBS += FM25Q04_sflash.a

APP_SRC += wiced_app.c
APP_SRC += hci_control.c
APP_SRC += hci_control_le.c
APP_SRC += hci_control_audio.c
APP_SRC += wiced_app_cfg.c
APP_SRC += remote_controller/hci_control_rc.c

APP_SRC += handsfree/handsfree.c
APP_SRC += handsfree/handsfree_utils.c
APP_SRC += handsfree/handsfree_wiced_hci.c

INCS += ../../Apps/awi_cybt_transmission/handsfree

########################################################################
# C flags
# To use SPI transport, append TRANSPORT=SPI to the make target, 
# for example "demo.headset-CYW920706WCDEVAL TRANSPORT=SPI download"
########################################################################
#FLAG CHECK FOR STAND-ALONE/MCU-DRIVEN
C_FLAGS += -DSTANDALONE_HEADSET_APP
#Flag to enable the support for changing the audio route. This should be enabled in case of MCU-DRIVEN mode only.
#C_FLAGS += -DCHANGE_ROUTE_SUPPORT

C_FLAGS += -DWICED_BT_TRACE_ENABLE
C_FLAGS += -DAVRC_ADV_CTRL_INCLUDED
C_FLAGS += -DAVRC_METADATA_INCLUDED
# Max Number of HF connections supported.
# Default value is 2, please update this macro based on requirement
C_FLAGS += -DWICED_BT_HFP_HF_MAX_CONN=2

########################################################################
################ DO NOT MODIFY FILE BELOW THIS LINE ####################
########################################################################
