//
//  fullSpectrum.swift
//  Fractured
//
//  Created by Omar Peracha on 14/08/2017.
//  Copyright © 2017 Omar Peracha. All rights reserved.
//

import Foundation
import AudioKit

class fullSpectrum : NSObject{
    
    var choice = 0
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
    var file11 : AKAudioFile?
    var file12 : AKAudioFile?
    var file13 : AKAudioFile?
    var file14 : AKAudioFile?
    var file15 : AKAudioFile?
    var file16 : AKAudioFile?
    
    var player1 : AKAudioPlayer?
    var player2 : AKAudioPlayer?
    var player3 : AKAudioPlayer?
    var player4 : AKAudioPlayer?
    var player5 : AKAudioPlayer?
    var player6 : AKAudioPlayer?
    var player7 : AKAudioPlayer?
    var player8 : AKAudioPlayer?
    var player9 : AKAudioPlayer?
    var player10 : AKAudioPlayer?
    var player11 : AKAudioPlayer?
    var player12 : AKAudioPlayer?
    var player13 : AKAudioPlayer?
    var player14 : AKAudioPlayer?
    var player15 : AKAudioPlayer?
    var player16 : AKAudioPlayer?

    let options = [
                "Block Swap 2 [1101].wav",
              "Fractured [1100].wav",
               "High Noise Cloud [1110].wav",
               "High Pitch Cloud 2 [1110].wav",
               "High Pitch Cloud 3 [1110].wav",
              "Pitch [1100].wav",
               "pn convolve [1101].wav",
               "Straigh Tone Stretched 2 [1100].wav",
               "Straight Tone Stretched 3 [1101].wav",
               "Straight Tone Stretched 5 [1101].wav",
               "Straight Tone-Block Swap [1100].wav",
               "Threshold 3 [1100].wav",
               "Threshold 4 [1101].wav",
               "Threshold 5 [1100].wav",
               "Threshold 7 [1101].wav",
               "Threshold [1101].wav"
    ]
    
