//
//  ViewController.swift
//  FindTheFlag
//
//  Created by Bahadır Tarcan on 19.03.2023.
//

import UIKit

protocol FindFlagViewModelDelegate: AnyObject {
    func didLoadFlags(flags: [Flag])
    func didFailWithError(error: Error)
}

class FindFlagViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    weak var delegate: FindFlagViewModelDelegate?


}

