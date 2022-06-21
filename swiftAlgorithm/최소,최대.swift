//
//  main.swift
//  swiftAlgorithm
//
//  Created by Lee Myeonghwan on 2022/06/10.
//

let n = readLine()!
let numArr = readLine()!.split(separator: " ").map {Int($0)!}
let maxValue = numArr.max()
let minValue = numArr.min()
print(minValue!, terminator: " ")
print(maxValue!)
