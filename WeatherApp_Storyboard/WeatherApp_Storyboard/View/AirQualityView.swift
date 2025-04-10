//
//  AirQualityView.swift
//  WeatherApp_Storyboard
//
//  Created by Аяжан Таймас on 10.04.2025.
//
import SwiftUI

struct AirQualityView: View {
    let data: AirQualityData

    var body: some View {
        VStack(alignment: .leading) {
            Text("Качество воздуха:")
                .font(.headline)
            Text("Индекс качества воздуха (AQI): \(data.aqi)")
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(10)
    }
}

