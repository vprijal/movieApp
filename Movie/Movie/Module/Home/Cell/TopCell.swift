//
//  TopCell.swift
//  Movie
//
//  Created by ITUMAC03 on 18/07/24.
//

import Foundation
import UIKit

class TopCell: UICollectionViewCell {
    lazy var containerView = UIView()
    lazy var imageView = UIImageView()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.text = "Pokemon"
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setupView() {
        setupConstraint()
        imageView.image = UIImage(named: "system")
        containerView.backgroundColor = UIColor(named: "ic_primary")
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
    }
    
    func setupConstraint() {
        contentView.addSubview(containerView)
        containerView.fillSuperView()
        
    }
    
    func setData() {
       
    }
}
