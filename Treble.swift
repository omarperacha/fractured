//
//  Treble.swift
//  Fractured
//
//  Created by Omar Peracha on 14/08/2017.
//  Copyright © 2017 Omar Peracha. All rights reserved.
//

import Foundation
import AudioKit

class treble : NSObject{
    
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
    
    
    let options: Array <String> = ["Fracture 1 high sparse C4.m4a",
                   "High 1 [0110] D4.m4a",
                   "High 2 [0110] A4.m4a",
                   "High 5 [0110] B4.m4a",
                   "High 6 [0110] C5.m4a",
                   "High Noise Cloud 2 [0110] D5.m4a",
                   "High Pitch Cloud [0110] E5.m4a",
                   "High Noise Cloud [1110] A5.m4a",
                   "High Pitch Cloud 2 [1110] B5.m4a",
                   "High Pitch Cloud 3 [1110] C6.m4a",]
    
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
        
        if choice == 0 {
            midi = 60
            duration = file1!.duration
        } else if choice == 1 {
            midi = 62
            duration = file2!.duration
        } else if choice == 2 {
            midi = 69
            duration = file3!.duration
        } else if choice == 3 {
            midi = 71
            duration = file4!.duration
        } else if choice == 4 {
            midi = 72
            duration = file5!.duration
        } else if choice == 5 {
            midi = 74
            duration = file6!.duration
        } else if choice == 6 {
            midi = 75
            duration = file7!.duration
        } else if choice == 7 {
            midi = 81
            duration = file8!.duration
        } else if choice == 8 {
            midi = 83
            duration = file9!.duration
        } else if choice == 9 {
            midi = 84
            duration = file10!.duration
        } else {print(choice)}
        
        sampler.play(noteNumber: MIDINoteNumber(midi), velocity: 127, channel: 0)

    }
    
}
