import Foundation

public class LinkedListNode<T> {
    public var value: T
    public var next: LinkedListNode<T>?

    public init(value: T) {
        self.value = value
    }
}

public class SinglyLinkedList<T: Equatable> {

    public init() {}

    public typealias Node = LinkedListNode<T>

    private var head: Node?

    public var tail: Node? {
        guard var node = head else {
            return nil
        }

        while let next = node.next {
            node = next
        }

        return node
    }

    public var count: Int {
        guard var node = head else { return 0 }

        var count = 1

        while let next = node.next {
            node = next
            count += 1
        }

        return count
    }

    public subscript(index: Int) -> T? {
        get {
            if self.isIndexSafe(index: index) {
                let node = self.node(at: index)
                return node?.value
            } else {
                return nil
            }
        }

        set {
            if let newValue {
                self.insert(newValue, at: index)
            }
        }
    }

    public func node(at index: Int) -> Node? {
        if index == 0 {
            return head
        } else {
            var node = head?.next

            for _ in 1..<index {
                node = node?.next

                if node == nil {
                    break
                }
            }

            return node
        }
    }

    public func value(at index: Int) -> T? {
        return self.node(at: index)?.value
    }

    public func append(_ value: T) {
        let node = Node(value: value)
        append(node)
    }

    public func append(_ node: Node) {
        let newNode = node

        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = node
        }
    }

    public func insert(_ value: T, at index: Int) {
        let node = Node(value: value)
        insert(node, at: index)
    }

    public func insert(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = nil
            head = newNode
        } else {
            if index >= count - 1 {
                let previous = node(at: index - 1)

                newNode.next = nil
                previous?.next = newNode
            } else {
                let currentNode = node(at: index)
                currentNode?.value = newNode.value
            }
        }
    }

    public func update(node: Node, at index: Int, to newValue: T) {
        self.node(at: index)?.value = newValue
    }

    public func add(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = head
        }
    }

    private func isIndexSafe(index: Int) -> Bool {
        if index <= count - 1 && index >= 0 {
            return true
        } else {
            print("Wrong index. Check your requested index again.")
            return false
        }
    }
}

extension SinglyLinkedList {
    public func reverse() {
        var current = head
        var prev: Node?
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
    }
}

extension SinglyLinkedList {
    public func firstIndex(of element: T) -> Int? {
        var index: Int?

        for i in 0...count-1 {
            if value(at: i) == element {
                index = i
                break
            } else {
                continue
            }
        }

        return index
    }
}

extension SinglyLinkedList: Sequence {
    public func makeIterator() -> AnyIterator<Node> {
        var current: Node? = head

        return AnyIterator<Node> { () -> Node? in
            defer { current = current?.next }
            return current
        }
    }
}

extension SinglyLinkedList: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = head
        while let nd = node {
            s += "\(nd.value)"
            node = nd.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}
