//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by Makaveli Ohaya on 1/11/20.
//  Copyright © 2020 Ohaya. All rights reserved.
//
import AVFoundation
import UIKit

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {
    var audioRecorder : AVAudioRecorder!
    @IBOutlet var StopRecording: UIView!
    @IBOutlet weak var TapToRecord: UILabel!
    @IBOutlet weak var StopRecordingButton: UIButton!
    @IBOutlet weak var RecordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        StopRecordingButton.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    @IBAction func RecordButtion(_ sender: Any) {
        print("record button was pressed")
        TapToRecord.text = "Recording in Progress"
        StopRecordingButton.isEnabled = true
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.delegate = self
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    
    @IBAction func StopRecording(_ sender: Any) {
        print("Stop Recording button was pressed")
        TapToRecord.text = "Tap to Record"
         StopRecordingButton.isEnabled = false
        let audiosession = AVAudioSession.sharedInstance()
        try! audiosession.setActive(false)
    }
}

