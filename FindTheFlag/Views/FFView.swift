//
//  Views.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit

class  FFView: UIView {
    let viewModel: FFViewModelAPI
    let viewController = FFViewController()
    
    
    private let countryButton1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.text = "SORU1"
        label.textColor = .black
        
        return label
    }()
    
    private let countryButton2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.text = "SORU2"
        label.textColor = .black
        
        return label
    }()
    
    private let countryButton3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.text = "SORU3"
        label.textColor = .black
        
        return label
    }()
    
    private let countryButton4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.text = "SORU4"
        label.textColor = .black
        
        return label
    }()
    
    
    init(frame: CGRect, viewModel: FFViewModelAPI) {
        self.viewModel = viewModel
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
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // Button 1
            countryButton1.topAnchor.constraint(equalTo: topAnchor, constant: 550), // yukarıda boşluk bırakılıyor
            countryButton1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50), // Sağa doğru 20 birim kaydırılıyor
            countryButton1.trailingAnchor.constraint(equalTo: countryButton2.leadingAnchor, constant: -20),
            countryButton1.bottomAnchor.constraint(equalTo: countryButton3.topAnchor),
            countryButton1.widthAnchor.constraint(equalTo: countryButton2.widthAnchor),
            countryButton1.heightAnchor.constraint(equalTo: countryButton3.heightAnchor),

            // Button 2
            countryButton2.topAnchor.constraint(equalTo: topAnchor, constant: 550), // yukarıda boşluk bırakılıyor
            countryButton2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), // Sola doğru 20 birim kaydırılıyor
            countryButton2.bottomAnchor.constraint(equalTo: countryButton4.topAnchor),
            countryButton2.widthAnchor.constraint(equalTo: countryButton1.widthAnchor),
            countryButton2.heightAnchor.constraint(equalTo: countryButton4.heightAnchor),

            // Button 3
            countryButton3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50), // Sağa doğru 20 birim kaydırılıyor
            countryButton3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50), // Yukarı doğru 50 birim kaydırılıyor
            countryButton3.trailingAnchor.constraint(equalTo: countryButton4.leadingAnchor, constant: -15), // Sola doğru 20 birim kaydırılıyor
            countryButton3.widthAnchor.constraint(equalTo: countryButton4.widthAnchor),
            countryButton3.heightAnchor.constraint(equalTo: countryButton1.heightAnchor),

            // Button 4
            countryButton4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15), // Sola doğru 20 birim kaydırılıyor
            countryButton4.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50), // Yukarı doğru 50 birim kaydırılıyor
            countryButton4.widthAnchor.constraint(equalTo: countryButton3.widthAnchor),
            countryButton4.heightAnchor.constraint(equalTo: countryButton2.heightAnchor)
        ])
    }
    
}
