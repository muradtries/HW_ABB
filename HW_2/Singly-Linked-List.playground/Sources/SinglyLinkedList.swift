import Foundation

public class LinkedListNode<T> {
    public var value: T
    public var next: LinkedListNode<T>?

    init(value: T) {
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
            assert(index <= count, "Index is out of bounds.")
            let node = self.node(at: index)
            return node?.value
        }

        set {
            if let newValue = newValue {
                self.insert(newValue, at: index)
            }
        }
    }

    public func node(at index: Int) -> Node? {
        assert(head != nil, "List is empty")
        assert(index >= 0, "Index couldn't be negative")

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

            assert(node != nil, "Index is out of bounds.")
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
            newNode.next = head
            head = newNode
        } else {
            let previous = node(at: index - 1)
            let next = previous?.next

            newNode.next = next
            previous?.next = newNode
        }
    }
}

extension SinglyLinkedList {
    public func reverse() {
        var previousNode = head
        var currentNode = head?.next

        head = head?.next
        previousNode?.next = nil

        while head != nil {
            head = head?.next
            currentNode?.next = previousNode

            previousNode = currentNode
            currentNode = head
        }

        head = previousNode
    }
}

extension SinglyLinkedList {
    public func firstIndex(of element: T) -> Int {
        var index = 0

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
