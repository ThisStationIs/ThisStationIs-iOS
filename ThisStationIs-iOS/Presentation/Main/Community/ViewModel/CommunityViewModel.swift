//
//  CommunityViewModel.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/24.
//

import Foundation

class CommunityViewModel: NSObject {
    
    var selectedLineArray: [String] = []
    var selectedCategoryArray: [String] = []
    var canSelect: Bool = false
    
    // 선택한 호선 저장
    func addSelectLine(lineInfo: String, tag: Int) {
        // 5개만 선택 가능하도록
        if selectedLineArray.count < 5 {
            selectedLineArray.append(lineInfo)
            canSelect = true
            print("👾 추가 완료 : \(selectedLineArray)")
        } else {
            print("최대 5개까지만 선택할 수 있어요.")
            canSelect = false
        }
    }
    
    // 선택한 호선 삭제
    func removeSelectLine(lineInfo: String, tag: Int) {
        canSelect = true
        selectedLineArray = selectedLineArray.filter { $0 != lineInfo }
        
        print("🗑 삭제 완료 : \(selectedLineArray)")
    }
    
    // 선택한 카테고리 저장
    func addSelectCategory(category: String, tag: Int) {
        if category != "전체" {
            selectedCategoryArray.append(category)
            print("👾 추가 완료 : \(selectedCategoryArray)")
        } else {
            selectedCategoryArray.removeAll()
        }
    }
    
    // 선택한 카테고리 삭제, 전체 선택 시 전부 삭제
    func removeSelectCategory(category: String, tag: Int) {
        // 전체 선택 시 선택한 카테고리 전부 해제
        if tag == 0 {
            selectedCategoryArray.removeAll()
        } else {
            selectedCategoryArray = selectedCategoryArray.filter { $0 != category }
        }
        
        print("🗑 삭제 완료 : \(selectedCategoryArray)")
    }
}
