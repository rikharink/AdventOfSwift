//
//  Fetcher.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//
import Foundation

class PuzzleFetcher {
    private let sessionCookie: String
    private let cacheDirectory: URL
    
    public init(sessionCookie: String) {
        self.sessionCookie = sessionCookie
        let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        self.cacheDirectory = cachesDirectory.appendingPathComponent("AdventOfSwiftCache")
        
        if !FileManager.default.fileExists(atPath: cacheDirectory.path) {
            try? FileManager.default.createDirectory(at: cacheDirectory, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    public func fetchInput(for day: Int, year: Int) async throws -> String {
        let cacheFile = cacheFilePath(for: day, year: year)

        // Return cached input if available
        if let cachedInput = try? String(contentsOf: cacheFile, encoding: .utf8) {
            return cachedInput
        }

        // Otherwise, fetch from server
        guard let url = URL(string: "https://adventofcode.com/\(year)/day/\(day)/input") else {
            throw NSError(domain: "InvalidURL", code: 1, userInfo: nil)
        }

        var request = URLRequest(url: url)
        request.setValue("session=\(sessionCookie)", forHTTPHeaderField: "Cookie")

        let (data, _) = try await URLSession.shared.data(for: request)

        guard let input = String(data: data, encoding: .utf8) else {
            throw NSError(domain: "InvalidResponse", code: 2, userInfo: nil)
        }

        // Cache the input
        try input.write(to: cacheFile, atomically: true, encoding: .utf8)
        return input
    }
    
    private func cacheFilePath(for day: Int, year: Int) -> URL {
        return cacheDirectory.appendingPathComponent("\(year)-\(day).txt")
    }
}
