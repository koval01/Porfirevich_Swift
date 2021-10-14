//
//  api.swift
//  Porfirevich
//
//  Created by Ярослав Коваль on 14.10.2021.
//

import Foundation

class Api {
    func getPost(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://porfirevich.herokuapp.com/random") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}
