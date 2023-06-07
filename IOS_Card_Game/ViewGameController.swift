
//  Created by Student35 on 07/06/2023.
//
import UIKit
import Foundation

class ViewGameController : UIViewController {
    
    private var rightScore = 0
    private var leftScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setImgSource(imgObj: rightImage, imgName: "rock.jpeg")
    }
    
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var leftImage: UIImageView!
    
    private func setImgSource(imgObj: UIImageView, imgName: String){
        if let image = UIImage(named: imgName){
            imgObj.image = image
        }
        else{
            print("Image was not found")
        }
    }
}
