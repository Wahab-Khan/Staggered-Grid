//
//  StaggeredGrid.swift
//  Staggered Grid
//
//  Created by AWKhan on 13/11/2021.
//

import SwiftUI

struct StaggeredGrid<Content : View , T : Identifiable>: View  where T : Hashable{
    
    var content: (T) -> (Content)
    
    var list : [T]
    
    
    var showIndicator : Bool
    var spacing : CGFloat
    
    var columns : Int
    
    init(columns : Int ,
         showIndecator : Bool = false ,
         spacing : CGFloat = 10 ,
         list : [T] ,
         @ViewBuilder content: @escaping (T)->
         Content){
        
        self.content = content
        self.list = list
        self.showIndicator = showIndecator
        self.spacing = spacing
        self.columns = columns
    }
    
    
    func setUpList() -> [[T]]{
        // empty subarray of colums count
        var gridArray : [[T]] = Array(repeating: [], count: columns)
        
        // splitting array for VStack
        var currentIndex : Int = 0
        
        for object in list{
            gridArray[currentIndex].append(object)
            
            if currentIndex == (columns - 1){ currentIndex = 0 }
            else{ currentIndex += 1 }
        }
        
        return gridArray
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: showIndicator){
            HStack(alignment: .top){
                ForEach(setUpList(), id: \.self){ columsData in
                    LazyVStack{
                        
                        ForEach(columsData){object in
                            content(object)
                        }
                        
                    }
                }
            }
        }
    }
    
}

struct StaggeredGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
