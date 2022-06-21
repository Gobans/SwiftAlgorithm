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

//let node1 = Node(value: 1)
//let node2 = Node(value: 2)
//let node3 = Node(value: 3)
//node1.next = node2
//node2.next = node3
//print(node1)

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public init() {}
    public var isEmpty: Bool {
        return head == nil
    }
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: self.head)
        // 빈 리스트에 push를 했을 떄 tail이 head가 됌
        if tail == nil {
            tail = head }
    }
    public mutating func append(_ value: Value) {
    // 빈 배열일 떄는 push
      guard !isEmpty else {
        push(value)
        return
    }
    // tail 다음의 Node를 만들어준다
      tail!.next = Node(value: value)
    // 새로 만든 Node를 tail로 만들어준다
      tail = tail!.next
    }
    
    // insert를 위해 원하는 위치의 노드를 찾는 함수
    public func node(at index: Int) -> Node<Value>? {
      // 1
      var currentNode = head
      var currentIndex = 0
      // 2
      while currentNode != nil && currentIndex < index {
        currentNode = currentNode!.next
        currentIndex += 1
    }
      return currentNode
    }
    
    // @discardableResult는 결과값이 쓰이지 않았을떄 warning이 띄워지는 것을 없애준다.
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value> {
    // insert를 마지막 tail부분에 한다면 append하는 것과 같다.
    guard tail !== node else {
      append(value)
      return tail!
    }
    // 다음 노드를 만들어준다.
      node.next = Node(value: value, next: node.next)
      return node.next!
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

//var list = LinkedList<Int>()
//list.push(3)
//list.push(2)
//list.push(1)
//print(list)

//var list = LinkedList<Int>()
//list.append(1)
//list.append(2)
//list.append(3)
//print(list)

//  var list = LinkedList<Int>()
//  list.push(3)
//  list.push(2)
//  list.push(1)
//  print("Before inserting: \(list)")
//  var middleNode = list.node(at: 1)!
//  for _ in 1...4 {
//    middleNode = list.insert(-1, after: middleNode)
//  }
//  print("After inserting: \(list)")
