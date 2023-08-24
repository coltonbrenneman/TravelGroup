//
//  Log.swift
//  TravelGroup
//
//  Created by Colton Brenneman on 8/16/23.
//

import Foundation

// Class has properties and initializers // We added Codable for JSON persit, Codable is readable and write
class Log: Codable {
    // These properties were created to display the data we need in our app.
    var logTitle: String
    var logAddress: String
    var logDate: Date
    var logBody: String
    let uuid: UUID
    
    // Initializing the propeties of the class.
    init(logTitle: String, logAddress: String, logDate: Date = Date(), logBody: String, uuid: UUID = UUID()) {
        self.logTitle = logTitle
        self.logAddress = logAddress
        self.logDate = logDate
        self.logBody = logBody
        self.uuid = uuid // Universal unique identifer
    }
} //End of class
// Extending the class to be able to delete with equatable.
extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.uuid == rhs.uuid
    }
} // End of extension
