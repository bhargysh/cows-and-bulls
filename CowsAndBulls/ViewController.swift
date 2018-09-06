//
//  ViewController.swift
//  CowsAndBulls
//
//  Created by Bharg Sharma on 17/7/18.
//  Copyright © 2018 Bharg Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var inputField: UITextField!
  @IBOutlet weak var result: UILabel!
  //var secret:[Int] = []
  var game: Game?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    inputField.addTarget(self, action: #selector(ViewController.someMethod), for: UIControlEvents.editingChanged)
    
    game = Game.init(secretLength: 5)
    
  }
  
  @objc func someMethod() {
    if let input = inputField.text, let game = self.game, let guess = game.parsing(input) {
      let r = check(parsedInput: guess, secretNum: game.secretNumber)
      let userWin = game.didUserWin(r)
      if userWin {
        result.text = "YOU WON!"
      }
      else {
        result.text = r.description
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  

}

