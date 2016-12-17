//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by ficow on 2016/12/17.
//  Copyright © 2016年 ficow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLB: UILabel!
    @IBOutlet weak var actionIV: UIImageView!
    var isCounting = false
    var timer = Timer()
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.actionIVTapped))
        actionIV.addGestureRecognizer(tap)
        
        initUI()
    }
    
    func initUI(){
        textLB.text = "0.0"
        timer.invalidate()
        counter = 0
    }
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        
        initUI()
    }
    
    func actionIVTapped(){
        
        isCounting = !isCounting
        
        if isCounting {
            run()
            return
        }
        pause()
    }
    
    func run(){
        actionIV.image = UIImage(named: "Pause")
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.countTime), userInfo: nil, repeats: true)
    }
    
    func pause(){
        timer.invalidate()
        actionIV.image = UIImage(named: "Start")
    }
    
    func countTime(){
        counter += 0.1
        textLB.text = String(format: "%.1f", counter)
    }

}

