//
//  SolutionRegistry.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//

class SolutionRegistry {
    static var registeredSolutions: [SolutionMetadata.Type] = []

    static func register(_ solution: SolutionMetadata.Type) {
        registeredSolutions.append(solution)
    }

    static func implementedSolutions() -> [Int: [Int]] {
        var solutionsByYear: [Int: [Int]] = [:]
        for solution in registeredSolutions {
            solutionsByYear[solution.year, default: []].append(solution.day)
        }
        return solutionsByYear
    }
    
    static func availableYears() -> [Int] {
        return implementedSolutions().keys.sorted()
    }
    
    static func availableDays(for year: Int) -> [Int] {
        let days = implementedSolutions()[year] ?? []
        return days.sorted()
    }
}
