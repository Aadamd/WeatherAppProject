//
//  ContentView.swift
//  WeatherAppProject
//
//  Created by Aadam De Doncker on 2023/03/04.
//

import SwiftUI

struct ContentView: View {
    var weatherManager = WeatherManager()
    @State var weather: APIResponse?
    
    var body: some View {
        VStack {
            if let weather = weather {
                WeatherView(weather: weather)
            } else {
                LoadingView()
                    .task {
                        do {
                            weather = try await weatherManager.getWeather()
                        } catch {
                             print("Error retrieving weather: \(error)")
                        }
                    }
            }
        }
        .background(Image("Space bg"))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
