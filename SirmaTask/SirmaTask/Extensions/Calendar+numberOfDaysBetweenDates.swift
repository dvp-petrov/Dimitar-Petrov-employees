//
//  Calendar+numberOfDaysBetweenDates.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 7.12.23.
//

import Foundation

// Solution from: https://sarunw.com/posts/getting-number-of-days-between-two-dates/#number-of-days-pass-midnight%2C-including-a-start-date
extension Calendar {
    
    // Number of days pass midnight, including a start date. (the +1 at the end)
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        
        return (numberOfDays.day ?? 0) + 1
    }
    
}
