//
//  NewsFilter.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import Foundation

struct NewsFilter: Codable {
  var country: Country
  var categories: Set<Category>
}
