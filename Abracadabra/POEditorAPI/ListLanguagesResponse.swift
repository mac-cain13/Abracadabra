//
//  ListLanguagesResponse.swift
//  Abracadabra
//
//  Created by Mathijs Kadijk on 24-02-17.
//  Copyright © 2017 Mathijs Kadijk. All rights reserved.
//

import Foundation

struct ListLanguagesResponse {
  let result: Result

  struct Result {
    let languages: [Language]

    struct Language {
      let name: String
      let code: String
      let percentage: Double
    }
  }
}
