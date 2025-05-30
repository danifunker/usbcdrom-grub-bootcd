#!/bin/bash

# Make script stop on first error
set -e

# Create ISO with legacy IDE and USB support modules
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --modules="915resolution acpi ahci all_video aout archelp at_keyboard ata backtrace bfs bsd biosdisk bitmap bitmap_scale blocklist boot btrfs cat chain cmosdump cmostest cmp cpio configfile cpuid crc64 cs5536 date datehook datetime disk diskfilter drivemap echo efiemu ehci elf eval exfat ext2 extcmd fat file font freedos fshelp gettext gfxmenu gfxterm gfxterm_background gfxterm_menu gptsync gzio halt hashsum hdparm help hexdump hfs hfsplus hfspluscomp iso9660 jpeg keystatus ldm linux linux16 loadenv loopback ls lsacpi lsapm lsmmap lspci lvm lzopio macbless mdraid09 mdraid1x memdisk minicmd mmap msdospart multiboot2 nativedisk newc normal ntfs ntfscomp ntldr ohci part_acorn part_amiga part_apple part_bsd part_gpt part_msdos parttool pata pci pcidump play png probe progress random read reboot reiserfs romfs scsi search search_fs_file search_fs_uuid search_label sendkey serial setjmp setpci sfs sleep smbios tar test test_blockarg testload testspeed time tr trig true udf ufs1 ufs2 uhci usb usb_keyboard usbms usbtest vbe vga vga_text video video_bochs video_cirrus video_colors video_fb videotest_checksum xfs xzio zfs zfsinfo zstd" \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"


#oldmodules --modules="biosdisk ata ahci at_keyboard pata part_msdos fat iso9660 usb uhci ohci ehci usbms search ls echo acpi all_video boot cat chain configfile disk echo ext2 fat font gettext gfxmenu gfxterm gzio halt help linux loadenv ls normal part_gpt part_msdos reboot scsi search search_fs_file search_fs_uuid search_label video video_bochs video_cirrus video_colors video_fb zstd" \