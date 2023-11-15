//
//  MenuView.swift
//  VPNProject
//
//  Created by Muslim on 13.11.2023.
//

import SwiftUI

struct MenuView: View {
    
    @State var isConnected = false
    @State var autoMode = false
    
    var body: some View {
        
        VStack {
            // MARK: - Header
            HStack {
                Text(showLogo())
                
                Spacer()
                
                Button {
                    // TODO action
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
            
            // MARK: - Connection Button Section
            VStack {
                Text( !isConnected ? "Protect your connection" : " ")
                    .font(.custom("Dubai-Medium", size: 16))
                    .foregroundStyle(.white)
                
                Text(isConnected ? "Connected" : "Not Connected")
                    .font(.custom("Dubai-Medium", size: 18))
                    .foregroundStyle(.gray)
                
                // Indicators and Connection Button
                HStack(spacing: 25){
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
                    
                    // Connection Button
                    Button {
                        //TODO action
                    } label: {
                        ZStack(alignment: Alignment(horizontal: !isConnected ? .leading : .trailing, vertical: .center)) {
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
                        }
                        .frame(width: 170, height: 75)
                        .onTapGesture {
                            withAnimation {
                                isConnected.toggle()
                            }
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
                }
            }
            // View around button and indicators
            .frame(maxWidth: .infinity)
            .background(
                Color(.black)
                    .opacity(0.3)
                    .cornerRadius(24)
                    .padding(.vertical, -16)
            )
            .padding(.horizontal, 16)
            
            
            // MARK: - Location and Shorctut Buttons
            HStack {
                // Location Button
                Button {
                    // TODO action
                } label: {
                    HStack {
                        Image("Germany")
                            .frame(width: 42, height: 42)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Location")
                                .font(.custom("Dubai-Light", size: 14))
                                .foregroundStyle(.gray)
                            Text("Germany")
                                .font(.custom("Dubai-Regular", size: 16))
                                .foregroundStyle(.white)
                        }
                        .padding(.leading, 8)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.forward")
                            .font(.system(size: 12, weight: .black))
                            .foregroundStyle(.white)
                            .background(
                                Circle()
                                    .fill(.black.opacity(0.2))
                                    .frame(width: 28, height: 28)
                            )
                    }
                    // Location Button padding
                    .padding(.leading, 12)
                    .padding(.trailing, 24)
                    .padding(.vertical, 18)
                    .background(
                        Color(UIColor.black)
                            .cornerRadius(24)
                            .opacity(0.3)
                    )
                }
                
                // Shotcut Button
                Button {
                    autoMode.toggle()
                } label: {
                    HStack {
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
                                .fill( autoMode ? .orange : Color("DarkAccentColor"))
                                .frame(width: 8, height: 8)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Shortcut")
                                .font(.custom("Dubai-Light", size: 14))
                                .foregroundStyle(.white)
                            Text("Auto Mode")
                                .font(.custom("Dubai-Regular", size: 16))
                                .foregroundStyle(.white)
                        }
                    }
                    // Shortcut Button padding
                    .padding(.vertical, 18)
                    .padding(.horizontal, 12)
                    .background(
                        Color(UIColor.black)
                            .cornerRadius(24)
                            .opacity(0.3)
                    )
                    .overlay(
                        autoMode ? RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.orange) : nil
                    )
                }
            }
            // Location and Shortcut Button paddings
            .padding(.horizontal, 16)
            .padding(.vertical, 32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
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
