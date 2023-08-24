//
//  LogController.swift
//  TravelGroup
//
//  Created by Colton Brenneman on 8/18/23.
//

import Foundation

class LogController { // Design pattern MCV, Model, View Controller
    
    // MARK: - Properties
    static let shared = LogController() // static means we can access the property anywhere in the project. Shared = source of truth
    var logs: [Log] = [] // creating an array of logs with an empty array that will populate the the array of logs
    
    init() {
        load() // We are calling the load for the JSON persit.
    }
    
    // MARK: - CRUD
    // Creating a log with a crud function. CRUD = Create, Read, Update, Delete.
    func createLog(title: String, address: String, body: String) {
       let log = Log(logTitle: title, logAddress: address, logBody: body)
        logs.append(log) // append mean to add to the end. adding a log.
        save() // Calling the save for the JSON
    } // End of createLog
    // Crud updating
    func update(log: Log, title: String, address: String, body: String) {
        log.logTitle = title
        log.logAddress = address
        log.logBody = body
        log.logDate = Date()
        save() // save for JSON
    } // End of update
    //  Function for delete. Where the index is, we want to remove that index, create it to be delelted.
    func delete(log: Log) {
        guard let index = logs.firstIndex(of: log) else { return }
        logs.remove(at: index)
        save() // For JSON
    } // end of delete
    
    // MARK: - Persistence - This will perist our data in the app. When the user closes the app, the app will persit how it was last closed.
    // writing
    func save() {
        guard let url = fileURL else {return}
        do {  // looking for data to use JSON encode to save our information/ Using do try catch / Do this , try, catch - either we have data or we have an error. 
            let data = try JSONEncoder().encode(logs)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func load() {
        guard let url = fileURL else { return }
        do {
            let data = try Data(contentsOf: url)
            let logs = try JSONDecoder().decode([Log].self, from: data)
            self.logs = logs
        } catch {
            print(error)
        }
    }
    
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
        let url = documentsDirectory.appendingPathComponent("log.json")
        return url
    }
    
} // End of class
