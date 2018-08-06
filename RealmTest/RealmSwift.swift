//
//  RealmSwift.swift
//  RealmTest
//
//  Created by Kohei Adachi on 2018/07/30.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import Foundation
import RealmSwift

class RealmStudent: Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var name = ""
    @objc dynamic var age: Int = 0
    // idをプライマリキーに設定
    override static func primaryKey() -> String? {
        return "id"
    }
}
