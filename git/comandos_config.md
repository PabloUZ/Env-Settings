# Configuracion Git

## Nombre y Correo
```bash
git config --global user.name "PabloU"
```
```bash
git config --global user.email "puribezuluaga28@gmail.com"
```

## Rama principal
```bash
git config --global init.defaultBranch main
```

## SSH

1. Crear llaves
```bash
ssh-keygen -t rsa -b 4096 -C "puribezuluaga28@gmail.com"
```
2. verificar agente ssh
```bash
eval $(ssh-agent -s)
```
3. agregar llave privada al sistema
```bash
ssh-add ~/.ssh/id_rsa
```
4. agregar llave publica a GitHub