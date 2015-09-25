//
//  GameControllerViewController.swift
//  MasterMind
//
//  Created by rony klein on 8/11/15.
//  Copyright (c) 2015 rony klein. All rights reserved.
//

import UIKit

class GameControllerViewController: UIViewController {
   
    
    var currentColor = UIColor.blueColor()
    
    var moves = 0
    var rowActive = 0
    var gameOver = false
    var Level = levels.easy
    
    var gameBullPgia = [bullPgia](count: 4, repeatedValue: bullPgia.empty)
    
        var game = GameManager()
        var game2 = GameManager2()
    var currentNumber = 0
    
    var currentSelection = [Int](count: 4, repeatedValue: -1)
    
    @IBOutlet var brickgroup: [UIImageView]!
    
    @IBAction func SubmitAction(sender: UIButton) {
        
    
        if (!gameOver){
        //brickgroup[1].image = UIImage(named: "pgia")
            
            if (currentSelection[0] != currentSelection[1]) && (currentSelection[0] != currentSelection[2]) && (currentSelection[0] != currentSelection[3]) && (currentSelection[1] != currentSelection[2]) && (currentSelection[1] != currentSelection[3]) && (currentSelection[2] != currentSelection[3]) && (currentSelection[0] != -1) && (currentSelection[1] != -1) && (currentSelection[2] != -1) && (currentSelection[3] != -1) {
                if Level == .easy {
               gameBullPgia = game.checkNumbers(num2: currentSelection)
                }
                else {
                    gameBullPgia = game2.checkNumbers(num2: currentSelection)
                }
                    drawBullPgia(bullpgia: gameBullPgia)
                rowActive += 4
                moves++
                if rowActive > 51 {
                    gameOver = true
                }
                currentSelection = [Int](count: 4, repeatedValue: -1)
                if gameBullPgia == [bullPgia.bull,.bull,.bull,.bull] {
                    gameOver = true
                    winLabel.text = "you guested in \(moves) moves"
                }
            }
        }
    }
    
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var winLabel: UILabel!
    
    
    @IBAction func SetColorsAction(sender: UIButton) {
        if !gameOver {
        currentColor = sender.backgroundColor!
        currentNumber = sender.tag
        }
    }
    @IBAction func gameButtonsAction(sender: UIButton) {
        if (sender.tag >= rowActive) && (sender.tag < rowActive + 4) && (!gameOver){
            sender.backgroundColor = currentColor
        currentSelection[sender.tag - rowActive] = currentNumber
        }
        
        
    }
    @IBOutlet var gamebuttons: [UIButton]!
    var Leveltype = levels.easy
    func drawBullPgia(bullpgia array : [bullPgia]) {
        var count = 0
        var name = ""
        for(var i = 0 ; i<4 ; i++){
            for im in brickgroup {
                if (im.tag == (rowActive + count)) {
                    if array[count] != bullPgia.empty {
                        if array[count] == bullPgia.pgia {
                            name = "pgia"
                        }
                        else {name = "bull"}
                        im.image = UIImage(named: name)
                    }
                }
            }
            count++
            
        }
    }
override func viewDidLoad() {
        super.viewDidLoad()
        
        //for(var i = 2;i<5;i++){
        for b in self.buttons{
           b.layer.cornerRadius = 15
        }
        for gb in self.gamebuttons{
            gb.layer.cornerRadius = 10
        }
        // Do any additional setup after loading the view.
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
