//
//  ViewController.swift
//  MotionSensor
//
//  Created by 伊藤 奨真 on 2022/07/15.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let motionManager = CMMotionManager()
    
    @IBOutlet weak var fish: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let originalX = fish.center.x//fishの最初のx座標を入れておく
        
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.02
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) { motion, error in
                print(motion!.attitude.roll)//iphoneの縦方向を軸とした傾き -ΠからΠまで
                
                let newX = originalX + CGFloat(motion!.attitude.roll * 100)
                self.fish.center = CGPoint(x: newX, y: self.fish.center.y)
            }
        }
    }
    
    
    func stopSensor() {
        motionManager.stopDeviceMotionUpdates()
    }


}

