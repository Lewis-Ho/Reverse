//
//  PlaySoundViewController.swift
//  Reverse
//
//  Created by Yiu Cheung Ho on 9/3/15.
//  Copyright (c) 2015 Lewis Ho. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var engine:AVAudioEngine!
    var audioFile: AVAudioFile!
    var recordedAudio:RecordedAudio!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // initialize audio
        //var path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        //var pathUrl = NSURL.fileURLWithPath(path!)
        audioPlayer = AVAudioPlayer(contentsOfURL: recordedAudio.filePathUrl, error: nil)
        // Enable audio rate
        audioPlayer.enableRate = true
        engine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recordedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlow(sender: AnyObject) {
        // Play sound
        audioPlayer.stop()
        audioPlayer.prepareToPlay()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }

    @IBAction func playFast(sender: AnyObject) {
        // Play sound
        audioPlayer.stop()
        audioPlayer.prepareToPlay()
        audioPlayer.rate = 1.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playChipmunk(sender: UIButton) {
        var playerNode = AVAudioPlayerNode()
        var audioEffect = AVAudioUnitTimePitch()
        audioEffect.pitch = 2000
        
        // Keep playerNode and engine clear from last play
        playerNode.stop()
        engine.stop()
        engine.reset()
        
        engine.attachNode(playerNode)
        engine.attachNode(audioEffect)

        // Attach audioEffect to playerNode
        engine.connect(playerNode, to: audioEffect, format: nil)
        engine.connect(audioEffect, to: engine.outputNode, format: nil)

        playerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)

        engine.startAndReturnError(nil)
        playerNode.play()
    }
    
    @IBAction func stopAudio(sender: AnyObject) {
        audioPlayer.stop()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
