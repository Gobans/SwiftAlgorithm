//
//  main.swift
//  swiftAlgorithm
//
//  Created by Lee Myeonghwan on 2022/06/21.
//

public class Node<Value> {
    public var value: Value
    public var next: Node?
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    } }

extension Node: CustomStringConvertible {
  public var description: String {
  guard let next = self.next else {
      return "\(value)"
  }
    // 구조체를 원하는 형식으로 출력
    return "\(value) -> " + String(describing: next) + " "
  }
}
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)
node1.next = node2
node2.next = node3
node3.next = node4
print(node1)
