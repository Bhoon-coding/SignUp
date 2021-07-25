//
//  TapGesture.swift
//  SignUp
//
//  Created by BH on 2021/07/25.
//

import UIKit

class TapGestureViewController: UIViewController {
    @IBAction func tapview(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
