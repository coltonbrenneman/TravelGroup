//
//  DateHelper.swift
//  TravelGroup
//
//  Created by Colton Brenneman on 8/16/23.
//

import Foundation

extension Date {
    // Here we are creating a date helper to create a date into a string.
    func asString() -> String {
     let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
}
