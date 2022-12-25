import Foundation

extension Int {
    public var digits: [Int] {
        get {
            return separateDigits(of: self)
        }
    }

    private func separateDigits(of number: Int) -> [Int] {
        var num: Int = abs(number)
        var arr: [Int] = []

        while num >= 10 {
            arr.insert(num % 10, at: 0)
            num = num / 10
        }

        if number < 0 {
            arr.insert(-num % 10, at: 0)
        } else {
            arr.insert(num % 10, at: 0)
        }

        return arr
    }
}
