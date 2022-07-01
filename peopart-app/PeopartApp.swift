//
//  PeopartApp.swift
//  peopart-app
//
//  Created by Leo Dion on 7/1/22.
//  Copyright © 2022 Leo Dion. All rights reserved.
//

import SwiftUI

#if !USE_UIKIT
@main
struct PeopartApp : App {}
#else
struct PeopartApp : App {}
#endif


extension PeopartApp {
  var body: some Scene {
    WindowGroup {
      TabView{
        UserListView().tabItem {
          Label {
            Text("Users")
          } icon: {
            Image(systemName: "person.3.fill")
          }
        }
        PostListView().tabItem {
          Label {
            Text("Posts")
          } icon: {
            Image(systemName: "note.text")
          }
        }
      }.environmentObject(DataEnvironmentObject(database: Database.shared))
    }
  }
}
