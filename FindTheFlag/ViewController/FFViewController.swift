//
//  ViewController.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit

class FFViewController: UIViewController {

    let viewModel = FFViewModelAPI()
    var ffView: FFView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        ffView = FFView(frame: view.bounds, viewModel: viewModel)
        setUpView()
      
        
    }

    func setUpView() {
        view.addSubview(ffView)
        viewModel.delegate = self
        viewModel.fetchFlag()
        
        
        
    }

}

extension FFViewController: FFViewModelDelegate {
    
    func didLoadFlags(_ ffViewModelAPI: FFViewModelAPI, flags: FlagData) {
        if let flagUrlString = flags.flagUrl, let flagUrl = URL(string: flagUrlString) {
            
            DispatchQueue.global(qos: .userInitiated).async {
                if let data = try? Data(contentsOf: flagUrl), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.ffView.countryImageView.image = image
                    }
                } else {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Hata", message: "Bayrak yüklenirken bir hata oluştu", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}




