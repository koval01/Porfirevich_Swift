//
//  model.swift
//  Porfirevich
//
//  Created by Ярослав Коваль on 14.10.2021.
//

import Foundation

struct Post: Codable, Identifiable {
    var id: String
    var content: String
    var likesCount: Int
    var createdAt: String
}
