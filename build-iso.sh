#!/bin/bash

# Make script stop on first error
set -e

echo "Creating bootable USB CD-ROM helper ISO..."

# Use absolute minimal modules to reduce errors and add "regexp" for pattern matching
MINIMAL_MODULES="part_msdos fat iso9660 normal linux linux16 memdisk chain ls echo regexp"

# Copy memdisk to correct location if not already there
if [ ! -f iso/boot/memdisk ]; then
  echo "Copying memdisk to iso/boot/"
  cp /usr/lib/syslinux/memdisk iso/boot/ || \
  cp /usr/share/syslinux/memdisk iso/boot/ || \
  echo "WARNING: Could not find memdisk, please copy it manually to iso/boot/"
fi

# Instead of using --early-config, include these settings in grub.cfg
# (Create a custom early config file to reference in grub.cfg)
cat > iso/boot/grub/early_config.cfg << EOF
# Early config to prevent disk scanning
set GRUB_DISABLE_DISK_SCAN=true
EOF

# Create ISO with minimal modules
echo "Running grub-mkrescue with minimal modules..."
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --modules="${MINIMAL_MODULES}" \
  --directory=/usr/lib/grub/i386-pc \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"