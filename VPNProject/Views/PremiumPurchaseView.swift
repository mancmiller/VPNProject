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
        PriceButton(time: "1 year", sum: 47_990, isSelected: true),
        PriceButton(time: "1 month", sum: 6_290, isSelected: false),
        PriceButton(time: "1 week", sum: 2_190, isSelected: false)
    ]
    
    var body: some View {
        VStack(spacing: padding * 2) {
            
            // MARK: - Back Button and Label HStack
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
            .frame(maxHeight: 32, alignment: .top)
            .padding(.horizontal, padding)
            
            // MARK: - Perks VStack
            VStack(spacing: padding / 2) {
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
            }
            
            // MARK: - PriceButtions VStack
            VStack(spacing: padding / 2) {
                ForEach(priceButtons) { priceButton in
                    Button {
                        priceButton.isSelected.toggle()
                    } label: {
                        HStack(spacing: padding) {
                            !priceButton.isSelected ? Image(systemName: "circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.white)
                            : Image("Circle.Fill")
                                .frame()
                                .foregroundStyle(.white)
                            
                            VStack(alignment: .leading, spacing: -8) {
                                Text(priceButton.time)
                                    .font(.custom("Dubai-Medium", size: 22))
                                    .foregroundStyle(.white)
                                Text("₸ " + String(priceButton.sum))
                                    .font(.custom("Dubai-Regular", size: 18))
                                    .foregroundStyle(.white).opacity(0.7)
                            }
                            
                            Spacer()
                            
                            if priceButton.time == "1 year" {
                                Text("₸ " + String(ceil(priceButton.sum / 12 * 10)/10.0) + " / month")
                                    .font(.custom("Dubai-Light", size: 18))
                                    .foregroundStyle(.white).opacity(0.7)
                            } else if priceButton.time == "1 month" {
                                
                                Text("₸ " + String(ceil(priceButton.sum * 100) / 100.0) + " / month")
                                    .font(.custom("Dubai-Light", size: 18))
                                    .foregroundStyle(.white).opacity(0.7)
                            } else {
                                Text("₸ " + String(priceButton.sum * 4) + " / month")
                                    .font(.custom("Dubai-Light", size: 18))
                                    .foregroundStyle(.white).opacity(0.7)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background( priceButton.isSelected ? Color("AccentColor") : .black.opacity(0.5))
                        .clipShape(Capsule())
                    }
                }
            }
            
            // MARK: - Proceed Button
            Button {
                
            } label: {
                HStack(alignment: .center) {
                    Text("3 days,")
                        .font(.custom("Dubai-Medium", size: 22))
                        .foregroundStyle(.white)
                    Text("then 47 990,00 / 1 year")
                        .font(.custom("Dubai-Regular", size: 18))
                        .foregroundStyle(.white).opacity(0.7)
                }
                .padding(.vertical, padding / 2)
                .frame(maxWidth: .infinity)
                .background(Color("OrangePremium"))
                .clipShape(Capsule())
            }
            
            Text("Terms of Use & Privacy Policy")
                .font(.custom("Dubai-Regular", size: 18))
                .foregroundStyle(.white).opacity(0.4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, padding)
        .background(
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }
}

struct PriceButton: Identifiable {
    let id = UUID()
    fileprivate let time: String
    fileprivate let sum: Double
    @State var isSelected: Bool
}

struct PremiumPerk: Identifiable {
    let id = UUID()
    fileprivate let image: String
    fileprivate let text: String
}

#Preview {
    PremiumPurchaseView()
}
