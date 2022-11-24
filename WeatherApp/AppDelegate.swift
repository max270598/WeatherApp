//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Мах Ol on 19.11.2022.
//

import UIKit
import IQKeyboardManagerSwift
import Resources
import CityList

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = L10n.Keyboard.ready
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 20
        
        let initialViewController = CityListViewController()
        initialViewController.viewModel = CityListViewModel()
        let navigationController = UINavigationController(rootViewController: initialViewController)
     
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

