import Foundation

fileprivate enum SubscriptPurpose {
    case get, set
}

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
            guard self.isIndexSafe(index: index, purpose: .get) else { return nil }

            let node = self.node(at: index)
            return node?.value
        }

        set {
            guard self.isIndexSafe(index: index, purpose: .set) else { return }

            if index <= count - 1 {
                self.update(node: self.node(at: index), to: newValue)
            } else {
                self.insert(newValue, at: index)
            }
        }
    }

    public func value(at index: Int) -> T? {
        return self.node(at: index)?.value
    }

    public func node(at index: Int) -> Node? {
        guard index != 0 else { return head }

        var node = head?.next

        for _ in 1..<index {
            node = node?.next

            if node == nil {
                break
            }
        }

        return node
    }

    public func append(_ value: T) {
        let node = Node(value: value)
        append(node)
    }

    public func append(_ node: Node) {
        if let tail {
            tail.next = node
        } else {
            head = node
        }
    }

    public func insert(_ value: T?, at index: Int) {
        if let value {
            let node = Node(value: value)
            insert(node, at: index)
        }
    }

    public func insert(_ newNode: Node, at index: Int) {
        guard isIndexSafe(index: index, purpose: .set) else { return }

        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            let previous = node(at: index - 1)
            newNode.next = previous?.next
            previous?.next = newNode
        }
    }

    private func update(node: Node?, to newValue: T?) {
        if let newValue {
            node?.value = newValue
        }
    }
}

extension SinglyLinkedList {
    private func isIndexSafe(index: Int, purpose: SubscriptPurpose) -> Bool {
        switch purpose {
        case .get:
            if index <= count - 1 && index >= 0 {
                return true
            } else {
                return false
            }
        case .set:
            if index < count + 1 && index >= 0 {
                return true
            } else {
                print("Wrong index. Check your requested index again.")
                return false
            }
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
