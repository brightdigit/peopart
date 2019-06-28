//
//  DateFormatter.swift
//  peopart-app
//
//  Created by Leo Dion on 6/28/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

fileprivate let dateFormatString = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"

fileprivate let _customDateFormatter : DateFormatter = {
  formatString in
  let formatter = DateFormatter()
  formatter.dateFormat = formatString
  return formatter
}(dateFormatString)

extension DateFormatter {
  /**
    DateFormatter for Application.
  */
  static var custom : DateFormatter {
    return _customDateFormatter
  }
}
