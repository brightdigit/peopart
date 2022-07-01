//
//  PostItemView.swift
//  peopart-app
//
//  Created by Leo Dion on 7/1/22.
//  Copyright © 2022 Leo Dion. All rights reserved.
//

import SwiftUI

struct PostItemView: View {
  let post: PostEmbeddedViewModel
  var body: some View {
    VStack(alignment: .leading){
      RemoteImageView(url: post.object.post.image) {
        Rectangle()
      } image: { image in
        image.resizable()
      }.frame(height: 100.0)
      HStack{
        
        RemoteImageView(url: post.object.author.avatar) {
          Rectangle()
        } image: { image in
          image.resizable()
        }.frame(width: 100.0, height: 100.0)
        Text(post.object.author.name)
        Spacer()
      }
      HStack{
        Text(post.object.title)
        
        Text(post.object.post.date.description)
        
      }.lineLimit(1)
      
      
      Text(post.object.post.text).lineLimit(3)
      
      Text("Label")
      
      
    }
  }
}
  struct PostItemView_Previews: PreviewProvider {
    static var previews: some View {
      PostItemView(post: .init(object: PreviewPostEmbedded(userId: .init(), id: .init(), image: .init(string: "https://i.picsum.photos/id/215/300/300.jpg?hmac=fbcOUjHvJU-TDq0Lsbc_lPoR8aKijF4nXbuUlKTDvKw")!, text: "Hello World", date: .init(), name: "Hello World", avatar: .init(string: "https://i.picsum.photos/id/215/300/300.jpg?hmac=fbcOUjHvJU-TDq0Lsbc_lPoR8aKijF4nXbuUlKTDvKw")!, badge: "Hello World", comments: [])))
    }
  }
