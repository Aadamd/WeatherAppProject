//
//  WeatherManager.swift
//  WeatherAppProject
//
//  Created by Aadam De Doncker on 2023/03/04.
//

import Foundation

class WeatherManager {
    func getWeather() async throws -> APIResponse{
        guard let url = URL(string: "https://run.mocky.io/v3/1fd068d7-cbb2-4ceb-b697-da7fcc1c520b") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        guard let decodedData = try? JSONDecoder().decode(APIResponse.self, from: data) else { fatalError("There was a problem decoding the data")}
        
        return decodedData
    }
}

struct APIResponse: Decodable {
    var forecasts: [Result]
    var lastUpdated: String
    var weatherStation: String
}

struct Result: Decodable, Hashable {
    var date: String
    var temp: Double
    var humidity: Int
    var windSpeed: Int
    var safe: Bool

}
