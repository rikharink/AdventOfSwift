//
//  SolutionError.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//

enum SolutionError: Error {
    case notImplemented(year: Int, day: Int)
    case inputFetchFailed(reason: String)
}
