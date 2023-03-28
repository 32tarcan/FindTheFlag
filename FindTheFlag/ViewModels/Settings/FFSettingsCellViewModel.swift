//
//  FFSettingsCellViewModel.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 28.03.2023.
//

import UIKit

struct FFSettingsCellViewModel: Identifiable {
    let id = UUID()
    
    public let type: FFSettingsOption
    public let onTapHandler: (FFSettingsOption) -> Void
   
    
    //MARK: - Init
    
    init(type: FFSettingsOption, onTapHandler: @escaping (FFSettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
    
    //MARK: - Public
    
    public var image: UIImage? {
        return type.iconImage
    }
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
