//
//  Log.swift
//  TravelGroup
//
//  Created by Colton Brenneman on 8/16/23.
//

import Foundation

class Log {
    
    var logTitle: String
    var logAddress: String
    var logDate: Date
    var logBody: String
    let uuid: UUID
    
    init(logTitle: String, logAddress: String, logDate: Date = Date(), logBody: String, uuid: UUID = UUID()) {
        self.logTitle = logTitle
        self.logAddress = logAddress
        self.logDate = logDate
        self.logBody = logBody
        self.uuid = uuid
    }
} //End of class

extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.uuid == rhs.uuid
    }
} // End of extension
