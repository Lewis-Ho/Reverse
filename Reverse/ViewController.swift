//
//  ViewController.swift
//  Reverse
//
//  Created by Yiu Cheung Ho on 8/27/15.
//  Copyright (c) 2015 Lewis Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // ViewDidLoad -- initial setup
    // ViewWillAppear -- view before using - hiding/show button
    // ViewDidAppear -- view after using - animation
    // 

    @IBOutlet weak var stopRecording: UIButton!
    @IBOutlet weak var recordingInProgress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Hide stop button
        stopRecording.hidden = true
    }

    @IBAction func recordAudio(sender: UIButton) {
        // Show recording text
        recordingInProgress.hidden = false
        // Show stop recording button
        stopRecording.hidden = false
        // Record audio
    }

    @IBAction func stopRecording(sender: AnyObject) {
        // Hide recording text
        recordingInProgress.hidden = true
        
    }
}

