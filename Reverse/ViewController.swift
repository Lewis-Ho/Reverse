//
//  ViewController.swift
//  Reverse
//
//  Created by Yiu Cheung Ho on 8/27/15.
//  Copyright (c) 2015 Lewis Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        // Show recording text
        recordingInProgress.hidden = false
        // Record audio
    }

}

