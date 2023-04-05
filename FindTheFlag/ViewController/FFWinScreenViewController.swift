//
//  FFWinScreenViewController.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 5.04.2023.
//

import UIKit

class FFWinScreenViewController: UIViewController {
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Geri Dön", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.tintColor = .white
        backButton.layer.cornerRadius = 10
        backButton.backgroundColor = .black
        self.view.addSubview(backButton)
        
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            backButton.widthAnchor.constraint(equalToConstant: 120),
            backButton.heightAnchor.constraint(equalToConstant: 40)
                ])
        
        let infoLabel = UILabel()
        infoLabel.text = "YOU WIN"
        infoLabel.font = UIFont(name: "MarkerFelt-Wide", size: 60)
        infoLabel.textColor = .white
        infoLabel.layer.cornerRadius = 10
        self.view.addSubview(infoLabel)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150)
        
        ])
    }
    
    @objc func backButtonTapped() {
        
            guard let presentingViewController = presentingViewController else {
                fatalError("No presenting view controller")
            }
            dismiss(animated: true) {
                presentingViewController.dismiss(animated: false) {
                    let homeVC = FFHomeViewController()
                    presentingViewController.present(homeVC, animated: true, completion: nil)
                }
            }
        }
    
   
    

            
        
    }
    
    


