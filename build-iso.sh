#!/bin/bash

# Make script stop on first error
set -e

# Create ISO with legacy IDE and USB support modules
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"