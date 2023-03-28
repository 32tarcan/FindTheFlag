//
//  FFSettingsView.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 28.03.2023.
//

import SwiftUI

struct FFSettingsView: View {
    let viewModel: FFSettingsViewViewModel
    
    init(viewModel: FFSettingsViewViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        List(viewModel.cellViewModels) { viewModel in
            HStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.red)
                        .padding(8)
                        .background(Color(viewModel.iconContainerColor))
                        .cornerRadius(6)
                }
                Text(viewModel.title)
                    .padding(.leading, 10)
                
                Spacer()
            }
            
            .padding(.bottom, 3)
            .onTapGesture {
                viewModel.onTapHandler(viewModel.type)
            }
        }
    }
}

struct FFSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        FFSettingsView(viewModel: .init(cellViewModels: FFSettingsOption.allCases.compactMap({
            return FFSettingsCellViewModel(type: $0) { option in
                
            }
            
        })))
    }
}
