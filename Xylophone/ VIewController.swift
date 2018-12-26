//
//  ViewController.swift
//  Xylophone
//
//  Created by Churong Zhang on 12/23/18.
//  Copyright © 2018 Churong Zhang. All rights reserved.
//

import UIKit
//import AudioToolbox
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    let noteArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var audioPlayer : AVAudioPlayer!
    var selectSound: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        // solution one
//        import AudioToolbox
//        if let soundURL = Bundle.main.url(forResource: noteArray[sender.tag - 1], withExtension: "wav") {
//            var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//            print(sender.tag)
//            // Play
//            AudioServicesPlaySystemSound(mySound);
//        }
        selectSound = noteArray[sender.tag - 1]
        playSound(tagValue: sender.tag - 1)

    }
    
    func playSound(tagValue:Int){
        //let soundURL = Bundle.main.url(forResource: noteArray[tagValue], withExtension: "wav")
        let soundURL = Bundle.main.url(forResource: selectSound, withExtension: "wav")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
  

}

