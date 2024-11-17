//
//  Solution.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//

import Foundation

protocol Solution : SolutionMetadata {
    func part1(input: String) -> AsyncStream<String>
    func part2(input: String) -> AsyncStream<String>
}
