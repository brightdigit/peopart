//
//  DataSource.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation
/**
 Defines the source of the Database.
 */
public enum DataSource {
  /**
   DataSource which includes the bundle, resource name, and extension.
   */
  case bundle(Bundle, withResource: String?, andExtension: String?)
  /**
   DataSource which is just the direct url.
   */
  case url(URL)
  /**
   DataSource which is the raw data.
   */
  case data(Data)
  
  /**
   Returns the raw data of the DataSource.
   
   - Throws: `DataSourceError.missingResource`
   if there is no url for the resource.
   
   - Throws: An error in the Cocoa domain, if `url` cannot be read.
   */
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
