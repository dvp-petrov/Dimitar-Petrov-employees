//
//  EmployeesCollaborationRepository.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 6.12.23.
//

import Foundation

protocol EmployeesCollaborationRepository {
    func getCollaborationData(for url: URL) -> [InputRow]
}
