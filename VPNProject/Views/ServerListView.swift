//
//  ServerListView.swift
//  VPNProject
//
//  Created by Muslim on 16.11.2023.
//

import SwiftUI

struct ServerListView: View {
    
    @EnvironmentObject var serverListViewModel: ServerListViewModel
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [.black.opacity(0.1), Color(#colorLiteral(red: 0.4039215686, green: 0.05098039216, blue: 0.8549019608, alpha: 0.4019039735)), Color(#colorLiteral(red: 0.4666666667, green: 0.137254902, blue: 0.9411764706, alpha: 0.4)),Color(#colorLiteral(red: 0.3450980392, green: 0.05098039216, blue: 0.7411764706, alpha: 0.4)),Color(#colorLiteral(red: 0.02352941176, green: 0.003921568627, blue: 0.1019607843, alpha: 0.4)), .black], center: .bottom, startRadius: 40, endRadius: 400).ignoresSafeArea().opacity(0.4)
                .background(Color("SheetBackground"))
            List {
                Section {
                    ForEach(serverListViewModel.servers) { server in
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
                                    HStack {
                                        Image("Fast")
                                        Text("Fast")
                                            .font(.custom("Dubai-Regular", size: 12))
                                            .foregroundStyle(Color("DarkAccentColor"))
                                    }
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 6)
                                    .background(.white)
                                    .clipShape(.capsule)
                                } else {
                                    HStack {
                                        Image("Slow")
                                        Text("Slow")
                                            .font(.custom("Dubai-Regular", size: 12))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 6)
                                    .background(.white.opacity(0.05))
                                    .clipShape(.capsule)
                                }
                            }
                            .padding(.leading, 12)
                            .padding(.trailing, 12)
                            .padding(.vertical, 18)
                            .background(.white.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            
                            .listRowInsets(EdgeInsets(.init(top: 0, leading: 0, bottom: 8, trailing: 0)))
                        }
                    
                } header: {
                    HStack(alignment: .center, spacing: nil, content: {
                        Spacer()
                        Text("Current Location")
                            
                            .font(.custom("Dubai-Regular", size: 14))
                            .foregroundStyle(.white)
                            .listRowBackground(Color.clear)
                        Spacer()
                    })
                }
                .textCase(.none)

                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    ServerListView()
        .environmentObject(ServerListViewModel())
}
