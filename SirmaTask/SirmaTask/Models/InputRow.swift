//
//  InputRow.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 6.12.23.
//

import Foundation

struct InputRow {
    
    let employeeId: String
    let projectId: String
    let dateFrom: Date
    let dateTo: Date
    
    init?(employeeId: String, 
          projectId: String,
          dateFrom: String,
          dateTo: String,
          referenceDate: Date) {
        self.employeeId = employeeId
        self.projectId = projectId
        guard let dateFrom = dateFrom.detectDates?.first else { return nil }
        self.dateFrom = dateFrom
        self.dateTo = dateTo.detectDates?.first ?? referenceDate
    }
    
}
