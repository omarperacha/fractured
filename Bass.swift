//
//  Bass.swift
//  Fractured
//
//  Created by Omar Peracha on 14/08/2017.
//  Copyright © 2017 Omar Peracha. All rights reserved.
//

import Foundation
import AudioKit

class bass : NSObject {

    var choice = 0
    var midi = 0
    var duration = 0.0
    
    var file1 : AKAudioFile?
    var file2 : AKAudioFile?
    var file3 : AKAudioFile?
    var file4 : AKAudioFile?
    var file5 : AKAudioFile?
    
    var sampler = AKSampler()

    let options: Array <String> = ["[0011] low C4.m4a",
                   "[0011] low 3 D4.m4a",
                   "[0011] low 6 E4.m4a",
                   "[0011] low 7 F4.m4a",
                   "[0011] low 8 G4.m4a"]
    
    func prepare(){
        
        do {file1 = try AKAudioFile(readFileName: options[0])} catch {print("file_1 assertion error")}
        
        do {file2 = try AKAudioFile(readFileName: options[1])} catch {print("file_2 assertion error")}
        
        do {file3 = try AKAudioFile(readFileName: options[2])} catch {print("file_3 assertion error")}
        
        do {file4 = try AKAudioFile(readFileName: options[3])} catch {print("file_4 assertion error")}
        
        do {file5 = try AKAudioFile(readFileName: options[4])} catch {print("file_5 assertion error")}
        
        do {try sampler.loadAudioFiles([file1!, file2!, file3!, file4!, file5!])} catch {print("sampler failed to load files")}
    }
    
    func choose() {
        let randomIndex = Int(arc4random_uniform(UInt32(options.count)))
        choice = randomIndex
    }
    
    func playRandom(){
        choose()
        
        if choice == 0 {
            midi = 60
            duration = file1!.duration
        } else if choice == 1 {
            midi = 62
            duration = file2!.duration
        } else if choice == 2 {
            midi = 64
            duration = file3!.duration
        } else if choice == 3 {
            midi = 65
            duration = file4!.duration
        } else if choice == 4 {
            midi = 67
            duration = file5!.duration
        } else {print(choice)}
        
        sampler.play(noteNumber: MIDINoteNumber(midi), velocity: 127, channel: 0)
        
    }



}
