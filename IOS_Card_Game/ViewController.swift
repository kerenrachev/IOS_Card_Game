//
//  ViewController.swift
//  IOS_Card_Game
//
//  Created by Student35 on 07/06/2023.
//

import UIKit
import Foundation
import CoreLocation
class ViewController: UIViewController {
    
    private final var LONGITUTE = 34.817549168324334
    //private String name;
    //private final double lng;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readNameFromSharedPreferences(input: "username")
        //hideInitialElements()
       
        initiateClickListeners()
    
    }
    
    @IBOutlet weak var leftEarth: UIImageView!
    
    @IBOutlet weak var rightEarth: UIImageView!
    @IBOutlet weak var EnterName: UITextField!
    @IBOutlet weak var insertName: UILabel!
    @IBOutlet weak var heyNameLabel: UILabel!
    @IBOutlet weak var SubmitNameButton: UIButton!
    
    @IBOutlet weak var StartButton: UIButton!
    
    private func readNameFromSharedPreferences(input: String){
        let defaults = UserDefaults.standard
        defaults.synchronize()
        if let userNameSaved  = defaults.string(forKey: input){
            hideAllElements()
            heyNameLabel.isHidden = false
            heyNameLabel.text = "Hey," + userNameSaved
            
            getLocation()
            StartButton.isHidden = false
        }
        else{
            getLocation()
            hideAllElements()
            insertName.isHidden = false
        }
    }
    
    private func hideAllElements(){
        leftEarth.alpha = 0.0
        rightEarth.alpha = 0.0
        heyNameLabel.isHidden = true
        EnterName.isHidden = true
        insertName.isHidden = true
        SubmitNameButton.isHidden = true
        StartButton.isHidden = true
    }
    
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
   
    @objc func submitButtonClicked(){
        processText()
        StartButton.isHidden = false
        getLocation()
        //leftEart.alpha = 1.0
    }
    
    private func processText(){
        if let enteredText = EnterName.text{
            let name = enteredText
            EnterName.isHidden = true
            SubmitNameButton.isHidden = true
            heyNameLabel.isHidden = false
            heyNameLabel.text = "Hey, " + name
            saveInSharedPreferences(key: "username", input: name)
            
        }
        
    }
    
    private func saveInSharedPreferences(key: String, input:String){
        let defaults = UserDefaults.standard
        defaults.set(input, forKey: key)
        defaults.synchronize()
    }
    
    private func getLocation(){
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways)
        {
            
            let curr_lng = locationManager.location!.coordinate.longitude
            if(curr_lng < LONGITUTE){
                print("Smaller")
                leftEarth.alpha = 1.0
            }
            else{
                print("BIGGER")
                rightEarth.alpha = 1.0
            }
        }
        else{
            print("Please allow location to use the application!")
        }
        
    }
    
}
