# QEMU QMP monitor access with Perl

Build QEMU Rocky VM
```t
qemu-img create -f qcow2 rocky.img 60G 
qemu-system-x86_64 -enable-kvm -cdrom ~/Downloads/Rocky-9.3-x86_64-dvd.iso -boot menu=on -drive file=rocky.img -m 4G -cpu host -vga virtio -display sdl,gl=on
```
