//
//  ContentView.swift
//  WeatherFAllTV
//
//  Created by GSK on 12/11/21.
//

import SwiftUI
import CoreData
import AVKit

struct ContentView: View {
    @State private var forecasts = [forecast]()
    
    @State private var selection = 0
    
    @State private var avPlayer: AVPlayer!

    var body: some View {
        ZStack {
            if forecasts.count > 0 {
                VideoPlayer(player: avPlayer)
                    .scaleEffect(1.5)
                    .blur(radius: 10)
                    .disabled(true)
                VStack {
                    Text("🗓 \(forecasts[selection].date)")
                        .font(.largeTitle)
                    Text("\(forecasts[selection].condition_desc). The high will be \(Int(forecasts[selection].temp_max)) °F")
                        .font(.title)
                }
            }
            
            Button("Next day", action: {
                if selection < forecasts.count -1 {
                    selection += 1
                } else {
                    selection = 0
                }
                loadVideo()
            }).offset(x: 0, y: 200)
        }.onAppear {
            loadData()
        }.onReceive(NotificationCenter.default.publisher(for: NSNotification.Name.AVPlayerItemDidPlayToEndTime), perform: {_ in
            avPlayer.seek(to: CMTime.zero)
            
            avPlayer.play()
        }).ignoresSafeArea()
    }

    func loadData() {
        let weatherDataRequest = WeatherDataRequest<WeatherData>(city: "San Francisco")
        
        weatherDataRequest.getData { dataResult in
            switch dataResult {
            case .failure:
                print("Could not load weather data")
            case .success(let weatherDataObjects):
                guard let forecastArray = weatherDataObjects.first?.forecast else { return }
                DispatchQueue.main.async {
                    self.forecasts = forecastArray
                    loadVideo()
                }
//            default:
//                <#code#>
            }
        }
        
    }
    func loadVideo() {
        avPlayer = AVPlayer(url: Bundle.main.url(forResource: forecasts[selection].condition_name, withExtension: "mp4")!)
        avPlayer.play()
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
