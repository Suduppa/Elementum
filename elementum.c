#include "element.h"
main() { Element flame = {150, 70, "FIRE"};
Element aqua = {40, 60, "WATER"};
while (flame.attack > aqua.attack) {
weaken_element(&flame, 5);
balance_element(&aqua, 10);
}
printf("flame: ATK=%d, HP=%d, TYPE=%s\n", flame.attack, flame.health, flame.type);
printf("aqua: ATK=%d, HP=%d, TYPE=%s\n", aqua.attack, aqua.health, aqua.type);
Element steam = {flame.attack / 2 + aqua.attack / 2, flame.health + aqua.health, "MIXED"};
printf("steam: ATK=%d, HP=%d, TYPE=%s\n", steam.attack, steam.health, steam.type);
strcpy(steam.type, "WATER");
printf("steam: ATK=%d, HP=%d, TYPE=%s\n", steam.attack, steam.health, steam.type);
balance_element(&steam, 50);
strengthen_element(&steam, 30);
printf("steam: ATK=%d, HP=%d, TYPE=%s\n", steam.attack, steam.health, steam.type);
printf("flame: ATK=%d, HP=%d, TYPE=%s\n", flame.attack, flame.health, flame.type);
printf("aqua: ATK=%d, HP=%d, TYPE=%s\n", aqua.attack, aqua.health, aqua.type); }