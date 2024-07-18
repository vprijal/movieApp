//
//  LoadingCell.swift
//  Movie
//
//  Created by ITUMAC03 on 18/07/24.
//

import UIKit
struct LoadingIndicatorItem: Hashable { let id = UUID() }
class LoadingCell: CollectionCell {
    
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func setupView() {
        super.setupView()
        backgroundColor = .black
        contentView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXToSuperview()
        activityIndicator.centerYToSuperview()
        activityIndicator.color = .white
        activityIndicator.startAnimating()
    }
    
    func start() {
        activityIndicator.startAnimating()
    }
}
