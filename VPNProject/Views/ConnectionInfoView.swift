//
//  ConnectionInfoView.swift
//  VPNProject
//
//  Created by Muslim on 23.11.2023.
//

import SwiftUI

struct ConnectionInfoView: View {
    
    @State var userServer = [UserServer(ip: "5.18.186.247", country: "Slovakia", city: "Bratislava", isp: "Telecom", timezone: "Europe")]

    
    
    var body: some View {
        ZStack {
            SheetBackground()
            VStack {
                HStack {
                    Image("Info")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Connection")
                        .font(.custom("Dubai-Regular", size: 14))
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 32)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct UserServer: Identifiable {
    let id = UUID()
    let ip: String
    let country: String
    let city: String
    let isp: String
    let timezone: String
}

#Preview {
    ConnectionInfoView()
}
