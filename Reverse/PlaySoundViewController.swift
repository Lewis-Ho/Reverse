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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // initialize audio
        var path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        var pathUrl = NSURL.fileURLWithPath(path!)
        audioPlayer = AVAudioPlayer(contentsOfURL: pathUrl, error: nil)
        // Enable audio rate
        audioPlayer.enableRate = true
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
        audioPlayer.play()
    }

    @IBAction func playFast(sender: AnyObject) {
        // Play sound
        audioPlayer.stop()
        audioPlayer.prepareToPlay()
        audioPlayer.rate = 1.5
        audioPlayer.play()
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
