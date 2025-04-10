//
//  WeatherView.swift
//  WeatherApp_Storyboard
//
//  Created by Аяжан Таймас on 10.04.2025.
//

import SwiftUI

struct WeatherView: View {
    let data: WeatherData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Температура: \(data.temp, specifier: "%.1f")°C")
            Text("Описание: \(data.description)")
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}
