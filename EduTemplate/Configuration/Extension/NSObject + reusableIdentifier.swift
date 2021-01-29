//
//  NSObject + reusableIdentifier.swift
//  sampleTabBar
//
//  Created by 김우성 on 2021/01/06.
//
import Foundation

extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
