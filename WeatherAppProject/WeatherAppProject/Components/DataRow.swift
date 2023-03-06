//
//  DataRow.swift
//  WeatherAppProject
//
//  Created by Aadam De Doncker on 2023/03/05.
//

import SwiftUI

struct DataRow: View {
//    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 5) {
            Text(name + ":")
                .bold()
                .font(.title3)
            VStack(alignment: .leading, spacing: 8) {
                Text(value)
                    .bold()
                    .font(.title3)
            }
        }
    }
}

struct DataRow_Previews: PreviewProvider {
    static var previews: some View {
        DataRow(name: "Feels like", value: "8°")
    }
}
