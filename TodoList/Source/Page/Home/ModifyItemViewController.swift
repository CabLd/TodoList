//
//  ModifyItemViewController.swift
//  TodoList
//
//  Created by yangtz on 2024/1/24.
//

import SnapKit
import UIKit

/// Description: Receive text data to modify
protocol ReceiveSourceTextData {
    func setTextView(data: String)
}

class ModifyItemViewController: UIViewController, ReceiveSourceTextData {

    private var ok: String = ""
    func setTextView(data: String) {
        ok = data
    }

    lazy var textView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 10, y: 100, width: self.view.frame.width - 20, height: 400))
        textView.backgroundColor = .gray
        textView.text = ok // textData
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 20.0
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor // the border color to black.
        textView.font = UIFont.systemFont(ofSize: 20.0)
        textView.textColor = UIColor.black
        textView.textAlignment = NSTextAlignment.left
        // Automatically detect links, dates, etc. and convert them to links.
        textView.dataDetectorTypes = UIDataDetectorTypes.all
        textView.layer.shadowOpacity = 0.5 // shadow darkness.
        textView.isEditable = true // Make text uneditable.
        return textView
    }()

    var delegate: ReceiveModifyItemData?
    var id: UUID?
    // public var todo: Todo?
    // public var onSave: (Todo) -> Void

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.purple
        return textField
    }()

    lazy var storageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        button.addTarget(self, action: #selector(onModify), for: .touchUpInside)
        return button
    }()

//    init(onSave: @escaping (Todo) -> Void) {
//        self.onSave = onSave
//        super.init(nibName: nil, bundle: nil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationController!.navigationBar.backgroundColor = .black
        view.backgroundColor = .systemBackground
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", image: UIImage(systemName: "square.and.arrow.down.on.square"), target: self, action: #selector(self.onModify))

        // self.navigationItem.rightBarButtonItem = UIBar
        view.addSubview(textView)
    }

    @objc func onModify() {
        print("Modify New TodoCell Success! ok")
        print("after")
        print(self.textView.text!, self.id!)
        self.delegate?.passModify(data: self.textView.text!, id: self.id!)
        navigationController?.popViewController(animated: true)
    }
}
