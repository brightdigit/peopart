//
//  DataSet.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
  Codable structure based on the JSON data.
 */
public struct Dataset : Codable {
  /**
   List of users in the dataset.
   */
  let users : [User]
}
