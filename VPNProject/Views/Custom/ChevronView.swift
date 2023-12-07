//
//  ChevronView.swift
//  VPNProject
//
//  Created by Muslim on 30.11.2023.
//

import SwiftUI

struct ChevronView: View {
    
    let color: Color
    let forwardOrBackward: String
    
    var body: some View {
        Image(systemName: "chevron.\(forwardOrBackward)")
            .font(.system(size: 12, weight: .black))
            .foregroundStyle(.white)
            .background(
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 24, height: 24)
            )
    }
}

