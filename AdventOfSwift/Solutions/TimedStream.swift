//
//  TimedStream.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//

import Foundation

func timedStream(_ stream: AsyncStream<String>, label: String = "") -> AsyncStream<String> {
    return AsyncStream { continuation in
        Task {
            let start = DispatchTime.now()
            
            // Forward all results from the original stream
            for await result in stream {
                continuation.yield(result)
            }
            
            let end = DispatchTime.now()
            let delta = Double(end.uptimeNanoseconds - start.uptimeNanoseconds)
            continuation.yield("\(label.isEmpty ? "" : "\(label) ")execution time: \(formatElapsedTime(delta))")
            continuation.finish()
        }
    }
}

func formatElapsedTime(_ nanoseconds: Double) -> String {
    if nanoseconds < 1_000 { // Less than 1 microsecond
        return String(format: "%.0f ns", nanoseconds)
    } else if nanoseconds < 1_000_000 { // Less than 1 millisecond
        return String(format: "%.3f µs", nanoseconds / 1_000) // Convert to microseconds
    } else if nanoseconds < 1_000_000_000 { // Less than 1 second
        return String(format: "%.3f ms", nanoseconds / 1_000_000) // Convert to milliseconds
    } else {
        return String(format: "%.6f s", nanoseconds / 1_000_000_000) // Convert to seconds
    }
}
