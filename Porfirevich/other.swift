//
//  other.swift
//  Porfirevich
//
//  Created by Ярослав Коваль on 14.10.2021.
//

import Foundation

extension String {
    @available(iOS 15, *)
    func markdownToAttributed() -> AttributedString {
        do {
            return try AttributedString(markdown: self)
        } catch {
            return AttributedString("Error parsing markdown: \(error)")
        }
    }
}
