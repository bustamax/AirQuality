//
//  SceneDelegate.swift
//  Air Quality
//
//  Created by Максим Юрисов on 09.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
     
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
        
        
    }

   


}

