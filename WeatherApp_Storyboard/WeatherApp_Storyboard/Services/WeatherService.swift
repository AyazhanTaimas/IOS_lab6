import Foundation

class WeatherService {
    static let shared = WeatherService()
    private init() {}
    
    let apiKey = "c45d21065b62844448765e693d97ec50"
    
    // MARK: - Current Weather
    func getCurrentWeather(for location: String) async throws -> WeatherData {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)&units=metric&lang=ru"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(OpenWeatherCurrentResponse.self, from: data)
        
        return WeatherData(
            temp: decoded.main.temp,
            description: decoded.weather.first?.description ?? ""
        )
    }
    
    func getHumidity(for location: String) async throws -> HumidityData {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)&units=metric&lang=ru"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(OpenWeatherCurrentResponse.self, from: data)
        
        return HumidityData(humidity: decoded.main.humidity)
    }
        
    // MARK: - Water Temperature
    func getWaterTemperature(for location: String) async throws -> WaterTemperatureData {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)&units=metric&lang=ru"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(OpenWeatherCurrentResponse.self, from: data)
        
        // Assuming water temperature is not provided, return land temperature as a placeholder
        // If there's a more specific field, you would adjust the below to fetch that field
        return WaterTemperatureData(waterTemp: decoded.main.sea_level)
    }
    // MARK: - Forecast
    func getForecast(for location: String) async throws -> ForecastData {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(location)&appid=\(apiKey)&units=metric&lang=ru"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(OpenWeatherForecastResponse.self, from: data)
        
        let forecastList = decoded.list.map {
            WeatherData(temp: $0.main.temp, description: $0.weather.first?.description ?? "")
        }
        
        return ForecastData(list: forecastList)
    }

    // MARK: - Air Quality
    func getAirQuality(for location: String) async throws -> AirQualityData {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)&units=metric&lang=ru"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(OpenWeatherCurrentResponse.self, from: data)
        
        // Placeholder for AQI
        let aqi = decoded.main.temp
        
        return AirQualityData(aqi: aqi)
    }
    
}

// OpenWeatherMap Response Structures
struct OpenWeatherCurrentResponse: Codable {
    let weather: [WeatherDescription]
    let main: WeatherMain
}

struct WeatherDescription: Codable {
    let description: String
}

struct WeatherMain: Codable {
    let temp: Double
    let humidity: Int
    let sea_level: Double
}

struct OpenWeatherForecastResponse: Codable {
    let list: [ForecastItem]
}

struct ForecastItem: Codable {
    let main: WeatherMain
    let weather: [WeatherDescription]
}
