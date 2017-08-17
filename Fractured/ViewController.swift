

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
    
    var m1 = mid()
    var m2 = mid()
    
    var t1 = treble()
    var t2 = treble()
    
    
    var fsMixer = AKMixer()
    var auMixer = AKMixer()
    var bMixer = AKMixer()
    var mMixer = AKMixer()
    var tMixer = AKMixer()
    
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
        m1.prepare()
        m2.prepare()
        t1.prepare()
        t2.prepare()
        
        fsMixer = AKMixer(
            
            fs1.player1!, fs1.player2!, fs1.player3!, fs1.player4!, fs1.player5!,fs1.player6!, fs1.player7!, fs1.player8!, fs1.player9!, fs1.player10!, fs1.player11!,
                          
            fs2.player6!, fs2.player7!, fs2.player8!, fs2.player9!, fs2.player10!, fs2.player11!, fs2.player1!, fs2.player2!, fs2.player3!, fs2.player4!, fs2.player5!
        
        )
        
        auMixer = AKMixer(
            
            au1.player1!, au1.player2!, au1.player3!, au1.player4!, au1.player5!,au1.player6!, au1.player7!, au1.player8!, au1.player9!, au1.player10!,
            
            au2.player6!, au2.player7!, au2.player8!, au2.player9!, au2.player10!, au2.player1!, au2.player2!, au2.player3!, au2.player4!, au2.player5!
            
        )
        
        bMixer = AKMixer(
            
            b1.player1!, b1.player2!, b1.player3!, b1.player4!, b1.player5!,
            
            b2.player1!, b2.player2!, b2.player3!, b2.player4!, b2.player5!
            
        )
        
        mMixer = AKMixer(
            
            m1.player1!, m1.player2!, m1.player3!, m1.player4!, m1.player5!, m1.player6!,
            m1.player7!, m1.player8!, m1.player9!, m1.player10!,
            
            m2.player1!, m2.player2!, m2.player3!, m2.player4!, m2.player5!,m2.player6!, m2.player7!, m2.player8!, m2.player9!, m2.player10!
        )
        
        tMixer = AKMixer(
            
            t1.player1!, t1.player2!, t1.player3!, t1.player4!, t1.player5!, t1.player6!, t1.player7!, t1.player8!, t1.player9!, t1.player10!,
            
            t2.player6!, t2.player7!, t2.player8!, t2.player9!, t2.player10!, t2.player1!, t2.player2!, t2.player3!, t2.player4!, t2.player5!
        )
        
        upperSplitMixer = AKMixer(mMixer, tMixer)
        
        splitMixer = AKMixer(bMixer, auMixer, upperSplitMixer)
        
        output = AKMixer(fsMixer, splitMixer)
        
        AudioKit.output = output
        AudioKit.start()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        setInitalLevels()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 60, execute: {
            
            Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(ViewController.fadeChoice1), userInfo: nil, repeats: true)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 70, execute: {
            
            Timer.scheduledTimer(timeInterval: 70, target: self, selector: #selector(ViewController.fadeChoice2), userInfo: nil, repeats: true)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 30, execute: {
            
            Timer.scheduledTimer(timeInterval: 40, target: self, selector: #selector(ViewController.fadeChoice3), userInfo: nil, repeats: true)
        })
        
    }
    
    //MARK - Loop functions//
    
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
    
    func loopm1() {
        m1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.m1.duration)-3)) {
            self.loopm2()}
    }
    
    func loopm2() {
        m2.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.m2.duration)-3)) {
            self.loopm1()}
    }
    
    func loopt1() {
        t1.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.t1.duration)-3)) {
            self.loopt2()}
    }
    
    func loopt2() {
        t2.playRandom()
        DispatchQueue.main.asyncAfter(deadline: .now() + ((self.t2.duration)-3)) {
            self.loopt1()}
    }
    
    //MARK - fade functions//
    
    //fsMixer & splitMixer//
    
    func fade1() {
        if fsMixer.volume != 0 {
        for _ in 0...49 {
        linearFade1()
            }
        }
    }
    
    func linearFade1(){
        
        if fsMixer.volume > 0 {
            fsMixer.volume -= 0.02
            if splitMixer.volume < 1{
                splitMixer.volume += 0.02}}
        
        if fsMixer.volume < 0 {
            fsMixer.volume = 0
        }
        
        if splitMixer.volume > 1 {
        splitMixer.volume = 1}
    }
    
    
    func fade2() {
        if splitMixer.volume != 0 {
            for _ in 0...49 {
                linearFade2()
            }
        }
    }
    
    func linearFade2(){
        
        if splitMixer.volume > 0 {
            splitMixer.volume -= 0.02
            if fsMixer.volume < 1{
                fsMixer.volume += 0.02}}
        
        if splitMixer.volume < 0 {
            splitMixer.volume = 0
        }
        
        if fsMixer.volume > 1 {
            fsMixer.volume = 1}
    }
    
    // auMixer & upperSplitMixer//
    
    func fade3() {
        if auMixer.volume != 0 {
            for _ in 0...49 {
                linearFade3()
            }
        }
    }
    
    func linearFade3(){
        
        //fades au down and upperSplit up
        
        if auMixer.volume > 0 {
            auMixer.volume -= 0.02
            if upperSplitMixer.volume < 1{
                upperSplitMixer.volume += 0.02}}
        
        if auMixer.volume < 0 {
            auMixer.volume = 0
        }
        
        if upperSplitMixer.volume > 1 {
            upperSplitMixer.volume = 1}
    }
    
    func fade4() {
        if upperSplitMixer.volume != 0 {
            for _ in 0...49 {
                linearFade4()
            }
        }
    }
    
    func linearFade4(){
        
        
    //fades upperSplit down and au up
        
        if upperSplitMixer.volume > 0 {
            upperSplitMixer.volume -= 0.02
            if auMixer.volume < 1{
                auMixer.volume += 0.02}}
        
        if upperSplitMixer.volume < 0 {
            upperSplitMixer.volume = 0
        }
        
        if auMixer.volume > 1 {
            auMixer.volume = 1}
    }
    
    // Mids //
    
    func fade5() {
        if mMixer.volume != 0 {
            for _ in 0...49 {
                linearFade5()
            }
        }
    }
    
    func linearFade5(){
        
        //fades mid down
        
        if mMixer.volume > 0 {
            mMixer.volume -= 0.02
        }
        
        if mMixer.volume < 0 {
            mMixer.volume = 0
        }
    }
    
    func fade6() {
        if mMixer.volume != 1 {
            for _ in 0...49 {
                linearFade6()
            }
        }
    }
    
    func linearFade6(){
        
        //fades mid up
        
        if mMixer.volume < 1{
            mMixer.volume += 0.02}
        
        if mMixer.volume > 1 {
            mMixer.volume = 1}
    }
    
    //Treble//
    
    func fade7() {
        if tMixer.volume != 0 {
            for _ in 0...49 {
                linearFade7()
            }
        }
    }
    
    func linearFade7(){
        
        //fades treble down
        
        if tMixer.volume > 0 {
            tMixer.volume -= 0.02
        }
        
        if tMixer.volume < 0 {
            tMixer.volume = 0
        }
    }
    
    func fade8() {
        
        if tMixer.volume != 1 {
            for _ in 0...49 {
                linearFade8()
            }
        }
    }
    
    func linearFade8(){
        
        //fades treble up
        
        if tMixer.volume < 1{
            tMixer.volume += 0.02}
        
        if tMixer.volume > 1 {
            tMixer.volume = 1}
    }
    
    
    //MARK - random number functions//
    
    
    func setInitalLevels(){
        let number = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        if number < 0.25 {
            fsMixer.volume = 1
            splitMixer.volume = 0
            auMixer.volume = 0
            upperSplitMixer.volume = 1
        }
        
        if  0.25 <= number && number < 0.7 {
            fsMixer.volume = 0
            splitMixer.volume = 1
            auMixer.volume = 0
            upperSplitMixer.volume = 1
        }
        
        if number > 0.7 {
            fsMixer.volume = 0
            splitMixer.volume = 1
            auMixer.volume = 1
            upperSplitMixer.volume = 0
        }
        
        loopfs1()
        loopb1()
        loopau1()
        loopm1()
        loopt1()
        
        print("\(fsMixer.volume), \(splitMixer.volume)")
        
    }
    
    func fadeChoice1(){
        let number = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        print("fade 1 number = \(number)")
        
        if number > 0.2 {
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
