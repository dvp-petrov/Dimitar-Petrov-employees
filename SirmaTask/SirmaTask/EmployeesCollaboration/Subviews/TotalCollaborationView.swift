//
//  TotalCollaborationView.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 7.12.23.
//

import SwiftUI

struct TotalCollaborationView: View {
    
    let totalCollaboration: (firstEmployeeId: String, secondEmployeeId: String, totalNumberOfDays: Int)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Employee ID #1, Employee ID #2, Total Days")
                .font(.title3)
            Text("\(totalCollaboration.firstEmployeeId), \(totalCollaboration.secondEmployeeId), \(totalCollaboration.totalNumberOfDays)")
                .padding(8)
        }
    }
}

#Preview {
    TotalCollaborationView(totalCollaboration: ("1", "2", 10))
}
