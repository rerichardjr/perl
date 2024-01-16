# QEMU QMP monitor access with Perl

Build QEMU Rocky VM
```t
qemu-img create -f qcow2 rocky.img 60G 
qemu-system-x86_64 -enable-kvm -cdrom ~/Downloads/Rocky-9.3-x86_64-dvd.iso \
	-boot menu=on -drive file=rocky.img \
	-m 4G -cpu host -vga virtio -display sdl,gl=on
```

Restart Rocky VM with QMP on TCP port 4567
```t
qemu-system-x86_64 -qmp tcp:192.168.1.65:4567,server,wait=off \
	-enable-kvm -boot menu=on -drive file=rocky.img \
	-m 4G -cpu host -vga virtio -display sdl,gl=on
```

Verify by connecting to lab server hosting QMP using PuTTY and execute `qmp_capabilities` and `query-status`
```t
{"execute": "qmp_capabilities" }
{"return": {}}
{"execute":"query-status"}
{"return": {"status": "running", "singlestep": false, "running": true}}
```
