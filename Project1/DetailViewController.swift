//
//  DetailViewController.swift
//  Project1
//
//  Created by Macbook on 05/04/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

@IBOutlet weak var imageView: UIImageView!

     var selectedImage: String?
     
     override func viewDidLoad() {
          super.viewDidLoad()
          
          title = selectedImage
          
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
          
          
          if let imageToLoad = selectedImage {
               
               imageView.image = UIImage(named: imageToLoad)
          }
     }
     
     override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.hidesBarsOnTap = true
     }
     
     override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          navigationController?.hidesBarsOnTap = false
     }
     
     func shareTapped() {
//          let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
//          vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//          present(vc, animated: true)
//          
          if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
          vc.setInitialText("Look at this great picture!")
          vc.add(imageView.image!)
          vc.add(URL(string: "http://www.photlib.noaa.gov/nssl"))
          present(vc, animated: true)
          
          }
          
     }
     
     
     
}
