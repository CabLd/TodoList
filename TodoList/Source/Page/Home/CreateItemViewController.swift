//
//  CreateItemViewController.swift
//  TodoList
//
//  Created by yangtz on 2024/1/24.
//

import UIKit
import SnapKit

class CreateItemViewController: UIViewController {
    
    var delegate: ReceiveCreateItemData?

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.purple
        return textField
    }()

    lazy var storageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        button.addTarget(self, action: #selector(onCreate), for: .touchUpInside)
        return button
    }()

//    init(onSave: @escaping (Todo) -> Void) {
//        self.onSave = onSave
//        super.init(nibName: nil, bundle: nil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemPink
        view.addSubview(storageButton)
        storageButton.snp.makeConstraints { make in
            make.width.height.equalTo(56)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.center.equalTo(self.view)
        }

    }

    @objc func onCreate() {
        //onSave(Todo(title: ""))
        //dismiss(animated: true)
        self.dismiss(animated: true) {
            self.delegate?.passCreate(title: self.textField.text ?? "")
            //self
            //self.delegate?.pass(data: self.textField.text ?? "", id: self.id!)
        }
    }


}
