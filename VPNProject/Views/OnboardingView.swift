//
//  OnboardingView.swift
//  VPNProject
//
//  Created by Muslim on 28.11.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    @State var onboardingState = 0
    
    @State var perks: [Perk] = [
        Perk(image: "Layers", text: "Servers", description: "Our servers have high stability and high throughput"),
        Perk(image: "Send", text: "Locations", description: "We support more than 10 locations around the world"),
        Perk(image: "Basketball", text: "Shortcust", description: "Set VPN to turn on automatically when certain apps are opened"),
        Perk(image: "Heartbeat", text: "Statistics", description: "Measure speed and view network data directly from the app")
    ]
    
    var body: some View {
        ZStack {
            switch onboardingState {
            case 0:
                firstSection
            case 1:
                secondSection
            default:
                firstSection
            }
        }
        .background(
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }
}

extension OnboardingView {
    private var firstSection: some View {
        VStack{
            VStack(spacing: -10) {
                Text("Welcome to")
                    .font(.custom("Dubai-Light", size: 24))
                    .foregroundStyle(.white)
                Text(showLogo())
            }
            Text("Fast & Stable")
                .font(.custom("Dubai-Regular", size: 20))
                .foregroundStyle(Color("AccentColor"))
                .padding(.horizontal, 16)
                .background(.white)
                .clipShape(Capsule())
            
            ForEach(perks) { perk in
                HStack(spacing: 16) {
                    Image(perk.image)
                        .frame(width: 32, height: 32)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(perk.text)
                            .font(.custom("Dubai-Regular", size: 16))
                            .foregroundStyle(.white)
                        Text(perk.description)
                            .font(.custom("Dubai-Light", size: 12))
                            .foregroundStyle(.white.opacity(0.7))
                        
                    }
                    Spacer()
                }
                .padding(.leading, 12)
                .padding(.vertical, 18)
                .background(.black.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 24))
            }
            
            Spacer()
            
            VStack {
                Button {
                    onboardingState += 1
                } label: {
                    Text("Continue")
                        .font(.custom("Dubai-Medium", size: 22))
                        .foregroundStyle(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .background(Color("OrangePremium"))
                        .clipShape(Capsule())
                }
               
                    Text("Terms of Use & Privacy Policy")
                        .font(.custom("Dubai-Regular", size: 18))
                        .foregroundStyle(.white).opacity(0.4)
                        .onTapGesture {
                            
                        }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 16)
        
    }
    
    private var secondSection: some View {
        VStack {
            VStack(spacing: -10) {
                Text("Welcome to")
                    .font(.custom("Dubai-Light", size: 24))
                    .foregroundStyle(.white)
                Text(showLogo())
            }
            Text("Privacy Policy")
                .font(.custom("Dubai-Regular", size: 20))
                .foregroundStyle(Color("AccentColor"))
                .padding(.horizontal, 16)
                .background(.white)
                .clipShape(Capsule())
            
            VStack {
                VStack {
                    Text("We collect")
                        .font(.custom("Dubai-Regular", size: 16))
                        .foregroundStyle(.white)
                    PerkView(image: "Calculator", text: "Device-specific information like OS version and IP dress to optimize our network connection to you. We do not store or log you IP address after you disconnect from the VPN")
                    PerkView(image: "Timer", text: "Total bandwidth consumed and time connected to our VPN service")
                }
                .padding(.leading, 12)
                .padding(.vertical, 18)
                .background(.black.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 24))
                
                Spacer()
                
                VStack {
                    Button {
                        isOnboarding = false
                    } label: {
                        Text("Continue")
                            .font(.custom("Dubai-Medium", size: 22))
                            .foregroundStyle(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                            .background(Color("OrangePremium"))
                            .clipShape(Capsule())
                    }
                    
                        Text("Terms of Use & Privacy Policy")
                            .font(.custom("Dubai-Regular", size: 18))
                            .foregroundStyle(.white).opacity(0.4)
                            .onTapGesture {
                                
                            }
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    func showLogo() -> AttributedString {
        var string = AttributedString("StriderVPN")
        if let range = string.range(of: "Strider") {
            string[range].font = .custom("Dubai-Bold", size: 40)
            string[range].foregroundColor = UIColor(named: "AccentColor")
        }
        if let range = string.range(of: "VPN") {
            string[range].font = .custom("Dubai-Regular", size: 40)
            string[range].foregroundColor = .white
        }
        return string
    }
}

struct Perk: Identifiable {
    let id = UUID()
    fileprivate let image: String
    fileprivate let text: String
    fileprivate let description: String
}

#Preview {
    OnboardingView()
}

struct PerkView: View {
    
    let image: String
    let text: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(image)
                .frame(width: 32, height: 32)
            VStack(alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.custom("Dubai-Light", size: 12))
                    .foregroundStyle(.white.opacity(0.7))
            }
            Spacer()
        }
    }
}
