#include <iostream>
#include <string.h>

extern "C" void copySubstring(char* dest, const char* src, int start, int length);

int main() {
    char source[] = "Hello, World!";
    char destination[20];

    copySubstring(destination, source, 7, 5);

    std::cout << "Copied Substring: " << destination << std::endl;
    return 0;
}

// Assembly code for copying a substring
void copySubstring(char* dest, const char* src, int start, int length) {
    __asm {
        mov esi, src    // Source string
        mov edi, dest   // Destination string
        add esi, start  // Move to the starting position
        mov ecx, length // Length of the substring

    copy_loop:
        lodsb           // Load byte from [esi] to al and increment esi
        stosb           // Store byte from al to [edi] and increment edi
        loop copy_loop  // Decrement ecx and loop if ecx != 0

        mov byte ptr [edi], 0 // Null-terminate the destination string
    }
}
