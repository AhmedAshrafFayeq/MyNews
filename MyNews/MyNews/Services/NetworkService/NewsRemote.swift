//
//  NewsRemote.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import Foundation

// MARK: - NewsRemote
//
class NewsRemote: NewsRemoteProtocol {
  
  var network: Networkable?
  
  init(network: Networkable) {
    self.network = network
  }
  
  func getHeadlines(request: NewsSearchRequest, searchWord: String, completionHandler: @escaping RemoteNewsCompletionHandler) {
    
    let target: NewsAPI = .topheadlines(request: request, searchWord: searchWord)
    network?.fetchData(target: target, complitionHandler: completionHandler)
  }
}

