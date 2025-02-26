#include <iostream>

extern "C" void copyArray(int* dest, const int* src, int length);

int main() {
    int source[] = {1, 2, 3, 4, 5};
    int destination[5];

    copyArray(destination, source, 5);

    std::cout << "Copied Array: ";
    for (int i = 0; i < 5; ++i) {
        std::cout << destination[i] << " ";
    }
    std::cout << std::endl;
    return 0;
}

// Assembly code for copying an array of integers
void copyArray(int* dest, const int* src, int length) {
    __asm {
        mov esi, src    // Source array
        mov edi, dest   // Destination array
        mov ecx, length // Length of the array

    copy_loop:
        mov eax, [esi]  // Load integer from [esi] to eax
        mov [edi], eax  // Store integer from eax to [edi]
        add esi, 4      // Move to the next integer in source array
        add edi, 4      // Move to the next integer in destination array
        loop copy_loop  // Decrement ecx and loop if ecx != 0
    }
}
