//
//  FlagData.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 24.03.2023.
//

import Foundation


struct FlagData: Codable {
    
    var flagUrl: String?
    var flagName: String?
    
    
    
    enum CodingKeys: String, CodingKey {
        case flagUrl
        case flagName
    }
    
    
    // Init
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flagUrl = try values.decode(String.self, forKey: .flagUrl)
        flagName = try values.decode(String.self, forKey: .flagName)
    }
    
    init(flagUrl: String, flagName: String) {
        self.flagUrl = flagUrl
        self.flagName = flagName
    }
    
}

