//
//  SidebarView.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//
import Foundation
import SwiftUI

struct SidebarView : View {
    @EnvironmentObject var appState: AppState
    @State private var isRunning = false
    
    var selectedDay: Int {
        appState.day
    }
    
    var selectedYear: Int {
        appState.year
    }
    
    var availableDays: [Int] {
        SolutionRegistry.availableDays(for: selectedYear)
    }
    
    
    var body: some View {
        VStack {
            VStack {
                Text("Session Cookie:")
                    .font(.headline)
                TextField("Session Cookie", text: $appState.sessionCookie)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Picker("Year", selection: $appState.year) {
                ForEach(SolutionRegistry.availableYears(), id: \.self) { year in
                    Text(String(year)).tag(year)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            Picker("Day", selection: $appState.day) {
                ForEach(availableDays, id: \.self) { day in
                    Text("day \(day)").tag(day)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            Picker("Part", selection: $appState.part) {
                ForEach([1,2], id: \.self) { part in
                    Text("part \(part)").tag(part)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            
            Button(action: {
                Task {
                    await runSolution()
                }
            }) {
                Text("Run")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(isRunning ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .disabled(isRunning)
            .padding()
        }
        .onChange(of: selectedYear) {
            if !availableDays.contains(selectedDay) {
                appState.day = availableDays.first ?? 1
            }
        }
    }
    
    func runSolution() async {
        guard !appState.sessionCookie.isEmpty else {
            appState.output = "Session cookie is required."
            return
        }
        
        isRunning = true
        defer { isRunning = false }
        appState.output = ""
        let runner = Runner(sessionCookie: appState.sessionCookie, day: appState.day, year: appState.year)
        do {
            let stream = try await runner.run(appState.part)
            for await res in stream {
                if !appState.output.isEmpty {
                    appState.output.append("\n")
                }
                appState.output.append("\(res)")
            }
        }
        catch{
            appState.output = "An error occured: \(error.localizedDescription)"
        }
    }
}
