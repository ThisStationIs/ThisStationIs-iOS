//
//  AppCoordinator.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/06/13.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(){
        goToLogin()
    }
    
    func goToLogin(){
        let loginCoordinator = LoginCoordinator.init(navigationController: navigationController)
        children.removeAll()
        
        loginCoordinator.parentCoordinator = self
        children.append(loginCoordinator)
        
        loginCoordinator.start()
    }
}
