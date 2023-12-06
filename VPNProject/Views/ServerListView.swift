//
//  ServerListView.swift
//  VPNProject
//
//  Created by Muslim on 16.11.2023.
//

import SwiftUI

struct ServerListView: View {
    
    @State var currentServer: Server = servers.first!
    
    var body: some View {
        ZStack {
            SheetBackground()
            List {
                Section {
                    HStack {
                        Image(currentServer.countryFlag)
                            .frame(width: 42, height: 42)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("Location")
                                .font(.custom("Dubai-Light", size: 14))
                                .foregroundStyle(.gray)
                            Text(currentServer.countryName)
                                .font(.custom("Dubai-Regular", size: 16))
                                .foregroundStyle(.white)
                        }
                        .padding(.leading, 8)
                        
                        Spacer()
                        if !currentServer.isPremium {
                            Text("Free")
                                .font(.custom("Dubai-Regular", size: 12))
                                .foregroundStyle(.white)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 12)
                                .background(.white.opacity(0.05))
                                .clipShape(.capsule)
                        }
                        Spacer()
                            .frame(width: 16)
                        if currentServer.fast{
                            FastOrSlow(image: "Fast", text: "Fast", textColor: Color("DarkAccentColor"), backgroundColor: .white)
                        } else {
                            FastOrSlow(image: "Slow", text: "Slow", textColor: .white, backgroundColor: Color.white.opacity(0.05))
                        }
                    }
                    .padding(.leading, 12)
                    .padding(.trailing, 12)
                    .padding(.vertical, 18)
                    .background(.white.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    
                    .listRowInsets(EdgeInsets(.init(top: 0, leading: 0, bottom: 8, trailing: 0)))
                } header: {
                    HStack(alignment: .center, spacing: nil, content: {
                        Spacer()
                        Text("Current Location")
                        
                            .font(.custom("Dubai-Regular", size: 14))
                            .foregroundStyle(.white)
                        Spacer()
                    })
                }
                .textCase(.none)
                .listRowBackground(Color.clear)
                Section {
                    ForEach(servers.filter{
                        $0.id != currentServer.id
                    }){ server in
                        Button {
                            currentServer = server
                        } label: {
                            HStack {
                                Image(server.countryFlag)
                                    .frame(width: 42, height: 42)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text("Location")
                                        .font(.custom("Dubai-Light", size: 14))
                                        .foregroundStyle(.gray)
                                    Text(server.countryName)
                                        .font(.custom("Dubai-Regular", size: 16))
                                        .foregroundStyle(.white)
                                }
                                .padding(.leading, 8)
                                
                                Spacer()
                                if !server.isPremium {
                                    Text("Free")
                                        .font(.custom("Dubai-Regular", size: 12))
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 2)
                                        .padding(.horizontal, 12)
                                        .background(.white.opacity(0.05))
                                        .clipShape(.capsule)
                                }
                                Spacer()
                                    .frame(width: 16)
                                if server.fast{
                                    FastOrSlow(image: "Fast", text: "Fast", textColor: Color("DarkAccentColor"), backgroundColor: .white)
                                } else {
                                    FastOrSlow(image: "Slow", text: "Slow", textColor: .white, backgroundColor: Color.white.opacity(0.05))
                                }
                            }
                            .padding(.leading, 12)
                            .padding(.trailing, 12)
                            .padding(.vertical, 18)
                            .background(.white.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                        }
                        .listRowInsets(EdgeInsets(.init(top: 0, leading: 0, bottom: 8, trailing: 0)))
                    }
                } header: {
                    HStack(alignment: .center, spacing: nil, content: {
                        Spacer()
                        Text("Premium Servers")
                        
                            .font(.custom("Dubai-Regular", size: 14))
                            .foregroundStyle(.white)
                        Spacer()
                    })
                }
                .textCase(.none)
                .listRowBackground(Color.clear)
            }
        }
        .scrollContentBackground(.hidden)
    }
}


#Preview {
    ServerListView()
}

struct FastOrSlow: View {
    let image: String
    let text: String
    let textColor: Color
    let backgroundColor: Color
    var body: some View {
        HStack {
            Image(image)
            Text(text)
                .font(.custom("Dubai-Regular", size: 12))
                .foregroundStyle(Color(textColor))
        }
        .padding(.vertical, 2)
        .padding(.horizontal, 6)
        .background(Color(backgroundColor))
        .clipShape(.capsule)
    }
}
