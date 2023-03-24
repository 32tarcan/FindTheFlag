//
//  FlagData.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 24.03.2023.
//

import Foundation


struct FlagData: Codable {
    
    var flagUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case flagUrl
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flagUrl = try values.decode(String.self, forKey: .flagUrl)
    }
    
    init(flagUrl: String) {
        self.flagUrl = flagUrl
    }
    
}

