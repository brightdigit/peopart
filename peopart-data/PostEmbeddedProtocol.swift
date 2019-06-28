//
//  PostEmbeddedProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

protocol PostEmbeddedProtocol : AnyPost{
  var post : PostProtocol { get }
  var author : UserProtocol { get }
  var comments : [CommentProtocol] { get }
}

extension PostEmbeddedProtocol {
  var title: String {
    return post.title
  }
}
