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
    var duration = 0.0
    
    var file1 : AKAudioFile?
    var file2 : AKAudioFile?
    var file3 : AKAudioFile?
    var file4 : AKAudioFile?
    var file5 : AKAudioFile?
    var file6 : AKAudioFile?
    var file7 : AKAudioFile?
    var file8 : AKAudioFile?
    
    var player1 : AKAudioPlayer?
    var player2 : AKAudioPlayer?
    var player3 : AKAudioPlayer?
    var player4 : AKAudioPlayer?
    var player5 : AKAudioPlayer?
    var player6 : AKAudioPlayer?
    var player7 : AKAudioPlayer?
    var player8 : AKAudioPlayer?

    let options = ["[0011] low.wav",
                   "[0011] low 2.wav",
                   "[0011] low 3.wav",
                   "[0011] low 4.wav",
                   "[0011] low 5.wav",
                   "[0011] low 6.wav",
                   "[0011] low 7.wav",
                   "[0011] low 8.wav"]
    
    func prepare(){
        
        do {file1 = try AKAudioFile(readFileName: options[0])} catch {print("file_1 assertion error")}
        do {player1 = try AKAudioPlayer(file: file1!)} catch {print("player assetion error")}
        player1!.fadeInTime = 0.1
        player1!.fadeOutTime = 3
        
        do {file2 = try AKAudioFile(readFileName: options[1])} catch {print("file_2 assertion error")}
        do {player2 = try AKAudioPlayer(file: file2!)} catch {print("player assetion error")}
        player2!.fadeInTime = 0.1
        player2!.fadeOutTime = 3
        
        do {file3 = try AKAudioFile(readFileName: options[2])} catch {print("file_3 assertion error")}
        do {player3 = try AKAudioPlayer(file: file3!)} catch {print("player assetion error")}
        player3!.fadeInTime = 0.1
        player3!.fadeOutTime = 3
        
        do {file4 = try AKAudioFile(readFileName: options[3])} catch {print("file_4 assertion error")}
        do {player4 = try AKAudioPlayer(file: file4!)} catch {print("player assetion error")}
        player4!.fadeInTime = 0.1
        player4!.fadeOutTime = 3
        
        do {file5 = try AKAudioFile(readFileName: options[4])} catch {print("file_5 assertion error")}
        do {player5 = try AKAudioPlayer(file: file5!)} catch {print("player assetion error")}
        player5!.fadeInTime = 0.1
        player5!.fadeOutTime = 3
        
        do {file6 = try AKAudioFile(readFileName: options[5])} catch {print("file_6 assertion error")}
        do {player6 = try AKAudioPlayer(file: file6!)} catch {print("player assetion error")}
        player6!.fadeInTime = 0.1
        player6!.fadeOutTime = 3
        
        do {file7 = try AKAudioFile(readFileName: options[6])} catch {print("file_7 assertion error")}
        do {player7 = try AKAudioPlayer(file: file7!)} catch {print("player assetion error")}
        player7!.fadeInTime = 0.1
        player7!.fadeOutTime = 3
        
        do {file8 = try AKAudioFile(readFileName: options[7])} catch {print("file_8 assertion error")}
        do {player8 = try AKAudioPlayer(file: file8!)} catch {print("player assetion error")}
        player8!.fadeInTime = 0.1
        player8!.fadeOutTime = 3
    }
    
    func choose() {
        let randomIndex = Int(arc4random_uniform(UInt32(options.count)))
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
        } else {print(choice)}
    }



}
