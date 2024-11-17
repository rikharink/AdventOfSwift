//
//  Runner.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//

import Foundation

class Runner {
    private let solution: Solution
    private let puzzleFetcher: PuzzleFetcher
    private let day: Int
    private let year: Int
    
    init(sessionCookie: String, day: Int, year: Int) {
        let factory = SolutionFactory()
        self.solution = try! factory.getSolution(year: year, day: day)
        self.puzzleFetcher = PuzzleFetcher(sessionCookie: sessionCookie)
        self.day = day
        self.year = year
    }
    
    public func runTest(part: Int, testInput: String) async throws -> AsyncStream<String> {
        return part == 1 ? runPart1(input: testInput) : runPart2(input: testInput)
    }
    
    public func run(_ part: Int) async throws -> AsyncStream<String> {
        let input = try await puzzleFetcher.fetchInput(for: day, year: year)
        return part == 1 ? runPart1(input: input) : runPart2(input: input)
    }
    
    private func runPart1(input: String) -> AsyncStream<String> {
        return timedStream(solution.part1(input: input))
    }
    
    private func runPart2(input: String) -> AsyncStream<String> {
        return timedStream(solution.part2(input: input))
    }
}
