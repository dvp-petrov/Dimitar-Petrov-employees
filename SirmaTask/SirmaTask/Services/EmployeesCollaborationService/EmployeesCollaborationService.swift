//
//  EmployeesCollaborationService.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 7.12.23.
//

import Foundation

protocol EmployeesCollaborationService {
    func transformInputRowDataToEmployeesCollaboration(_ data: [InputRow]) -> [EmployeesCollaboration]
    func getLongestCollaboration(from data: [EmployeesCollaboration]) -> (data: [EmployeesCollaboration], numberOfDays: Int)?
}

class DefaultEmployeesCollaborationService: EmployeesCollaborationService {
    
    func transformInputRowDataToEmployeesCollaboration(_ data: [InputRow]) -> [EmployeesCollaboration] {
        guard data.count > 1 else { return [] }
        
        var employeesCollaborations: [EmployeesCollaboration] = []

        for firstEntryIndex in 0..<data.count - 1 {
            for secondEntryIndex in firstEntryIndex+1..<data.count {
                guard let employeesCollaboration = EmployeesCollaboration(first: data[firstEntryIndex], second: data[secondEntryIndex]) else { continue }
                employeesCollaborations.append(employeesCollaboration)
            }
        }
        
        return employeesCollaborations
    }
    
    func getLongestCollaboration(from data: [EmployeesCollaboration]) -> (data: [EmployeesCollaboration], numberOfDays: Int)? {
        
        let dict = Dictionary(grouping: data) {
            // Group by employees' ids.
            "\($0.secondEmployeeId) && \($0.firstEmployeeId)"
        }
        
        let map = dict.map {
            // Calculate total number of days among all projects per employees' pair.
            let numberOfDays = $0.value.map { $0.numberOfDays }.reduce(0, +)
            return ($0.value, numberOfDays)
        }.sorted {
            // Sort by number of days.
            $0.1 > $1.1
        }
        
        return map.first
    }
    
}
