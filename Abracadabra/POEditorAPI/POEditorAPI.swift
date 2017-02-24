//
//  POEditorAPI.swift
//  Abracadabra
//
//  Created by Mathijs Kadijk on 24-02-17.
//  Copyright © 2017 Mathijs Kadijk. All rights reserved.
//

import Foundation

class POEditorAPI {
  private static let baseURL = URL(string: "https://api.poeditor.com/v2/")!
  private let token: String

  init(token: String) {
    self.token = token
  }

  func listLanguages(projectId: Int) throws -> ListLanguagesResponse {
    fatalError()
  }
}
