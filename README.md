# Elementum  
# Elementum Programming Language  

**Elementum** is a specialized programming language designed for modeling and interacting with elements. Each element has characteristics: type (e.g., FIRE, WATER), attack, and health. The language allows users to create elements, modify their parameters, combine them, and perform various operations, including conditionals and loops. This repository contains the implementation of the Elementum compiler, along with example programs.  

---  

## Key Features  

- **Element Creation**: Define objects with type, attack, and health.  
- **Element Interaction**: Reactions and combinations of elements to create new ones.  
- **Conditionals and Loops**: Execute actions based on conditions or repeat operations while a condition is true.  
- **Flexible Structure**: Easily extend the language syntax for additional tasks.  

---  

## Example Program  

A program in Elementum:  

```plaintext  
CREATE FIRE flame 20 80  
CREATE WATER aqua 10 70  
REACT flame aqua  
STATE flame  
STATE aqua  
IF (HP flame > HP aqua)  
    TRANSFORM flame EARTH  
END
```






---------------------------------------------------------------------------------------------------------------------------------------------------








# Elementum
# Язык программирования Elementum

**Elementum** — это специализированный язык программирования, предназначенный для моделирования и взаимодействия с элементами. Каждый элемент обладает характеристиками: типом (например, FIRE, WATER), атакой и здоровьем. Язык позволяет создавать элементы, изменять их параметры, комбинировать их и выполнять над ними различные операции, включая условия и циклы. Этот репозиторий содержит реализацию компилятора языка Elementum, а также примеры программ.

---

## Основные возможности

- **Создание элементов**: Определение объектов с типом, атакой и здоровьем.
- **Взаимодействие элементов**: Реакции и комбинирование элементов для создания новых.
- **Условные конструкции и циклы**: Выполнение действий на основе условий или повторение операций, пока условие истинно.
- **Гибкая структура**: Возможность легко расширять синтаксис языка под дополнительные задачи.

---

## Пример программы

Программа на Elementum:

```plaintext
CREATE FIRE flame 20 80
CREATE WATER aqua 10 70
REACT flame aqua
STATE flame
STATE aqua
IF (HP flame > HP aqua)
    TRANSFORM flame EARTH
END

