//
//  EmployeesCollaborationView.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 6.12.23.
//

import SwiftUI

struct EmployeesCollaborationView<ViewModel: EmployeesCollaborationViewModel>: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel = DefaultEmployeesCollaborationViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 8) {
            FilePickerView<ViewModel>(viewModel: viewModel)
            CommonProjectsView()
            Color.blue
        }
        .alert("Error",
               isPresented: $viewModel.isErrorPresented,
               actions: {
            Button(action: {
                viewModel.isErrorPresented = false
            }, label: {
                Text("Ok")
            })
        }) {
            Text("Something went wrong while picking file.")
        }
    }
    
}

#Preview {
    EmployeesCollaborationView()
}
