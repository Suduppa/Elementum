#ifndef ELEMENT_H
#define ELEMENT_H

// Определение структуры для представления элемента
typedef struct {
    int attack;        // Мощность атаки элемента
    int health;        // Количество здоровья элемента
    char type[16];     // Тип элемента (например, FIRE, WATER)
} Element;

// Функции для работы с элементами
void create_element(Element* elem, const char* type, int attack, int health);
void react_elements(const Element* elem1, const Element* elem2, Element* result);
void strengthen_element(Element* elem, int value) {elem->attack = elem->attack+value;};
void weaken_element(Element* elem, int value) {elem->attack = elem->attack-value;};
void balance_element(Element* elem, int value) {elem->health = elem->health+value;}; // Добавлена недостающая декларация

#endif // ELEMENT_H
