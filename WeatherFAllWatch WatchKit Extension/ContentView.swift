//
//  ContentView.swift
//  WeatherFAllWatch WatchKit Extension
//
//  Created by GSK on 12/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var forecasts = [ForecastData]()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("🌤 Forecast")
            List(forecasts, rowContent: {forecast in
                VStack(alignment: .leading) {
                    Text("\(forecast.date)")
                    Text("L: \(Int(forecast.temp_min)) H: \(Int(forecast.temp_max))")
                    HStack {
                        Image(systemName: Icon.systemIconForCondition(condition: forecast.condition_name))
                        Text(forecast.condition_desc)
                    }.padding(.top, 5)
                }
            }).onAppear {
                loadData()
            }
        }
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
                }
            //default:
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
