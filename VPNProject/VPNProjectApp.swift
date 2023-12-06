//
//  VPNProjectApp.swift
//  VPNProject
//
//  Created by Muslim on 13.11.2023.
//

import SwiftUI

@main
struct VPNProjectApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                MainView()
            }
        }
    }
}
