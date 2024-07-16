#include <string.h>
#include <stdio.h>


int main() {
    char input[100];
    int count = 0;

    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Remove trailing newline character
    input[strcspn(input, "\n")] = '\0';

    // Count the number of words
    for (int i = 0; input[i] != '\0'; i++) {
        if (input[i] == ' ' || input[i] == '\t') {
            count++;
        }
    }

    printf("Number of words: %d\n", count + 1);

    return 0;
}
