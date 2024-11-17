//
//  AdventOfSwiftTests.swift
//  AdventOfSwiftTests
//
//  Created by Rik Harink on 14/11/2024.
//

import Testing
@testable import AdventOfSwift

struct AdventOfSwiftTests {
    
    let sessionCookie = "53616c7465645f5f638cf65cd60d662e631fb8d57a990963f40ad0d5f69fb9e14fc9452711192aba0b9db1cf821c1ec7f0cc17fa0909d3678ec2880a5e968163"

    @Test func day01() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let day01 = Year2023_Day01()
        let runner = Runner(solution: day01, sessionCookie: sessionCookie, day: 1, year: 2023)
        let (part1, part2) = try await runner.run()
        #expect(part1 == 55477)
        #expect(part2 == 54431)
    }

}
