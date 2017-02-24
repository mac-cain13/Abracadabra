//
//  main.swift
//  Abracadabra
//
//  Created by Mathijs Kadijk on 24-02-17.
//  Copyright © 2017 Mathijs Kadijk. All rights reserved.
//

import Foundation

let pushOption = BoolOption(longFlag: "push", helpMessage: "Push base language terms from project to POEditor")
let pullOption = BoolOption(longFlag: "pull", helpMessage: "Pull in translations from POEditor into the project")
// TODO: Add project file option
let apiTokenOption = StringOption("t", "apiToken", true, "POEditor API token, can be obtained at https://poeditor.com/account/api")
let projectIdOption = IntOption("p", "projectID", true, "POEditor project identifier, can be found at https://poeditor.com/account/api")

let cli = CommandLine()
cli.addOptions(pushOption, pullOption, apiTokenOption, projectIdOption)

do {
  try cli.parse()

  guard let apiToken = apiTokenOption.value, let projectId = projectIdOption.value else {
    cli.printUsage()
    exit(EX_USAGE)
  }
  let poEditorAPI = POEditorAPI(token: apiToken)

  if pushOption.value {
    try push(projectId: projectId, api: poEditorAPI)
  }

  if pullOption.value {
    try pull(projectId: projectId, api: poEditorAPI)
  }

  print("🎩 Abracadabra finished running.")
} catch {
  cli.printUsage(error)
  exit(EX_USAGE)
}
