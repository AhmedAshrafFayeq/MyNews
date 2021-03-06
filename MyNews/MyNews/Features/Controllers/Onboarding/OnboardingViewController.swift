//
//  OnboardingViewController.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import Foundation
import Eureka

// MARK: - OnboardingViewController
//
class OnboardingViewController: FormViewController {
  
  // MARK: - Properties
  
  let viewModel: OnboardingViewModel
  lazy var filterSection = FilterSection(initialValue: nil)
  weak var coordinator: AppCoordinator?
  
  init(viewModel: OnboardingViewModel) {
    self.viewModel = viewModel
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureFooterView()
    configureHeaderView()
    createRows()
    viewModelFilterBinding()
  }
}

// MARK: - Configure ViewModel
//
extension OnboardingViewController {
  func viewModelFilterBinding() {
    viewModel.filterObservable.subscribe { [weak self] _ in
      self?.coordinator?.showNewsScreen()
    }
  }
}

// MARK: - Rows Creations
//
extension OnboardingViewController {
  
  /// Creating inputs rows of OnboardingViewController
  ///
  func createRows() {
    form +++ filterSection
  }
}

// MARK: - OnboardingViewController
//
extension OnboardingViewController {
  
  /// Configure footer view
  ///
  func configureFooterView() {
    footerView.addAction(ButtonAction(title: Strings.submit, style: .default) { [weak self] _ in
      guard let self = self else { return }
      self.viewModel.setFilter(filter: self.filterSection.value)
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
private extension OnboardingViewController {
  enum Strings {
    static var submit: String { "Submit".localized }
  }
}
