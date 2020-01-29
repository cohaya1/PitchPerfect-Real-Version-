//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Makaveli Ohaya on 1/14/20.
//  Copyright © 2020 Ohaya. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    @IBOutlet weak var HighPitch: UIButton!
    
    @IBOutlet weak var SlowSnail: UIButton!
    @IBOutlet weak var LowPitch: UIButton!
    @IBOutlet weak var FastPitch: UIButton!
    @IBOutlet weak var Reverbbutton: UIButton!
    @IBOutlet weak var Echo: UIButton!
    @IBOutlet weak var StopRec: UIButton!
    
   
    var recordedAudioUrl : URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //configure the UI for not playing
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Button was pressed")
    }
    
    @IBAction func StopSoundForButton(_ sender: UIButton) {
        print("Stop Button was pressed")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
