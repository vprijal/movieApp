//
//  HomeView.swift
//  Ichigo
//
//  Created by Ichigo iOS Team on 15/06/22.
//
  
import UIKit
import SDWebImage

enum HomeSection {
    case top
    case midle
    case bottom
}

class HomeView: UIView {
    
    typealias GeneralCDataSource = UICollectionViewDiffableDataSource<HomeSection, AnyHashable>
    typealias GeneralCSnapshot = NSDiffableDataSourceSnapshot<HomeSection, AnyHashable>
    
    lazy var collectionView: UICollectionView = createCollectionView()
    lazy private var dataSource = self.configureDataSource()

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
        addSubview(collectionView)
        collectionView.fillSuperView()
        collectionView.setStateView(with: .loading)
        collectionView.dataSource = dataSource
    }
    
    private func configureDataSource() -> GeneralCDataSource {
        let _dataSource = GeneralCDataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell: TopCell = collectionView.dequeue(at: indexPath)
            cell.layoutIfNeeded()
//            if let item = itemIdentifier as? Pokemon {
//                cell.setData(item)
//            }
            return cell
        }
        var snapshot = GeneralCSnapshot()
        snapshot.appendSections([.top, .midle, .bottom])
        _dataSource.apply(snapshot)
        return _dataSource
    }
    
    
    private func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(TopCell.self)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { [unowned self] index, env in
            return self.sectionFor(index: index, environment: env)
        }
    }
    /// - Tag: ListAppearances
    func sectionFor(index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = self.dataSource.snapshot().sectionIdentifiers[index]
        switch section {
        case .top:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(170))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(250))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(10)

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32)
            return section
        case .midle:
            // Define item size with a fixed height of 160
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
            
            // Create an item with the defined size
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // Define the spacing between items (horizontal)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            
            // Create a group with 3 items in 1 row
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            // Define the spacing between groups (vertical)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            
            // Define the spacing between sections (rows)
            section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
            
            return section
        case .bottom:
            // Define item size with a fixed height of 160
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
            
            // Create an item with the defined size
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // Define the spacing between items (horizontal)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            
            // Create a group with 3 items in 1 row
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            // Define the spacing between groups (vertical)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            
            // Define the spacing between sections (rows)
            section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
            
            return section
        }
    }
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

