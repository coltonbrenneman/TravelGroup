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
    
    init() {
        load()
    }
    
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
    } // end of delete
    
    // MARK: - Persistence
    // writing
    func save() {
        guard let url = fileURL else {return}
        do {
            let data = try JSONEncoder().encode(logs)
            try data.write(to: url)
        } catch {
            print("This save isn't working")
        }
    }
    
    func load() {
        guard let url = fileURL else { return }
        do {
            let data = try Data(contentsOf: url)
            let logs = try JSONDecoder().decode([Log].self, from: data)
            self.logs = logs
        } catch {
            print("Load didn't work")
        }
    }
    
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
        let url = documentsDirectory.appendingPathComponent("logs.json")
        return url
    }
    
} // End of class
