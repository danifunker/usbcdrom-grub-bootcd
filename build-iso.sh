#!/bin/bash

# Make script stop on first error
set -e

# Create ISO with legacy IDE and USB support modules
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --modules="biosdisk ata pata part_msdos fat iso9660 usb uhci ohci ehci usbms search ls echo acpi all_video boot cat chain configfile disk echo efi_gop efi_uga efifwsetup ext2 fat font gettext gfxmenu gfxterm gzio halt help linux loadenv ls normal part_gpt part_msdos reboot scsi search search_fs_file search_fs_uuid search_label tpm video video_bochs video_cirrus video_colors video_fb zstd" \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"
