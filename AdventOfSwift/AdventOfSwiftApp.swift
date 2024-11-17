//
//  AdventOfSwiftApp.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 14/11/2024.
//

import SwiftUI

@main
struct AdventOfSwiftApp: App {
    @StateObject private var appState = AppState()
    
    let allSolutions: [SolutionMetadata.Type] = [
        Year2023_Day01.self,
    ]
    
    init() {
        registerSolutions()
    }
    
    func registerSolutions() {
        allSolutions.forEach { SolutionRegistry.register($0)}
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(appState)
        }
    }
}
