//
//  ViewController.swift
//  IOS_Card_Game
//
//  Created by Student35 on 07/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideInitialElements()
       
        initiateClickListeners()
        
       
        
    }
    
    
    @IBOutlet weak var leftEart: UIImageView!
    
    @IBOutlet weak var rightEart: UIImageView!
    
    @IBOutlet weak var EnterName: UITextField!
    @IBOutlet weak var insertName: UILabel!
 
    @IBOutlet weak var SubmitNameButton: UIButton!
    
    @objc private func initiateClickListeners(){
        insertName.isUserInteractionEnabled = true
        let tapGesRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        insertName.addGestureRecognizer(tapGesRecognizer)
        SubmitNameButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
        
    }
    
    @objc private func labelTapped(){
        EnterName.isHidden = false
        SubmitNameButton.isHidden = false
        insertName.isHidden = true
    }
    
    @objc private func hideInitialElements(){
        
        leftEart.alpha = 0.0
        rightEart.alpha = 0.0
        
        EnterName.isHidden = true
        SubmitNameButton.isHidden = true
    }
    @objc func insertNameClicked(){
        
    }
    @objc func submitButtonClicked(){
        leftEart.alpha = 1.0
    }
    
}
