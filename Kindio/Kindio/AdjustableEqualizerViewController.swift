//
//  AdjustableEqualizerViewController.swift
//  Kindio
//
//  Created by Alin Petrus on 5/19/16.
//  Copyright © 2016 Alin Petrus. All rights reserved.
//

import UIKit

class AdjustableEqualizerViewController: UIViewController {
    @IBOutlet var frequency1Slider: EqualizerSlider!
    @IBOutlet var frequency2Slider: EqualizerSlider!
    @IBOutlet var frequency3Slider: EqualizerSlider!
    @IBOutlet var frequency4Slider: EqualizerSlider!
    @IBOutlet var frequency5Slider: EqualizerSlider!
    @IBOutlet var frequency6Slider: EqualizerSlider!
    @IBOutlet var equalizerView: UIView!
    
    var playSession: PlaySession?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blueCharcoal()
        self.equalizerView.backgroundColor = UIColor.blueCharcoal()
        
        self.title = "Customize Equalizer"
    }
    
    override func viewWillAppear(animated: Bool) {
         super.viewWillAppear(animated)
        
        var rotation = CGAffineTransformIdentity
        rotation = CGAffineTransformRotate(rotation, CGFloat.init(-(M_PI / 2)))
        self.equalizerView.transform = rotation
    }
    
    // MARK: Private
  
}