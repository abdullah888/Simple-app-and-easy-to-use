//
//  ViewController.swift
//  abdullahIcon
//
//  Created by abdullah  on 28/05/1441 AH.
//  Copyright © 1441 abdullah . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var MenuShowing = false
    
    @IBOutlet weak var TrailingCO: NSLayoutConstraint!
    @IBOutlet weak var LeadingCO: NSLayoutConstraint!
    
    @IBOutlet weak var MainView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        MainView.layer.shadowOpacity = 100
//        MainView.layer.shadowRadius = 20
    }
    
    
    @IBAction func ShowMenu(_ sender: Any) {
        if (MenuShowing) {
            LeadingCO.constant = 0
            TrailingCO.constant = 0
             self.performSegue(withIdentifier: "ThankLG", sender: nil)
        } else {
            LeadingCO.constant = 100
            TrailingCO.constant = -100
                        }
        UIView.animate(withDuration: 1) {
                      self.view.layoutIfNeeded()
        }
    

        MenuShowing = !MenuShowing
        
    }
    

}

