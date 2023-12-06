//
//  String+detectDates.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 7.12.23.
//

import Foundation

// Solution taken from: https://stackoverflow.com/a/32595941/3883492
extension String {
    var nsString: NSString { self as NSString }
    var length: Int { nsString.length }
    var nsRange: NSRange { .init(location: 0, length: length) }
    var detectDates: [Date]? {
        try? NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
            .matches(in: self, range: nsRange)
            .compactMap(\.date)
    }
}
