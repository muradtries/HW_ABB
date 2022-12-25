import Foundation

var llist = SinglyLinkedList<Int>()
llist[0] = 1
llist[1] = 2
llist[2] = 3
llist[3] = 4

for node in llist {
    print("Node: \(node.value)")
}

print("Count of nodes: \(llist.count)\n")

llist[4] = 5

print("Reversed version of list\n")

let reversedList = llist.reversed()

for node in reversedList {
    print("Node: \(node.value)")
}
