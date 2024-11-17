//
//  Day01.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//

struct Year2023_Day01 : Solution {
    static let year = 2023
    static let day = 1
    
      
    func fetchDigits(line: String) -> Int? {
        var leftDigit: Int?
        var rightDigit: Int?
        
        var leftIndex = line.startIndex
        var rightIndex = line.index(before: line.endIndex)
        
        while leftIndex < line.endIndex && rightIndex >= line.startIndex {
            
            if leftDigit == nil, line[leftIndex].isNumber {
                leftDigit = Int(String(line[leftIndex]))
            }
            
            if rightDigit == nil, line[rightIndex].isNumber {
                rightDigit = Int(String(line[rightIndex]))
            }
            
            if leftDigit != nil && rightDigit != nil {
                break
            }
            
            leftIndex = line.index(after: leftIndex)
            rightIndex = line.index(before: rightIndex)
        }
        
        if let left = leftDigit, let right = rightDigit {
            return left * 10 + right
        }
        return nil
    }
    
    func parsePart1(_ rawInput: String) -> [Int] {
        let lines = rawInput.split(separator: "\n")
        let values = lines.compactMap {
            fetchDigits(line: String($0))
        }
        return values
    }
    
    func parsePart2(_ rawInput: String) -> [Int] {
        let lines = rawInput.split(separator: "\n")
        let values = lines.compactMap {
            let line = String($0)
            let replacements: [String: String] = [
                "one": "o1e",
                "two": "t2o",
                "three": "t3e",
                "four": "f4r",
                "five": "f5e",
                "six": "s6x",
                "seven": "s7n",
                "eight": "e8t",
                "nine": "n9e",
                "zero": "z0o"
            ]
            
            var modified = String(line)
            for (word, replacement) in replacements {
                modified = modified.replacingOccurrences(of: word, with: replacement)
            }
            return fetchDigits(line: modified)
        }
        return values
    }
    
    func part1(input: String) -> AsyncStream<String> {
        AsyncStream { continuation in
            let calibrationValues = parsePart1(input)
            let result = calibrationValues.reduce(0, +)
            continuation.yield("part 1: \(result)")
            continuation.finish()
        }
    }
    
    func part2(input: String) -> AsyncStream<String> {
        AsyncStream { continuation in
            let calibrationValues = parsePart2(input)
            let result = calibrationValues.reduce(0, +)
            continuation.yield("part 2: \(result)")
            continuation.finish()
        }
    }
}

