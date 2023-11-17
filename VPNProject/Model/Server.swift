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
