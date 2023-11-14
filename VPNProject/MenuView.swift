//
//  MenuView.swift
//  VPNProject
//
//  Created by Muslim on 13.11.2023.
//

import SwiftUI

struct MenuView: View {
    
    @State var isConnected = false
    
    var body: some View {
        VStack {
            
            // MARK: - Header
            HStack {
                
                Text(showLogo())
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("MenuButton")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(
                                    .shadow(.inner(color: .black .opacity(0.6),
                                                   radius: 1, x: 4, y: 4))
                                )
                                .fill(
                                    .shadow(.inner(color: .white .opacity(0.6),
                                                   radius: 2, x: -1, y: -1))
                                )
                        ).foregroundStyle(.black.opacity(0.4))
                }
            }.padding(16)
            
            // MARK: - Button Section
            VStack {
                
                Text( !isConnected ? "Protect your connection" : " ")
                    .font(.custom("Dubai-Medium", size: 16))
                    .foregroundStyle(.white)
                
                Text(isConnected ? "Connected" : "Not Connected")
                    .font(.custom("Dubai-Medium", size: 18))
                    .foregroundStyle(.gray)
                
                HStack{
                    
                    // Indicator OFF
                    ZStack {
                        Circle()
                            .fill(.shadow(.inner(color: .black.opacity(0.2),
                                                 radius: 4, x: 4, y: 4))
                            )
                            .fill(.shadow(.inner(color: Color("AccentColor"),
                                                 radius: 4, x: -1, y: -1))
                            )
                            .foregroundStyle(.black.opacity(0.4))
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill( !isConnected ? .red : Color("DarkAccentColor"))
                            .frame(width: 8, height: 8)
                    }
                    .padding(.trailing, 14)
                    
                    // Button
                    ZStack(alignment: Alignment(horizontal: !isConnected ? .leading : .trailing, vertical: .center), content: {
                        Capsule()
                            .fill(Color.black.opacity(0.3))
                        Capsule()
                            .fill(.shadow(.inner(color: Color("AccentColor").opacity(0.4),
                                                 radius: 2, x: -4, y: -4))
                            )
                            .foregroundStyle(.black.opacity(0.4))
                            .padding(.vertical, 10)
                            .padding(.horizontal, 14)
                        
                        Image("Toggle")
                        
                    })
                    .frame(width: 170, height: 75)
                    .onTapGesture {
                        withAnimation {
                            isConnected.toggle()
                        }
                    }
                    
                    // Indicator ON
                    ZStack {
                        Circle()
                            .fill(.shadow(.inner(color: .black.opacity(0.2),
                                                 radius: 4, x: 4, y: 4))
                            )
                            .fill(.shadow(.inner(color: Color("AccentColor"),
                                                 radius: 4, x: -1, y: -1))
                            )
                            .foregroundStyle(.black.opacity(0.4))
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill( isConnected ? .green : Color("DarkAccentColor"))
                            .frame(width: 8, height: 8)
                    }
                    .padding(.leading, 14)
                }
            }
            
            // View around button and indicators
            .padding(.horizontal, 48)
            .padding(.vertical, 16)
            .background(
                Color(UIColor.black)
                    .cornerRadius(24)
                    .opacity(0.3)
            )
            .frame(maxHeight: .infinity, alignment: .top)
        }
        
        // MARK: Background Image
        .background(
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }
    
    // MARK: - func
    func showLogo() -> AttributedString {
        var string = AttributedString("StriderVPN")
        if let range = string.range(of: "Strider") {
            string[range].font = .custom("Dubai-Bold", size: 24)
            string[range].foregroundColor = UIColor(named: "AccentColor")
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
