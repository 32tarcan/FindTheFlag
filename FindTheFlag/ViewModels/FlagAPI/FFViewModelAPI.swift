//
//  ViewModel.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit

protocol FFViewModelDelegate {
    func didLoadFlags(_ ffViewModelAPI: FFViewModelAPI, flags: FlagData)
    func didFailWithError(error: Error)
}

// API class
class FFViewModelAPI {
    
    var delegate: FFViewModelDelegate?
    var ffModel = FFModel()
    
    
    let flagAPI = "https://flag.herokuapp.com/country"
    
    
    public func fetchFlag(index: Int) {
        let urlString = "\(flagAPI)/\(ffModel.countryImage[index])"
        fetchJSON(from: urlString)
    }
    
    func fetchJSON(from urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    
                  
                        if let flagJson = self.parseJSON(safeData) {
                            
                            self.delegate?.didLoadFlags(self, flags: flagJson)
                            
                            
                            
                            
                        } else {
                            self.delegate?.didFailWithError(error: error!)
                        }
                }
            }
            task.resume()
        } else {
            print("Invalid URL: \(urlString)")
        }
    }
    
    
    
    
    
    func parseJSON(_ data: Data) -> FlagData? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FlagData.self, from: data)
            return decodedData
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}


