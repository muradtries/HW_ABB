import Foundation

var llist = SinglyLinkedList<Int>()
llist[0] = 1
llist[1] = 2
llist[2] = 3
llist[3] = 4

print(llist.description)
print("-------------------")

// Getting the tail node's value
print("TAIL NODE'S VALUE: \(llist.tail?.value)")

// Getting the number of nodes of linked list
print("COUNT: \(llist.count)")

// Getting the node at the given index
print("NODE AT 2nd INDEX: \(llist.node(at: 2))")

// Getting the value at given index
print("VALUE AT 2nd INDEX: \(llist.value(at: 2))")

// Getting first index of given value
print("FIRST INDEX OF 3: \(llist.firstIndex(of: 3))")

// Appending new node
llist.append(LinkedListNode(value: 5))

// Appending new value
llist.append(6)

// Inserting node at given index
llist.insert(LinkedListNode(value: 10), at: 3)

// Inserting value at given index
llist.insert(10, at: 5)

// Reversing linked list
llist.reverse()
print("UPDATED LIST: \(llist.description)")

// Testing invalid index
print(llist[999])

// Testing valid index
print(llist[5])
