//
//  Server.swift
//  VPNProject
//
//  Created by Muslim on 16.11.2023.
//

import SwiftUI

struct Server: Identifiable {
    var id = UUID().uuidString
    var countryName: String
    var countryFlag: String
    var isPremium = true
    var fast = true
}
var servers: [Server] = [Server(countryName: "Germany", countryFlag: "Germany", isPremium: false, fast: true),
                                     Server(countryName: "South Korea", countryFlag: "SouthKorea", fast: false),
                                     Server(countryName: "Sweden", countryFlag: "Sweden"),
                                     Server(countryName: "Great Britain", countryFlag: "GB")
                                     ]
