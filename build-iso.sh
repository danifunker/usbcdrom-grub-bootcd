#!/bin/bash

# Make script stop on first error
set -e

# Create ISO with legacy IDE and USB support modules
grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --modules="915resolution acpi adler32 affs afs afsplitter ahci all_video aout archelp at_keyboard ata backtrace bfs biosdisk bitmap bitmap_scale blocklist boot bsd bswap_test btrfs bufio cat cbfs cbls cbmemc cbtable cbtime chain cmdline_cat_test cmosdump cmostest cmp cmp_test configfile cpio cpio_be cpuid crc64 crypto cryptodisk cs5536 ctz_test date datehook datetime disk diskfilter div div_test dm_nv drivemap echo efiemu ehci elf eval exfat exfctest ext2 extcmd f2fs fat file font freedos fshelp functional_test gcry_arcfour gcry_blowfish gcry_camellia gcry_cast5 gcry_crc gcry_des gcry_dsa gcry_idea gcry_md4 gcry_md5 gcry_rfc2268 gcry_rijndael gcry_rmd160 gcry_rsa gcry_seed gcry_serpent gcry_sha1 gcry_sha256 gcry_sha512 gcry_tiger gcry_twofish gcry_whirlpool gdb geli gettext gfxmenu gfxterm gfxterm_background gfxterm_menu gptsync gzio halt hashsum hdparm hello help hexdump hfs hfsplus hfspluscomp http hwmatch iorw iso9660 jfs jpeg json keylayouts keystatus ldm legacy_password_test legacycfg linux linux16 loadenv loopback ls lsacpi lsapm lsmmap lspci luks luks2 lvm lzopio macbless macho mda_text mdraid09 mdraid09_be mdraid1x memdisk memrw minicmd minix minix2 minix2_be minix3 minix3_be minix_be mmap morse mpi msdospart mul_test multiboot multiboot2 nativedisk net newc nilfs2 normal ntfs ntfscomp ntldr odc offsetio ohci part_acorn part_amiga part_apple part_bsd part_dfly part_dvh part_gpt part_msdos part_plan part_sun part_sunpc parttool password password_pbkdf2 pata pbkdf2 pbkdf2_test pci pcidump pgp plan9 play png priority_queue probe procfs progress pxe pxechain raid5rec raid6rec random rdmsr read reboot regexp reiserfs relocator romfs scsi search search_fs_file search_fs_uuid search_label sendkey serial setjmp setjmp_test setpci sfs shift_test signature_test sleep sleep_test smbios spem.mod squash4 strtoull_test syslinuxcfg tar terminal terminfo test test_blockarg testload testspeed tftp tga time tr trig true truecrypt udf ufs1 ufs1_be ufs2 uhci usb usb_keyboard usbms usbserial_common usbserial_ftdi usbserial_pl2303 usbserial_usbdebug usbtest vbe verifiers vga vga_text video video_bochs video_cirrus video_colors video_fb videoinfo videotest videotest_checksum wrmsr xfs xnu xnu_uuid xnu_uuid_test xzio zfs zfscrypt zfsinfo zstd" \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"


#oldmodules --modules="biosdisk ata ahci at_keyboard pata part_msdos fat iso9660 usb uhci ohci ehci usbms search ls echo acpi all_video boot cat chain configfile disk echo ext2 fat font gettext gfxmenu gfxterm gzio halt help linux loadenv ls normal part_gpt part_msdos reboot scsi search search_fs_file search_fs_uuid search_label video video_bochs video_cirrus video_colors video_fb zstd" \