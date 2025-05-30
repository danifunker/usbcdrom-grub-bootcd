#!/bin/bash

# Make script stop on first error
set -e

# Create ISO with legacy IDE and USB support modules
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --install-modules="biosdisk ata pata part_msdos part_gpt fat ntfs ext2 iso9660 udf hfsplus usb uhci ohci ehci usbms normal chain search configfile ls cat echo sleep font gfxterm boot linux linux16 loadenv minicmd reboot halt memdisk test video" \
  --modules="biosdisk ata pata part_msdos fat iso9660 usb uhci ohci ehci usbms normal search ls linux linux16" \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"