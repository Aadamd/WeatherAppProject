//
//  ListCell.swift
//  WeatherAppProject
//
//  Created by Aadam De Doncker on 2023/03/06.
//

import SwiftUI

struct ListCell: View {
    
    var items: [Result]
    
    var body: some View {
        ForEach(items, id: \.self) { item in
            NavigationLink(destination: DetailedViewModel(item: item), label: {
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
            })
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(items: [Result.init(date: "2020-11-05T22:00:00.000+0000", temp: 20.0, humidity: 30, windSpeed: 300, safe: true)])
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
