//
//  DateHelper.swift
//  TravelGroup
//
//  Created by Colton Brenneman on 8/16/23.
//

import Foundation

extension Date {
    
    func asString() -> String {
     let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
}
