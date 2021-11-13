//
//  Post.swift
//  Staggered Grid
//
//  Created by AWKhan on 13/11/2021.
//

import Foundation


struct Post : Identifiable , Hashable{
    var id = UUID().uuidString
    var imageURL : String
}
