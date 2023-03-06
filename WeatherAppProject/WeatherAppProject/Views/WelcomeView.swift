//
//  WelcomeView.swift
//  WeatherAppProject
//
//  Created by Aadam De Doncker on 2023/03/04.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the Weather App")
                    .bold().font(.title)
            }
            .multilineTextAlignment(.center)
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
