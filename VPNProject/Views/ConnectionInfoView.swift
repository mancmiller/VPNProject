//
//  ConnectionInfoView.swift
//  VPNProject
//
//  Created by Muslim on 23.11.2023.
//

import SwiftUI

struct ConnectionInfoView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        
        ScrollView {
                VStack {
                    HStack {
                        Image("Info")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Connection")
                            .font(.custom("Dubai-Regular", size: 14))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.top, 32)
                    
                    InfoView(description: "IP", value: "\(vm.ipAddress)")
                    InfoView(description: "Country", value: "\(vm.ipGeo.country)")
                    InfoView(description: "City", value: "\(vm.ipGeo.city)")
                    InfoView(description: "Internet Provider", value: "\(vm.ipGeo.org)")
                    InfoView(description: "Timezone", value: "\(vm.ipGeo.timezone)")
                    
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(SheetBackground())
    }
}

struct InfoView: View {
    
    @StateObject var vm = ConnectionInfoView.ViewModel()
    
    let description: String
    let value: String
    
    var body: some View {
        HStack {
            Text(description)
                .font(.custom("Dubai-Light", size: 14))
                .foregroundStyle(.gray)
            Spacer()
            Text(value)
                .font(.custom("Dubai-Regular", size: 16))
                .foregroundStyle(.white)
        }
        .padding(16)
        .background(.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

extension ConnectionInfoView {
    
    final class ViewModel: ObservableObject {
        @Published var ipAddress: String = "Retrieving..."
        @Published var ipGeo = IPGeo(city: "Loading...", country: "Loading...", org: "Loading...", timezone: "Loading...")
        
        private let api = APIManager()
        
        init() {
            fetchIP()
        }
        
        func runOnMain(_ method: @escaping () -> Void) {
            DispatchQueue.main.async {
                withAnimation {
                    method()
                }
            }
        }
        
        private func fetchIP() {
            api.fetchData(url: "https://api.ipify.org?format=json", model: IP.self) { result in
                self.runOnMain {
                    self.ipAddress = result.ip
                    self.fetchGeoData(ip: result.ip)
                }
            } failure: { error in
                print("IP: \(error.localizedDescription)")
            }
        }
        
        private func fetchGeoData(ip: String) {
            api.fetchData(url: "https://ipinfo.io/\(ip)/geo", model: IPGeo.self) { result in
                self.runOnMain {
                    self.ipGeo = result
                }
            } failure: { error in
                print("GeoData: \(error.localizedDescription)")
            }
        }
    }
}


#Preview {
    ConnectionInfoView()
}


