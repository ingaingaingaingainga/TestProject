//
//  ViewController.swift
//  TestStarLab
//
//  Created by Inga Codreanu on 12/6/16.
//  Copyright © 2016 Inga Codreanu. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleUrlUILabel: UILabel!
    @IBOutlet weak var currentItemUILabel: UILabel!
    @IBOutlet weak var durrationUILabel: UILabel!
    @IBOutlet weak var imboxURLUITextField: UITextField!
    @IBOutlet weak var viewVideoUIView: UIView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
   
    @IBAction func inputURL(_ sender: Any) {
        self.ShowVideo(textField: imboxURLUITextField)
    }
   
     func ShowVideo (textField:UITextField){
        
        let url:NSURL = NSURL(string: textField.text!)!
        let player = AVPlayer(url: url as URL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.addChildViewController(playerController)
     playerController.view.frame = CGRect(x: 0, y: 0, width:300, height:250)
        self.viewVideoUIView.addSubview(playerController.view)
     
        let currentItem:AVPlayerItem = player.currentItem!
        let durration:CMTime = currentItem.asset.duration
        let currentTime:CMTime = currentItem.currentTime()
    
        
        
        self.titleUrlUILabel.text = "\(currentItem)"
        self.currentItemUILabel.text = "\(currentTime)"
        self.durrationUILabel.text = "\(durration)"
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

