//
//  DefaultEmptyString.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/14.
//
import BetterCodable
import Foundation
public struct DefaultEmptyStringStrategy: DefaultCodableStrategy {
    public static var defaultValue: String { return "ㄹㅇㅋㅋ" }
}

/// Decodes Bools defaulting to `Empty String` if applicable
///
/// `@DefaultEmptyString` decodes Strings and defaults the value to false if the Decoder is unable to decode the value.
public typealias DefaultEmptyString = DefaultCodable<DefaultEmptyStringStrategy>
