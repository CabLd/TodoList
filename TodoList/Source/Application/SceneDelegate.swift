//
//  SceneDelegate.swift
//  TodoList
//
//  Created by yangtz on 2024/1/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options
               connectionOptions: UIScene.ConnectionOptions) {
        // 设置根viewController
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navg = UINavigationController(rootViewController: HomeViewController())
        window?.rootViewController = navg

        // navg.navigationBar.prefersLargeTitles = true
        // navg.navigationBar.setTitleVerticalPositionAdjustment(CGFloat, for: UIBarMetrics)
        let myColor = UIColor(red: 57/255, green: 57/255, blue: 67/255, alpha: 1)
        let attrs = [
            NSAttributedString.Key.foregroundColor: myColor,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
            // NSAttributedString.Key.
        ]
        // navg.navigation
        // navg.navigationBar.largeTitleTextAttributes = attrs
        // 设置NavigationBar的标题格式
        // UINavigationBar.appearance().backgroundColor = .red
        UINavigationBar.appearance().titleTextAttributes = attrs
        window?.makeKeyAndVisible()

    }
}
