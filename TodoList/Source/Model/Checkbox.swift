//
//  Checkbox.swift
//  TodoList
//
//  Created by yangtz on 2024/1/19.
//

import UIKit
import SnapKit

@IBDesignable
class Checkbox: UIControl {
    @IBInspectable
    /// Description: the symbol of check
    public var checked: Bool = true {
        didSet {
            imageView.image = image
        }
    }

    /// Description: pickup image by checked
    private var image: UIImage {
        checked ? UIImage(named: "Checked")! : UIImage(named: "Unchecked")!
    }

    /// Description: imageView
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup() {
        addSubview(imageView)
        backgroundColor = UIColor.clear
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }

    @objc func touchUpInside() {
        checked = !checked
        sendActions(for: .valueChanged)
    }

}
