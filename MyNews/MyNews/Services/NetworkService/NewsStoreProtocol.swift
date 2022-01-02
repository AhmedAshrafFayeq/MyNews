//
//  NewsStoreProtocol.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import Foundation

// MARK: - Typealias
typealias StoreNewsCompletionHandler = (Result<NewsResponse, Error>) -> Void
typealias  AddFavoriteNewsCompletion = ((Result<Bool, GeneralError>) -> Void)

// MARK: - NewsStoreProtocol
//
protocol NewsStoreProtocol {
  
  var remote: NewsRemoteProtocol? {get set}
  
  /// Fetch headlines
  ///
  func getHeadlines(request: NewsSearchRequest, searchWord: String, complitionHandler: @escaping StoreNewsCompletionHandler)
  
  /// Get news from local storage
  ///
  func fetchNews(completion: @escaping ([StorageNews]?, Error?) -> Void)
  
  /// Add article to favorite
  ///
  func addFavorite(article: StorageNews, onCompletion: @escaping  AddFavoriteNewsCompletion)
  
  /// Delete article
  ///
  func deleteArticle(article: StorageNews, onCompletion: @escaping  AddFavoriteNewsCompletion)
  
  func isFavorite(article: StorageNews) throws -> Bool
}
