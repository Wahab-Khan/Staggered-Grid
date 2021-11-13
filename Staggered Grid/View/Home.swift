//
//  Home.swift
//  Staggered Grid
//
//  Created by AWKhan on 13/11/2021.
//

import SwiftUI

struct Home: View {
    
    @State var posts : [Post] = []
    
    @State var columns : Int = 2
    
    @Namespace var animation
    
    var body: some View {
        NavigationView{
            
            StaggeredGrid(columns: columns,
                          list:  posts ,
                          content: { post in
                
                PostCardView(post: post)
                    .matchedGeometryEffect(id: post.id , in: animation)
                
            })
                .padding(.horizontal)
                .navigationTitle("Staggered")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing,
                                content: {
                        
                        Button{
                            columns += 1
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                    })
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            columns = max(columns - 1 , 1)
                        }label: {
                            Image(systemName: "minus")
                        }
                    }
                }
                .animation(.easeInOut, value: columns)
            
        }
        .onAppear{
            for index in 1...6{
                posts.append(Post(imageURL: "post\(index)"))
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct PostCardView : View {
    
    var post : Post
    
    var body : some View {
        
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10.0)
    }
}
