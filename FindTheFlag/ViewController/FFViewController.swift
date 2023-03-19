//
//  ViewController.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit


class FFViewController: UIViewController {
    
    var ffView: FFView!
    let viewModel = FFViewModelAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        ffView = FFView(frame: view.bounds, viewModel: viewModel)
        view.addSubview(ffView)
    
    }
}


