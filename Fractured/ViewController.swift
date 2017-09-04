

//
//  ViewController.swift
//  Fractured
//
//  Created by Omar Peracha on 01/08/2017.
//  Copyright © 2017 Omar Peracha. All rights reserved.
//

import UIKit
import AudioKit

var loadVar = 0

class ViewController : UIViewController {
    
    let Q = DispatchQueue.global(qos: .userInitiated)
    
    func audioRouteChangeListener(notification:NSNotification) {
        let audioRouteChangeReason = notification.userInfo![AVAudioSessionRouteChangeReasonKey] as! UInt
        
        switch audioRouteChangeReason {
        case AVAudioSessionRouteChangeReason.newDeviceAvailable.rawValue:
            AudioKit.stop()
            reset()
            
        case AVAudioSessionRouteChangeReason.oldDeviceUnavailable.rawValue:
            AudioKit.stop()
            reset()
            
        default:
            break
        }
    }
    
    var au1 = allUpper()
    
    var b1 = bass()
    
    var m1 = mid()
    
    var t1 = treble()
    
    //Mark - FX//
    
    var decimator : AKDecimator?
    var fx1 : AKClipper?
    var fx2: AKPhaser?
    var fx3 : AKDelay?
    
    
    var bUpper = 1.3
    var mUpper = 0.75
    var tUpper = 0.8
    
    
    var auMixer = AKMixer()
    var bMixer = AKMixer()
    var mMixer = AKMixer()
    var tMixer = AKMixer()
    
    var splitMixer = AKMixer()
    var upperSplitMixer = AKMixer()
    
    var output = AKMixer()
    
