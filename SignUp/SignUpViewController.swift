//
//  SignUpViewController.swift
//  SignUp
//
//  Created by BH on 2021/07/26.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchToSelectImage(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    @IBOutlet weak var imageView: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage]as? UIImage {
            self.imageView.image = originalImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
