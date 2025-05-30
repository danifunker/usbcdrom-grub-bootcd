#!/bin/bash
#grub-mkrescue -o bootable.iso iso/
# Make script stop on first error
set -e

# Create ISO with IDE-optimized module loading
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --install-modules="ata part_msdos fat iso9660 usb uhci ohci ehci usbms chain biosdisk normal search ls help" \
  --modules="ata part_msdos fat iso9660 usb normal search ls" \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"