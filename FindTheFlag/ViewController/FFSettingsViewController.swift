//
//  FFSettingsViewController.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 28.03.2023.
//

import StoreKit
import SafariServices
import SwiftUI
import UIKit

/// Controller to show various app options and settings
class FFSettingsViewController: UIViewController {
    
    
    private var settingsSwiftUIController: UIHostingController<FFSettingsView>?
   
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            title = "Settings"
            addSwiftUIController()
            
            
            let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
            navBar.backgroundColor = .white
            navBar.isTranslucent = false
            navBar.tintColor = .systemYellow
            
            let navItem = UINavigationItem(title: "Settings")
                    navBar.setItems([navItem], animated: false)
                    view.addSubview(navBar)
            
            let backButton = UIBarButtonItem(title: "Geri", style: .plain, target: self, action: #selector(goBack))
                    navItem.leftBarButtonItem = backButton
                    
                    
                    navBar.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        navBar.heightAnchor.constraint(equalToConstant: 44)
                    ])
        }
    
    @objc func goBack() {
        dismiss(animated: true) {
            let homeVC = FFHomeViewController()
            self.present(homeVC, animated: true, completion: nil)
        }
        
    }
   
    private func addSwiftUIController() {
        let settingsSwiftUIController = UIHostingController(
            rootView: FFSettingsView(
                viewModel: FFSettingsViewViewModel(
                cellViewModels: FFSettingsOption.allCases.compactMap({
                    return FFSettingsCellViewModel(type: $0) { [weak self]  option in
                        self?.handleTap(option: option)
                        
                    }
                
            })
      )
       )
      )

        addChild(settingsSwiftUIController)
        settingsSwiftUIController.didMove(toParent: self)
        
        view.addSubview(settingsSwiftUIController.view)
        settingsSwiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsSwiftUIController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsSwiftUIController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsSwiftUIController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsSwiftUIController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        ])
        
        self.settingsSwiftUIController = settingsSwiftUIController
    }
        
    private func handleTap(option: FFSettingsOption) {
        guard Thread.current.isMainThread else {
            return
        }
        
        if let url = option.targetUrl {
            // Opern website
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        } else if option == .rateApp {
            //Show rating prompt
            
                     if let windowScene = view.window?.windowScene {
                         SKStoreReviewController.requestReview(in: windowScene)
                    }
                 }
             }
        }
