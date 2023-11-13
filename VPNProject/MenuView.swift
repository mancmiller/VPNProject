//
//  MenuView.swift
//  VPNProject
//
//  Created by Muslim on 13.11.2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            HStack {
                Text(getLogo())
                Spacer()
                Button {
                // Button action
                } label: {
                    Image("MenuButton")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(
                        Circle()
                            .fill(
                                .shadow(.inner(color:.white .opacity(0.3),
                                               radius: 1,
                                               x: -1, y: -1))
                            )
                        ).foregroundStyle(.black.opacity(0.6))
                }
            }.padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
        }
    }
    func getLogo() -> AttributedString {
        var string = AttributedString("StriderVPN")
        if let range = string.range(of: "Strider") {
            string[range].font = .custom("Dubai-Bold", size: 24)
            string[range].foregroundColor = UIColor(named: "LogoColor")
        }
        if let range = string.range(of: "VPN") {
            string[range].font = .custom("Dubai-Regular", size: 24)
            string[range].foregroundColor = .white
        }
        return string
    }
}

#Preview {
    MenuView()
}
