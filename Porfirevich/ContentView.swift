//
//  ContentView.swift
//  Porfirevich
//
//  Created by Ярослав Коваль on 14.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var posts: [Post] = []
    
    func update_posts() {
        Api().getPost { (posts_getted) in
            posts.append(contentsOf: posts_getted)
        }
    }
    
    var drag: some Gesture {
        DragGesture()
          .onChanged { state in
              update_posts()
          }
          .onEnded { state in
              update_posts()
          }
    }
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack {
                    let text_block = post.content
                    
                    Spacer(minLength: 3)
                    if #available(iOS 15.0, *) {
                        Text(text_block.markdownToAttributed())
                        
                    } else {
                        Text("Форматирование текста доступно для iOS 15 и выше.")
                        
                        Spacer(minLength: 5)
                        Text(text_block)
                    }
                    
                    Spacer(minLength: 7)
                    Text("❤️ \(String(post.likesCount))")
                        .fontWeight(.medium)
                    
                    Spacer(minLength: 3)
                }
            }
            .onAppear() {
                Api().getPost { (posts) in
                    self.posts = posts
                }
            } .navigationBarTitle("Порфирьевич")
        } .gesture(drag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
