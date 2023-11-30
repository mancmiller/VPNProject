//
//  IndicatorOuterCircle.swift
//  VPNProject
//
//  Created by Muslim on 30.11.2023.
//

import SwiftUI

struct IndicatorOuterCircle: View {
    var body: some View {
        Circle()
            .fill(.shadow(.inner(color: .black.opacity(0.2),
                                 radius: 4, x: 4, y: 4))
            )
            .fill(.shadow(.inner(color: Color("AccentColor"),
                                 radius: 4, x: -1, y: -1))
            )
            .foregroundStyle(.black.opacity(0.4))
            .frame(width: 20, height: 20)
    }
}
