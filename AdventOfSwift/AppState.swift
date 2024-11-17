//
//  SessionManager.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//
import Foundation

class AppState: ObservableObject {
    @Published var year: Int {
        didSet {
            UserDefaults.standard.set(year, forKey: "year")
        }
    }

    @Published var day: Int {
        didSet {
            UserDefaults.standard.set(day, forKey: "day")
        }
    }
    
    @Published var part: Int {
        didSet {
            UserDefaults.standard.set(part, forKey: "part")
        }
    }
    
    @Published var sessionCookie: String {
        didSet {
            UserDefaults.standard.set(sessionCookie, forKey: "sessionCookie")
        }
    }
    
    @Published var output: String;
    
    init() {
        self.sessionCookie = UserDefaults.standard.string(forKey: "sessionCookie") ?? ""
        let defaultYear = UserDefaults.standard.object(forKey: "year") as? Int
           ?? SolutionRegistry.implementedSolutions().keys.max() ?? Calendar.current.component(.year, from: Date())
        self.year = defaultYear
        self.day = UserDefaults.standard.object(forKey: "day") as? Int ?? 1
        self.part = UserDefaults.standard.object(forKey: "part") as? Int ?? 1
        self.output = ""
    }
}
