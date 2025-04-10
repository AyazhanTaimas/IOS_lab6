// CurrentWeatherAPIResponse.swift

struct CurrentWeatherAPIResponse: Codable {
    let current: Current
}

struct Current: Codable {
    let temp_c: Double
    let condition: Condition
    let air_quality: [String: Double]
}

struct Condition: Codable {
    let text: String
}
