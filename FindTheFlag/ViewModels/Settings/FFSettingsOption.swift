//
//  FFSettingsOption.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 28.03.2023.
//


import UIKit

enum FFSettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case viewCode
    
    var targetUrl: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contactUs:
            return URL(string: "https://twitter.com/32Tarcann")
        case .terms:
            return URL(string:"https://github.com/")
        case .privacy:
            return URL(string: "https://twitter.com/32Tarcann")
        case .viewCode:
          return URL(string: "https://github.com/32tarcan/FindTheFlag")
        }
    }
    
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contac tUs"
        case .terms:
            return "Terms of Service"
        case .privacy:
            return "Privacy Policy"
        
        case .viewCode:
            return "View App Code"
        }
    }
    
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
             return .systemBlue
        case .contactUs:
            return .systemGreen
        case .terms:
            return .systemRed
        case .privacy:
            return .systemYellow
        case .viewCode:
            return .systemPink
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .privacy:
            return UIImage(systemName: "lock")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
}
