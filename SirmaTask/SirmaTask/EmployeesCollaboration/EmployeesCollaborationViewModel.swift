//
//  EmployeesCollaborationViewModel.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 6.12.23.
//

import SwiftUI
import Combine

protocol EmployeesCollaborationViewModel: ObservableObject, FilePickerViewModel {
    var isErrorPresented: Bool { get set }
}

class DefaultEmployeesCollaborationViewModel: EmployeesCollaborationViewModel {
    
    @Published var fileName = "Selected file:"
    @Published var isErrorPresented = false
    
    private let repository: EmployeesCollaborationRepository
    
    init(repository: EmployeesCollaborationRepository = LocalFileRepository()) {
        self.repository = repository
    }
    
}

// MARK: - FilePickerViewModel
extension DefaultEmployeesCollaborationViewModel: FilePickerViewModel {
    
    func didFinishPickingFileWithSuccess(url: URL) {
        // TODO: start loading indicator if needed
        fileName = url.lastPathComponent
        
        let data = repository.getCollaborationData(for: url)
        // TODO: transform data to find the longest collaborating employees
        // TODO: display results
        // TODO: stop loading if needed
    }
    
    func didFinishPickingFileWithError(_ error: Error) {
        // placeholder method for handling error while picking file.
        // Handle in production implementation for specification.
        // Consider showing some error to the user.
        print("Error: \(error) reading file \(error.localizedDescription)")
        
        // Dummy implementation only shows popup with error.
        isErrorPresented = true
    }
    
}
