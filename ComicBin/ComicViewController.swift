//
//  ComicViewController.swift
//  ComicBin
//
//  Created by Jefferey Rigler on 11/23/16.
//  Copyright © 2016 RiglerDigital. All rights reserved.
//

import UIKit

class ComicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var comicImageView: UIImageView!

    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
         }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as!
        UIImage
        
        comicImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)

    }
    

    

    @IBAction func cameraTapped(_ sender: Any) {
    }

    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let comic = Comic(context: context)
        comic.title = titleTextField.text
        comic.image = UIImagePNGRepresentation(comicImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
