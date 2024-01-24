//
//  TagCell.swift
//  TodoList
//
//  Created by yangtz on 2024/1/21.
//

import LegoKit
import SnapKit
import UIKit

struct TodoItem: TypedItemType {
    // 给cellType一个视图TodoCell
    typealias CellType = TodoCell
    var id: UUID { todo.id }
    var todo: Todo
    var onToggle: () -> Void
}

class TodoCell: UICollectionViewCell {
    var item: Item?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    lazy var checkControl: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.item?.onToggle()
        }
        let button = UIButton(type: .custom, primaryAction: action)
        button.setImage(UIImage(named: "Unchecked"), for: .normal)
        button.setImage(UIImage(named: "Checked"), for: .selected)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(checkControl)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(59)
            make.trailing.equalToSuperview().offset(-14)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }

        checkControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(19)
            // 上下
            make.centerY.equalToSuperview()
        }
        contentView.backgroundColor = UIColor.orange
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TypedCellType
extension TodoCell: TypedCellType {
    func update(with item: TodoItem) {
        print("更新TodoCell")
        self.item = item
        titleLabel.text = item.todo.title
        checkControl.isSelected = item.todo.isCompleted
    }
}


