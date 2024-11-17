//
//  MainView.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        NavigationSplitView {
            SidebarView().environmentObject(appState)
        } content: {
            ContentView().environmentObject(appState)
        } detail: {
            DetailView().environmentObject(appState)
        }
        
    }
}

#Preview {
    MainView().environmentObject(AppState())
}
