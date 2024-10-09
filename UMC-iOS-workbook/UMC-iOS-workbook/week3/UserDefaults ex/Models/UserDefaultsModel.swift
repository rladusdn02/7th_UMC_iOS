//
//  UserDefaultsModel.swift
//  UMC-iOS-workbook
//
//  Created by 김연우 on 10/9/24.
//

import Foundation
class UserDefaultsModel{
    private let userDefaults = UserDefaults.standard
    private let userTextKey: String = "userText"
        /// 유저가 입력한 텍스트 값을 UserDefaults에 저장합니다.
        /// - Parameter text: 유저가 입력한 텍스트 값
        public func saveUserText(_ text: String) {
            //저장하고 불러오기 위한 키값을 지정
            userDefaults.set(text, forKey: userTextKey)
        }
        
        /// UserDefaults에 저장된 값을 불러옵니다.
        /// - Returns: 저장된 값 String으로 return
        public func loadUserText() -> String? {
            return userDefaults.string(forKey: userTextKey)
        }
}
