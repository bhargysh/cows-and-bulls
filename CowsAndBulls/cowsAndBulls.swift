//
//  cowsAndBulls.swift
//  CowsAndBulls
//
//  Created by Bharg Sharma on 17/7/18.
//  Copyright © 2018 Bharg Sharma. All rights reserved.
//

import Foundation

public struct Response: Equatable {
  public let bulls: Int
  public let cows: Int
}

public func response(_ response: Response) -> String {
  return "\(response.bulls) bulls, \(response.cows) cows"
}

func secretNumber() -> [Int] {
  let secretNum = [1, 2, 3, 4]
  return secretNum
}

func parsing(_ userInput: String) -> [Int]? {
  return nil
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
