import Foundation

var llist = SinglyLinkedList<Int>()
llist[0] = 1
llist[1] = 2
llist[2] = 3
llist[3] = 4

print(llist.description)
print("\n-------------------------\n")

// Getting the tail node's value
print("TAIL NODE'S VALUE: \(llist.tail?.value)\n")

// Getting the number of nodes of linked list
print("COUNT: \(llist.count)\n")

// Getting the node at the given index
print("NODE AT 2nd INDEX: \(llist.node(at: 2))\n")

// Getting the value at given index
print("VALUE AT 2nd INDEX: \(llist.value(at: 2))\n")

// Getting first index of given value
print("FIRST INDEX OF 3: \(llist.firstIndex(of: 3))\n")

// Appending new node
llist.append(LinkedListNode(value: 5))

// Appending new value
llist.append(6)

// Inserting node at given index
llist.insert(LinkedListNode(value: 10), at: 3)

// Inserting value at given index
llist.insert(10, at: 5)

// Reversing linked list
print("CURRENT: \(llist.description)\n")
llist.reverse()
print("REVERSED: \(llist.description)\n")

// Testing invalid index
print("\(llist[999])\n")

// Testing valid index
print("\(llist[5])")
