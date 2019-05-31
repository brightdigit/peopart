//
//  DataSourceError.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

public enum DataSourceError : Error {
  case missingResource(Bundle, withResource: String?, andExtension: String?)
}
