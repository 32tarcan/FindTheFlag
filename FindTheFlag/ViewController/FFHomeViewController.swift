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
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
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
            settingsButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 30),
            settingsButton.widthAnchor.constraint(equalTo: startButton.widthAnchor),
            settingsButton.heightAnchor.constraint(equalTo: startButton.heightAnchor)
        ])
        
        
        
        let homeLabel = UILabel()
       homeLabel.text = "Find The Flag"
       homeLabel.font = UIFont(name: "MarkerFelt-Wide", size: 56)
       homeLabel.textColor = .white
       homeLabel.layer.cornerRadius = 10
        self.view.addSubview(homeLabel)
        
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -260)
        
        ])
        
        
        



        
        let homeImage2 = UIImageView()
        homeImage2.translatesAutoresizingMaskIntoConstraints = false
        homeImage2.contentMode = .scaleAspectFill
        homeImage2.backgroundColor = UIColor.clear
        homeImage2.image = UIImage(named: "flagImages.png")
        homeImage2.alpha = 0.06
        
        view.addSubview(homeImage2)
        NSLayoutConstraint.activate([
            homeImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeImage2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeImage2.topAnchor.constraint(equalTo: view.topAnchor)
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

