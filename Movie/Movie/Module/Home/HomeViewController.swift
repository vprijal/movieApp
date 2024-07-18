//
//  HomeViewController.swift
//  Ichigo
//
//  Created by Ichigo iOS Team on 15/06/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel?
    let mainView: HomeView
    
    init(parameters: [String: Any?]) {
        viewModel = HomeViewModel()
        mainView = HomeView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.title = "Movie"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonTitle = ""
        view.addSubview(mainView)
        mainView.fillSuperView()
        viewModel?.fetchByPopular(page: viewModel?.currentPage ?? 1)
    }
}

extension HomeViewController: HomeDelegate {
    func didReceive(movie: [Movie]) {
        
    }
    
    func didError() {
        
    }
}
