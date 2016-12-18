//
//  ViewController.swift
//  ChangeFont
//
//  Created by ficow on 2016/12/18.
//  Copyright © 2016年 ficow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textV: UITextView!
    @IBOutlet weak var changeFontBtn: UIButton!
    var text = ""
    var fontsArr = [String]()
    var currentIdx = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text += "ChangeFont demo just 4 u !🤓\n\n测试文本：\n"
        text += "1234567890\n"
        text += "一二三四五六七八九十\n"
        text += "abcdefghijklmnopqrstuvwxyz\n"
        text += "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n\n"
        
        text += "当前显示的字体为：\n"
        textV.text = text
        
        for family in UIFont.familyNames{
            for font in UIFont.fontNames(forFamilyName: family){
                fontsArr.append(font)
            }
        }
        
//        for font in fontsArr{
//            print(font)
//        }
//        
//        print(fontsArr.count)
    }

    @IBAction func changeFontBtnPressed(_ sender: UIButton) {
        
        print(currentIdx)
        
        let fontName = fontsArr[currentIdx]
        textV.text = text + fontName
        textV.font = UIFont(name: fontName, size: 20.0)
        currentIdx = (currentIdx + 1) % fontsArr.count
        
        UIView.animate(withDuration: 0.1, animations: {[unowned self] in
            
            self.changeFontBtn.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            }, completion: {(finished) in
                
                UIView.animate(withDuration: 0.1, animations: {[unowned self] in
                    self.changeFontBtn.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
        })
    }
}

