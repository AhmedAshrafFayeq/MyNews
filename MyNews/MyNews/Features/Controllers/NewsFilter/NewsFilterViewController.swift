//
//  NewsFilterViewController.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import Foundation
import Eureka

// MARK: - NewsFilterViewController
//
class NewsFilterViewController: FormViewController {
  // MARK: - Properties
  
  /// Delegate when finish filtering
  ///
  weak var delegate: NewsFilterDelegate?
  
  lazy var filterSection = FilterSection(initialValue: nil)
  
  // MARK: - Init
  init(delegate: NewsFilterDelegate) {
    self.delegate = delegate
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureFooterView()
    configureHeaderView()
    createRows()
  }
}

// MARK: - Rows Creations
//
extension NewsFilterViewController {
  
  /// Creating inputs rows of OnboardingViewController
  ///
  func createRows() {
    form +++ filterSection
  }
}

// MARK: - OnboardingViewController
//
extension NewsFilterViewController {
  
  /// Configure footer view
  ///
  func configureFooterView() {
    footerView.addAction(ButtonAction(title: Strings.submit, style: .default) { [weak self] in
      guard let self = self else { return }
      self.delegate?.newsFilter(viewController: self, didTappedSearch: $0.button, with: self.filterSection.value)
    })
  }
  
  /// Configure header view
  ///
  func configureHeaderView() {
    headerView.imageView.image = Asset.stretchyHeader.image
  }
}

// MARK: - Strings
//
private extension NewsFilterViewController {
  enum Strings {
    static var submit: String { "Submit".localized }
  }
}

