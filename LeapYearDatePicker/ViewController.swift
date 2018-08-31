//
//  ViewController.swift
//  LeapYearDatePicker
//
//  Created by Chang Sophia on 2018/8/24.
//  Copyright © 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation
var goal: Date!
var player: AVPlayer?


class ViewController: UIViewController {
    @IBOutlet weak var spidermanImageView: UIImageView!
    @IBOutlet weak var deadpoolImageView: UIImageView!
    @IBOutlet weak var myDatePickerValue: UIDatePicker!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var intervalTextField: UITextField!
    @IBOutlet weak var heartImageView: UIImageView!


   
    @IBAction func myDatePickerValue(_ sender: UIDatePicker) {
        goal = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let interval = dateFormatter.string(from: goal)
        let integerinteval = Int(interval)
        intervalTextField.text = ("\(String(describing: integerinteval))")
        intervalTextField.text = dateFormatter.string(from: myDatePickerValue.date)
        if (((integerinteval! % 4) == 0 && (integerinteval! % 100) != 0) || ((integerinteval! % 400) == 0)){
            goalTextField.text = String(true)
        }else{
            goalTextField.text = String(false)
        }
        move()
        
    }
    func move(){
        if goalTextField.text == String(true){
            spidermanImageView.frame.origin.y = CGFloat(306+160)
            deadpoolImageView.frame.origin.y = CGFloat(638-120)
            if let url = Bundle.main.url(forResource: "take on me-chorus", withExtension: "mp3"){
                player = AVPlayer(url: url)
                player?.play()
            }
        }else if goalTextField.text == String(false){
            spidermanImageView.frame.origin.y = CGFloat(306)
            deadpoolImageView.frame.origin.y = CGFloat(638)
            heartImageView.isHidden = false
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
         heartImageView.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

