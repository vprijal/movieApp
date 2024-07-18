//
//  MLoadingState.swift
//  Movie
//
//  Created by ITUMAC03 on 18/07/24.
//

import UIKit

class MLoadingState: UIView {

    lazy var indicator = UIActivityIndicatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
        addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false

        indicator.fillSuperView()

        indicator.style = .medium
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
    }
}
