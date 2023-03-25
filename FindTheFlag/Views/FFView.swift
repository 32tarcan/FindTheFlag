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
    var ffscore = FFScoreViewController()
    
    
    
    
    
    
    
    
    
    
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
                scoreNum += 1
                sender.backgroundColor = .systemGreen
                correctAnswerFound = true
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    self.resetGame()
                })
            } else {
                sender.backgroundColor = .systemRed
            }
        }
    }
    
    func resetGame() {
        correctAnswer = Int.random(in: 1...4)
        correctAnswerFound = false
        countryButton1.backgroundColor = .darkGray
        countryButton2.backgroundColor = .darkGray
        countryButton3.backgroundColor = .darkGray
        countryButton4.backgroundColor = .darkGray
        updateButtonTitles()
        scoreLabel.text = "Score: \(score)"
    }
    
    func updateButtonTitles() {
        var buttonTitles = ffmodel.countryLabel
        buttonTitles.shuffle()
        countryButton1.setTitle(buttonTitles.randomElement()?.uppercased(), for: .normal)
        countryButton2.setTitle(buttonTitles.randomElement()?.uppercased(), for: .normal)
        countryButton3.setTitle(buttonTitles.randomElement()?.uppercased(), for: .normal)
        countryButton4.setTitle(buttonTitles.randomElement()?.uppercased(), for: .normal)
        
        let correctButton = Int.random(in: 1...4)
        
        switch correctButton {
        case 1:
            countryButton1.setTitle(ffmodel.countryLabel[correctAnswer - 1].uppercased(), for: .normal)
        case 2:
            countryButton2.setTitle(ffmodel.countryLabel[correctAnswer - 1].uppercased(), for: .normal)
        case 3:
            countryButton3.setTitle(ffmodel.countryLabel[correctAnswer - 1].uppercased(), for: .normal)
        case 4:
            countryButton4.setTitle(ffmodel.countryLabel[correctAnswer - 1].uppercased(), for: .normal)
        default:
            break
        }
    }
    
    private var score = 0
    private var remaining = 16
    var scoreNum: Int {
        get {
            return score
        }
        set {
            score = newValue
            scoreLabel.text = "Score: \(score)"
            remaining -= 1
            remainingLabel.text = "Remaining: \(remaining)"
            
            if remaining == 0 {
                // Win ekranı açılsın!!
            }
        }
    }
    
    let remainingLabel: UILabel = {
        let remainingLabel = UILabel()
        remainingLabel.text = "Remaining:16"
        remainingLabel.textColor = .black
        remainingLabel.font = UIFont(name: "Chalkduster", size: 16)
        remainingLabel.translatesAutoresizingMaskIntoConstraints = false
        return remainingLabel
    }()
    
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.text = "Score:0"
        scoreLabel.textColor = .black
        scoreLabel.font = UIFont(name: "Chalkduster", size: 19)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreLabel
    }()
    
    let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
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
        addSubview(remainingLabel)
        
        
        
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
            
            // Score Label
            scoreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            scoreLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            // Remaining Label
            remainingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            remainingLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15)
            
            // Bayrağın üzerinde durmasını istiyorsan sor!
            //scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            //scoreLabel.bottomAnchor.constraint(equalTo: countryImageView.topAnchor, constant: -30)
            
            
            
        ])
        
        
        
    }
    
    
    
}
