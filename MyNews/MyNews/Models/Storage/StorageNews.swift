//
//  StorageNews.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import Foundation
import RealmSwift

// MARK: - StorageNews
//
final class StorageNews: Object {
  
  @objc dynamic var author: String = ""
  @objc dynamic var title: String = ""
  @objc dynamic var articleDescription: String = ""
  @objc dynamic var url: String = ""
  @objc dynamic var urlToImage: String = ""
  @objc dynamic var publishedAt: String = ""
  @objc dynamic var content: String = ""
  @objc dynamic var sourceNewsID: String = ""
  @objc dynamic var sourceNewsName: String = ""
  @objc dynamic var isFavorite: Bool = false
  override static func primaryKey() -> String? {
    return "url"
  }
}
