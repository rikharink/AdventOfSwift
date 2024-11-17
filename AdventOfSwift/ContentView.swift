//
//  ContentView.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 14/11/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        if !appState.output.isEmpty {
            VStack {
                ScrollView {
                    Text(appState.output)
                        .padding()
                        .background(Color(NSColor.windowBackgroundColor))
                        .cornerRadius(8)
                        .textSelection(.enabled)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
