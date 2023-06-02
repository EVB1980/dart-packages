<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Small extension methods for commonly used types.

## Features

### Objects

* ```bool equalsToNullable(T? another, bool Function(T, T) compare)``` - compares nullable objects

### Lists

* ```bool isEmptyList()``` - checks if list is empty
* ```bool equalsToList(List<T> another, bool Function(T, T) compareItems)``` - compares two generic lists
* ```bool equalsToNullableList(List<T>? another, bool Function(T, T) compareItems)``` - compares two nullable generic lists
* ```bool equalsToNullableListOfNullables(List<T?>? another, bool Function(T, T) compareItems)``` - compares two nullable generic lists of nullables

#### Lists of integers

* ```bool equalsToListOfInts(List<int> another)``` - compares two lists of integers
* ```bool equalsToNullableListOfInts(List<int>? another)``` - compares two nullable lists of integers
* ```bool equalsToNullableListOfNullableInts(List<int?>? another)``` - compares two nullable lists of nullable integers

### Strings

* ```bool isStringEmpty()``` - returns true if string is empty
* ```bool isWhiteSpace()``` - returns true if string is whitespace (consists of any: ' ', '\n', '\r')
* ```bool equalsToString(String other)``` - returns true if two strings equals
* ```bool equalsToStringIgnoreCase(String other)``` - returns true if two strings equals with ignoring case
* ```bool isStringNullOrEmpty()``` - returns true if nullable string is null or empty
* ```bool isStringNullOrWhiteSpace()``` - returns true if nullable string is null or whitespace (consists of any: ' ', '\n', '\r')
* ```bool isStringNullOrEmptyOrWhiteSpace()``` - returns true if nullable string is null or empty or whitespace (consists of any: ' ', '\n', '\r')
* ```bool equalsToNullableString(String other)``` - returns true if two nullable strings equals
* ```bool equalsToNullableStringIgnoreCase(String other)``` - returns true if two nullable strings equals with ignoring case
