import LegoKit
import SnapKit
import UIKit

class HomeViewController: UIViewController, LegoContainer {
    // MARK: - Properties
    private let todoLayout: NSCollectionLayoutSection = {
        // item的size等于group就好
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 32
        return section
    }()

    var lego: Lego {
        Lego {
            Section(id: 0, layout: todoLayout) {
                // 初始化每个item中的todo 使用静态属性.dummy
                BigTitleItem(title: .toolP)
                TodoItem(todo: .dummy)
                TodoItem(todo: .dummy)
                TodoItem(todo: .init(title: [String](repeating: "hello", count: 20).joined(separator: " ")))
            }
        }
    }

    // legoRenderer是一个渲染器
    lazy var legoRenderer: LegoRenderer = .init(lego: lego)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // HomeView 的title
        title = "Home"
        configureHierarchy()
    }
}

// MARK: - Configure Views

private extension HomeViewController {
    func configureHierarchy() {
        legoRenderer.render(in: view) {
            $0.backgroundColor = .systemBackground
        }
    }
}
