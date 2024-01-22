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
}

class TodoCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
        let lable = UILabel()
        lable.textColor = UIColor.black
        lable.backgroundColor = UIColor.blue
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.numberOfLines = 2
        lable.textAlignment = .left
        return lable
    }()

    lazy var checkControl: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.checkControl.isSelected.toggle()
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
        titleLabel.text = item.todo.title
    }
}
