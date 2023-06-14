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
    private var rightName = "";
    private var leftName = ""
    private var userName: String!
    //private String name;
    //private final double lng;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readNameFromSharedPreferences(input: "username")
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
            userName = userNameSaved
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
        StartButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        
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
    
    @objc func startGame(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let gameController = storyBoard.instantiateViewController(withIdentifier: "cardGameController") as! ViewGameController
        
        gameController.rightName = rightName
        gameController.leftName = leftName
        present(gameController, animated: true)
        
    }
    
    private func processText(){
        if let enteredText = EnterName.text{
            let name = enteredText
            EnterName.isHidden = true
            SubmitNameButton.isHidden = true
            heyNameLabel.isHidden = false
            heyNameLabel.text = "Hey, " + name
            userName = name
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
                leftEarth.alpha = 1.0
                leftName = userName
                rightName = "PC"
            }
            else{
                rightEarth.alpha = 1.0
                rightName = userName
                leftName = "PC"
            }
        }
        else{
            print("Please allow location to use the application!")
        }
        
    }
     
}
