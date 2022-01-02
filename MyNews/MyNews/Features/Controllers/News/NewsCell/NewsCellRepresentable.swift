//
//  NewsCellRepresentable.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import Foundation

// MARK: - NewsCellRepresentable
//
protocol NewsCellRepresentable {
  
  var title: String? { get }
  var description: String? { get }
  var date: String? { get }
  var source: String? { get }
  var imageURL: String? { get }
  var isFavorite: Bool? { get }
}

