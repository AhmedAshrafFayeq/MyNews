//
//  ActionsFooterView.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import UIKit

// MARK: - ActionsFooterView
//
class ActionsFooterView: UIView {
    
    // MARK: - IBOutlets
    //
    @IBOutlet var contentView: UIView!    
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Proeprties
    //
    private(set) var actions: [ButtonAction] = []
    
    // MARK: - Init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
        configureView()
    }
}

// MARK: - ConfigureView
//
private extension ActionsFooterView {
    
    func commitInit() {
        Bundle.main.loadNibNamed(ActionsFooterView.classNameWithoutNamespaces, owner: self, options: nil)
        contentView.addAndFixInView(self)
    }
    
    func configureView() {
        configureContentView()
    }
    
    func configureContentView() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
}

// MARK: - Public Handlers
//
extension ActionsFooterView {
    
    func addAction(_ action: ButtonAction) {
        let button = action.button
        actions.append(action)
        stackView.addArrangedSubview(button)
    }
}

// MARK: - Loading Handlers
//
extension ActionsFooterView {
    
    /// Returns reference to loading buttons
    ///
    private var loadingButtons: [LoadingButton] {
        return actions.compactMap { $0.button as? LoadingButton }
    }
    
    /// Starts the loading buttons animation.
    ///
    func ensureLoadingIsStarted() {
        loadingButtons.forEach { button in
            button.showLoading()
        }
    }
    
    /// Stops animating the Loading buttons.
    ///
    func ensureLoadingIsStopped() {
        loadingButtons.forEach { button in
            button.hideLoading()
        }
    }
}
