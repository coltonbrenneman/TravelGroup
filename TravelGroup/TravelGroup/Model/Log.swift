//
//  Log.swift
//  TravelGroup
//
//  Created by Colton Brenneman on 8/16/23.
//

import Foundation

struct Log {
    let logDate: Date
    let logTitle: String
    let logAddress: String
    let logBody: String
    let uuid: UUID
} // End of struct

extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.uuid == rhs.uuid
    }
} // End of extension
