//
//  Main.swift
//  swiftAlgorithm
//
//  Created by Lee Myeonghwan on 2022/06/20.
//

let n = Int(readLine()!)!
for i in 0..<n {
    for _ in 0..<n-i-1 {
        print(" ", terminator: "")
    }
    for _ in n-i...n {
        print("*", terminator: "")
    }
    print("")
}
