//
//  cowsAndBulls.swift
//  CowsAndBulls
//
//  Created by Bharg Sharma on 17/7/18.
//  Copyright © 2018 Bharg Sharma. All rights reserved.
//

import Foundation

public struct Response {
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

func check(parsedInput: [Int], secretNum: [Int]) -> Response {
  return Response.init(bulls: 0, cows: 0)
}
