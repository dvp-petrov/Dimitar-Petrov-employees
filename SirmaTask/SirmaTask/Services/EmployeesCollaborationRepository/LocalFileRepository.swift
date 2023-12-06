//
//  LocalFileRepository.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 6.12.23.
//

import Foundation

class LocalFileRepository: EmployeesCollaborationRepository {
    
    func getCollaborationData(for url: URL) -> [InputRow] {
        guard var string = try? String(contentsOf: url, encoding: .utf8) else {
            return []
        }
        
        // Simple parsing logic for handling provided input data.
        // Improve the parsing logic, if input data is more complex.
        // Consider using https://github.com/swiftcsv/SwiftCSV
        string = string.filter { !$0.isWhitespace || $0 == "\n" }
        var result: [InputRow] = []
        
        // Create referenceDate before iterating among all items,
        // in order to have the same referenceDate for all items.
        let referenceDate = Date()
        
        let rows = string.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ",")
            
            guard let employeeId = columns[safeAt: 0],
                  let projectId = columns[safeAt: 1],
                  let dateFrom = columns[safeAt: 2],
                  let dateTo = columns[safeAt: 3],
                  let item = InputRow(employeeId: employeeId,
                                      projectId: projectId,
                                      dateFrom: dateFrom,
                                      dateTo: dateTo, 
                                      referenceDate: referenceDate)
            else { continue }
            
            result.append(item)
        }
        
        return result
    }
    
}
