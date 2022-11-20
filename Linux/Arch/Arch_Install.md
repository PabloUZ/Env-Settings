# Arch

## UEFI
### Configuracion temporal de teclado
```bash
localectl list-keymaps -l less
loadkeys es
loadkeys la-latin1
```


### Verificar si es BIOS o UEFI
```bash
ls /sys/firmware/efi/efivars
```
> (Muestra directorios)

### Verificar conexion a internet
```bash
ip link
```
> Verificar internet con ping

### Particionado
```bash
fdisk -l
cfdisk /dev/<disco>
gpt
```
*Particiones*

|ID|Funcion|Tamaño|Tipo|
|---|---|---|---|
|1|Arranque|  1G|            efi system|
|2|swap      |2XRAM         |linux swap|
|3|raiz|      Disponible/2|  linux filesystem|
|4|home   |   restante   |   linux home|

### Formato a las particiones
|ID|COMANDO|
|---|---|
|1| mkfs.vfat -F32 <-particion arranque->|
|2| mkswap <-particion swap->|
|3| mkfs.ext4 <-particion raiz->|
|4| mkfs.ext4 <-particion home->|

### Activar swap
```bash
swapon <particion swap>
```
### montar particiones
```bash
mount <particion raiz> /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/efi
mount <particion home> /mnt/home
mount <particion arranque> /mnt/boot/efi
```

### instalar arch

> opcion 1: 
```bash
pacstrap /mnt base base-devel efibootmgr os-prober ntfs-3g networkmanager grub gvfs gvfs-afc gvfs-mtp xdg-user-dirs linux linux-firmware nano vim dhcpd
```
> opcion 2: 
```bash
pacstrap /mnt base base-devel efibootmgr os-prober ntfs-3g networkmanager grub gvfs gvfs-afc gvfs-mtp xdg-user-dirs linux linux-firmware nano vim dhcp
```

### Portatil
```bash
pacstrap /mnt netctl wpa_supplicant dialog
pacstrap /mnt xf86-input-synaptics
```
### Contenedor de tablas de particiones
```bash
genfstab -pU /mnt >> /mnt/etc/fstab
```

### Acceder al sistema base
```bash
arch-chroot /mnt
```
### poner nombre al equipo
```bash
vim /etc/hostname
```
### enlace simbolico a localtime
```bash
ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime
```

