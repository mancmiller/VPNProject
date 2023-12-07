//
//  SheetBackground.swift
//  VPNProject
//
//  Created by Muslim on 30.11.2023.
//

import SwiftUI

struct SheetBackground: View {
    var body: some View {
        RadialGradient(colors: [.black.opacity(0.1), Color(#colorLiteral(red: 0.4039215686, green: 0.05098039216, blue: 0.8549019608, alpha: 0.4019039735)), Color(#colorLiteral(red: 0.4666666667, green: 0.137254902, blue: 0.9411764706, alpha: 0.4)),Color(#colorLiteral(red: 0.3450980392, green: 0.05098039216, blue: 0.7411764706, alpha: 0.4)),Color(#colorLiteral(red: 0.02352941176, green: 0.003921568627, blue: 0.1019607843, alpha: 0.4)), .black], center: .bottom, startRadius: 40, endRadius: 400).ignoresSafeArea().opacity(0.4)
            .background(Color("SheetBackground"))
    }
}
