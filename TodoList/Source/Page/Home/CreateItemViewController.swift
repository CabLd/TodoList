//
//  CreateItemViewController.swift
//  TodoList
//
//  Created by yangtz on 2024/1/24.
//

import SnapKit
import UIKit

class CreateItemViewController: UIViewController {
    var delegate: ReceiveCreateItemData?

    lazy var textView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 10, y: 100, width: self.view.frame.width - 20, height: 400))
        textView.backgroundColor = .gray
        textView.text = "Add some things you want to do"
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

//    lazy var storageButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
//        button.addTarget(self, action: #selector(self.onCreate), for: .touchUpInside)
//        return button
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationController!.navigationBar.backgroundColor = .black
        view.backgroundColor = .systemBackground
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", image: UIImage(systemName: "square.and.arrow.down.on.square"), target: self, action: #selector(self.onCreate))
        view.addSubview(textView)
//        textField.snp.makeConstraints { make in
//            // make.width.equalTo(200)
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
//            // make.width.equalToSuperview()
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            // make.height.equalTo(50)
//            make.center.equalTo(self.view)
//        }
    }

    @objc func onCreate() {
        print("Create New TodoCell Success! ok")
        self.delegate?.passCreate(title: self.textView.text!)
        navigationController?.popViewController(animated: true)
    }
}
