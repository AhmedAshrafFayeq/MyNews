//
//  NewsFilterDelegate.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import UIKit

// MARK: - NewsFilterDelegate - Delegate when finish data filtering
//
protocol NewsFilterDelegate: class {
  
  /// When search button tapped
  ///
  func newsFilter(viewController: NewsFilterViewController, didTappedSearch button: UIButton, with result: NewsFilter)
}

