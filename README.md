# iOS_lab6
##  WeatherApp_Storyboard
A Swift-based iOS application built using UIKit and Swift Concurrency (async/await). The app fetches and displays real-time weather data using the OpenWeatherMap API.

### Project Overview
WeatherApp_Storyboard is a lightweight iOS weather application that allows users to:

View current weather conditions.
See a 5-day forecast.
Check air quality.
Get humidity levels.
View sea level data.
The app demonstrates modern Swift practices using Task, TaskGroup, and ObservableObject with @MainActor, integrating clean MVVM architecture.

 **Setup Instructions** 
 Prerequisites:
Xcode 15+
iOS 16.0 or later
Swift 5.8+

Steps:
Register for an API key at https://openweathermap.org/api
Add your API key to WeatherService.swift:
```swift
let apiKey = "YOUR_API_KEY_HERE"

```

### Features Implemented
 Current Weather – Displays temperature and description.
 Forecast – Shows 5-day forecast data.
 Air Quality – Simulated based on current temperature (placeholder logic).
 Humidity – Shows real-time humidity percentage.
 Sea Level – Extracted from weather data as a representation of environmental pressure.

**Known Issues or Limitations**
No map view is included, though the infrastructure (mapURL) exists.

**Third-Party Libraries Used**
None
