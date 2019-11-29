//
//  ContentView.swift
//  Peopart_iOS_Framework
//
//  Created by Leo Dion on 11/28/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TabView{
        NavigationView{
          Text("Users").navigationBarTitle("Users")
        }.tabItem {
          Image("User").renderingMode(.template)
          Text("Users")
        }
        NavigationView{
          Text("Posts").navigationBarTitle("Posts")
        }.tabItem {
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
