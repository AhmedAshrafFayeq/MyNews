//
//  APIError.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import Foundation

// MARK: - APIError
enum APIError : String, Error {
    case noInternet = "Please check the internet connection"
    case notFound   = "No data found or page removed"
}

