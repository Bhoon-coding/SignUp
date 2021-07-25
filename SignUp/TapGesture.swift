//
//  TapGesture.swift
//  SignUp
//
//  Created by BH on 2021/07/25.
//

import UIKit

class TapGestureViewController: UIViewController {
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        
        self.view.addGestureRecognizer(tapGesture)
    }
}
