#grub-mkrescue -o bootable.iso iso/

grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --install-modules="all_video gfxterm part_msdos fat iso9660 usb uhci ohci ehci usbms chain part_gpt biosdisk search ls help echo sleep font" \
  --modules="all_video gfxterm part_msdos fat iso9660 usb uhci ohci ehci usbms" \
  iso/ \
  -- -volid "USBHLPCD"
  
echo "ISO created successfully as usbcdrom-bootcd.iso"
echo "Volume ID: USBHLPCD"
