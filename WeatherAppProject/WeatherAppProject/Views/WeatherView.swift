//
//  WeatherView.swift
//  WeatherAppProject
//
//  Created by Aadam De Doncker on 2023/03/04.
//

import SwiftUI

struct WeatherView: View {
    var weather: APIResponse
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Weather Station: \n\(weather.weatherStation)")
                            .bold().font(.title2)
                        
                        Text("Last Updated:\n\(weather.lastUpdated.toDate())\n").bold().fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    ScrollView {
                        VStack(alignment: .leading) {
                            ListCell(items: weather.forecasts)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Image("Space bg"))
            .preferredColorScheme(.dark)
        }
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
