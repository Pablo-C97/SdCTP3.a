# SdCTP3.a - Sistemas de Computación
**Universidad Nacional de Córdoba - FCEFyN**

## Análisis de Firmware UEFI y Aplicación "Hello World"

Este repositorio contiene el desarrollo de una aplicación nativa para el entorno UEFI y los scripts de automatización necesarios para su ejecución en entornos emulados. El análisis técnico detallado, los fundamentos de arquitectura y los resultados de la ingeniería inversa realizada con Ghidra se encuentran documentados en el informe técnico adjunto.

## Requisitos del Sistema
Para la construcción y emulación del proyecto en distribuciones basadas en Arch Linux (EndeavourOS), es necesario instalar las siguientes dependencias:
* **gnu-efi**: Bibliotecas y cabeceras para el desarrollo de aplicaciones UEFI.
* **qemu-system-x86** & **ovmf**: Plataforma de emulación y firmware de referencia.
* **binutils-mingw-w64** & **build-essential**: Toolchain de compilación necesaria para generar binarios PE/COFF.
* **ghidra**: Herramienta de ingeniería inversa utilizada para el análisis de binarios.

## Estructura del Proyecto
* `main.c`: Código fuente de la aplicación UEFI desarrollado sobre los servicios de consola del firmware.
* `Makefile`: Script de automatización para la compilación cruzada y configuración del entorno de arranque virtual.
* `NvVars`: Archivo para la persistencia de variables en la NVRAM emulada[cite: 1].
* `README.md`: Documentación técnica del repositorio.

## Instrucciones de Uso

### 1. Procedimiento de Construcción
Para compilar el código fuente y generar el binario ejecutable con formato EFI:
```bash
make
```
### 2. Ejecución y Emulación
Para simular con QEMU:

```bash
qemu-system-x86_64 -m 512 -bios /usr/share/ovmf/OVMF.fd -net none -drive format=raw,file=fat:rw:. -s -S
Shell> FS0:
FS0:\> helloworld.efi
