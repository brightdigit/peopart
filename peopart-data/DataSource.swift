//
//  DataSource.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation
public enum DataSource {
  case bundle(Bundle, withResource: String?, andExtension: String?)
  case url(URL)
  case data(Data)
  
  func getData () throws -> Data {
    switch (self) {
      
    case .bundle(let bundle, let resource, let ext):
      guard let url = bundle.url(forResource: resource, withExtension: ext) else {
        throw DataSourceError.missingResource(bundle, withResource: resource, andExtension: ext)
      }
      return try Data(contentsOf: url)
    case .url(let url):
      return try Data(contentsOf: url)
    case .data(let data):
      return data
    }
  }
}
