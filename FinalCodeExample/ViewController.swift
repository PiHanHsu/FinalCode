//
//  ViewController.swift
//  FinalCodeExample
//
//  Created by PiHan Hsu on 7/21/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputNumberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var remainingNumberLable: UILabel!
    
    var finalCode: Int?
    var inputCode: Int?
    var topCode: Int?
    var bottomCode: Int?
    var playerList = ["Alex", "Jeff", "YoMing", "PiHan", "George", "Crystal"]
    var playerIndex = 0
    
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFinalCode()
    }

    func createFinalCode() {
        finalCode = Int(arc4random_uniform(UInt32(99))+1)
        topCode = 100
        bottomCode = 0
        resetButton.enabled = false
        resultLabel.text = "0 < 100"
        remainingNumberLable.text = "100"
        playerIndex = Int(arc4random_uniform(UInt32(playerList.count)))
        playerNameLabel.text = playerList[playerIndex]
    }
    
    @IBAction func confirmButtonPressed(sender: AnyObject) {
        inputCode = Int(inputNumberTextField.text!)
        inputNumberTextField.text = ""
        
        if inputCode == finalCode {
            let title = "\(playerList[playerIndex]) 你輸了！"
            let alert = UIAlertController(title: title, message: "請接受處罰", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            let newGame = UIAlertAction(title: "New Game", style: .Default, handler: { (UIAlertAction) in
                self.createFinalCode()
            })
            alert.addAction(okAction)
            alert.addAction(newGame)
            presentViewController(alert, animated: true, completion: nil)
            resultLabel.text = String(finalCode!)
            remainingNumberLable.text = "0"
            resetButton.enabled = true
            return
        }else if inputCode > finalCode {
            topCode = inputCode
            resultLabel.text = "\(bottomCode!) < \(topCode!)"
        }else if inputCode < finalCode {
            bottomCode = inputCode
            resultLabel.text = "\(bottomCode!) < \(topCode!)"
        }
        
        if playerIndex < playerList.count - 1 {
            playerIndex += 1
        }else {
            playerIndex = 0
        }
        
        playerNameLabel.text = playerList[playerIndex]
        remainingNumberLable.text = "\(topCode! - bottomCode! - 1)"
        
        
    }
    
    @IBAction func resetButtonPressed(sender: AnyObject) {
        createFinalCode()
    }
    
    //TODO 1: Adjust Layout to make it look better
    //hint: Adjust the font size, color, position,...
    
    //TODO 2: Create a player list and a label to show which player is guessing
    // the playing player should be a circle, ex: 1 -> 2 -> 3 -> 1 -> 2
    // every single game can have a new order.
    
    //TODO 3: The Result label should show who is the loser
    
    //TODO 4: display how many numbers players can guess
    
    //TODO 5: use your creation to add a few feature
    // EX: each player can have 2 crads "return" / "pass"
    // each player can use these 2 cards once each game


}

