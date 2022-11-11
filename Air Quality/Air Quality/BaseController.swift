//
//  BaseController.swift
//  Air Quality
//
//  Created by Максим Юрисов on 09.11.2022.
//

import Foundation
import UIKit


class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

extension BaseController{
    
    func configure(){
        view.backgroundColor = Colors.background
    }
}
