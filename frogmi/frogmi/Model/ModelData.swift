//
//  ModelData.swift
//  frogmi
//
//  Created by Christian Meza on 08-11-21.
//

import Foundation

struct ModelData: Hashable, Codable{
    
    let data: [Stores]
    let meta: Meta?
    let links: Links?
    
    init(data: [Stores] = [], meta: Meta? = nil, links: Links? = nil) {
        self.data  = data
        self.meta  = meta
        self.links = links
    }
    
    struct Stores : Hashable, Codable, Identifiable {
        
        let id: String
        let attributes : StoreAttributes
        
        struct StoreAttributes : Hashable, Codable{
            let name: String
            let code: String
            let full_address: String
        }
    }
    
    struct Links: Codable, Hashable{
        let prev: String?
        let next: String
        let first: String?
        let last: String?
    }

    struct Meta: Codable, Hashable{
        
        let pagination: Pagination
        
        struct Pagination: Codable, Hashable{
            let current_page: Int?
            let total: Int?
            let per_page: Int?
        }
    }
}
