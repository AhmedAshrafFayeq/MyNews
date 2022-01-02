//
//  NewsRemoteProtocol.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import Foundation

// MARK: - Typealias
typealias RemoteNewsCompletionHandler = (NewsResponse?, Error?) -> Void

// MARK: - NewsRepoProtocol
//
protocol NewsRemoteProtocol {
  
  var network: Networkable? {get set}
  
  /// Fetch headlines
  ///
  func getHeadlines(request: NewsSearchRequest, searchWord: String, completionHandler: @escaping RemoteNewsCompletionHandler)
}

