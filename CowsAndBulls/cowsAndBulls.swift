//
//  cowsAndBulls.swift
//  CowsAndBulls
//
//  Created by Bharg Sharma on 17/7/18.
//  Copyright © 2018 Bharg Sharma. All rights reserved.
//

import Foundation

//let secretLength: Int = 5

public struct Response: Equatable {
  public let bulls: Int
  public let cows: Int
}

public struct Game {
  public let secretNumber: [Int]
  public let secretLength: Int
  
  init(secretLength: Int) {
    self.secretLength = secretLength
    self.secretNumber = generateSecretNumber(secretLength)
  }
  
  public func didUserWin(_ response: Response) -> Bool {
    return response.bulls == secretLength
  }
  
  func parsing(_ userInput: String) -> [Int]? {
    let validOutputArray = userInput.makeIterator().compactMap(checkConvertToInt)
    if (validOutputArray.count == secretLength && validOutputArray.count == userInput.count) {
      return validOutputArray
    }
    return nil
  }

}

public func response(_ response: Response) -> String {
  return "\(response.bulls) bulls, \(response.cows) cows"
}



func generateSecretNumber(_ secretLength: Int) -> [Int] {
  //let secretNum = [1, 2, 3, 4]
  var secretNum: [Int] = []
  for _ in 1...secretLength {
    secretNum.append(Int(arc4random_uniform(10)))
  }
  return secretNum
}

func checkConvertToInt(_ input: Character) -> Int? {
  let intDict: [Character: Int] = ["0": 0, "1": 1,"2": 2,"3": 3,"4": 4,"5": 5,"6": 6, "7": 7,"8": 8,"9": 9]
  return intDict[input]
}

public func check(parsedInput: [Int], secretNum: [Int]) -> Response {
  var (bullsCount, nonMatchingGuess, nonMatchingSecret) = helperCheck(parsedInput: parsedInput, secretNum: secretNum)
  nonMatchingGuess.sort()
  nonMatchingSecret.sort()
  nonMatchingGuess = nonMatchingGuess.filter { nonMatchingSecret.contains($0) }
  nonMatchingSecret = nonMatchingSecret.filter { nonMatchingGuess.contains($0) }
  let (cowsCount, _, _) = helperCheck(parsedInput: nonMatchingGuess, secretNum: nonMatchingSecret)
  return Response.init(bulls: bullsCount, cows: cowsCount)
}

func helperCheck(parsedInput: [Int], secretNum: [Int]) -> (Int, [Int], [Int]) {
  var count = 0
  var nonMatchingGuess: [Int] = []
  var nonMatchingSecret: [Int] = []
  for (index, guessNumber) in parsedInput.enumerated() {
    if guessNumber == secretNum[index] {
      count += 1
    }
    else {
      nonMatchingGuess.append(guessNumber)
      nonMatchingSecret.append(secretNum[index])
    }
  }
  return (count, nonMatchingGuess, nonMatchingSecret)
}
