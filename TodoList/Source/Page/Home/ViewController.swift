import LegoKit
import SnapKit
import UIKit

class ViewController: UIViewController {
    /// Layout of UICollectionView
    /// - Returns: UICollectionViewCompositionalLayout
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize (
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize (
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(45)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(0)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        let layout = UICollectionViewCompositionalLayout(section: section)

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 32
        layout.configuration = config

        return layout
    }

    lazy var HomeLabel: UILabel = {
        let lable = UILabel()
        lable.textColor = UIColor.black
        lable.font = UIFont.systemFont(ofSize: 18)
        lable.numberOfLines = 1
        lable.textAlignment = .center
        lable.text = "Home"
        return lable
    }()

    
    private lazy var colltionView: UICollectionView = {
        // let layout = UICollectionViewFlowLayout()
        // The width and height values are temporary
        let colltionView = UICollectionView(frame: .zero, collectionViewLayout: layout())

        colltionView.register(TodoCell.self, forCellWithReuseIdentifier: "cell")
        colltionView.dataSource = self
        colltionView.backgroundColor = UIColor.black
        return colltionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(HomeLabel)
        HomeLabel.snp.makeConstraints { make in
            make.width.equalTo(52)
            make.height.equalTo(22)
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(157)
            // make.right.equalToSuperview().offset(166)
        }
        view.addSubview(colltionView)
        colltionView.snp.makeConstraints { make in
            // make.edges.equalToSuperview()
            make.width.equalTo(342)
            make.height.equalTo(597)
            make.top.equalTo(HomeLabel).offset(26)
            make.leading.equalToSuperview().offset(18)
            // make.right.equalToSuperview().offset(166)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    /// Description
    /// - Parameter collectionView: collectionView description
    /// - Returns: description
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    /// Description
    /// - Parameters:
    ///   - collectionView: collectionView description
    ///   - section: section description
    /// - Returns: description
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    /// Descripti
    /// - Parameters:
    ///   - collectionView: collectionView description
    ///   - indexPath: indexPath description
    /// - Returns: description
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TodoCell
        print(33)
        cell.tagLabel.text = "ok"
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
}
