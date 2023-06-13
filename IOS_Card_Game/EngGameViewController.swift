//
//  GameViewController.swift
//  IOS_Card_Game
//
//  Created by Student35 on 07/06/2023.
//
import UIKit
import Foundation

class EndGameViewController : UIViewController {
    
    var winner = ""
    var score = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Bla bla")
        
        winnerLabel.text = "Winner is: " + winner
        scoreLabel.text = "Score is: " + score
        
    }
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
}
