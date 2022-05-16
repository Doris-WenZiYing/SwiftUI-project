//
//  ViewController.swift
//  Image classification
//
//  Created by Doris Trakarskys on 2021/3/17.
//

import UIKit
import CoreML

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "Select An Image"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapImage)
        )
        tap.numberOfTapsRequired = 1
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func didTapImage() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 20, y: view.safeAreaInsets.top, width: view.frame.size.width-40, height: view.frame.size.width-40)
        label.frame = CGRect(x: 20, y: view.safeAreaInsets.top+(view.frame.size.width-40)+10, width: view.frame.size.width-40, height: 100)
    }
    
    
    func analyzImage(image: UIImage?){
        //resize image, and grab a pixel buffer of the resized image as well as on wrap it
        guard let buffer = image?.resize(size: CGSize(width: 224, height: 224))?
            .getCVPixelBuffer() else { return }
        
        do {
            let config = MLModelConfiguration()
            let model = try GoogLeNetPlaces(configuration: config)
            let input = GoogLeNetPlacesInput(sceneImage: buffer)
            
            let output = try model.prediction(input: input)
            let text = output.sceneLabel
            label.text = text
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    //image picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //cancelled
        picker.dismiss(animated: true, completion: nil)
    }
    
    //if user selected an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        //assign image to imageView
        imageView.image = image
        analyzImage(image: image)
    }
}

