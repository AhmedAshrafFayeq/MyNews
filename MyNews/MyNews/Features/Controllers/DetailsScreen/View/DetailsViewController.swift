//
//  DetailsViewController.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var model: StorageNews?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationButton()
        configureView()   
    }
    
    func addNavigationButton(){
        let openArticalButton = UIBarButtonItem(title: "openInSafari".localized, style: .plain, target: self, action: #selector(self.openArticalInSafari))
        self.navigationItem.rightBarButtonItem  = openArticalButton
    }
    
    func configureView() {
        titleLabel?.text = model?.title
        newsImageView?.setImage(urlString: model?.urlToImage, placeholder:    Asset.placeholderImageIcon.image)
        
        descriptionLabel?.text = model?.articleDescription
        dateLabel.text = model?.publishedAt
        sourceLabel.text = model?.sourceNewsName
    }
    @objc func openArticalInSafari() {
      WebviewHelper.launch(model?.url, with: self)
    }
}

private extension DetailsViewController {
  
  

}
