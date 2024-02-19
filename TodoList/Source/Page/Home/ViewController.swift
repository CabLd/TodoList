import LegoKit
import SnapKit
import UIKit


/// Description: Data protocol between HomeVc and ModifyVc
protocol ReceiveModifyItemData {
    func passModify(data: String, id: UUID)
}

/// Description: Data protocol between HomeVc and CreateVc
protocol ReceiveCreateItemData {
    func passCreate(title: String)
}

class HomeViewController: UIViewController, LegoContainer, ReceiveModifyItemData, ReceiveCreateItemData {

    func passCreate(title: String) {
        vm.createNewTodo(title: title)
    }

    func passModify(data: String, id: UUID) {
        print("end")
        print(data, id)
        print("hello,this is mainVc，data: \(data) id: \(id)");
        vm.ModifyTodo(id: id, Message: data)
    }

    var delegatePassTextViewData: ReceiveSourceTextData?

    // MARK: - Properties
    lazy var addButton: UIButton = {
        // learn... weak self
        let action = UIAction { [weak self] _ in
            let vc = CreateItemViewController()
            vc.delegate = self

            // modify
            self?.navigationController?.pushViewController(vc, animated: true)

            // self?.present(vc, animated: false, completion: nil)
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
        // let image = UIImage(named: "back1")!
        // view.imageView = UIImageView(frame: CGRectZero)
        // view.imageView?.contentMode = .scaleAspectFill
        // view.backgroundColor = UIColor(patternImage: image!)
        self.centerTitle()
        configureHierarchy()
    }
}

// MARK: - Configure Views
private extension HomeViewController {
    func configureHierarchy() {
        // 加载defaults数据
        
        legoRenderer.render(in: view) {
            $0.backgroundColor = .systemBackground
            $0.delegate = self
        }
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
}

// MARK: - Set UICollectionView Layout
private extension HomeViewController {
    func todoLayout() -> NSCollectionLayoutSection {
        // let item.size = group.size
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
        section.interGroupSpacing = 16

        section.contentInsets.top = 32
        return section
    }
}

extension HomeViewController: UICollectionViewDelegate {
    /// Description: Implement clicking on TodoItem to pop up the modification view
    /// - Parameters:
    ///   - collectionView: collectionView description
    ///   - indexPath: indexPath description
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = legoRenderer[indexPath, as: TodoItem.self] else {
            return
        }
//       let vc = ModifyItemViewController { [weak self] todo in
//            
//       }
        let vc = ModifyItemViewController()
        // 设置委托
        delegatePassTextViewData = vc
        vc.delegate = self
        // 传递数据
        self.delegatePassTextViewData?.setTextView(data: item.todo.title)
        vc.id = item.id
        // 切换页面
        self.navigationController?.pushViewController(vc, animated: true)
    }

//    func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
//
//    }
}


extension HomeViewController {
    func CustomTitle() -> AttributedString {
        var str = AttributedString("Home")
        str.font = .boldSystemFont(ofSize: 18)
        let myColor = UIColor(red: 57/255, green: 57/255, blue: 67/255, alpha: 1)
        str.backgroundColor = myColor
        return str
    }
}


extension UIViewController {
    func centerTitle() {
        for navItem in (self.navigationController?.navigationBar.subviews)! {
            for itemSubView in navItem.subviews {
                if let largeLabel = itemSubView as? UILabel {
                    largeLabel.center = CGPoint(x: navItem.bounds.width/2, y: navItem.bounds.height/2
                     )
                    return
                }
            }
        }
    }
}


