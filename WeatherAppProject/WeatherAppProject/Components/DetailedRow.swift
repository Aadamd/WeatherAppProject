//
//  DetailedRow.swift
//  WeatherAppProject
//
//  Created by Aadam De Doncker on 2023/03/06.
//

import SwiftUI

struct DetailedRow: View {
    
    var name: String
    var image: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.caption)
                    .foregroundColor(.black)
                Label(value, systemImage: image)
                    .font(.title2)
                    .foregroundColor(.black)
            }
        }
    }
}

struct DetailedRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailedRow(name: "some stat:", image: "thermometer", value: "some value")
    }
}
