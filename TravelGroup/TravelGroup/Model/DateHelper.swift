//
//  DateHelper.swift
//  TravelGroup
//
//  Created by Colton Brenneman on 8/16/23.
//

import Foundation

extension Date {
    // Here we are creating a date helper to create use the data as a string. Strings are easier to deal with than INTs. 
    func asString() -> String {
     let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
}
