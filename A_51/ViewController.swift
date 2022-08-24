////  ViewController.swift
//  A_51
//
//  Created by Madhusudhan, Srikanth on 03/08/22.
//  
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL = URL(string: "https://cdn-9.motorsport.com/images/mgl/0oOn5ea0/s500/carlos-sainz-ferrari-f1-75-1.jpg")
        self.imageView.kf.setImage(with: imageURL)
    }


}

