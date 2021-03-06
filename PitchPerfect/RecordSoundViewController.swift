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
    

    @IBAction func RecordButton(_ sender: Any) {
       // print("record button was pressed")
       // TapToRecord.text = "Recording in Progress"
        //StopRecordingButton.isEnabled = true
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
        return configureUI(isRecording: true)
    }
    func configureUI(isRecording: Bool) {
        StopRecordingButton.isEnabled = isRecording // to disable the button
        RecordButton.isEnabled = !isRecording // to enable the button
        TapToRecord.text = !isRecording ? "Tap to Record" : "Recording in Progress"

    }
    
    @IBAction func StopRecording(_ sender: AnyObject) {
        print("Stop Recording button was pressed")
    //    TapToRecord.text = "Tap to Record"
      //   StopRecordingButton.isEnabled = false
       audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        
        try! audioSession.setActive(false)
      
       return configureUI(isRecording: false)
        
        
    }
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
       // audioRecorder.stop()
        if flag {
            performSegue(withIdentifier: "Stop Recording", sender: audioRecorder.url)
        }
        else {
            print("recording was not successful")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Stop Recording"{
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioUrl = sender as! URL

            playSoundsVC.recordedAudioUrl = recordedAudioUrl
        }
    }
}

