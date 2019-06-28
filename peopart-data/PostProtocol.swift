//
//  PostProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

protocol PostProtocol : AnyPost {
  /**
   Post author user id.
   */
  var userId : UUID { get }
  /**
   Post id.
   */
  var id : UUID { get }
  /**
   Title of the post.
   */
  var title : String { get }
  /**
   Image for the post.
   */
  var image: URL { get }
  /**
   Text of the post.
   */
  var text: String { get }
  /**
   Publish data of the post.
   */
  var date: Date { get }
}
