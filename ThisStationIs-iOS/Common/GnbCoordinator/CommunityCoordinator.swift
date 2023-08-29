//
//  CommunityCoordinator.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/08/23.
//

import UIKit

class CommunityCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    var finishDelegate: CoordinatorFinishDelegate?
    
    var type: CoordinatorType = .community
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let communityViewController  = CommunityViewController()
        communityViewController.coordinator = self
        navigationController.pushViewController(communityViewController, animated: true)
    }
    
}

extension CommunityCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        // 자식 뷰를 삭제하는 델리게이트 (자식 -> 부모 접근 -> 부모에서 자식 삭제)
        self.childCoordinators = self.childCoordinators
            .filter({ $0.type != childCoordinator.type })
        childCoordinator.navigationController.popToRootViewController(animated: true)
    }
}


extension CommunityCoordinator: CommunityDelegate {
    func pushDetailViewController(postData: PostModel) {
        
        
        
        let detailCommunityCoordinator = DetailCommunityViewCoordinator(navigationController)
        detailCommunityCoordinator.parentCoordinator = self
        childCoordinators.append(detailCommunityCoordinator)
        detailCommunityCoordinator.start(postData: postData)
    }
}
