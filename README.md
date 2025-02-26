#include <iostream>

extern "C" int countMatches(const int* array, int size, int value);

int main() {
    int array[] = {1, 2, 3, 4, 2, 5, 2, 6, 2};
    int size = sizeof(array) / sizeof(array[0]);
    int value;

    std::cout << "Enter the value to count: ";
    std::cin >> value;

    int count = countMatches(array, size, value);

    std::cout << "Number of matches: " << count << std::endl;
    return 0;
}

// Assembly code to count matches using chained commands
int countMatches(const int* array, int size, int value) {
    int count = 0;
    __asm {
        mov esi, array   // Source array
        mov ecx, size    // Size of the array
        mov edx, value   // Value to match
        xor ebx, ebx     // Clear ebx (will be used as count register)

    count_loop:
        lodsd            // Load integer from [esi] to eax and increment esi by 4
        cmp eax, edx     // Compare value in eax with edx
        je increment     // If equal, jump to increment
        jmp next_iter    // Otherwise, jump to next iteration

    increment:
        inc ebx         // Increment count in ebx

    next_iter:
        loop count_loop  // Decrement ecx and loop if ecx != 0

        mov count, ebx   // Move the result from ebx to count variable
    }
    return count;
}
