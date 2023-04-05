//
//  ViewController.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit


class FFGameViewController: UIViewController {

    let viewModel = FFViewModelAPI()
    var ffView: FFView!
    var model = FFModel()
    
    static var sharedInstance: FFGameViewController?
    
    

    var flagIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        ffView = FFView(frame: view.bounds, viewModel: viewModel)
        setUpView()
        let homeVC = FFHomeViewController()
        present(homeVC, animated: true, completion: nil)
        FFGameViewController.sharedInstance = self
        
        
        
        
        
        
        
        
        
    }

    func setUpView() {
        view.addSubview(ffView)
        viewModel.delegate = self
        viewModel.fetchFlag(index: flagIndex)
        restartGame()
        
        
    }
    
    func restartGame() {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont.systemFont(ofSize: 20, weight: .bold),
            kTextFont: UIFont.systemFont(ofSize: 16),
            kButtonFont: UIFont.systemFont(ofSize: 16, weight: .bold),
            showCloseButton: false
        )
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton("Evet") {
            self.dismiss(animated: true) {
                let homeVC = FFHomeViewController()
                homeVC.modalPresentationStyle = .fullScreen
                homeVC.presentGameViewController()
            }
        }
        
        alert.addButton("Hayır") {
            self.dismiss(animated: true) {
                let homeVC = FFHomeViewController()
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true, completion: nil)
            }
        }
        
        alert.showWarning("Oyunu kaybettiniz", subTitle: "Üzgünüm, 3 kere yanlış cevap verdiniz. Yeniden oynamak ister misiniz?")
    }



   
    
    

    

}

extension FFHomeViewController {
    func presentGameViewController() {
        let gameVC = FFGameViewController()
        gameVC.modalPresentationStyle = .fullScreen
        present(gameVC, animated: true, completion: nil)
    }
}


extension FFGameViewController: FFViewModelDelegate {
    
    func didLoadFlags(_ ffViewModelAPI: FFViewModelAPI, flags: FlagData) {
        if let flagUrlString = flags.flagUrl, let flagUrl = URL(string: flagUrlString) {
            
            DispatchQueue.global(qos: .userInitiated).async {
                if let data = try? Data(contentsOf: flagUrl), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.ffView.countryImageView.image = image
                        self.ffView.activeFlagName = flags.flagName ?? ""
                        self.ffView.initButtonNames(correctName: flags.flagName ?? "")
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




