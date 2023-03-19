//
//  ViewModel.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit

protocol FFViewModelDelegate: AnyObject {
    func didLoadFlags(flags: [FFModel], country: FFModel)
    func didFailWithError(error: Error)
}

class FFViewModelAPI {
    
    var delegate: FFViewModelDelegate?
    
    let flagAPI = "https://flag.herokuapp.com/country"
    
    
    
    func fetchFlag() {
        let urlString = "\(flagAPI)/\(country)"
        performRequest(with: urlString)
        
        let country = [
            "turkey",
            "usa",
            "germany",
            "france",
            "italy",
            "spain",
            "uk",
            "china",
            "japan",
            "canada",
            "brazil",
            "argentina",
            "india",
            "russia",
            "australia",
            "southAfrica"
        ]

        
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let flags = self.parseJSON(safeData) {
                        if let country = flags.randomElement() {
                            self.delegate?.didLoadFlags(flags: flags, country: country)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
    
    
    
    func parseJSON(_ data: Data) -> [FFModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([FFModel].self, from: data)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
}







