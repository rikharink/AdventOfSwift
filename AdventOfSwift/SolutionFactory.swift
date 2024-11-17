//
//  SolutionFactory.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//
 
class SolutionFactory {
    
    public func getSolution2023(day: Int) throws -> Solution {
        switch day {
        case 1:
            return Year2023_Day01()
        default:
            throw SolutionError.notImplemented(year: 2023, day: day)
        }
    }
    
    public func getSolution(year: Int, day: Int) throws -> Solution {
        switch(year) {
        case 2023:
            return try getSolution2023(day: day)
        default:
            throw SolutionError.notImplemented(year: year, day: day)
        }
    }
}
