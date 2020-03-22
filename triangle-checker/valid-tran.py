#!/usr/bin/env python3

import math

def checkValidity(a, b, c):  
      
    # check condition  
    if (a + b <= c) or (a + c <= b) or (b + c <= a) : 
        return False
    else: 
        return True

def convertion(value):
    if 'sqrt' in value:
        value = value.replace('sqrt', '')
        value = floatDetector(value)
        value = math.sqrt(value)
        print('Square root value detected. Converting to integer...')
        return value
    elif 'dm' in value:
        value = value.replace('dm', '')
        value = floatDetector(value)
        value = value * 10
        print('Decimeters detected. Converting back to centimeters...')
        return value
    elif 'm' in value:
        value = value.replace('m', '')
        value = floatDetector(value)
        value = value * 100
        print('Meters detected. Converting back to centimeters...')
        return value
    else:
        value = floatDetector(value)
        return value

def floatDetector(value):
    if '.' in value:
            value = float(value)
            print('Float value detected. Changing data type...')
            return value
    else:
        return int(value)

# driver code  
a = input('Enter first side lenght : ')
b = input('Enter second side lenght : ')
c = input('Enter third side lenght : ')

a = convertion(a)
b = convertion(b)
c = convertion(c)

if checkValidity(a, b, c):
    print("\nThis triangle does exist!")
else:
    print("\nInvalid triangle.")
