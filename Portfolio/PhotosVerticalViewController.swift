//
//  PhotosVerticalViewController.swift
//  Portfolio
//
//  Created by stud on 23/11/2018.
//  Copyright © 2018 Michal Legut. All rights reserved.
//

import UIKit

class PhotosVerticalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preArrowImage : UIImageView
        let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapDetected"))
        preArrowImage.isUserInteractionEnabled = true
        preArrowImage.addGestureRecognizer(singleTap)
        
        @objc func tapDetected() {
            print()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
