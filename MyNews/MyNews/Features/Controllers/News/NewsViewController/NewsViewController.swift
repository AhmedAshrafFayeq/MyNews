//
//  NewsViewController.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import Foundation

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - Outlets
    //
    @IBOutlet weak var contentView: UIView!
    
    // MARK: - Properties
    /// MyTicketsListSelectorDataSource
    ///
    private(set) lazy var newsSearchCommand: NewsSearchCommand = {
        return NewsSearchCommand(onSelectSearchResult: handleOnSelectArticle(viewModel:))
    }()
    /// Search view controller for all departments
    ///
    lazy var searchViewController: SearchViewController = {
        return SearchViewController(
            command: newsSearchCommand,
            cellType: NewsCell.self,
            cellSeparator: .singleLine
        )
    }()
    
    // MARK: - ViewLifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureListViewController()
        configureOnFilterTapped()
    }
}

// MARK: - View's Configuration
//
private extension NewsViewController {
    
    func configureOnFilterTapped() {
        searchViewController.configureOnFilterTapped(completion: presentFilter)
    }
    
    /// Apply configuration for list view controller
    ///
    func configureListViewController() {
        addChildViewController(searchViewController,
                               parentView: view)
    }
}

// MARK: - Private handlers
//
private extension NewsViewController {
    
    func handleOnSelectArticle(viewModel: NewsCellViewModel) {
        let detailsViewController = DetailsViewController()
        detailsViewController.model = viewModel.model
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func presentFilter() {
        let filterViewController = NewsFilterViewController(delegate: self)
        navigationController?.pushViewController(filterViewController, animated: true)
    }
}

// MARK: - News filter delegate
//
extension NewsViewController: NewsFilterDelegate {
    func newsFilter(viewController: NewsFilterViewController, didTappedSearch button: UIButton, with result: NewsFilter) {
        navigationController?.popToRootViewController(animated: true)
        newsSearchCommand.updateFilter(with: result)
    }
}
