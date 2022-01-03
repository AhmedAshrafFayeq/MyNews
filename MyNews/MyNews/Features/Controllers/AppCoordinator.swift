//
//  AppCoordinator.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import UIKit

// MARK: - AppCoordinator
//
class AppCoordinator {
    
  private var isLoggedIn: Bool?
  
  // MARK: - Properties
  //
  let navigationController: UINavigationController
  
  /// Tab Bar Controller
  ///
  lazy var tabBarController: MainTabBarController? = {
      MainTabBarController()
  }()

  
  // MARK: - init
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  // MARK: - Start
  //
  func start() {
    
    guard let _ = ServiceLocator.defaultFilter else {
      showOnboardingViewController()
      return
    }
    showNewsScreen()
  }
}

// MARK: - Coordination Helpers
//
extension AppCoordinator {
  
  /// Show OnboardingViewController
  ///
  func showOnboardingViewController() {
    let viewController = OnboardingViewController(viewModel: OnboardingViewModel())
    viewController.coordinator = self
    navigationController.setViewControllers([viewController], animated: true)
    tabBarController?.setViewControllers([navigationController], animated: true)
  }
  
  /// Show NewsViewController.
  ///
  func showNewsScreen() {
    tabBarController?.showNewsScreen()
  }
}

