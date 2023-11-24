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
            SheetBackground()
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
                    VStack(alignment: .leading, spacing: 0) {
                        SupportView(image: "Mail", text: "Restore Purchases")
                        SupportView(image: "Shield", text: "Privacy Policy")
                        SupportView(image: "Document", text: "Terms of Use")
                    }
                    .listRowBackground(Color.clear)
                } header: {
                    SectionHeaderView(text: "Support")
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
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
