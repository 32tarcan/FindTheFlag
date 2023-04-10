//
//  ViewController.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit
import CoreMotion
import AudioToolbox




class FFGameViewController: UIViewController {
    
    let viewModel = FFViewModelAPI()
    var ffView: FFView!
    var model = FFModel()
    
    static var sharedInstance: FFGameViewController?
    
    let motionManager = CMMotionManager()
    
    var flagIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        ffView = FFView(frame: view.bounds, viewModel: viewModel)
        setUpView()
        let homeVC = FFHomeViewController()
        present(homeVC, animated: true, completion: nil)
        FFGameViewController.sharedInstance = self
        
        let homeImage2 = UIImageView()
        homeImage2.translatesAutoresizingMaskIntoConstraints = false
        homeImage2.contentMode = .scaleAspectFill
        homeImage2.backgroundColor = UIColor.clear
        homeImage2.image = UIImage(named: "flagImages.png")
        homeImage2.alpha = 0.02
        
        view.addSubview(homeImage2)
        NSLayoutConstraint.activate([
            homeImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeImage2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeImage2.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        
        
    }
    
    
    
        
    
    
    
    
    func setUpView() {
        view.addSubview(ffView)
        viewModel.delegate = self
        viewModel.fetchFlag(index: flagIndex)
        restartGame()
        
        
        
        motionManager.startDeviceMotionUpdates(to: .main) {  motion, error in
            if let acceleration = motion?.userAcceleration,
               acceleration.x > 1.5 || acceleration.y > 1.5 || acceleration.z > 1.5 {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
        }
        
        
      

        

        let buttonPadding: CGFloat = 20.0
        let buttonHeight: CGFloat = 60.0
        let buttonWidth: CGFloat = (UIScreen.main.bounds.width - 3*buttonPadding - 10) / 2

        NSLayoutConstraint.activate([
            // Button 1
            ffView.countryButton1.topAnchor.constraint(equalTo: ffView.countryImageView.bottomAnchor, constant: buttonPadding + 150),
            ffView.countryButton1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: buttonPadding),
            ffView.countryButton1.heightAnchor.constraint(equalToConstant: buttonHeight),
            ffView.countryButton1.widthAnchor.constraint(equalToConstant: buttonWidth),

            // Button 2
            ffView.countryButton2.topAnchor.constraint(equalTo: ffView.countryImageView.bottomAnchor, constant: buttonPadding + 150),
            ffView.countryButton2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -buttonPadding),
            ffView.countryButton2.heightAnchor.constraint(equalToConstant: buttonHeight),
            ffView.countryButton2.widthAnchor.constraint(equalToConstant: buttonWidth),

            // Button 3
            ffView.countryButton3.topAnchor.constraint(equalTo: ffView.countryButton1.bottomAnchor, constant: buttonPadding),
            ffView.countryButton3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: buttonPadding),
            ffView.countryButton3.heightAnchor.constraint(equalToConstant: buttonHeight),
            ffView.countryButton3.widthAnchor.constraint(equalToConstant: buttonWidth),

            // Button 4
            ffView.countryButton4.topAnchor.constraint(equalTo: ffView.countryButton2.bottomAnchor, constant: buttonPadding),
            ffView.countryButton4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -buttonPadding),
            ffView.countryButton4.heightAnchor.constraint(equalToConstant: buttonHeight),
            ffView.countryButton4.widthAnchor.constraint(equalToConstant: buttonWidth),

            // Flag Image View
            ffView.countryImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ffView.countryImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            ffView.countryImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 120),
            ffView.countryImageView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 120) * 0.6667),

            // Score Label
            ffView.scoreLabel.topAnchor.constraint(equalTo: ffView.safeAreaLayoutGuide.topAnchor, constant: 10),
            ffView.scoreLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            
            // Remaining Label
            ffView.remainingLabel.topAnchor.constraint(equalTo: ffView.safeAreaLayoutGuide.topAnchor, constant: 10),
            ffView.remainingLabel.leadingAnchor.constraint(equalTo: ffView.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            // Heart Images
            ffView.heartImage1.widthAnchor.constraint(equalToConstant: 25),
            ffView.heartImage1.heightAnchor.constraint(equalToConstant: 25),
            ffView.heartImage1.topAnchor.constraint(equalTo: ffView.safeAreaLayoutGuide.topAnchor, constant: 20),
            ffView.heartImage1.trailingAnchor.constraint(equalTo: ffView.heartImage2.leadingAnchor, constant: -10),

            ffView.heartImage2.widthAnchor.constraint(equalToConstant: 25),
            ffView.heartImage2.heightAnchor.constraint(equalToConstant: 25),
            ffView.heartImage2.topAnchor.constraint(equalTo: ffView.safeAreaLayoutGuide.topAnchor, constant: 20),
            ffView.heartImage2.centerXAnchor.constraint(equalTo: ffView.centerXAnchor),

            ffView.heartImage3.widthAnchor.constraint(equalToConstant: 25),
            ffView.heartImage3.heightAnchor.constraint(equalToConstant: 25),
            ffView.heartImage3.topAnchor.constraint(equalTo: ffView.safeAreaLayoutGuide.topAnchor, constant: 20),
            ffView.heartImage3.leadingAnchor.constraint(equalTo: ffView.heartImage2.trailingAnchor, constant: 10),

            

        ])
       






        
        
        
        
        
        
    }
    
    func restartGame() {
        let alert = UIAlertController(title: "Oyunu kaybettiniz", message: "Üzgünüm, 3 kere yanlış cevap verdiniz. Yeniden oynamak ister misiniz?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { _ in
            self.dismiss(animated: true) {
                let gameVC = FFGameViewController()
                gameVC.modalPresentationStyle = .fullScreen
                UIApplication.shared.windows.first?.rootViewController?.present(gameVC, animated: true, completion: nil)
            }
        }))
        
        
        alert.addAction(UIAlertAction(title: "Hayır", style: .default, handler: { _ in
            self.dismiss(animated: true) {
                let homeVC = FFHomeViewController()
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true, completion: nil)
            }
        }))
        
        present(alert, animated: true)
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




