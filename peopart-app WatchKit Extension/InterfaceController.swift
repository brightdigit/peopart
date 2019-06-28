//
//  InterfaceController.swift
//  peopart-app WatchKit Extension
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
  var dataType : DataFetcher? = MenuItemFetcher()
  var items : [MenuItem]? = nil
  
  @IBOutlet weak var table: WKInterfaceTable!
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    if let itemType = context as? MenuItem, let dataType = itemType.dataType {
      self.dataType = dataType
    }
    
    // Configure interface objects here.
    dataType?.fetch { (result) in
      self.items = try? result.get()
      DispatchQueue.main.async {
        self.reload()
      }
    }
  }
  
  func reload () {
    guard let items = self.items else {
      return
    }
    table.setNumberOfRows(items.count, withRowType: "row")
    
    for (index, item) in items.enumerated() {
      item.controller(self, table: table, configureRowAtIndex: index)
    }
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  
  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    guard let item = items?[rowIndex] else {
      return
    }
    
    item.controller(self, table : table, didSelectRowAt: rowIndex)
  }
}
