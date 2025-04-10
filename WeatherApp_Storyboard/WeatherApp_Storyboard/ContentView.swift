//
//  ContentView.swift
//  WeatherApp_Storyboard
//
//  Created by Аяжан Таймас on 10.04.2025.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var location: String = "Almaty"

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.3), .white]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Поисковая строка
                        VStack(spacing: 12) {
                            TextField("Введите город", text: $location)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 4)

                            Button(action: {
                                viewModel.fetchAllWeather(for: location)
                            }) {
                                Text("Обновить")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 3)
                            }
                        }
                        .padding(.horizontal)

                        if viewModel.isLoading {
                            HStack {
                                Spacer()
                                ProgressView("Загрузка...")
                                    .padding()
                                Spacer()
                            }
                        }

                        // Текущая погода
                        if let weather = viewModel.currentConditions {
                            CardView {
                                WeatherView(data: weather)
                            }
                        }

                        // Прогноз
                        if let forecast = viewModel.forecast {
                            CardView {
                                ForecastView(data: forecast)
                            }
                        }

                        // Качество воздуха
                        if let air = viewModel.airQuality {
                            CardView {
                                AirQualityView(data: air)
                            }
                        }

                        // Влажность
                        if let humidity = viewModel.humidity {
                            CardView {
                                HumidityView(data: humidity)
                            }
                        }
                        
                        // Температура воды
                        if let waterTemp = viewModel.waterTemperature {
                            CardView {
                                WaterTemperatureView(data: waterTemp)
                            }
                        }

                      
                        // Ошибка
                        if let error = viewModel.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("🌤 Погода")
            }
        }
    }
}

// Карточка с тенями
struct CardView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
            .padding(.horizontal)
    }
}
