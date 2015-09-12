//
//  RecordSoundsViewController.swift
//  Reverse
//
//  Created by Yiu Cheung Ho on 8/27/15.
//  Copyright (c) 2015 Lewis Ho. All rights reserved.
//

import UIKit
import AVFoundation

var audioRecorder:AVAudioRecorder!

class RecordSoundsViewController: UIViewController {
    // ViewDidLoad -- initial setup
    // ViewWillAppear -- view before using - hiding/show button
    // ViewDidAppear -- view after using - animation
    // 

    @IBOutlet weak var recordingBtn: UIButton!
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
        // Prevent pressed twice
        recordingBtn.enabled = false
        
        // Record audio
        // Set Path
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        //let currentDateTime = NSDate()
        //let formatter = NSDateFormatter()
        //formatter.dateFormat = "ddMMyyyy-HHmmss"
        //let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecording(sender: AnyObject) {
        // Hide recording text, stopBtn
        recordingInProgress.hidden = true
        stopRecording.hidden = true
        
        // Enable recordingBtn
        recordingBtn.enabled = true
        
        // Stop recording
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
}