### Idioma del sistema
```bash
vim /etc/locale.gen
```
> en_US.UTF-8 UTF-8
```bash
echo LANG=es_CO.UTF-8 > /etc/locale.conf
locale-gen
```
### configurar teclado
> Español: 
```bash
echo KEYMAP=es > /etc/vconsole.conf
```
> Español LA: 
```bash
echo KEYMAP=la-latin1 > /etc/vconsole.conf
```
### Instalar grub
```bash
grub-install --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

### cambiar contraseña root 
```bash
passwd
```

### grupo admin
```bash
groupadd <grupo>
useradd -m -g <grupo> -s /bin/bash <nuevo usuario>
```
### cambiar contraseña usuario 
```bash
passwd <usuario>
```
### desmontar particiones y reiniciar
```bash
exit
umount -R /mnt
reboot
```
> Iniciar con root
### permisos superusuario
```bash
vim /etc/sudoers
<usuario> ALL=(ALL) NOPASSWD:ALL
```

### Habilitar tarjeta de red
```bash
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
ping google.com
```

> Iniciar con usuario personal
### Actualizar sistema
```bash
sudo pacman -Syyu
```
### Servidor grafico
```bash
sudo pacman -S xorg-server xorg-xinit
sudo pacman -S mesa mesa-demos
```

### Entorno grafico

#### XFCE
	sudo pacman -S xfce4 xfce4-goodies network-manager-applet pulseaudio
	START: exec startxfce4


#### PLASMA
	sudo pacman -S plasma-desktop plasma-meta plasma-wayland-session
	1 Jack2, 5 ttf-dejavu, 2 wireplumber, 2 phonon-qt5-vlc
	START: exec startplasma-x11


#### GNOME
	sudo pacman -S gnome gnome-extra
	START:
		export XDG_SESSION_TYPE=x11
		export GDK_BACKEND=x11
		exec gnome-session
```bash
/home/<usuario>/.xinitrc
```
{START}


### Teclado XOrg
```bash
sudo vim /etc/X11/xorg.conf.d/00-keyboard.conf
```


	Section "InputClass"
		Identifier "system-keyboard"
		MatchIsKeyboard "on"
		Option "XkbLayout" "es"
	EndSection



### Login 
```bash
sudo pacman -S sddm
sudo systemctl enable sddm
```
```bash
reboot
```

## BIOS
### Configuracion temporal de teclado
```bash
localectl list-keymaps -l less
loadkeys es
loadkeys la-latin1
```

### Verificar si es BIOS o UEFI
```bash
ls /sys/firmware/efi/efivars 
```
> (error directorios)

### Verificar conexion a internet
```bash
ip link
```
> Verificar internet con ping

### Particionado
```bash
fdisk -l
cfdisk /dev/<disco>
dos
```
*Particiones*

|ID|Funcion|Tamaño|Tipo|
|---|---|---|---|
|1| Arranque  |1G            |bootable|
|2| swap      |2XRAM         |82 linux swap|
|3| raiz      |Disponible/2  |linux|
|4| home      |restante      |linux|

### Formato a las particiones
|ID|COMANDO|
|---|---|
|1| mkfs.vfat -F32 <-particion arranque->|
|2| mkswap <-particion swap->|
|3| mkfs.ext4 <-particion raiz->|
|4| mkfs.ext4 <-particcion home->|

### Activar swap
```bash
swapon <particion swap>
```
### montar particiones
```bash
mount <particion raiz> /mnt
mkdir /mnt/home
mkdir /mnt/boot
mount <particion home> /mnt/home
mount <particion arranque> /mnt/boot
```


### instalar arch

> opcion 1:
```bash
pacstrap /mnt base base-devel grub os-prober ntfs-3g networkmanager gvfs gvfs-afc gvfs-mtp xdg-user-dirs linux linux-firmware nano vim dhcpd
```
> opcion 2: 
```bash
pacstrap /mnt base base-devel grub os-prober ntfs-3g networkmanager gvfs gvfs-afc gvfs-mtp xdg-user-dirs linux linux-firmware nano vim dhcp
```

### Portatil
```bash
pacstrap /mnt netctl wpa_supplicant dialog
pacstrap /mnt xf86-input-synaptics
```
### Contenedor de tablas de particiones
```bash
genfstab -pU /mnt >> /mnt/etc/fstab
```

### Acceder al sistema base
```bash
arch-chroot /mnt
```
### poner nombre al equipo
```bash
vim /etc/hostname
```
### enlace simbolico a localtime
```bash
ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime
```
### Idioma del sistema
```bash
vim /etc/locale.gen
```
> en_US.UTF-8 UTF-8
```bash
echo LANG=es_CO.UTF-8 > /etc/locale.conf
locale-gen
```
### configurar teclado
> Español: 
```bash
echo KEYMAP=es > /etc/vconsole.conf
```
> Español LA: 
```bash
echo KEYMAP=la-latin1 > /etc/vconsole.conf
```
### Instalar grub
```bash
pacman -S grub
grub-install /dev/<disco>
grub-mkconfig -o /boot/grub/grub.cfg
```

### cambiar contraseña root 
```bash
passwd
```

### grupo admin
```bash
groupadd <grupo>
useradd -m -g <grupo> -s /bin/bash <nuevo usuario>
```

### cambiar contraseña usuario 
```bash
passwd <usuario>
```
### desmontar particiones y reiniciar
```bash
exit
umount -R /mnt
reboot
```
> Iniciar con root
### permisos superusuario
```bash
vim /etc/sudoers
<usuario> ALL=(ALL) NOPASSWD:ALL
```


### Habilitar tarjeta de red
```bash
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
ping google.com
```

> Iniciar con usuario personal
### Actualizar sistema
```bash
sudo pacman -Syyu
```
### Servidor grafico
```bash
sudo pacman -S xorg-server xorg-xinit
sudo pacman -S mesa mesa-demos
```

### Entorno grafico
#### XFCE
	sudo pacman -S xfce4 xfce4-goodies network-manager-applet pulseaudio
	START: exec startxfce4
#### PLASMA
	sudo pacman -S plasma-desktop plasma-meta plasma-wayland-session
	1 Jack2, 5 ttf-dejavu, 2 wireplumber, 2 phonon-qt5-vlc
	START: exec startplasma-x11
#### GNOME
	sudo pacman -S gnome gnome-extra
	START:
		export XDG_SESSION_TYPE=x11
		export GDK_BACKEND=x11
		exec gnome-session

```bash
/home/<usuario>/.xinitrc
```
{START}

### Teclado XOrg
```bash
sudo vim /etc/X11/xorg.conf.d/00-keyboard.conf
```

	Section "InputClass"
		Identifier "system-keyboard"
		MatchIsKeyboard "on"
		Option "XkbLayout" "es"
	EndSection


### Login 
```bash
sudo pacman -S sddm
sudo systemctl enable sddm
```
```bash
reboot
```