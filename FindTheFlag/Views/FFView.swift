//
//  Views.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit




class FFView: UIView  {
    
    let viewModel: FFViewModelAPI
    let viewController = FFGameViewController()
    let ffmodel: FFModel
    let ffGame = FFGameViewController()
    let ffWin = FFWinScreenViewController()
    
    
    
    
    
    //MARK: -Buttons
    private lazy var countryButton1: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 25, width: 100, height: 50))
        
        
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tag = 1
        
        
        return button
    }()
    
    private lazy var countryButton2: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 25, width: 100, height: 50))
        
        
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tag = 2
        
        
        
        
        return button
    }()
    
    private lazy var countryButton3: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 25, width: 100, height: 50))

        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tag = 3
        
        
        
        
        
        return button
    }()
    
    
    private lazy var countryButton4: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 25, width: 100, height: 50))
        
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.tag = 4
        
        
        
        return button
    }()
    
    //MARK: - Flag And Label Logic
    func initButtonNames(correctName: String) {
        var randomNames: [String] = []
        randomNames.append(correctName)

        
        var usedNames = Set<String>()
        usedNames.insert(correctName)

        while randomNames.count < 4 {
            let randomFlagName = ffmodel.countryLabel.randomElement() ?? ""

            
            if !usedNames.contains(randomFlagName) {
                randomNames.append(randomFlagName)
                usedNames.insert(randomFlagName)
            }
        }

        randomNames.shuffle()
        countryButton1.setTitle(randomNames[0].uppercased(), for: .normal)
        countryButton2.setTitle(randomNames[1].uppercased(), for: .normal)
        countryButton3.setTitle(randomNames[2].uppercased(), for: .normal)
        countryButton4.setTitle(randomNames[3].uppercased(), for: .normal)
    }
    
   
    public var activeFlagName = ""
    private var correctAnswerFound = false
    private var correctAnswer = Int.random(in: 1...4)
    private var incorrectAnswers = [String]()


    @objc func buttonTapped(_ sender: UIButton) {
        if correctAnswerFound == false {
            if sender.titleLabel?.text?.lowercased() == activeFlagName.lowercased() {
                scoreNum += 1
                sender.backgroundColor = .systemGreen
                
                correctAnswerFound = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    sender.backgroundColor = .darkGray
                    self.viewController.flagIndex += 1
                    self.viewModel.fetchFlag(index: self.viewController.flagIndex)
                    self.resetGame()
                }
            } else {
                
                
                
                sender.backgroundColor = .systemRed
                
                heartImage1.translatesAutoresizingMaskIntoConstraints = true
                heartImage2.translatesAutoresizingMaskIntoConstraints = true
                heartImage3.translatesAutoresizingMaskIntoConstraints = true

                if heartImage1.superview != nil {
                                heartImage1.removeFromSuperview()
                            } else if heartImage2.superview != nil {
                                heartImage2.removeFromSuperview()
                            } else if heartImage3.superview != nil {
                                heartImage3.removeFromSuperview()
                            }
                sender.isEnabled = false
                
               
                    incorrectAnswers.append(activeFlagName)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                        sender.backgroundColor = .darkGray
                        sender.isEnabled = true
                    }
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
        scoreLabel.text = "Score: \(score)"
        countryButton1.isEnabled = true
        countryButton2.isEnabled = true
        countryButton3.isEnabled = true
        countryButton4.isEnabled = true
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
    private var remaining = 14 {
            didSet {
                remainingLabel.text = "14/\(remaining)"
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    if self.remaining == 13 {
                        if let viewController = self.superview?.next as? UIViewController {
                            let winScreenVC = FFWinScreenViewController()
                            winScreenVC.modalPresentationStyle = .fullScreen
                            viewController.present(winScreenVC, animated: true, completion: {
                                self.removeFromSuperview()
                            })
                        }
                    }
                }
            }
        }

    var scoreNum: Int {
        get {
            return score
        }
        set {
            score = newValue
            scoreLabel.text = "Score: \(score)"
            remaining -= 1
        }
    }
    
    
    



    
    
    //MARK: - Label and Image
    let remainingLabel: UILabel = {
        let remainingLabel = UILabel()
        remainingLabel.text = "14/14"
        remainingLabel.textColor = .black
        remainingLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 19)
        remainingLabel.translatesAutoresizingMaskIntoConstraints = false
        return remainingLabel
    }()
    
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.text = "Score:0"
        scoreLabel.textColor = .black
        scoreLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 19)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreLabel
    }()
    
    let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    
    
    
    let heartImage1: UIImageView = {
        let heartImage1 = UIImageView()
        heartImage1.image = UIImage(named: "heart.png")?.withRenderingMode(.alwaysOriginal)
        heartImage1.translatesAutoresizingMaskIntoConstraints = false
       return heartImage1
    }()
    
    


        let heartImage2: UIImageView = {
            let heartImage2 = UIImageView()
            heartImage2.image = UIImage(named: "heart.png")?.withRenderingMode(.alwaysOriginal)
            heartImage2.translatesAutoresizingMaskIntoConstraints = false
            return heartImage2
        }()
    


         let heartImage3: UIImageView = {
                let heartImage3 = UIImageView()
                heartImage3.image = UIImage(named: "heart.png")?.withRenderingMode(.alwaysOriginal)
                heartImage3.translatesAutoresizingMaskIntoConstraints = false
                return heartImage3
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
        addSubview(heartImage1)
        addSubview(heartImage2)
        addSubview(heartImage3)
        
        
        
        
        
    }
    //MARK: - All Constraints
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
            remainingLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            // Heart Images
            heartImage1.widthAnchor.constraint(equalToConstant: 25),
            heartImage1.heightAnchor.constraint(equalToConstant: 25),
            heartImage1.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor),
            heartImage1.trailingAnchor.constraint(equalTo: heartImage2.leadingAnchor, constant: -10),

            heartImage2.widthAnchor.constraint(equalToConstant: 25),
            heartImage2.heightAnchor.constraint(equalToConstant: 25),
            heartImage2.centerYAnchor.constraint(equalTo:scoreLabel.centerYAnchor),
            heartImage2.centerXAnchor.constraint(equalTo:centerXAnchor),

            heartImage3.widthAnchor.constraint(equalToConstant: 25),
            heartImage3.heightAnchor.constraint(equalToConstant: 25),
            heartImage3.centerYAnchor.constraint(equalTo:scoreLabel.centerYAnchor),
            heartImage3.leadingAnchor.constraint(equalTo: heartImage2.trailingAnchor, constant: 10),
            

        ])
        
    
        
    }
    
    
    
}
