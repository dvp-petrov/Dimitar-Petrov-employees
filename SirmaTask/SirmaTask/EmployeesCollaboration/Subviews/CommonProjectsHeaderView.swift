//
//  CommonProjectsHeaderView.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 7.12.23.
//

import SwiftUI

struct CommonProjectsHeaderView: View {
    var body: some View {
        GeometryReader { reader in
            HStack(alignment: .center, spacing: 8) {
                Text("Employee ID #1")
                    .frame(maxWidth: reader.size.width / 4)
                Text("Employee ID #2")
                    .frame(maxWidth: reader.size.width / 4)
                Text("Project ID")
                    .frame(maxWidth: reader.size.width / 4)
                Text("Days")
                    .frame(maxWidth: reader.size.width / 4)
            }
            .scaledToFill()
            .minimumScaleFactor(0.5)
            .lineLimit(1)
        }
    }
}

#Preview {
    CommonProjectsHeaderView()
}
