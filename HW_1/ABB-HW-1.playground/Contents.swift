import Foundation

// Task 1: Create enumeratedMap function as collection extension
// You can find function at the Int+Extension file in Sources folder

let stringList: [String] = ["lorem", "ipsum", "desrever", "fox"]

let enumeratedMap = stringList.enumeratedMap { idx, element in
    if idx == 2 {
        return String(element.reversed())
    }

    return element
}

print(enumeratedMap)

// Task 2: Create a function that would return digits of a given number
// You can find function at the Int+Extension file in Sources folder

print((-12_345_678_901).digits)
