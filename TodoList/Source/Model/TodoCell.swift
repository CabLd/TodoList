//
//  TagCell.swift
//  TodoList
//
//  Created by yangtz on 2024/1/21.
//

import UIKit
import SnapKit

class TodoCell: UICollectionViewCell {
    lazy var tagLabel: UILabel = {
        let lable = UILabel()
        lable.textColor = UIColor.black
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.numberOfLines = 1
        lable.textAlignment = .center
        return lable
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(tagLabel)
        tagLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.center.equalToSuperview()
        }
        self.tagLabel.text = "finish"
        self.contentView.backgroundColor = UIColor.orange
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

