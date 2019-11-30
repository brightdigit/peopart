//
//  ContentView.swift
//  Peopart_iOS_Framework
//
//  Created by Leo Dion on 11/28/19.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var data : DataObject
  
    var body: some View {
      TabView{
        UserListView().tabItem {
          Image("User").renderingMode(.template)
          Text("Users")
        }
        PostListView().tabItem {
          Image("Post").renderingMode(.template)
          Text("Posts")
        }
        NavigationView{
          Text("Comments").navigationBarTitle("Comments")
        }.tabItem {
          Image("Comment").renderingMode(.template)
          Text("Comments")
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
