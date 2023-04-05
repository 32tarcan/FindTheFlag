//
//  FFHomeViewController.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 29.03.2023.
//

import UIKit

class FFHomeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let startButton = UIButton()
        startButton.tintColor = .white
        startButton.backgroundColor = .black
        startButton.layer.cornerRadius = 17
        startButton.setTitle("Oyna", for: .normal)
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            startButton.widthAnchor.constraint(equalToConstant: 120),
            startButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        let settingsButton = UIButton()
        settingsButton.tintColor = .white
        settingsButton.backgroundColor = .black
        settingsButton.layer.cornerRadius = 17
        settingsButton.setTitle("Ayarlar", for: .normal)
        settingsButton.setImage(UIImage(named: "gearshape.fill"), for: .normal)
        
        
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsButton)
        
        NSLayoutConstraint.activate([
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 10),
            settingsButton.widthAnchor.constraint(equalTo: startButton.widthAnchor),
            settingsButton.heightAnchor.constraint(equalTo: startButton.heightAnchor)
        ])
        
        
        
        
        let homeImage = UIImageView()
        homeImage.translatesAutoresizingMaskIntoConstraints = false
        homeImage.contentMode = .scaleAspectFit
        homeImage.image = UIImage(named: "homeScreenImage.jpg")
        homeImage.alpha = 0.5

        view.addSubview(homeImage)
        NSLayoutConstraint.activate([
            homeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                homeImage.topAnchor.constraint(equalTo: view.topAnchor),
                homeImage.widthAnchor.constraint(equalTo: view.widthAnchor),
                homeImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 4/10),
            homeImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70)
        ])


        
        let homeImage2 = UIImageView()
        homeImage2.translatesAutoresizingMaskIntoConstraints = false
        homeImage2.contentMode = .scaleAspectFill
        homeImage2.alpha = 0.5
        homeImage2.image = UIImage(named: "homeScreenImage2.jpg")
        
        view.addSubview(homeImage2)
        NSLayoutConstraint.activate([
            homeImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                homeImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                homeImage2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                homeImage2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
    }
    
    
    
    
   
    
    @objc func startButtonTapped() {
        dismiss(animated: true, completion: nil)
        let gameVC = FFGameViewController()
        gameVC.modalPresentationStyle = .fullScreen
        present(gameVC, animated: true, completion: nil)
    }
    
    @objc func settingsButtonTapped() {
        dismiss(animated: true, completion: nil)
        let settingsVC = FFSettingsViewController()
        settingsVC.modalPresentationStyle = .fullScreen
        present(settingsVC, animated: true, completion: nil)
    }
    
    
}

