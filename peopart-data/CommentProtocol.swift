//
//  CommentProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

protocol CommentProtocol {
  var id : UUID { get }
  var postId : UUID { get }
  var userId : UUID { get }
  var text : String { get }
  var date : Date { get }
}
