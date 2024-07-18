//
//  CollectionView+Extensions.swift
//  Movie
//
//  Created by ITUMAC03 on 17/07/24.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    func setupView() { }
}
extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UICollectionView {
    func dequeue<T>(at indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
        return cell
    }
    func dequeue<T: UICollectionReusableView>(header indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.nameOfClass,
            for: indexPath
        ) as! T
    }
    func dequeue<T: UICollectionReusableView>(footer indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.nameOfClass,
            for: indexPath
        ) as! T
    }
    func dequeue<T: UICollectionReusableView>(for indexPath: IndexPath, and kind: String) -> T {
        return dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: T.nameOfClass,
            for: indexPath
        ) as! T
    }
    func register(_ _class: AnyClass) {
        register(_class, forCellWithReuseIdentifier: String(describing: _class.self))
    }

    func register<T: UICollectionReusableView>(header: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.nameOfClass)
    }

    func register<T: UICollectionReusableView>(footer: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.nameOfClass)
    }
    
    func selectRow(at row: Int, section: Int = 0, position: ScrollPosition = .top) {
        let indexPathSelected = IndexPath(row: row, section: section)
        self.selectItem(at: indexPathSelected, animated: true, scrollPosition: position)
    }
}
