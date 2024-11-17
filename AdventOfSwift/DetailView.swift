//
//  DetailView.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        WebView(url: URL(string: "https://adventofcode.com/\(appState.year)/day/\(appState.day)")!, sessionCookie: appState.sessionCookie)
    }
}
