

//
//  ViewController.swift
//  Fractured
//
//  Created by Omar Peracha on 01/08/2017.
//  Copyright © 2017 Omar Peracha. All rights reserved.
//

import UIKit
import AudioKit

class ViewController : UIViewController {
    
    var fs1 = fullSpectrum()
    var fs2 = fullSpectrum()
    
    var au1 = allUpper()
    var au2 = allUpper()
    
    var b1 = bass()
    var b2 = bass()
    
    
    var fsMixer = AKMixer()
    var auMixer = AKMixer()
    var bMixer = AKMixer()
    
    var splitMixer = AKMixer()
    var upperSplitMixer = AKMixer()
    
    var output = AKMixer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fs1.prepare()
        fs2.prepare()
        au1.prepare()
        au2.prepare()
        b1.prepare()
        b2.prepare()
        
        fsMixer = AKMixer(
            
            fs1.player1!, fs1.player2!, fs1.player3!, fs1.player4!, fs1.player5!,fs1.player6!, fs1.player7!, fs1.player8!, fs1.player9!, fs1.player10!, fs1.player11!,fs1.player12!, fs1.player13!, fs1.player14!, fs1.player15!, fs1.player16!,
                          
            fs2.player6!, fs2.player7!, fs2.player8!, fs2.player9!, fs2.player10!, fs2.player11!,fs2.player12!, fs2.player13!, fs2.player14!, fs2.player15!, fs2.player16!, fs2.player1!, fs2.player2!, fs2.player3!, fs2.player4!, fs2.player5!
        
        )
        
        auMixer = AKMixer(
            
            au1.player1!, au1.player2!, au1.player3!, au1.player4!, au1.player5!,au1.player6!, au1.player7!, au1.player8!, au1.player9!, au1.player10!, au1.player11!,au1.player12!,
            
            au2.player6!, au2.player7!, au2.player8!, au2.player9!, au2.player10!, au2.player11!,au2.player12!, au2.player1!, au2.player2!, au2.player3!, au2.player4!, au2.player5!
            
        )
        
        bMixer = AKMixer(
            
            b1.player1!, b1.player2!, b1.player3!, b1.player4!, b1.player5!,b1.player6!, b1.player7!, b1.player8!,
            
            b2.player6!, b2.player7!, b2.player8!, b2.player1!, b2.player2!, b2.player3!, b2.player4!, b2.player5!
            
        )
        
        
        splitMixer = AKMixer(bMixer, auMixer)
        
        output = AKMixer(fsMixer, splitMixer)
        
        AudioKit.output = output
        AudioKit.start()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        //loopfs1()
        loopb1()
        loopau1()
    }
    
    func loopfs1() {
        fs1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.fs1.duration)-3)) {
            self.loopfs2()}
    }
    
    func loopfs2() {
        fs2.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.fs2.duration)-3)) {
            self.loopfs1()}
    }
    
    func loopb1() {
        b1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.b1.duration)-3)) {
            self.loopb2()}
    }
    
    func loopb2() {
        b2.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.b2.duration)-3)) {
            self.loopb1()}
    }
    
    func loopau1() {
        au1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.au1.duration)-3)) {
            self.loopau2()}
    }
    
    func loopau2() {
        au2.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.au2.duration)-3)) {
            self.loopau1()}
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
