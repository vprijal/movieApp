//
//  RetryView.swift
//  Movie
//
//  Created by ITUMAC03 on 18/07/24.
//

import UIKit

class RetryView: UIView {
    
    var buttonRetry = UIButton()
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.text = "This could be an issue on our API or a connection problem. You may check if you are connected to the internet and try reloading the page again."
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

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
        addSubview(descLabel)
        descLabel.centerYToSuperview()
        descLabel.centerXToSuperview()
        descLabel.leftToSuperview(space: 36)
        descLabel.rightToSuperview(space: -36)
       
        addSubview(buttonRetry)
        buttonRetry.setTitle("Retry", for: .normal)
        buttonRetry.backgroundColor = UIColor(named: "ic_primary")
        buttonRetry.setTitleColor(.white, for: .normal)
        buttonRetry.width(120)
        buttonRetry.height(45)
        buttonRetry.centerXToSuperview()
        buttonRetry.top(toAnchor: descLabel.bottomAnchor, space: 20)
    }
}
