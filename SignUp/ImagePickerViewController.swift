////
////  ImagePicker.swift
////  SignUp
////
////  Created by BH on 2021/07/23.
////
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    var cnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func alertBtn(_ sender: Any) {
        actionSheetAlert()
        
    }
    
}

// UIImagePickerControllerDelegate = 카메라 롤이나 앨범에서 사진을 가져올 수 있도록 도와 주는 것
extension PhotoViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func actionSheetAlert(){
        
        let alert = UIAlertController(title: "선택", message: "선택", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "카메라", style: .default) { [weak self] (_) in
            self?.presentCamera()
        }
        let album = UIAlertAction(title: "앨범", style: .default) { [weak self] (_) in
            self?.presentAlbum()
        }
        
        alert.addAction(cancel)
        alert.addAction(camera)
        alert.addAction(album)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func presentCamera(){
        
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        vc.cameraFlashMode = .on
        
        present(vc, animated: true, completion: nil)
    }
    
    func presentAlbum(){
        
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        
        present(vc, animated: true, completion: nil)
    }
    
    
    //카메라나 앨범등 PickerController가 사용되고 이미지 촬영을 했을 때 발동 된다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("picker -> \(String(describing: info[UIImagePickerController.InfoKey.imageURL]))")
   
        if cnt % 2 == 0 {

            if let image = info[.editedImage] as? UIImage {
                profileImage.image = image
            }

        }
        else{

            if let image = info[.originalImage] as? UIImage {
                profileImage.image = image
            }

        }
        
        cnt += 1
        
        print(cnt)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

//import UIKit
//
//class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//
//    let imagePicker = UIImagePickerController()
//
//    lazy var imagePicker: UIImagePickerController = {
//        let picker: UIImagePickerController = UIImagePickerController()
//        picker.sourceType = .photoLibrary
//        picker.allowsEditing = true
//        picker.delegate = self
//        return picker
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    @IBOutlet weak var imageView: UIImageView!
//
//    @IBAction func touchUpSelectImageButton(_ sender: UIButton) {
//        self.present(self.imagePicker, animated: true, completion: nil)
//
//    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        var newImage: UIImage? = nil
//
//        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            newImage = possibleImage
//        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            newImage = possibleImage
//        }
//
//        self.imageView.image = newImage
//
////        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
////            self.imageView.image = originalImage
////        }
//
//        self.dismiss(animated: true, completion: nil)
//    }
//}
//
