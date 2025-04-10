// ForecastAPIResponse.swift

struct ForecastAPIResponse: Codable {
    let forecast: Forecast
    let alerts: Alerts?
}

struct Forecast: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable {
    let day: Day
}

struct Day: Codable {
    let avgtemp_c: Double
    let condition: Condition
}

struct Alerts: Codable {
    let alert: [Alert]
}

struct Alert: Codable {
    let headline: String
}
