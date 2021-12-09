//
//  WeatherDetailView.swift
//  WheatherFAll
//
//  Created by GSK on 12/7/21.
//

import SwiftUI

struct WeatherDetailView: View {
    
    var forecast: ForecastData
    
    var body: some View {
        Text("\(forecast.condition_name)")
            .padding()
            .background(Rectangle().fill(BackgroundStyle()).edgesIgnoringSafeArea(.all))
            .navigationTitle("🗓 \(forecast.date)")
    }
    
    var maxTempContent: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("maxTempBackground"))
                    .frame(width: 150, height: 150)
                    .cornerRadius(16)
                Text("\(Int(forecast.temp_max)) °F").foregroundColor(.white)
                    .font(.largeTitle)
                
            }
            Text("High")
        }
    }
    
    var minTempContent: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("minTempBackground"))
                    .frame(width: 150, height: 150)
                    .cornerRadius(16)
                Text("\(Int(forecast.temp_min)) °F").foregroundColor(.white)
                    .font(.largeTitle)
                
            }
            Text("Low")
        }
    }
    
    var conditionIconContent: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("conditionBackground"))
                    .frame(width: 150, height: 150)
                    .cornerRadius(16)
                Image(systemName: Icon.systemIconForCondition(condition: forecast.condition_name))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
            Text("Condition")
        }
    }
    
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(forecast: ForecastData(date: "1/1/2021", temp_min: 10, temp_max: 10, conditionName: "Windy", conditionDescription: "Attentantion! It is winday"))
    }
}
