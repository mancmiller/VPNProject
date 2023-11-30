//
//  MainView.swift
//  VPNProject
//
//  Created by Muslim on 13.11.2023.
//

import SwiftUI

struct MainView: View {
    
    @State var isConnected = false
    @State var autoMode = false
    @State var showServerList = false
    @State var isPremium = false
    @State var showPremiumPurchase = false
    @State var openMenu = false
    @State var openConnectionInfo = false
    @State var startSpeedTest = false
    
    @EnvironmentObject var serverListViewModel: ServerListViewModel
    
    
    private let backgroundBlack = Color(.black.opacity(0.3))
    private let padding = CGFloat(16)
    
    var body: some View {
        
        ScrollView {
            // MARK: - Header
            HStack {
                Text(showLogo())
                
                Spacer()
                
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
                
                    .onTapGesture {
                        openMenu.toggle()
                    }
                    .sheet(isPresented: $openMenu, content: {
                        MenuView()
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)
                    })
                
            }
            .frame(maxHeight: 40)
            
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
                        IndicatorOuterCircle()
                        Circle()
                            .fill( !isConnected ? .red : Color("DarkAccentColor"))
                            .frame(width: 8, height: 8)
                    }
                    
                    // TurnOnButton
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
                    
                    
                    // Indicator ON
                    ZStack {
                        IndicatorOuterCircle()
                        Circle()
                            .fill( isConnected ? .green : Color("DarkAccentColor"))
                            .frame(width: 8, height: 8)
                    }
                }
            }
            // View around TurnOnButton and Indicators
            .frame(maxWidth: .infinity)
            .padding(.vertical, padding)
            .background(
                backgroundBlack
                    .clipShape(RoundedRectangle(cornerRadius: 24))
            )
            // TurnOnButton and Indicators HStack padding
            .padding(.top, padding)
            
            // MARK: - Location and Shorctut Buttons
            HStack {
                // Location Button
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
                    
                    ChevronView(color: .black, forwardOrBackward: "forward")
                }
                .sheet(isPresented: $showServerList, content: {
                    ServerListView()
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                })
                
                // Location Button paddings
                .padding(.leading, 12)
                .padding(.trailing, 24)
                .padding(.vertical, 18)
                .background(
                    backgroundBlack
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                )
                .onTapGesture {
                    showServerList.toggle()
                }
                
                // Shotcut Button
                HStack {
                    // Indicator
                    ZStack {
                        IndicatorOuterCircle()
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
                    backgroundBlack
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                )
                .overlay(
                    autoMode ? RoundedRectangle(cornerRadius: 24)
                        .stroke(Color("OrangePremium")) : nil
                )
                .onTapGesture {
                    autoMode.toggle()
                }
            }
            // Location and Shortcut Button HStack padding
            .padding(.vertical, padding * 2)
            
            // MARK: - GetPremiumButton
            if !isPremium {
                HStack {
                    Image("Coupon")
                        .frame(width: 42, height: 42)
                    
                    VStack(alignment: .leading, spacing: -2) {
                        Text("Get Premium")
                            .font(.custom("Dubai-Medium", size: 20))
                            .foregroundStyle(.white)
                        Text("• secure your data while surfing")
                            .font(.custom("Dubai-Light", size: 14))
                            .foregroundStyle(.white)
                        Text("• change the country without leaving home")
                            .font(.custom("Dubai-Light", size: 14))
                            .lineLimit(1)
                            .foregroundStyle(.white)
                        
                    }
                    .padding(.leading, 12)
                    
                    Spacer()
                    
                    ChevronView(color: .white, forwardOrBackward: "forward")
                }
                // GetPremiumButton inside padding
                .padding(.leading, 12)
                .padding(.trailing, 24)
                .padding(.vertical, 4)
                .background(
                    Color(Color("OrangePremium"))
                )
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .onTapGesture {
                    showPremiumPurchase.toggle()
                }
                .padding(.bottom, padding)
                
                .fullScreenCover(isPresented: $showPremiumPurchase, content: {
                    PremiumPurchaseView()
                })
            }
            
            // MARK: - SpeedTestButton
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
                
                ChevronView(color: .black, forwardOrBackward: "forward")
            }
            // SpeedTestButton inside padding
            .padding(.leading, 8)
            .padding(.trailing, 24)
            .padding(.vertical, 18)
            .background(
                backgroundBlack
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .onTapGesture {
                startSpeedTest.toggle()
            }
            .sheet(isPresented: $startSpeedTest, content: {
                SpeedTestView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            })
            
            // MARK: - ConnectionInfoButton
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
                
                ChevronView(color: .black, forwardOrBackward: "forward")
            }
            // ConnectionInfoButton inside padding
            .padding(.leading, 8)
            .padding(.trailing, 24)
            .padding(.vertical, 18)
            .onTapGesture {
                openConnectionInfo.toggle()
            }
            .sheet(isPresented: $openConnectionInfo, content: {
                ConnectionInfoView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            })
            
            .background(
                backgroundBlack
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.vertical, padding)
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, padding)
        
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
    MainView()
        .environmentObject(ServerListViewModel())
}
