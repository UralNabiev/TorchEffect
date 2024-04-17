//
//  AppDelegate.swift
//  TorchEffect
//
//  Created by O'ral Nabiyev on 16/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = TorchEffectVC(nibName: "TorchEffectVC", bundle: nil)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }


}

