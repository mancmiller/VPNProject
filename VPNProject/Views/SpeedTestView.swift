//
//  SpeedTestView.swift
//  VPNProject
//
//  Created by Muslim on 24.11.2023.
//

import SwiftUI
import SpeedcheckerSDK
import CoreLocation

struct SpeedTestView: View {
    
    @StateObject var vm = ViewModel()
    
    @State var inProgress = false
    
    @State var speed: [Int] = [
        Int.random(in: 30..<150),
        Int.random(in: 60..<150),
        Int.random(in: 80..<150)
    ]
    
    var array1 = ["0", "20", "40", "60", "80", "100", "120", "140", "160", "180", "200"]
    
    var body: some View {
        ZStack {
            SheetBackground()
            VStack(spacing: 32) {
                HStack {
                    
                    Image("Rocket")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Speed Test")
                        .font(.custom("Dubai-Regular", size: 14))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button {
                        inProgress.toggle()
                        vm.requestLocationAuthorization()
                        vm.runSpeedTestTouched()
                    } label: {
                        if !inProgress {
                            Text("Start Test")
                                .font(.custom("Dubai-Regular", size: 14))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(Color("OrangePremium"))
                                .clipShape(Capsule())
                        } else {
                            Text("In Progress")
                                .font(.custom("Dubai-Regular", size: 14))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(.gray)
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding(.leading, 16)
                .padding(.trailing, 32)
                .padding(.top, 32)
                
                if inProgress {
                    HStack(alignment: .top) {
                        VStack(spacing: -2) {
                            ForEach(array1.reversed(), id: \.self) { array in
                                Text(array)
                                    .font(.custom("Dubai-Regular", size: 14))
                                    .foregroundStyle(.white).opacity(0.18)
                            }
                        }
                        HStack(spacing: 12) {
                            BarView(type: "Ping", speed: "\(speed[0])", barHeight: CGFloat(speed[0]))
                            BarView(type: "Upload", speed: "\(speed[1])", barHeight: CGFloat(speed[1]))
                            BarView(type: "Download", speed: "\(speed[2])", barHeight: CGFloat(speed[2]))
                        }
                        .overlay(DottedLine().padding(.bottom, 64))
                    }
                } else {
                    
                    HStack(alignment: .top) {
                        VStack(spacing: -2) {
                            ForEach(array1.reversed(), id: \.self) { array in
                                Text(array)
                                    .font(.custom("Dubai-Regular", size: 14))
                                    .foregroundStyle(.white).opacity(0.18)
                            }
                        }
                        ZStack {
                            HStack(spacing: 12) {
                                BarView(type: "Ping", speed: nil, barHeight: 0)
                                BarView(type: "Upload", speed: nil, barHeight: 0)
                                BarView(type: "Download", speed: nil, barHeight: 0)
                            }
                        }
                        .overlay(DottedLine().padding(.bottom, 64))
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    SpeedTestView()
}

struct BarView: View {
    
    let type: String
    let speed: String?
    let barHeight: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 28)
                .frame(width: 92, height: 300)
                .foregroundStyle(.white.opacity(0.05))
            
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .frame(width: 70, height: barHeight * 1.5)
                        .padding(.bottom, -16)
                        .clipped()
                        .foregroundStyle(Color("AccentColor").opacity(0.2)), alignment: .bottom
                ).overlay(alignment: .bottom) {
                    VStack {
                        Text(type)
                            .font(.custom("Dubai-Regular", size: 14))
                            .foregroundStyle(.white).opacity(0.5)
                        Text(speed ?? "--")
                            .font(.custom("Dubai-Regular", size: 18))
                            .foregroundStyle(.white)
                    }
                }
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct DottedLine: View {
    var body: some View {
        VStack(spacing: 24) {
            ForEach((1...10), id: \.self) {_ in
                Line()
                    .stroke(style: .init(dash: [8]))
                    .foregroundStyle(.white.opacity(0.18))
                    .frame(height: 1)
            }
        }
    }
}

extension SpeedTestView {
    
    final class ViewModel: NSObject, ObservableObject, InternetSpeedTestDelegate, CLLocationManagerDelegate {
        
        private var internetTest: InternetSpeedTest?
        private var locationManager = CLLocationManager()
        
        func runSpeedTestTouched() {
            // to use free version, your app should have location access
            internetTest = InternetSpeedTest(delegate: self)
            internetTest?.startTest() { (error) in
                if error != .ok {
                    print(error)
                }
            }
        }
        
        func requestLocationAuthorization() {
            DispatchQueue.global().async {
                guard CLLocationManager.locationServicesEnabled() else {
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.locationManager.delegate = self
                    self?.locationManager.requestWhenInUseAuthorization()
                    self?.locationManager.requestAlwaysAuthorization()
                }
            }
        }
        
        // MARK: Delegate Methods
        func internetTestError(error: SpeedTestError) {
            print(error)
        }
        
        func internetTestFinish(result: SpeedTestResult) {
            print(result.downloadSpeed.mbps)
            print(result.uploadSpeed.mbps)
            print(result.latencyInMs)
            
        }
        
        func internetTestReceived(servers: [SpeedTestServer]) {
            //
        }
        
        func internetTestSelected(server: SpeedTestServer, latency: Int, jitter: Int) {
            print("Latency: \(latency)")
            print("Jitter: \(jitter)")
        }
        
        func internetTestDownloadStart() {
            //
        }
        
        func internetTestDownloadFinish() {
            //
        }
        
        func internetTestDownload(progress: Double, speed: SpeedTestSpeed) {
            print("Download: \(speed.descriptionInMbps)")
        }
        
        func internetTestUploadStart() {
            //
        }
        
        func internetTestUploadFinish() {
            //
        }
        
        func internetTestUpload(progress: Double, speed: SpeedTestSpeed) {
            print("Upload: \(speed.descriptionInMbps)")
        }
    }
}
