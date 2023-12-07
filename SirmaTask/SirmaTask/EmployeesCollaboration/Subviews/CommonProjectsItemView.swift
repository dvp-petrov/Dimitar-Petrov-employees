//
//  CommonProjectsItemView.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 7.12.23.
//

import SwiftUI

struct CommonProjectsItemView: View {
    
    let item: EmployeesCollaboration
    
    var body: some View {
        HStack {
            Text(item.firstEmployeeId)
            Spacer()
            Text(item.secondEmployeeId)
            Spacer()
            Text(item.projectId)
            Spacer()
            Text("\(item.numberOfDays)")
        }
    }
    
}
