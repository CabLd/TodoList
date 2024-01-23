import LegoKit
import SnapKit
import UIKit

class HomeViewController: UIViewController, LegoContainer {
    // MARK: - Properties

    lazy var AddButton: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.vm.createNewTodo(title: "Hello world")
        }
        let button = UIButton(type: .custom, primaryAction: action)
        // button.backgroundColor = UIColor.green
        button.imageView?.contentMode = .scaleAspectFill
        button.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.setImage(UIImage(named: "AddButton"), for: .normal)
        return button
    }()

    // 观察者 HomeViewModel
    @LegoKit.StateObject
    private var vm = HomeViewModel()

    var lego: Lego {
        Lego {
            Section(id: 0, layout: todoLayout()) {
                // 初始化每个item中的todo 使用静态属性.dummy
                BigTitleItem(title: .InCompleted)
                for todo in vm.incompleteTodos {
                    TodoItem(todo: todo) { [weak self] in
                        self?.vm.toggleTodo(todo)
                    }
                }
            }
            Section(id: 1, layout: todoLayout()) {
                BigTitleItem(title: .Completed)
                for todo in vm.completeTodos {
                    TodoItem(todo: todo) { [weak self] in
                        self?.vm.toggleTodo(todo)
                    }
                }
            }
        }
    }

    // legoRenderer是一个渲染器
    lazy var legoRenderer: LegoRenderer = .init(lego: lego)

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
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
        view.addSubview(AddButton)
        AddButton.snp.makeConstraints { make in
            make.width.height.equalTo(56)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
}

private extension HomeViewController {
    func todoLayout() -> NSCollectionLayoutSection {
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
        // section内部组之间的距离
        section.interGroupSpacing = 16
        section.contentInsets.top = 32
        return section
    }
}
