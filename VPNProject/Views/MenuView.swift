//
//  MenuView.swift
//  VPNProject
//
//  Created by Muslim on 23.11.2023.
//

import SwiftUI


struct MenuView: View {
    var body: some View {
        ZStack {
            RadialGradient(colors: [.black.opacity(0.1), Color(#colorLiteral(red: 0.4039215686, green: 0.05098039216, blue: 0.8549019608, alpha: 0.4019039735)), Color(#colorLiteral(red: 0.4666666667, green: 0.137254902, blue: 0.9411764706, alpha: 0.4)),Color(#colorLiteral(red: 0.3450980392, green: 0.05098039216, blue: 0.7411764706, alpha: 0.4)),Color(#colorLiteral(red: 0.02352941176, green: 0.003921568627, blue: 0.1019607843, alpha: 0.4)), .black], center: .bottom, startRadius: 40, endRadius: 400).ignoresSafeArea().opacity(0.4)
                .background(Color("SheetBackground"))
            List {
                Section {
                    VStack {
                        Button{
                            
                        } label: {
                            ButtonView(image: "Coupon2", label: "Get Premium", description: "Try all the possibilities")
                        }
                        ButtonView(image: "Cart", label: "Restore Purchases", description: nil)
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                } header: {
                    SectionHeaderView(text: "Menu")
                }
                Section {
                    VStack(alignment: .leading) {
                        SupportView(image: "Mail", text: "Restore Purchases")
                        SupportView(image: "Shield", text: "Privacy Policy")
                        SupportView(image: "Document", text: "Terms of Use")
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                } header: {
                    SectionHeaderView(text: "Support")
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    MenuView()
}

struct SupportView: View {
    
    let image: String
    let text: String
    
    var body: some View {
            HStack {
                Image(image)
                    .frame(width: 42, height: 42)
                Text(text)
                    .font(.custom("Dubai-Light", size: 18))
                    .foregroundStyle(.white)
        }
    }
}

struct ButtonView: View {
    
    let image: String
    let label: String
    let description: String?
    
    var body: some View {
            HStack {
                Image(image)
                    .frame(width: 42, height: 42)
                
                VStack(alignment: .leading) {
                    Text(label)
                        .font(.custom("Dubai-Regular", size: 16))
                        .foregroundStyle(.white)
                    if let description = description {
                        Text(description)
                            .font(.custom("Dubai-Light", size: 14))
                            .foregroundStyle(.white.opacity(0.7))
                    }
                }
                .padding(.leading, 8)
                
                Spacer()
                
                ChevronView(color: .white, forwardOrBackward: "forward")
            }
            // inside padding
            .padding(.leading, 8)
            .padding(.trailing, 24)
            .padding(.vertical, 8)
            .background(.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

struct SectionHeaderView: View {
    
    let text: String
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Spacer()
            Text(text)
                .font(.custom("Dubai-Regular", size: 14))
                .foregroundStyle(.white)
            Spacer()
        })
        .textCase(.none)
    }
}
