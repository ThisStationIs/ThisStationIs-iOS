//
//  MyCoordinator.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/08/23.
//

import UIKit

class MyCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    var finishDelegate: CoordinatorFinishDelegate?
    
    var type: CoordinatorType = .my
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.type = CoordinatorType.tab
    }
    
    func start() {
        self.navigationController.pushViewController(MyViewController(), animated: true)
    }
    
}

extension MyCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        // 자식 뷰를 삭제하는 델리게이트 (자식 -> 부모 접근 -> 부모에서 자식 삭제)
        self.childCoordinators = self.childCoordinators
            .filter({ $0.type != childCoordinator.type })
        childCoordinator.navigationController.popToRootViewController(animated: true)
    }
}