    var auCompressor : AKCompressor?
    var mCompressor : AKCompressor?
    var filter : AKLowPassFilter?
    var dryWet : AKDryWetMixer?
    var dryWet2: AKDryWetMixer?
    var dryWet3: AKDryWetMixer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
         NotificationCenter.default.addObserver(self, selector: #selector(self.audioRouteChangeListener(notification:)), name: NSNotification.Name.AVAudioSessionRouteChange, object: nil)
        
            AKSettings.playbackWhileMuted = true
        
        xyView.layer.borderWidth = 2
        xyView.layer.borderColor = UIColor.white.cgColor
        
        myLabel.layer.borderWidth = 0.5
        myLabel.layer.borderColor = UIColor.black.cgColor
        
        aboutA.layer.borderWidth = 0.5
        aboutA.layer.borderColor = UIColor.black.cgColor
        
        aboutF.layer.borderWidth = 0.5
        aboutF.layer.borderColor = UIColor.white.cgColor
        
            au1.prepare()
            b1.prepare()
            m1.prepare()
            t1.prepare()
        
        
        auMixer = AKMixer(
            
            au1.sampler
            
        )
        
        bMixer = AKMixer(
            b1.sampler
        )
        
        mMixer = AKMixer(
            
            m1.sampler
        )
        
        tMixer = AKMixer(
            
            t1.sampler
        )
        
        mMixer.volume = mUpper
        bMixer.volume = bUpper
        tMixer.volume = tUpper

        auCompressor = AKCompressor(auMixer, threshold: -40, masterGain: -0.5)
        
        mCompressor = AKCompressor(mMixer, threshold: -36, masterGain: -0.15)
        
        filter = AKLowPassFilter(tMixer, cutoffFrequency: 7800)
        
        upperSplitMixer = AKMixer(mCompressor!, filter!)
        
        splitMixer = AKMixer(bMixer, auCompressor!, upperSplitMixer)
        
        fx1 = AKClipper(splitMixer, limit: 0)
        
        dryWet = AKDryWetMixer(splitMixer, fx1!, balance: 0)
        
        decimator = AKDecimator(dryWet!, decimation: 0, rounding: 0, mix: 0)
        
        fx2 = AKPhaser(decimator!)
        
        dryWet2 = AKDryWetMixer(decimator! ,fx2!, balance: 0)
        
        fx3 = AKDelay(dryWet2!, time: 0.3, feedback: 0.87, lowPassCutoff: 4000, dryWetMix: 0)
        
        dryWet3 = AKDryWetMixer(dryWet2!, fx3!, balance: 0)
        
        output = AKMixer(dryWet3!)
        output.volume = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if loadVar == 0 {
        
        fx1!.start()
        auCompressor!.start()
        mCompressor!.start()
        filter!.start()
        decimator!.start()
        fx2!.start()
        fx3!.start()
        
        AudioKit.output = output
        AudioKit.start()
        
        self.setInitalLevels()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 60, execute: {
            
            Timer.scheduledTimer(timeInterval: 50.11, target: self, selector: #selector(ViewController.fadeChoice1), userInfo: nil, repeats: true)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 70, execute: {
            
            Timer.scheduledTimer(timeInterval: 70.643, target: self, selector: #selector(ViewController.fadeChoice2), userInfo: nil, repeats: true)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 30, execute: {
            
            Timer.scheduledTimer(timeInterval: 41.27, target: self, selector: #selector(ViewController.fadeChoice3), userInfo: nil, repeats: true)
        })
        }
    }
    
    //MARK - Loop functions//
    
    
    func loopb1() {
        b1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.b1.duration)-3), execute : {
            self.loopb2()})
    }
    
    func loopb2() {
        b1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.b1.duration)-3), execute : {
            self.loopb1()})
    }
    
    func loopau1() {
        au1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.au1.duration)-10), execute : {
            self.loopau2()})
    }
    
    func loopau2() {
        au1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.au1.duration)-10), execute : {
            self.loopau1()})
    }
    
    func loopm1() {
        m1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.m1.duration)-6), execute : {
            self.loopm2()})
    }
    
    func loopm2() {
        m1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.m1.duration)-6), execute : {
            self.loopm1()})
    }
    
    func loopt1() {
        t1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.t1.duration)-3), execute : {
            self.loopt2()})
    }
    
    func loopt2() {
        t1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.t1.duration)-3), execute : {
            self.loopt1()})
    }
    
    //MARK - fade functions//
    
    func fade1() {
        if bMixer.volume != 0 {
            for i in 0...99 {
                delay(i*0.03){
                    self.linearFade1()
                    //print(i)
                }
            }
        }
    }
    
    func linearFade1(){
        
        //fades bass down
        
        if bMixer.volume > 0 {
            bMixer.volume -= (bUpper/100)
        }
        
        if bMixer.volume < 0 {
            bMixer.volume = 0
        }
    }
    
    
    func fade2() {
        if bMixer.volume != bUpper {
            for i in 0...99 {
                delay(i*0.03){
                    self.linearFade2()
                    //print(i)
                }
            }
        }
    }
    
    func linearFade2(){
        
        //fades bass up
        
        if bMixer.volume < 1{
            bMixer.volume += (bUpper/100)}
        
        if bMixer.volume > bUpper {
            bMixer.volume = bUpper}
    }
    
    // auMixer & upperSplitMixer//
    
    func fade3() {
        if auMixer.volume != 0 {
            for i in 0...99 {
                delay(i*0.03){
                    self.linearFade3()
                    //print(i)
                }
            }
        }
    }
    
    func linearFade3(){
        
        //fades au down and upperSplit up
        
        if auMixer.volume > 0 {
            auMixer.volume -= 0.01
            if upperSplitMixer.volume < 1{
                upperSplitMixer.volume += 0.01}}
        
        if auMixer.volume < 0 {
            auMixer.volume = 0
        }
        
        if upperSplitMixer.volume > 1 {
            upperSplitMixer.volume = 1}
    }
    
    func fade4() {
        if upperSplitMixer.volume != 0 {
            for i in 0...99 {
                delay(i*0.03){
                    self.linearFade4()
                    //print(i)
                }
            }
        }
    }
    
    func linearFade4(){
        
        
    //fades upperSplit down and au up
        
        if upperSplitMixer.volume > 0 {
            upperSplitMixer.volume -= 0.01
            if auMixer.volume < 1{
                auMixer.volume += 0.01}}
        
        if upperSplitMixer.volume < 0 {
            upperSplitMixer.volume = 0
        }
        
        if auMixer.volume > 1 {
            auMixer.volume = 1}
    }
    
    // Mids //
    
    func fade5() {
        if mMixer.volume != 0 {
            for i in 0...99 {
                delay(i*0.03){
                    self.linearFade5()
                    //print(i)
                }
            }
        }
    }
    
    func linearFade5(){
        
        //fades mid down
        
        if mMixer.volume > 0 {
            mMixer.volume -= (mUpper/100)
        }
        
        if mMixer.volume < 0 {
            mMixer.volume = 0
        }
    }
    
    func fade6() {
        if mMixer.volume != mUpper {
            for i in 0...99 {
                delay(i*0.03){
                    self.linearFade6()
                    //print(i)
                }
            }
        }
    }
    
    func linearFade6(){
        
        //fades mid up
        
        if mMixer.volume < 1{
            mMixer.volume += (mUpper/100)}
        
        if mMixer.volume > mUpper {
            mMixer.volume = mUpper}
    }
    
    //Treble//
    
    func fade7() {
        if tMixer.volume != 0 {
            for i in 0...99 {
                delay(i*0.03){
                    self.linearFade7()
                    //print(i)
                }
            }
        }
    }
    
    func linearFade7(){
        
        //fades treble down
        
        if tMixer.volume > 0 {
            tMixer.volume -= (tUpper/100)
        }
        
        if tMixer.volume < 0 {
            tMixer.volume = 0
        }
    }
    
    func fade8() {
        
        if tMixer.volume != tUpper {
            for i in 0...99 {
               delay(i*0.03){
                self.linearFade8()
                    //print(i)
                }
            }
        }
    }
    
    
    func linearFade8(){
        
        //fades treble up
        
        if tMixer.volume < tUpper{
            tMixer.volume += (tUpper/100)}
        
        if tMixer.volume > tUpper {
            tMixer.volume = tUpper}
    }
    
    //Master fade at start
    
    func fade9() {
        
        if output.volume != 1 {
            for i in 0...49 {
                delay(i*0.01){
                    self.linearFade9()
                    //print(self.output.volume)
                }
            }
        }
    }
    
    
    func linearFade9(){
        
        //fades treble up
        
        if output.volume < 1 {
            output.volume += 0.02}
        
        if output.volume > 1 {
            output.volume = 1}
    }
    
    
    //MARK - random number functions//
    
    
    func setInitalLevels(){
        let number = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        if number < 0.15 {
            auMixer.volume = 0
            mMixer.volume = 0
            upperSplitMixer.volume = 1
        }
        
        if  0.15 <= number && number < 0.7 {
            auMixer.volume = 0
            upperSplitMixer.volume = 1
        }
        
        if number >= 0.7 {
            auMixer.volume = 1
            upperSplitMixer.volume = 0
        }
        
        loopb1()
        loopau1()
        loopm1()
        loopt1()
        fade9()
        
        print("\(auMixer.volume), \(upperSplitMixer.volume)")
        
    }
    
    func fadeChoice1(){
        let number = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        print("MARK fade 1 number = \(number)")
        
        if number < 0.2 {
            fade1()
        } else {
            fade2()
        }
    }
    
    func fadeChoice2(){
        let number = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        print("fade 2 number = \(number)")
        
        if number <= 0.66 {
            fade3()
        } else {
            fade4()
        }
    }
    
    func fadeChoice3(){
        let number = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        print("fade 3 number = \(number)")
        
        if number <= 0.1 {
            fade5()
        } else if number >= 0.9 {
            fade7()
        } else {
            fade6()
            fade8()
        }
    }
    
    //MARK - delay function//
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    //MARK - BUTTONS//
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.xyView)
        if let view = recognizer.view {
            let xCood = view.center.x + translation.x
            let yCood = view.center.y + translation.y
            if xCood >= 12 && xCood <= 228 && yCood >= 12 && yCood <= 228 {
            view.center = CGPoint(x:xCood, y:yCood)
                
                Q.async {
                    self.fx1!.limit = Double(0.15-(yCood-120)/756)
                    self.dryWet!.balance = Double((120-xCood)/180)
                    
                    self.decimator!.mix = Double((yCood-120)/324)
                    self.decimator!.decimation = Double((xCood-120)/2160)
                    
                    self.dryWet2!.balance = Double((xCood-120)/108)
                    self.fx2!.lfoBPM = Double(60+((120-yCood)/108*300))
                    
                    self.dryWet3!.balance = Double((120-yCood)/108)
                    self.fx3!.dryWetMix = Double((120-xCood)/108)
                }

            }
        }
        recognizer.setTranslation(CGPoint.zero, in: self.xyView)
    }
    
    @IBOutlet weak var xyView: UIView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var aboutF: UIButton!
    
    @IBOutlet weak var aboutA: UIButton!
    
    //MARK reset
    
    func reset(){
        
        au1.prepare()
        b1.prepare()
        m1.prepare()
        t1.prepare()
        
        AudioKit.output = output
        AudioKit.start()
        
        loopb1()
        loopau1()
        loopm1()
        loopt1()
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
