//
//  main.swift
//  MockingbirdCli
//
//  Created by Andrew Chang on 8/4/19.
//  Copyright © 2019 Bird Rides, Inc. All rights reserved.
//

import Foundation

func main(arguments: [String]) -> Int32 {
  let program = Program(usage: "<method>",
                        overview: "Mockingbird mock generator",
                        commands: [GenerateCommand.self,
                                   InstallCommand.self,
                                   UninstallCommand.self,
                                   TestbedCommand.self,
                                   VersionCommand.self])
  return program.run(with: arguments)
}

exit(main(arguments: ProcessInfo.processInfo.arguments))
