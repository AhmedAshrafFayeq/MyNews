//
//  NewsStore.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import Foundation

// MARK: - NewsStore
//
class NewsStore: NewsStoreProtocol {
  
  // MARK: - Properties
  
  var remote: NewsRemoteProtocol?
  let storageManager = RealmStorage()
  
  // MARK: - Init
  
  init(remote: NewsRemoteProtocol) {
    self.remote = remote
  }
  
  // MARK: - Handlers
  
  func getHeadlines(request: NewsSearchRequest, searchWord: String, complitionHandler: @escaping StoreNewsCompletionHandler) {
    remote?.getHeadlines(request: request, searchWord: searchWord) { response, error in
      guard let response = response, error == nil else {
        complitionHandler(.failure(error ?? GeneralError()))
        return
      }
      
      complitionHandler(.success(response))
    }
  }
  
  func isFavorite(article: StorageNews) throws -> Bool {
    return try storageManager.checkObjectIsExistInDB(StorageNews.self, key: article.url)
  }
}

// MARK: News Handlers

// TODO: TO BE USED WHEN START CACHING and PAGINATION WITH REALM
extension NewsStore {
  
  func getAllNews(request: NewsSearchRequest, searchWord: String, complitionHandler: @escaping ([StorageNews]?, Error?) -> Void) {
    
    let isNetworkAvailable = Reachability.isConnectedToNetwork()
    isNetworkAvailable ? updateNewsThenFetch(request: request, searchWord: searchWord, completion: complitionHandler) : fetchNews(completion: complitionHandler)
    
  }
  
  func updateNewsThenFetch(request: NewsSearchRequest, searchWord: String, completion: @escaping ([StorageNews]?, Error?) -> Void ) {
    
    getHeadlines(request: request, searchWord: searchWord) { [weak self] result in
      switch result {
      case .success(let newsResponse):
        DispatchQueue.main.async {
          newsResponse.articles?.forEach {
            try? self?.storageManager.insertNewObject(object: $0.storageNews)
          }
          self?.fetchNews(completion: completion)
        }
      case .failure(let error):
        completion(nil, error)
      }
    }
  }
  
  func fetchNews(completion: @escaping ([StorageNews]?, Error?) -> Void) {
    let news = storageManager.allObjects(ofType: StorageNews.self)
    guard !news.isEmpty else {
      completion(nil, GeneralError())
      return
    }
    completion(news, nil)
  }
}

// MARK: - Favorite Handlers
//
extension NewsStore {
  
  /// add new article to favorite
  func addFavorite(article: StorageNews, onCompletion: @escaping  AddFavoriteNewsCompletion) {
    do {
      try storageManager.insertNewObject(object: article)
      onCompletion(.success(true))
    } catch {
      assertionFailure("Something went wrong. Error: \(error)")
      onCompletion(.failure(.init()))
    }
  }
  
  func deleteArticle(article: StorageNews, onCompletion: @escaping  AddFavoriteNewsCompletion) {
    storageManager.deleteObject(article, key: article.url)
    onCompletion(.success(true))
  }
}




// MARK: - GeneralError
//
extension GeneralError: LocalizedError {
  
  public var errorDescription: String? {
    return "Something went wrong!"
  }
}

// MARK: - GeneralError
//
public struct GeneralError: Error {
  
  public init() { }
}
