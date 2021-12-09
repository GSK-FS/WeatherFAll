//
//  WeatherDetailRowView.swift
//  WheatherFAll
//
//  Created by GSK on 12/7/21.
//

import SwiftUI

struct WeatherDetailRowView: View {
    
    var forecast: ForecastData
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: Icon.systemIconForCondition(condition: forecast.condition_name))
                .frame(width: 50, height: 50)
                .accessibility(hidden: true
                )
            VStack(alignment: .leading) {
                Text(forecast.condition_name)
                .font(.headline)
                .lineLimit(1)
                
                Text(forecast.condition_desc)
                    .lineLimit(2)
            }
            .padding(.vertical, 8)
            Spacer(minLength: 0)
        }
        .font(.subheadline)
        .padding(.vertical, 0)
        .accessibilityElement(children: .combine)
    }
}

struct WeatherDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailRowView(forecast: ForecastData(date: "1/1/2021", temp_min: 10, temp_max: 10, conditionName: "Windy", conditionDescription: "Attentantion! It is winday"))
    }
}
