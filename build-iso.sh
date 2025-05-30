#!/bin/bash

# Make script stop on first error
set -e

# Create ISO with ALL modules included
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --install-modules="all" \
  --modules="ata part_msdos part_gpt fat ntfs ext2 iso9660 udf hfsplus usb uhci ohci ehci usbms pata ahci normal chain search configfile ls cat echo sleep font gfxterm biosdisk boot linux linux16 loadenv minicmd reboot halt memdisk test video" \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"