    func prepare(){
        
        do {file1 = try AKAudioFile(readFileName: "Block Swap 2 [1101].wav")} catch {print("file_1 assertion error")}
        do {player1 = try AKAudioPlayer(file: file1!)} catch {print("player assetion error")}
        player1!.fadeInTime = 0.1
        player1!.fadeOutTime = 3
        
        do {file2 = try AKAudioFile(readFileName: "Fractured [1100].wav")} catch {print("file_2 assertion error")}
        do {player2 = try AKAudioPlayer(file: file2!)} catch {print("player assetion error")}
        player2!.fadeInTime = 0.1
        player2!.fadeOutTime = 3
        
        do {file3 = try AKAudioFile(readFileName: "High Noise Cloud [1110].wav")} catch {print("file_3 assertion error")}
        do {player3 = try AKAudioPlayer(file: file3!)} catch {print("player assetion error")}
        player3!.fadeInTime = 0.1
        player3!.fadeOutTime = 3
        
        do {file4 = try AKAudioFile(readFileName: "High Pitch Cloud 2 [1110].wav")} catch {print("file_4 assertion error")}
        do {player4 = try AKAudioPlayer(file: file4!)} catch {print("player assetion error")}
        player4!.fadeInTime = 0.1
        player4!.fadeOutTime = 3
        
        do {file5 = try AKAudioFile(readFileName: "High Pitch Cloud 3 [1110].wav")} catch {print("file_5 assertion error")}
        do {player5 = try AKAudioPlayer(file: file5!)} catch {print("player assetion error")}
        player5!.fadeInTime = 0.1
        player5!.fadeOutTime = 3
        
        do {file6 = try AKAudioFile(readFileName: "Pitch [1100].wav")} catch {print("file_6 assertion error")}
        do {player6 = try AKAudioPlayer(file: file6!)} catch {print("player assetion error")}
        player6!.fadeInTime = 0.1
        player6!.fadeOutTime = 3
        
        do {file7 = try AKAudioFile(readFileName: "pn convolve [1101].wav")} catch {print("file_7 assertion error")}
        do {player7 = try AKAudioPlayer(file: file7!)} catch {print("player assetion error")}
        player7!.fadeInTime = 0.1
        player7!.fadeOutTime = 3
        
        do {file8 = try AKAudioFile(readFileName: "Straigh Tone Stretched 2 [1100].wav")} catch {print("file_8 assertion error")}
        do {player8 = try AKAudioPlayer(file: file8!)} catch {print("player assetion error")}
        player8!.fadeInTime = 0.1
        player8!.fadeOutTime = 3
        
        do {file9 = try AKAudioFile(readFileName: "Straight Tone Stretched 3 [1101].wav")} catch {print("file_9 assertion error")}
        do {player9 = try AKAudioPlayer(file: file9!)} catch {print("player assetion error")}
        player9!.fadeInTime = 0.1
        player9!.fadeOutTime = 3
        
        do {file10 = try AKAudioFile(readFileName: "Straight Tone Stretched 5 [1101].wav")} catch {print("file_10 assertion error")}
        do {player10 = try AKAudioPlayer(file: file10!)} catch {print("player assetion error")}
        player10!.fadeInTime = 0.1
        player10!.fadeOutTime = 3
        
        do {file11 = try AKAudioFile(readFileName: "Straight Tone-Block Swap [1100].wav")} catch {print("file_11 assertion error")}
        do {player11 = try AKAudioPlayer(file: file11!)} catch {print("player assetion error")}
        player11!.fadeInTime = 0.1
        player11!.fadeOutTime = 3
        
        do {file12 = try AKAudioFile(readFileName: "Threshold 3 [1100].wav")} catch {print("file_12 assertion error")}
        do {player12 = try AKAudioPlayer(file: file12!)} catch {print("player assetion error")}
        player12!.fadeInTime = 0.1
        player12!.fadeOutTime = 3
        
        do {file13 = try AKAudioFile(readFileName: options[12])} catch {print("file_13 assertion error")}
        do {player13 = try AKAudioPlayer(file: file13!)} catch {print("player assetion error")}
        player13!.fadeInTime = 0.1
        player13!.fadeOutTime = 3
        
        do {file14 = try AKAudioFile(readFileName: options[13])} catch {print("file_14 assertion error")}
        do {player14 = try AKAudioPlayer(file: file14!)} catch {print("player assetion error")}
        player14!.fadeInTime = 0.1
        player14!.fadeOutTime = 3
        
        do {file15 = try AKAudioFile(readFileName: options[14])} catch {print("file_15 assertion error")}
        do {player15 = try AKAudioPlayer(file: file15!)} catch {print("player assetion error")}
        player15!.fadeInTime = 0.1
        player15!.fadeOutTime = 3
        
        do {file16 = try AKAudioFile(readFileName: options[15])} catch {print("file_16 assertion error")}
        do {player16 = try AKAudioPlayer(file: file7!)} catch {print("player assetion error")}
        player16!.fadeInTime = 0.1
        player16!.fadeOutTime = 3
    }

    func choose() {
        let randomIndex = Int((arc4random_uniform(UInt32(options.count))))
        choice = randomIndex
    }
    
    func playRandom(){
        choose()
        
        if choice == 0 {
            player1!.start()
            duration = file1!.duration
        } else if choice == 1 {
            player2!.start()
            duration = file2!.duration
        } else if choice == 2 {
        player3!.start()
            duration = file3!.duration
        } else if choice == 3 {
        player4!.start()
            duration = file4!.duration
        } else if choice == 4 {
        player5!.start()
            duration = file5!.duration
        } else if choice == 5 {
            player6!.start()
            duration = file6!.duration
        } else if choice == 6 {
            player7!.start()
            duration = file7!.duration
        } else if choice == 7 {
            player8!.start()
            duration = file8!.duration
        } else if choice == 8 {
            player9!.start()
            duration = file9!.duration
        } else if choice == 9 {
            player10!.start()
            duration = file10!.duration
        } else if choice == 10 {
            player11!.start()
            duration = file11!.duration
        } else if choice == 11 {
            player12!.start()
            duration = file12!.duration
        } else if choice == 12 {
            player13!.start()
            duration = file13!.duration
        } else if choice == 13 {
            player14!.start()
            duration = file14!.duration
        } else if choice == 14 {
            player15!.start()
            duration = file15!.duration
        } else if choice == 15 {
            player16!.start()
            duration = file16!.duration
        } else {print(choice)}
    }
    
}

