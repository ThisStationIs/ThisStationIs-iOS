//
//  AppCoordinator.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/06/13.
//

import Foundation
import UIKit

class AppCoordinator: TabBarCoordinator {
    /*
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    */
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType
    var tabBarController: UITabBarController
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.type = CoordinatorType.tab
        
        self.tabBarController = UITabBarController()
    }
    
    func start(){
        let viewControllers: [TabBarItemType] = TabBarItemType.allCases
        
        let tabBarItems: [UITabBarItem] = viewControllers.map { self.createTabBarItem(of: $0) }
        let navigationControllers: [UINavigationController] = tabBarItems.map {
            self.createTabNavigationController(tabBarItem: $0)
        }
        
        let _  = navigationControllers.map { self.startTabCoordinator(tabNavigationController: $0) }
        self.configureTabBarCoordinator(tabNavigationControllers: navigationControllers)
        self.addTabBarCoordinator()
        /*goToLogin()*/
    }
    
    /*
    func goToLogin(){
        let loginCoordinator = LoginCoordinator.init(navigationController: navigationController)
        children.removeAll()
        
        loginCoordinator.parentCoordinator = self
        children.append(loginCoordinator)
        
        loginCoordinator.start()
    }
     */
}

extension AppCoordinator {
    /// 2. 탭 별 TabBarItem 생성
    private func createTabBarItem(of page: TabBarItemType) -> UITabBarItem {
        return UITabBarItem(
            title: page.toKrName(),
            image: UIImage(named: page.toIconName()),
            tag: page.toInt()
        )
    }
    
    /// 3. 탭바 페이지대로 탭바 생성
    private func createTabNavigationController(tabBarItem: UITabBarItem) -> UINavigationController {
        let tabNavigationController = UINavigationController()
        
        tabNavigationController.setNavigationBarHidden(false, animated: false)
        tabNavigationController.tabBarItem = tabBarItem
        return tabNavigationController
    }
    
    /// 4. 각 탭에 맞는 뷰의 Coordinator 실행, 각 NavigationController에 추가
    private func startTabCoordinator(tabNavigationController: UINavigationController) {
        let tabBarItemTag: Int = tabNavigationController.tabBarItem.tag
        guard let tabBarItemType: TabBarItemType = TabBarItemType(index: tabBarItemTag) else { return }
        
        switch tabBarItemType {
        case .home:
            let homeCoordinator = HomeCoordinator(tabNavigationController)
            homeCoordinator.finishDelegate = self
            self.childCoordinators.append(homeCoordinator)
            homeCoordinator.start()
        case .community:
            let communityCoordinator = CommunityCoordinator(tabNavigationController)
            communityCoordinator.finishDelegate = self
            self.childCoordinators.append(communityCoordinator)
            communityCoordinator.start()
        case .writting:
            let writtingCoordinator = WrittingCoordinator(tabNavigationController)
            writtingCoordinator.finishDelegate = self
            self.childCoordinators.append(writtingCoordinator)
            writtingCoordinator.start()
        case .history:
            let historyCoordinator = HistoryCoordinator(tabNavigationController)
            historyCoordinator.finishDelegate = self
            self.childCoordinators.append(historyCoordinator)
            historyCoordinator.start()
        case .my:
            let myCoordinator = MyCoordinator(tabNavigationController)
            myCoordinator.finishDelegate = self
            self.childCoordinators.append(myCoordinator)
            myCoordinator.start()
        }
        
    }
    
    /// 5. UiTabBarController에 NavigationController 설정
    /// 탭바 스타일 지정 및 초기화
    private func configureTabBarCoordinator(tabNavigationControllers: [UIViewController]) {
        self.tabBarController.setViewControllers(tabNavigationControllers, animated: false)
        self.tabBarController.selectedIndex = TabBarItemType.home.toInt()
        
        self.tabBarController.view.backgroundColor = .systemBackground
        self.tabBarController.tabBar.backgroundColor = .systemBackground
        self.tabBarController.tabBar.tintColor = AppColor.setupColor(.primaryNormal)
    }

    /// 6. rootView에 tabBar 추가
    private func addTabBarCoordinator() {
        self.navigationController.pushViewController(self.tabBarController, animated: true)
        
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        self.childCoordinators.removeAll()
        self.navigationController.viewControllers.removeAll()
        self.finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
