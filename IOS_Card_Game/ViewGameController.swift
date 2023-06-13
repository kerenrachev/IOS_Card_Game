
//  Created by Student35 on 07/06/2023.
//
import UIKit
import Foundation

class ViewGameController : UIViewController {
    
    private var rightScore = 0
    private var leftScore = 0
    var rightName = ""
    var leftName = ""
    private var cards:[String] = ["rock.jpeg", "paper.jpeg", "scissors.jpeg"]
    
    var currentLoop = 0
    var currentCount = 5
    var timer: Timer?
    //var countdownValue = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightNameLabel.text = rightName
        leftNameLabel.text = leftName
        closeCards()
        startCounting()
        
    }

    @IBOutlet weak var rightNameLabel: UILabel!
    
    @IBOutlet weak var leftNameLabel: UILabel!
    @IBOutlet weak var rightImg: UIImageView!
    @IBOutlet weak var leftImg: UIImageView!
    @IBOutlet weak var rightScoreLabel: UILabel!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!

    private func closeCards(){
        setImgSource(imgObj: rightImg, imgName: "card.jpeg")
        setImgSource(imgObj: leftImg, imgName: "card.jpeg")
    }
    private func getRandomPictureName() -> String{
        //let randomNumber = arc4random_uniform(3)
        let randomInt = Int.random(in: 0...2)
        return cards[randomInt]
    }
    
    private func setImgSource(imgObj: UIImageView, imgName: String){
        if let image = UIImage(named: imgName){
            imgObj.image = image
        }
        else{
            print("Image was not found")
        }
    }
    func startCounting() {
        currentLoop = 0
        updateCount()
    }
    
    private func updateScore(left: String, right: String){
        if(left == "rock.jpeg"){
            if(right == "paper.jpeg"){
                rightScore+=1
            }
            else if(right == "scissors.jpeg"){
                leftScore+=1
            }
        }
        else if(left == "paper.jpeg"){
            if(right == "rock.jpeg"){
                leftScore+=1
            }
            else if(right == "scissors.jpeg"){
                rightScore+=1
            }
        }
        //Scissors
        else{
            if(right == "rock.jpeg"){
                rightScore+=1
            }
            else if(right == "paper.jpeg"){
                leftScore+=1
            }
        }
        //print(rightScore)
        rightScoreLabel.text = String(rightScore)
        leftScoreLabel.text = String(leftScore)
        
    }
        
        func updateCount() {
            if currentCount >= 0 {
                countdownLabel.text = "\(currentCount)"
                currentCount -= 1
            } else {
                currentLoop += 1
                if currentLoop < 10 {
                    if currentLoop % 2 == 0 {
                        currentCount = 5
                        closeCards()
                    } else {
                        let newPicLeft = getRandomPictureName()
                        let newPicRight = getRandomPictureName()
                        updateScore(left: newPicLeft, right: newPicRight)
                        print("Right: " + newPicRight + " , left:" + newPicLeft)
                        setImgSource(imgObj: leftImg, imgName: newPicLeft)
                        setImgSource(imgObj: rightImg, imgName: newPicRight)
                        currentCount = 3
                    }
                } else {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let anotherViewController = storyBoard.instantiateViewController(withIdentifier: "endGameController") as! EndGameViewController
                    if(rightScore>leftScore){
                        anotherViewController.winner=rightNameLabel.text!
                        anotherViewController.score=rightScoreLabel.text!
                    }
                    else if(rightScore<leftScore){
                        anotherViewController.winner=leftNameLabel.text!
                        anotherViewController.score=leftScoreLabel.text!
                    }
                    else{
                        anotherViewController.winner="PC"
                        anotherViewController.score=rightScoreLabel.text!
                    }
                    present(anotherViewController, animated: true)
                    return
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.updateCount()
            }
        }
        
        }
