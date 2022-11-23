//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Мах Ol on 19.11.2022.
//

import UIKit
import IQKeyboardManagerSwift
import SkeletonView
import Resources
import CityList

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        
        
        SkeletonAppearance.default.multilineHeight = 20
        SkeletonAppearance.default.multilineCornerRadius = 5
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Готово"
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 20
        //      Не забывать где надо в контроллере ставить функцию ниже, так как на iphone X и выше IQKeyboard багует из-за дополнительных safeAreas
        //      self.extendedLayoutIncludesOpaqueBars = true эта функция позволяет вью заходить под status bar. Нужна потому что если navigationBar.isTranslusent = false - IQKeyboardmanager багует
        
        let initialViewController = CityListViewController()
        initialViewController.viewModel = CityListViewModel()
        let navigationController = UINavigationController(rootViewController: initialViewController)
     
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

