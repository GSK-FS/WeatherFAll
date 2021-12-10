//
//  WeatherView.swift
//  WeatherFAll
//
//  Created by GSK on 12/6/21.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var forecasts = [ForecastData]()
    @State private var selection: ForecastData?
    
    var body: some View {
        List(selection: $selection) {
            ForEach(forecasts) { forecast in
                NavigationLink(destination: WeatherDetailView(forecast: forecast), tag: forecast, selection: $selection) {
                    WeatherDetailRowView(forecast: forecast)
                }
            }
        }.onAppear(perform: loadData).background(Rectangle().fill(BackgroundStyle()).edgesIgnoringSafeArea(.all))
            .navigationTitle("🌤 Forecast")
    }
    func loadData() {
        let weatherDataRequest = WeatherDataRequest<WeatherData>(city: "San Francisco")
        
        weatherDataRequest.getData { dataResult in
            switch dataResult {
            case .failure:
                print("Could not load weather data")
            case .success(let weatherDataObjects):
                guard let forecastArray = weatherDataObjects.first?.forecast else {
                    return
                }
                DispatchQueue.main.async {
                    self.forecasts = forecastArray
                }
            //default:
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
