//
//  MainController.swift
//  MasterMind
//
//  Created by rony klein on 9/20/15.
//  Copyright (c) 2015 rony klein. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextVC = segue.destinationViewController as! GameControllerViewController
        if segue.identifier == "startId"{
            //nextVC is an viewController of the type of CollectionViewGameBoardViewController
            //pushing the names of the players to the next controller
            nextVC.Level = levels.easy
        }
        else if segue.identifier == "hardId"{
            nextVC.Level = levels.hard
        }
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
