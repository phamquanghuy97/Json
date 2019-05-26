//
//  ObjectData.swift
//  Json
//
//  Created by Phạm Huy on 5/24/19.
//  Copyright © 2019 Phạm Huy. All rights reserved.
//

import Foundation
class google: NSObject {
    var id : Int?
    var avatar_url : String?
    override init(){
        self.id = 0
        self.avatar_url = ""
    }
    public func parseData(json: [String: Any]) {
        avatar_url = json["avatar_url"] as? String ?? ""
        id = json["id"] as? Int ?? 0
    }
}
