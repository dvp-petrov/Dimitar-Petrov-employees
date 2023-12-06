//
//  FilePickerView.swift
//  SirmaTask
//
//  Created by Dimitar Petrov on 6.12.23.
//

import SwiftUI

protocol FilePickerViewModel: ObservableObject {
    /// `String` - the filename of the displayed CSV file.
    var fileName: String { get }
    
    /// Notify the viewModel for finish picking file with success outcome.
    /// - Parameter url: of the picked file.
    func didFinishPickingFileWithSuccess(url: URL)
    
    /// Notify the viewModel for finish picking file with failure.
    /// - Parameter error: Error to handle.
    func didFinishPickingFileWithError(_ error: Error)
}

struct FilePickerView<ViewModel: FilePickerViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var isFilePickerPresented = false
    
    var body: some View {
        HStack(spacing: 8) {
            Text(viewModel.fileName)
                .lineLimit(1)
                .font(.title3)
            Spacer()
            Button {
                isFilePickerPresented.toggle()
            } label: {
                Text("Open File Picker")
            }
        }
        .padding(8)
        .fileImporter(isPresented: $isFilePickerPresented,
                      allowedContentTypes: [.commaSeparatedText],
                      allowsMultipleSelection: false,
                      onCompletion: { [weak viewModel] result in
            
            switch result {
            case .success(let urls):
                if let url = urls.first {
                    viewModel?.didFinishPickingFileWithSuccess(url: url)
                } else {
                    viewModel?.didFinishPickingFileWithError(NSError(domain: "Internal - No URL for picked file.", code: 100))
                }
            case .failure(let error):
                viewModel?.didFinishPickingFileWithError(error)
            }
            
        })
    }
    
}
