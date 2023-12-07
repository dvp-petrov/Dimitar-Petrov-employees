//
//  CommonProjectsView.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 6.12.23.
//

import SwiftUI

struct CommonProjectsView: View {
    
    let items: [EmployeesCollaboration]
    
    private let columns = [
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        VStack {
            CommonProjectsHeaderView()
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.2))
                .fixedSize(horizontal: false, vertical: true)

            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(items, id: \.self) { item in
                        CommonProjectsItemView(item: item)
                    }
                }
            }
        }
    }
    
}

#Preview {
    CommonProjectsView(items: [])
}
