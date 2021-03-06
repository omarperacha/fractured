//
//  Mid.swift
//  Fractured
//
//  Created by Omar Peracha on 14/08/2017.
//  Copyright © 2017 Omar Peracha. All rights reserved.
//

import Foundation
import AudioKit

class mid : NSObject{
    
    var choice = 0
    var midi = 0
    var duration = 0.0
    
    var file1 : AKAudioFile?
    var file2 : AKAudioFile?
    var file3 : AKAudioFile?
    var file4 : AKAudioFile?
    var file5 : AKAudioFile?
    var file6 : AKAudioFile?
    var file7 : AKAudioFile?
    var file8 : AKAudioFile?
    var file9 : AKAudioFile?
    var file10 : AKAudioFile?
    
    var sampler = AKSampler()
    
    
    let options: Array <String> = ["Convolved [0101] C4.mp3",
                   "Mid Range 1 [0101] D4.mp3",
                   "Mid Range 4 [0101] E4.mp3",
                   "Mirrored [0101] F4.mp3",
                   "pn convolve 1 [0101] G4.mp3",
                   "pn convolve 2 [0101] A4 2.mp3",
                   "pn convolve 3 [0101] B4 2.mp3",
                   "Straight Tone Stretched 4 [0101] C5.mp3",
                   "Threshold 2 [0101] D5.mp3",
                   "Threshold 7 [1101] E5.mp3"]
    
    func prepare(){
        
        
        do {file1 = try AKAudioFile(readFileName: options[0])} catch {print("file_1 assertion error")}
        
        do {file2 = try AKAudioFile(readFileName: options[1])} catch {print("file_2 assertion error")}
        
        do {file3 = try AKAudioFile(readFileName: options[2])} catch {print("file_3 assertion error")}
        
        do {file4 = try AKAudioFile(readFileName: options[3])} catch {print("file_4 assertion error")}
        
        do {file5 = try AKAudioFile(readFileName: options[4])} catch {print("file_5 assertion error")}
        
        do {file6 = try AKAudioFile(readFileName: options[5])} catch {print("file_6 assertion error")}
        
        do {file7 = try AKAudioFile(readFileName: options[6])} catch {print("file_7 assertion error")}
        
        do {file8 = try AKAudioFile(readFileName: options[7])} catch {print("file_8 assertion error")}
        
        do {file9 = try AKAudioFile(readFileName: options[8])} catch {print("file_9 assertion error")}
        
        do {file10 = try AKAudioFile(readFileName: options[9])} catch {print("file_10 assertion error")}
        
        do {try sampler.loadAudioFiles([file1!, file2!, file3!, file4!, file5!, file6!, file7!, file8!, file9!, file10!])} catch {print("sampler failed to load files")}
    }
    
    func choose() {
        let randomIndex = Int(arc4random_uniform(UInt32(options.count)))
        choice = randomIndex
    }
    
    func playRandom(){
        choose()
        
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
        } else if choice == 5 {
            midi = 69
            duration = file6!.duration
        } else if choice == 6 {
            midi = 71
            duration = file7!.duration
        } else if choice == 7 {
            midi = 72
            duration = file8!.duration
        } else if choice == 8 {
            midi = 74
            duration = file9!.duration
        } else if choice == 9 {
            midi = 76
            duration = file10!.duration
        } else {print(choice)}
        
        sampler.play(noteNumber: MIDINoteNumber(midi), velocity: 127, channel: 0)
        
    }

}
    
