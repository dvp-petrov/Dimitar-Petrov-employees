//
//  EmployeesCollaboration.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 7.12.23.
//

import Foundation

struct EmployeesCollaboration {
    
    // Model used in SwiftUI ForEach.
    let id = UUID()
    
    let firstEmployeeId: String
    let secondEmployeeId: String
    let projectId: String
    let numberOfDays: Int
    
    init?(first: InputRow, second: InputRow) {
        guard first.projectId == second.projectId,
                first.employeeId != second.employeeId else { return nil }
        
        let firstStart = first.dateFrom
        let firstEnd = first.dateTo
        let secondStart = second.dateFrom
        let secondEnd = second.dateTo
        
        // L1 L2 R1 R2
        if firstStart <= secondStart, secondStart <= firstEnd, firstEnd <= secondEnd {
            // Calculate days between L2 & R1
            numberOfDays = Calendar.current.numberOfDaysBetween(secondStart, and: firstEnd)
        }
        // L1 L2 R2 R1
        else if firstStart <= secondStart, secondEnd <= firstEnd {
            // Calculate days between L2 & R2
            numberOfDays = Calendar.current.numberOfDaysBetween(secondStart, and: secondEnd)
        }
        // L2 L1 R2 R1
        else if secondStart <= firstStart, firstStart <= secondEnd, secondEnd <= firstEnd {
            // Calculate days between L1 & R2
            numberOfDays = Calendar.current.numberOfDaysBetween(firstStart, and: secondEnd)
        }
        // L2 L1 R1 R2
        else if secondStart <= firstStart, firstEnd <= secondEnd {
            // Calculate days between L1 & R1
            numberOfDays = Calendar.current.numberOfDaysBetween(firstStart, and: firstEnd)
        }
        // The last day of 1 employee and the first day of another, does not count as collaboration.
        // Will return `nil`:    L1 R1 L2 R2    OR    L2 R2 L1 R1
        else {
            // No intersection between the two date intervals.
            return nil
        }
        
        let firstEmployeeId: String
        let secondEmployeeId: String
        if Int(first.employeeId) ?? 0 <= Int(second.employeeId) ?? 0 {
            firstEmployeeId = first.employeeId
            secondEmployeeId = second.employeeId
        } else {
            firstEmployeeId = second.employeeId
            secondEmployeeId = first.employeeId
        }
        
        self.firstEmployeeId = firstEmployeeId
        self.secondEmployeeId = secondEmployeeId
        projectId = first.projectId
    }
    
}

// MARK: - Hashable
extension EmployeesCollaboration: Hashable {
    
}
