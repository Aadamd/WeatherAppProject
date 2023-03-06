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
                        
                        ForEach(weather.forecasts, id: \.self) { item in
                            VStack(alignment: .leading)  {
                                Text("\(item.date.toDate())")
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.title3)
                                Spacer()
                                    .frame(maxHeight: 10)
                                HStack {
                                    DataRow(name: "Temp", value: "\(item.temp)" + "°C")
                                    Spacer()
                                        .frame(maxWidth: 15)
                                    DataRow(name: "Humidity", value: "\(item.humidity)" + "%")
                                }
                                HStack() {
                                    DataRow(name: "Wind Speed", value: "\(item.windSpeed)" + "km/h")
                                }
                                DataRow(name: "Safe", value: " \(item.safe)")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(changeBkColor(color: item.safe))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .contentShape(Rectangle())
                            .onTapGesture {
                              print("The whole VStack is tappable now!")
                            }
                            
                            
                        }
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

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

func changeBkColor(color: Bool) -> Color
{
    if(color)
    {
        return Color.green;
    }
    else
    {
        return Color.red;
    }
}
