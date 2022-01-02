//
//  NewsSearchRequest.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import Foundation

struct NewsSearchRequest {
  
  let country: String
  let categories: [String]
  let pageNumber: Int
  let pageSize: Int
}
