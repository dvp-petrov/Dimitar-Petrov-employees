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
    var longestCollaboration: (data: [EmployeesCollaboration], numberOfDays: Int)? { get }
    var totalCollaboration: (firstEmployeeId: String, secondEmployeeId: String, totalNumberOfDays: Int) { get }
    var isLoading: Bool { get }
}

class DefaultEmployeesCollaborationViewModel: EmployeesCollaborationViewModel {
    
    @Published var fileName = "Selected file:"
    @Published var isErrorPresented = false
    @Published var longestCollaboration: (data: [EmployeesCollaboration], numberOfDays: Int)?
    @Published var isLoading = false
    
    var totalCollaboration: (firstEmployeeId: String, secondEmployeeId: String, totalNumberOfDays: Int) {
        guard let dataSample = longestCollaboration?.data.first else { return ("", "", 0) }
        return (dataSample.firstEmployeeId, dataSample.secondEmployeeId, longestCollaboration?.numberOfDays ?? 0)
    }
    
    private let repository: EmployeesCollaborationRepository
    private let collaborationService: EmployeesCollaborationService
    
    init(repository: EmployeesCollaborationRepository = LocalFileRepository(),
         collaborationService: EmployeesCollaborationService = DefaultEmployeesCollaborationService()) {
        self.repository = repository
        self.collaborationService = collaborationService
    }
    
}

// MARK: - FilePickerViewModel
extension DefaultEmployeesCollaborationViewModel: FilePickerViewModel {
    
    func didFinishPickingFileWithSuccess(url: URL) {
        isLoading = true
        fileName = url.lastPathComponent
        
        DispatchQueue.global(qos: .userInitiated).async {
            let data = self.repository.getCollaborationData(for: url)
            let employeesCollaboration = self.collaborationService.transformInputRowDataToEmployeesCollaboration(data)
            
            DispatchQueue.main.async {
                self.longestCollaboration = self.collaborationService.getLongestCollaboration(from: employeesCollaboration)
                self.isLoading = false
            }
        }
    }
    
    func didFinishPickingFileWithError(_ error: Error) {
        // Placeholder method for handling error while picking file.
        // Handle in production implementation for specification.
        // Consider showing some error to the user.
        print("Error: \(error) reading file \(error.localizedDescription)")
        
        // Dummy implementation only shows popup with error.
        isErrorPresented = true
    }
    
}
