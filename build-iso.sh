#!/bin/bash

# Make script stop on first error
set -e

echo "Creating bootable USB CD-ROM helper ISO..."

# Use absolute minimal modules to reduce errors
MINIMAL_MODULES="part_msdos fat iso9660 normal linux linux16 memdisk chain ls echo"

# Copy memdisk to correct location if not already there
if [ ! -f iso/boot/memdisk ]; then
  echo "Copying memdisk to iso/boot/"
  cp /usr/lib/syslinux/memdisk iso/boot/ || \
  cp /usr/share/syslinux/memdisk iso/boot/ || \
  echo "WARNING: Could not find memdisk, please copy it manually to iso/boot/"
fi

# Create ISO with minimal modules and explicit options
echo "Running grub-mkrescue with minimal modules..."
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --modules="${MINIMAL_MODULES}" \
  --directory=/usr/lib/grub/i386-pc \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"