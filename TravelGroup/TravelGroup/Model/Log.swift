//
//  Log.swift
//  TravelGroup
//
//  Created by Colton Brenneman on 8/16/23.
//

import Foundation

struct Log {
    var logDate: Date
    var logTitle: String
    var logAddress: String
    var logBody: String
    let uuid: UUID
} // End of struct

extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.uuid == rhs.uuid
    }
} // End of extension
