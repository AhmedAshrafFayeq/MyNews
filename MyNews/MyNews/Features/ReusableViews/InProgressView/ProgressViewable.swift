//
//  ProgressViewable.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//
import UIKit

// MARK: - ProgressViewable
//
protocol ProgressViewable {
    
    /// Default `ProgressType` for loading view.
    var progressType: ProgressViewType { get }
    
    /// Show loading view
    ///
    /// - parameter show: Shows progress view.
    /// - parameter type: set progress view type.
    func shouldShowProgressView(_ show: Bool, type: ProgressViewType)
}
