//
//  FFHomeView.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 29.03.2023.
//

import UIKit

class FFHomeView: UIView {

    let homeVC = FFHomeViewController()
    
    
  
    let gameLabel: UILabel = {
        let gameLabel = UILabel()
        gameLabel.text = "FindTheFlag"
        gameLabel.textColor = .black
        gameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 35)
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        return gameLabel
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(gameLabel)
       // addSubview(homeImage)

    }
    
  //  private func addConstraints() {
  //      NSLayoutConstraint.activate([
  //         homeImage.centerXAnchor.constraint(equalTo: centerXAnchor),
  //         homeImage.centerYAnchor.constraint(equalTo: centerYAnchor)
  //
  //      ])
  //  }
    
}
