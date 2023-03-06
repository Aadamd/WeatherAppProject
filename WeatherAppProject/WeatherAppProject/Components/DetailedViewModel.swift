//
//  DetailedView.swift
//  WeatherAppProject
//
//  Created by Aadam De Doncker on 2023/03/06.
//

import SwiftUI

struct DetailedViewModel: View {
    
    var item: Result
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Text("\(item.date.toDate())")
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                    Spacer()
                    if (item.safe){
                        Text("Safe to Travel")
                            .bold()
                            .font(.title)
                            .foregroundColor(.black)
                    } else {
                        Text("Not safe to travel")
                            .bold()
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Image(imageSelect(safe: item.safe))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .padding()
                    HStack {
                        DetailedRow(name: "temperature", image: "thermometer", value: "\(item.temp)" + "°C")
                        Spacer()
                            .frame(maxWidth: 80)
                        DetailedRow(name: "Humidity", image: "humidity", value: "\(item.humidity)" + "%")
                        
                    }
                    .padding(20)
                    HStack {
                        DetailedRow(name: "Wind Speed", image: "wind", value: "\(item.windSpeed)" + "km/h")
                        
                        
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(.white)
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedViewModel(item: Result.init(date: "2020-11-05T22:00:00.000+0000", temp: 20.0, humidity: 30, windSpeed: 300, safe: true))
    }
}


func imageSelect(safe: Bool) -> String
{
    if(safe)
    {
        return "Flat_tick_icon";
    }
    else
    {
        return "Flat_cross_icon";
    }
}

func sfImageSelect(safe: Bool) -> String
{
    if(safe)
    {
        return "checkmark.circle";
    }
    else
    {
        return "x.circle";
    }
}
