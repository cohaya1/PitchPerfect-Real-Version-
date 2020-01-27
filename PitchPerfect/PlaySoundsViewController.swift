//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Makaveli Ohaya on 1/14/20.
//  Copyright © 2020 Ohaya. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    @IBOutlet weak var HighPitch: UIButton!
    
    @IBOutlet weak var SlowSnail: UIButton!
    @IBOutlet weak var LowPitch: UIButton!
    @IBOutlet weak var FastPitch: UIButton!
    @IBOutlet weak var Reverbbutton: UIButton!
    @IBOutlet weak var Echo: UIButton!
    @IBOutlet weak var StopRec: UIButton!
    
    var recordedAudioUrl : URL!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
