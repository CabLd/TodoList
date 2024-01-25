//
//  BigTitle.swift
//  TodoList
//
//  Created by yangtz on 2024/1/22.
//
import UIKit
import SnapKit
import LegoKit

struct BigTitleItem: TypedItemType {
    typealias CellType = BigTitle
    var id: UUID { title.id }
    var title: Title
}

class BigTitle: UICollectionViewCell {
    lazy var bigTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        label.font = UIFont.init(name: "Bold", size: 18)
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 18)//加粗方法
        let myColor = UIColor(red: 57/255, green: 57/255, blue: 67/255, alpha: 1)
        label.textColor = myColor
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bigTitleLabel)
        bigTitleLabel.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(18)
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(0)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - TypedCellType
extension BigTitle: TypedCellType {
    func update(with item: BigTitleItem) {
        bigTitleLabel.text = item.title.title
    }
}
