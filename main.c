#include <efi.h>
#include <efilib.h>

EFI_STATUS
EFIAPI
efi_main (EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    // Inicializar el entorno y la consola para gnu-efi
    InitializeLib(ImageHandle, SystemTable);

    // Usamos Print de gnu-efi
    Print(L"Hola Mundo! \n");

    // Devolver el control al firmware
    return EFI_SUCCESS;
}
