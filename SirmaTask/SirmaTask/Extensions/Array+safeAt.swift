//
//  Array+safeAt.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 6.12.23.
//

import Foundation

extension Array {
    
    subscript(safeAt index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
    
}
