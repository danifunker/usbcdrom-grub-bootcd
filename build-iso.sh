#grub-mkrescue -o bootable.iso iso/

grub-mkrescue \
  --output=usbcdrom-bootcd.iso \
  --install-modules="usb part_msdos uhci ohci ehci usbms chain part_gpt biosdisk fat iso9660 normal search ls help echo sleep font" \
  --modules="usb part_msdos uhci ohci ehci usbms chain part_gpt biosdisk fat iso9660 normal search ls help echo sleep font" \
  --variables="prefix=(cd0)/boot/grub" \
  iso/
