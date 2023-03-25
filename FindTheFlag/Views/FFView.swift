//
//  Views.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit




class FFView: UIView  {
    let viewModel: FFViewModelAPI
    let viewController = FFViewController()
    var ffmodel: FFModel
    var score = FFScoreViewController()
    

    
    
    
    
    private lazy var countryButton1: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 25, width: 100, height: 50))

        button.setTitle(ffmodel.countryLabel.randomElement(), for: .normal)
        button.backgroundColor = .systemBrown
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tag = 1
        
        
        return button
    }()
    
    private lazy var countryButton2: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 25, width: 100, height: 50))
        
        button.setTitle(ffmodel.countryLabel.randomElement(), for: .normal)
        button.backgroundColor = .systemBrown
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tag = 2
        
        
        
        
        return button
    }()
    
    private lazy var countryButton3: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 25, width: 100, height: 50))
        button.setTitle(ffmodel.countryLabel.randomElement(), for: .normal)
        button.backgroundColor = .systemBrown
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tag = 3
        
        
        
        
        
        return button
    }()
    
    
    private lazy var countryButton4: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 25, width: 100, height: 50))
        button.setTitle(ffmodel.countryLabel.randomElement(), for: .normal)
        button.backgroundColor = .systemBrown
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.tag = 4
        
        
        
        return button
    }()
    
    
    private var correctAnswerFound = false
    private var correctAnswer = Int.random(in: 1...4)
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        if correctAnswerFound == false {
            if sender.tag == correctAnswer {
                sender.backgroundColor = .systemGreen
            correctAnswerFound = true
        
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                   
                    self.correctAnswer = Int.random(in: 1...4)
                    self.correctAnswerFound = false
                    
                })
                
              
                
        
        } else {
            sender.backgroundColor = .systemRed
            
        }
        
        
    }
        
        
    }
    
    
    init(frame: CGRect, viewModel: FFViewModelAPI) {
        self.viewModel = viewModel
        self.ffmodel = FFModel()
        super.init(frame: frame)
        setupViews()
        addConstraints()
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("fatalError!")
    }
    
    private func setupViews() {
        addSubview(countryButton1)
        addSubview(countryButton2)
        addSubview(countryButton3)
        addSubview(countryButton4)
        addSubview(countryImageView)
        addSubview(scoreLabel)
        
        
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // Button 1
            countryButton1.topAnchor.constraint(equalTo: topAnchor, constant: 500),
            countryButton1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            countryButton1.trailingAnchor.constraint(equalTo: countryButton2.leadingAnchor, constant: -20),
            countryButton1.bottomAnchor.constraint(equalTo: countryButton3.topAnchor, constant: -20),
            countryButton1.widthAnchor.constraint(equalTo: countryButton2.widthAnchor),
            countryButton1.heightAnchor.constraint(equalTo: countryButton3.heightAnchor),

            // Button 2
            countryButton2.topAnchor.constraint(equalTo: topAnchor, constant: 500),
            countryButton2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            countryButton2.bottomAnchor.constraint(equalTo: countryButton4.topAnchor, constant: -20),
            countryButton2.widthAnchor.constraint(equalTo: countryButton1.widthAnchor),
            countryButton2.heightAnchor.constraint(equalTo: countryButton4.heightAnchor),

            // Button 3
            countryButton3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            countryButton3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            countryButton3.trailingAnchor.constraint(equalTo: countryButton4.leadingAnchor, constant: -20),
            countryButton3.widthAnchor.constraint(equalTo: countryButton4.widthAnchor),
            countryButton3.heightAnchor.constraint(equalTo: countryButton1.heightAnchor),

            // Button 4
            countryButton4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            countryButton4.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            countryButton4.widthAnchor.constraint(equalTo: countryButton3.widthAnchor),
            countryButton4.heightAnchor.constraint(equalTo: countryButton2.heightAnchor),
            
            // Flag Image
            countryImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            countryImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -110),
            countryImageView.widthAnchor.constraint(equalToConstant: 300),
            countryImageView.heightAnchor.constraint(equalToConstant: 200),
            
            //Score label
            scoreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            scoreLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
            
            // Bayrağın üzerinde durmasını istiyorsan sor!
            //scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            //scoreLabel.bottomAnchor.constraint(equalTo: countryImageView.topAnchor, constant: -30)

           
            
            ])
            
            
            
    }
    
    let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.text = "Score 10"
        scoreLabel.textColor = .black
        scoreLabel.font = UIFont(name: "Chalkduster", size: 19)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreLabel
    }()
    
}
