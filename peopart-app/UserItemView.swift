//
//  UserItemView.swift
//  peopart-app
//
//  Created by Leo Dion on 7/1/22.
//  Copyright © 2022 Leo Dion. All rights reserved.
//

import SwiftUI
struct UserItemView: View {
  let user : UserEmbeddedViewModel
    var body: some View {
      HStack{
        RemoteImageView(url: user.object.user.avatar) {
          Rectangle()
        } image: { image in
          image.resizable()
        }.frame(width: 100.0, height: 100.0).padding()
        VStack(alignment: .leading){
          Text(user.object.user.name).font(.largeTitle).lineLimit(1)
          Text(user.object.user.badge).font(.subheadline).lineLimit(1)
          Text(user.object.summary).lineLimit(1)
        }
      }
    }
}

struct UserItemView_Previews: PreviewProvider {
    static var previews: some View {
      UserItemView(user:
                    UserEmbeddedViewModel(object:
                    PreviewUserEmbedded(id: .init(), name: "john_doe", avatar: .init(string: "https://i.picsum.photos/id/215/300/300.jpg?hmac=fbcOUjHvJU-TDq0Lsbc_lPoR8aKijF4nXbuUlKTDvKw")!, badge: "Hello World", children: [.init(id: .init(), title: "Yep", image: .init(string: "https://i.picsum.photos/id/215/300/300.jpg?hmac=fbcOUjHvJU-TDq0Lsbc_lPoR8aKijF4nXbuUlKTDvKw")!, text: "Hello World", date: .init())])))
    }
}
