# Configuracion i3wm

## Programas Esenciales

> Pacman

```bash
root $ pacman -S <Paquete>
```
- tilix

```bash
usuario $ sudo pacman -S <Paquete>
```
- git
- pcmanfm
- rofi
- picom
- nitrogen
- xautolock
- arandr
- xrandr

### yay (AUR)
```bash
cd /opt

sudo git clone https://aur.archlinux.org/yay.git

id <usuario>

sudo chown -R <usuario>:<grupo> ./yay

cd yay

makepkg -si
```
> yay
```bash
usuario $ yay -S <Paquete>
```

- brave-bin

## Archivo de i3
```bash
~/.config/i3/config
```

## Archivo de Picom
Original:
```bash
/etc/xdg/picom.conf
```

Personalizado:
```bash
~/.config/picom/picom.conf
```

## Rofi

```bash
rofi-theme-selector
```

## Nitrogen
```bash
nitrogen <directorio de las imagenes>
```

## i3Blocks
```bash
/etc/i3blocks.conf
```