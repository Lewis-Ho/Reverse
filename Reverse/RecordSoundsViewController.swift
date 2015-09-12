//
//  RecordSoundsViewController.swift
//  Reverse
//
//  Created by Yiu Cheung Ho on 8/27/15.
//  Copyright (c) 2015 Lewis Ho. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController,AVAudioRecorderDelegate {
    // ViewDidLoad -- initial setup
    // ViewWillAppear -- view before using - hiding/show button
    // ViewDidAppear -- view after using - animation
    // 

    @IBOutlet weak var recordingBtn: UIButton!
    @IBOutlet weak var stopRecording: UIButton!
    @IBOutlet weak var recordingInProgress: UILabel!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
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
        
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        // make this view to take advantage on audioRecorder library (So we can use DidFinishRecording function )
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    // Run only after finish recording
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if(flag){
            // Save audio
            recordedAudio = RecordedAudio()
            recordedAudio.filePathUrl = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            // Preform segue
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else {
            println("Err: audio save unsuccessfully.")
            recordingInProgress.hidden = true
            stopRecording.hidden = true
            recordingBtn.enabled = true
        }
    }
    
    // Make sure variable (audio info) send to next viewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording"){
            // Set segue destination
            let playSoundVC:PlaySoundViewController = segue.destinationViewController as! PlaySoundViewController
            let data = sender as! RecordedAudio
            // Choose variables to pass to playSoundVC
            playSoundVC.recordedAudio = data
        }
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

