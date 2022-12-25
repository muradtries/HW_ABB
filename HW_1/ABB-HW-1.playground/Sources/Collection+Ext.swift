import Foundation

// If I understood hometask correctly, this function does the thing. But I'm sure there are rooms
// for optimizing this function. I'm looking forward to see better solution

extension Collection {
    public func enumeratedMap<T>(mappingBlock: (Int, Element) -> T) -> [T] {
        var index = 0
        var arr: [T] = []

        for element in self {
            arr.append(mappingBlock(index, element))
            index += 1
        }

        return arr
    }
}
