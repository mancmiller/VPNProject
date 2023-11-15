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
                                    .shadow(.inner(color: .black.opacity(0.6),
                                                   radius: 1, x: 4, y: 4))
                                )
                                .fill(
                                    .shadow(.inner(color: .white.opacity(0.6),
                                                   radius: 2, x: -1, y: -1))
                                )
                        ).foregroundStyle(.black.opacity(0.4))
                }
            }.padding(16)
            
            // MARK: - TurnOnButton Section
            VStack {
                Text( !isConnected ? "Protect your connection" : " ")
                    .font(.custom("Dubai-Medium", size: 16))
                    .foregroundStyle(.white)
                
                Text(isConnected ? "Connected" : "Not Connected")
                    .font(.custom("Dubai-Medium", size: 18))
                    .foregroundStyle(.gray)
                
                // Indicators and TurnOnButton
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
                    
                    // TurnOnButton
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
            // View around TurnOnButton and Indicators
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(.black.opacity(0.3))
                    .cornerRadius(24)
            )
            // TurnOnButton and Indicators HStack paddings
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            
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
                                    .frame(width: 24, height: 24)
                            )
                    }
                    // Location Button paddings
                    .padding(.leading, 12)
                    .padding(.trailing, 24)
                    .padding(.vertical, 18)
                    .background(
                        Color(.black.opacity(0.3))
                            .cornerRadius(24)
                    )
                }
                
                // Shotcut Button
                Button {
                    autoMode.toggle()
                } label: {
                    HStack {
                        // Indicator
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
                                .fill( autoMode ? Color("OrangePremium") : Color("DarkAccentColor"))
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
                    // Shortcut Button paddings
                    .padding(.vertical, 18)
                    .padding(.horizontal, 12)
                    .background(
                        Color(.black)
                            .cornerRadius(24)
                            .opacity(0.3)
                    )
                    .overlay(
                        autoMode ? RoundedRectangle(cornerRadius: 24)
                            .stroke(Color("OrangePremium")) : nil
                    )
                }
            }
            // Location and Shortcut Button HStack paddings
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            
            // GetPremiumButton
            Button {
                // TODO action
            } label: {
                HStack {
                    Image("Coupon")
                        .frame(width: 42, height: 42)
                        
                    VStack(alignment: .leading) {
                        Text("Get Premium")
                            .font(.custom("Dubai-Medium", size: 20))
                            .foregroundStyle(.white)
                        Text("• secure your data while surfing")
                            .font(.custom("Dubai-Light", size: 14))
                            .foregroundStyle(.white)
                        Text("• change the country without leaving home")
                            .font(.custom("Dubai-Light", size: 14))
                            .foregroundStyle(.white)
                            
                    }
                    .padding(.leading, 12)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .font(.system(size: 12, weight: .black))
                        .foregroundStyle(.white)
                        .background(
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 24, height: 24)
                        )
                }
                // GetPremiumButton inside padding
                .padding(.leading, 12)
                .padding(.trailing, 24)
                .padding(.vertical, 4)
                .background(
                    Color(Color("OrangePremium"))
                        .cornerRadius(24)
                )
            }
            // GetPremiumButton HStack padding
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 8)
            
            // SpeedTestButton
            Button {
                // TODO action
            } label: {
                HStack {
                    Image("Rocket")
                        .frame(width: 42, height: 42)
                        
                    VStack(alignment: .leading) {
                        Text("Speed Test")
                            .font(.custom("Dubai-Regular", size: 16))
                            .foregroundStyle(.white)
                        Text("Check your internet connection speed")
                            .font(.custom("Dubai-Light", size: 14))
                            .foregroundStyle(.white.opacity(0.7))
                    }
                    .padding(.leading, 8)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .font(.system(size: 12, weight: .black))
                        .foregroundStyle(.white)
                        .background(
                            Circle()
                                .fill(.black.opacity(0.2))
                                .frame(width: 24, height: 24)
                        )
                }
                // SpeedTestButton inside padding
                .padding(.leading, 8)
                .padding(.trailing, 24)
                .padding(.vertical, 18)
                .background(
                    Color(.black.opacity(0.3))
                        .cornerRadius(24)
                )
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            
            // ConnectionButton
            Button {
                // TODO action
            } label: {
                HStack {
                    Image("Info")
                        .frame(width: 42, height: 42)
                        
                    VStack(alignment: .leading) {
                        Text("Connection")
                            .font(.custom("Dubai-Regular", size: 16))
                            .foregroundStyle(.white)
                        Text("Get information about your connection")
                            .font(.custom("Dubai-Light", size: 14))
                            .foregroundStyle(.white.opacity(0.7))
                    }
                    .padding(.leading, 8)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .font(.system(size: 12, weight: .black))
                        .foregroundStyle(.white)
                        .background(
                            Circle()
                                .fill(.black.opacity(0.2))
                                .frame(width: 24, height: 24)
                        )
                }
                // SpeedTestButton inside padding
                .padding(.leading, 8)
                .padding(.trailing, 24)
                .padding(.vertical, 18)
                .background(
                    Color(.black.opacity(0.3))
                        .cornerRadius(24)
                )
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
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
