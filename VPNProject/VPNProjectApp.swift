//
//  VPNProjectApp.swift
//  VPNProject
//
//  Created by Muslim on 13.11.2023.
//

import SwiftUI

@main
struct VPNProjectApp: App {
    
    @StateObject var serverListViewModel: ServerListViewModel = ServerListViewModel()
    
    var body: some Scene {
        WindowGroup {
            MenuView()
        }
        .environmentObject(serverListViewModel)
    }
}
