//
//  CommonProjectsView.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 6.12.23.
//

import SwiftUI

struct CommonProjectsView: View {
    var body: some View {
        HStack {
            Text("Employee ID #1")
            Divider()
            Text("Employee ID #2")
            Divider()
            Text("Project ID")
            Divider()
            Text("Days")
        }
        .minimumScaleFactor(0.5)
        .lineLimit(1)
    }
}

#Preview {
    CommonProjectsView()
}
