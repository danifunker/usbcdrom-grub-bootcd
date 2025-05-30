#!/bin/bash

# Make script stop on first error
set -e

echo "Creating bootable USB CD-ROM helper ISO..."

# Diagnostic and troubleshooting modules to include
DIAGNOSTIC_MODULES="ls lsacpi lsapm lsmmap lspci echo cat help sleep test probe"

# Core boot modules required for reliability
CORE_MODULES="ata biosdisk pata part_msdos fat iso9660 normal search configfile linux linux16 memdisk"

# USB support modules
USB_MODULES="usb uhci ohci ehci usbms"

# Additional useful modules
EXTRA_MODULES="ls echo cat help sleep test probe chain"

# Combine all modules
ALL_MODULES="${CORE_MODULES} ${USB_MODULES} ${DIAGNOSTIC_MODULES} ${EXTRA_MODULES}"

# Copy memdisk to correct location if not already there
if [ ! -f iso/boot/memdisk ]; then
  echo "Copying memdisk to iso/boot/"
  cp /usr/lib/syslinux/memdisk iso/boot/ || \
  cp /usr/share/syslinux/memdisk iso/boot/ || \
  echo "WARNING: Could not find memdisk, please copy it manually to iso/boot/"
fi

# Check if floppy images exist
if [ ! -f iso/images/w98_boot.img ] || [ ! -f iso/images/msdos622-with-usbcdrom.img ]; then
  echo "WARNING: Floppy images not found in iso/images/"
  echo "Please ensure your floppy images are in place before booting"
fi

# Create ISO with selected modules
echo "Running grub-mkrescue with selected modules..."
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --modules="${ALL_MODULES}" \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"


#oldmodules --modules="biosdisk ata ahci at_keyboard pata part_msdos fat iso9660 usb uhci ohci ehci usbms search ls echo acpi all_video boot cat chain configfile disk echo ext2 fat font gettext gfxmenu gfxterm gzio halt help linux loadenv ls normal part_gpt part_msdos reboot scsi search search_fs_file search_fs_uuid search_label video video_bochs video_cirrus video_colors video_fb zstd" \

#fullmodules   --modules="915resolution acpi ahci all_video aout archelp at_keyboard ata backtrace bfs bsd biosdisk bitmap bitmap_scale blocklist boot btrfs cat chain cmosdump cmostest cmp cpio configfile cpuid crc64 cs5536 date datehook datetime disk diskfilter drivemap echo ehci elf eval exfat ext2 extcmd fat file font freedos fshelp gettext gfxmenu gfxterm gfxterm_background gfxterm_menu gzio halt hashsum hdparm help hexdump hfs hfsplus hfspluscomp iso9660 jpeg keystatus ldm linux linux16 loadenv loopback ls lsacpi lsapm lsmmap lspci lvm lzopio macbless mdraid09 mdraid1x memdisk minicmd mmap msdospart multiboot2 nativedisk newc normal ntfs ntfscomp ntldr ohci part_acorn part_amiga part_apple part_bsd part_msdos parttool pata pci pcidump play png probe progress random read reboot reiserfs romfs scsi search search_fs_file search_fs_uuid search_label sendkey serial setjmp setpci sfs sleep smbios tar test test_blockarg time tr trig true udf ufs1 ufs2 uhci usb usb_keyboard usbms usbtest vbe vga vga_text video video_bochs video_cirrus video_colors video_fb videotest_checksum xfs xzio zfs zfsinfo zstd" \
