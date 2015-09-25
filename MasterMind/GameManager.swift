//
//  GameManager.swift
//  MasterMind
//
//  Created by rony klein on 8/19/15.
//  Copyright (c) 2015 rony klein. All rights reserved.
//

import UIKit


enum bullPgia {
    case bull
    case pgia
    case empty
}
enum levels {
    case easy
    case hard
}
class GameManager: NSObject {
    var computerColor = [Int](count: 4, repeatedValue: 0)
    var oknum = false

    override init() {
        super.init()
    }
    
    func setLevel(level:levels) {
        var number1 = 0
        var number2 = 0
        var number3 = 0
        var number4 = 0
        var numberofcolors = (level == levels.easy ? 6 : 10)
        
        while !oknum {
            number1 = random() % numberofcolors
            number2 = random() % numberofcolors
            if number1 != number2 {
                oknum = true
            }
        }
        oknum = false
        while !oknum {
            number3 = random() % numberofcolors
            if (number3 != number1) && (number3 != number2) {
                oknum = true
            }
        }
        oknum = false
        while !oknum {
            number4 = random() % numberofcolors
            if (number4 != number1) && (number4 != number2) && (number4 != number3){
                oknum = true
            }
        }
        
        
        self.computerColor[0] = number1
        self.computerColor[1] = number2
        self.computerColor[2] = number3
        self.computerColor[3] = number4
    }

    func checkNumbers(num2 secondNumber:[Int]) -> [bullPgia]{
        var bullHit = [bullPgia](count: 4, repeatedValue: bullPgia.empty)
        var count = 0
        for i in 0...3{
            if self.computerColor[i] == secondNumber[i] {
                bullHit[count] = bullPgia.bull
                count++
            }
        }
        for(var i = 0 ;i<4; i++ ){
            for(var j = 0  ; j<4  ; j++){
                if ((i != j) && (self.computerColor[i] == secondNumber[j])){
                    bullHit[count] = bullPgia.pgia
                    count++
                    
                }
                
            }
        }
        return bullHit
    }
}
