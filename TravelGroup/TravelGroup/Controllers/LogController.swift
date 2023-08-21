//
//  LogController.swift
//  TravelGroup
//
//  Created by Colton Brenneman on 8/18/23.
//

import Foundation

class LogController {
    
    // MARK: - Properties
    static let shared = LogController()
    var logs: [Log] = []
    
    // MARK: - CRUD
    func createLog(title: String, address: String, body: String) {
       let log = Log(logTitle: title, logAddress: address, logBody: body)
        logs.append(log)
    } // End of createLog
    
    func update(log: Log, title: String, address: String, body: String) {
        log.logTitle = title
        log.logAddress = address
        log.logBody = body
        log.logDate = Date()
    } // End of update
    
    func delete(log: Log) {
        guard let index = logs.firstIndex(of: log) else { return }
        logs.remove(at: index)
    } // End of delete
} // End of class
