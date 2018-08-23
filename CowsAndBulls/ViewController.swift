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
  var secret:[Int] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    inputField.addTarget(self, action: #selector(ViewController.someMethod), for: UIControlEvents.editingChanged)
    
    secret = secretNumber()
  }
  
  @objc func someMethod() {
    if let input = inputField.text {
      if let guess = parsing(input) {
        let r = check(parsedInput: guess, secretNum: secret)
        let userWin = didUserWin(r)
        if userWin {
          result.text = "YOU WON!"
        }
        else {
          result.text = response(r)
        }
      }
    }
//    result.text = ""
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  

}

