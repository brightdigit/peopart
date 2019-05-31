//
//  PostProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

protocol PostProtocol {  
  var userId : UUID { get }
  var id : UUID { get }
  var title : String { get }
  var image: URL { get }
  var text: String { get }
  var date: Date { get }
}
