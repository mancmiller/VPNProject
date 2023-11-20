//
//  ServerListViewModel.swift
//  VPNProject
//
//  Created by Muslim on 17.11.2023.
//

import Foundation

class ServerListViewModel: ObservableObject {
    @Published var servers: [Server] = [Server(countryName: "Germany", countryFlag: "Germany", isPremium: false, fast: false),
                                         Server(countryName: "South Korea", countryFlag: "SouthKorea", fast: false),
                                         Server(countryName: "Sweden", countryFlag: "Sweden"),
                                         Server(countryName: "Great Britain", countryFlag: "GB")
                                         ]
}
