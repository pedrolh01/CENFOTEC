//
//  DateFormatter.swift
//  tarea3
//
//  Created by Felix F on 3/27/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation

extension Date{
    func getFormatted(dateStyle:DateFormatter.Style,timeStyle:DateFormatter.Style)->String{
        let formatter = DateFormatter()
        formatter.locale=Locale.current
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        let localizedDate = formatter.string(from: self)
        return localizedDate
    }
}