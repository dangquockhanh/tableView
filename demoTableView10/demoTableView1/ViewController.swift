//
//  ViewController.swift
//  demoTableView1
//
//  Created by Đặng Khánh  on 5/22/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

protocol PassData {
    func hienthi(name: String, age: String, image: UIImage)
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var delegate: PassData?
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var textFieldname: UITextField!
    @IBOutlet weak var textFieldage: UITextField!
    
    var perSon: Person?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gán du lieu vào perSon
        if perSon != nil {
            photo.image = perSon?.image
            textFieldname.text = perSon?.name
            textFieldage.text = perSon?.age
        }
    }
        
    
    //thuc hien truyen du lieu
    @IBAction func pass(_ sender: Any) {
        delegate?.hienthi(name: textFieldname.text!, age: textFieldage.text!, image: photo.image!)
        navigationController?.popViewController(animated: true)
    }


    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photo.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}

