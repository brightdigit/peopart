//
//  DataSourceError.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 Error enum for when there is no url for the resource.
 */
public enum DataSourceError : Error {
  /**
   Error enum for when there is no url for the resource.
   */
  case missingResource(Bundle, withResource: String?, andExtension: String?)
}
