
//  Created by Student35 on 07/06/2023.
//
import UIKit
import Foundation

class ViewGameController : UIViewController {
    
    private var rightScore = 0
    private var leftScore = 0
    var countdownTimer: Timer?
    var countdownValue = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startCountdown(seconds: 5)
        setImgSource(imgObj: rightImage, imgName: "rock.jpeg")
    }
    
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var leftImage: UIImageView!
    
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    private func setImgSource(imgObj: UIImageView, imgName: String){
        if let image = UIImage(named: imgName){
            imgObj.image = image
        }
        else{
            print("Image was not found")
        }
    }
    
    func startCountdown(seconds: Int) {
        countdownValue = seconds
        countdownLabel.text = String(countdownValue)
            
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                
                self.countdownValue -= 1
                
                if self.countdownValue >= 0 {
                    self.countdownLabel.text = String(self.countdownValue)
                } else {
                    self.stopCountdown()
                    
                    if(seconds == 5) {
                        startCountdown(seconds: 3)
                    }
                    
                }
        }
        
    }
        
        func stopCountdown() {
            countdownTimer?.invalidate()
            countdownTimer = nil
        }}
