//
//  Extensions.swift
//  WeatherAppProject
//
//  Created by Aadam De Doncker on 2023/03/04.
//

import Foundation
import SwiftUI

extension String{
    func toDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)!
        let formatDate = DateFormatter()
        formatDate.dateFormat = "MMM d YYYY, hh:mm"  
        let drawDate = formatDate.string(from: date)
        return drawDate
      }
}

