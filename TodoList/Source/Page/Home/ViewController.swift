import LegoKit
import UIKit
import SnapKit

class ViewController: UIViewController {
//    private lazy var checkControl: UIButton = {
//        let action = UIAction { [weak self] _ in
//            self?.checkControl.isSelected.toggle()
//        }
//        let button = UIButton(type: .custom, primaryAction: action)
//        button.setImage(UIImage(named: "Unchecked"), for: .normal)
//        button.setImage(UIImage(named: "Checked"), for: .selected)
//        return button
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //configureHierarchy()
    }
}

// MARK: - Configure View
//private extension ViewController {
//    func configureHierarchy() {
//        view.addSubview(checkControl)
//        checkControl.snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.width.height.equalTo(100)
//        }
//    }
//}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    /// Description
    /// - Parameter collectionView: collectionView description
    /// - Returns: description
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    /// Description
    /// - Parameters:
    ///   - collectionView: collectionView description
    ///   - section: section description
    /// - Returns: description
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    /// Descripti
    /// - Parameters:
    ///   - collectionView: collectionView description
    ///   - indexPath: indexPath description
    /// - Returns: description
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
}
