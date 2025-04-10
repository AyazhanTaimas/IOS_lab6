import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var currentConditions: WeatherData?
    @Published var forecast: ForecastData?
    @Published var airQuality: AirQualityData?
    
    @Published var humidity: HumidityData?
    @Published var waterTemperature: WaterTemperatureData?

    @Published var mapURL: URL?
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // Метод для загрузки всех данных
    func fetchAllWeather(for location: String) {
        isLoading = true
        errorMessage = nil
        
        Task {
            await withTaskGroup(of: Void.self) { group in
                group.addTask { await self.fetchCurrentConditions(for: location) }
                group.addTask { await self.fetchForecast(for: location) }
                group.addTask { await self.fetchAirQuality(for: location) }
                group.addTask { await self.fetchHumidity(for: location) } // Загрузка влажности
                group.addTask { await self.fetchWaterTemperature(for: location) } // Загрузка температуры воды
            }
            isLoading = false
        }
    }
    
    private func fetchCurrentConditions(for location: String) async {
        do {
            currentConditions = try await WeatherService.shared.getCurrentWeather(for: location)
        } catch {
            errorMessage = "Ошибка загрузки текущей погоды."
        }
    }
    
    private func fetchForecast(for location: String) async {
        do {
            forecast = try await WeatherService.shared.getForecast(for: location)
        } catch {
            errorMessage = "Ошибка загрузки прогноза."
        }
    }
    
    private func fetchAirQuality(for location: String) async {
        do {
            airQuality = try await WeatherService.shared.getAirQuality(for: location)
        } catch {
            errorMessage = "Ошибка загрузки качества воздуха."
        }
    }
    
    // Метод для загрузки влажности
    private func fetchHumidity(for location: String) async {
        do {
            humidity = try await WeatherService.shared.getHumidity(for: location)
        } catch {
            errorMessage = "Ошибка загрузки влажности."
        }
    }

    // Метод для загрузки температуры воды
    private func fetchWaterTemperature(for location: String) async {
        do {
            waterTemperature = try await WeatherService.shared.getWaterTemperature(for: location)
        } catch {
            errorMessage = "Ошибка загрузки температуры воды."
        }
    }
}
