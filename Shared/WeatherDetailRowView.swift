//
//  WeatherDetailRowView.swift
//  WheatherFAll
//
//  Created by GSK on 12/7/21.
//

import SwiftUI

struct WeatherDetailRowView: View {
    
    struct Metrics {
        var iconSize: CGFloat
        var iconPadding: CGFloat
        var rowPadding: CGFloat
    }
    
    var metrics: Metrics {
        #if os(iOS)
        return Metrics(iconSize: 25, iconPadding: 10, rowPadding: 10)
        #else
        return Metrics(iconSize: 15, iconPadding: 5, rowPadding: 5)
        #endif
    }
    
    
    var forecast: ForecastData
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: Icon.systemIconForCondition(condition: forecast.condition_name))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: metrics.iconSize, height: metrics.iconSize)
                .padding(.trailing, metrics.iconPadding)
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
        .padding(.vertical, metrics.rowPadding)
        .accessibilityElement(children: .combine)
    }
}

struct WeatherDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailRowView(forecast: ForecastData(date: "1/1/2021", temp_min: 10, temp_max: 10, conditionName: "Windy", conditionDescription: "Attentantion! It is winday"))
    }
}
