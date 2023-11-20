//
//  PremiumPurchaseView.swift
//  VPNProject
//
//  Created by Muslim on 20.11.2023.
//

import SwiftUI

struct PremiumPurchaseView: View {
    
    @Environment(\.dismiss) var dismissScreen
    
    private let padding = CGFloat(16)
    
    @State var perks: [PremiumPerk] = [
        PremiumPerk(image: "Chart2", text: "The fastest servers"),
        PremiumPerk(image: "Settings", text: "Automatic VPN Mode"),
        PremiumPerk(image: "Rocket", text: "Speed Test"),
        PremiumPerk(image: "Info", text: "Connection Info")
    ]
    
    @State var priceButtons: [PriceButton] = [
    PriceButton(time: "1 year", sum: 47_990),
    PriceButton(time: "1 month", sum: 19_290),
    PriceButton(time: "1 week", sum: 4_790)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    dismissScreen()
                } label: {
                    ChevronView(color: .white, forwardOrBackward: "backward")
                }
                
                Spacer()
                
                Text("Premium")
                    .font(.custom("Dubai-Medium", size: 38))
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .frame(maxHeight: 32)
            .padding(.horizontal, padding * 2)
            
            List {
                ForEach(perks) { perk in
                    HStack(spacing: 16) {
                        Image(perk.image)
                            .frame(width: 32, height: 32)
                        Text(perk.text)
                            .font(.custom("Dubai-Regular", size: 16))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.leading, 12)
                    .padding(.vertical, 18)
                    .background(.black.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                .listRowBackground(Color.clear)
                .listRowInsets(.init(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)))
            }
            .scrollDisabled(true)
            .scrollContentBackground(.hidden)
        }
        
        .background(
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }
}



#Preview {
    PremiumPurchaseView()
}

struct PriceButton: Identifiable {
    let id = UUID()
    fileprivate let time: String
    fileprivate let sum: Double
}

struct PremiumPerk: Identifiable {
    
    let id = UUID()
    fileprivate let image: String
    fileprivate let text: String
}
