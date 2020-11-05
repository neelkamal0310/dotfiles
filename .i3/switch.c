#include<stdio.h>
#include<stdlib.h>

int main() {
    int n;
    int temp;
    int curr;
    scanf("%d", &n);
    int workspaces[100];
    for (int i = 0; i < 100; i++) {
        workspaces[i] = 0;
    }
    for (int i = 0; i < n; i++) {
        scanf("%d", &temp);
        workspaces[temp-1] = 1;
    }
    scanf("%d", &curr);
    for (int i = 0; i < 100 && i < curr; i++) 
        if ( workspaces[i] == 0){
            printf("%d", i+1);
            exit(1);
        }
    printf("%d", curr);
}
