//
//  ClassModel.swift
//  RealmExample
//
//  Created by algo on 5/17/16.
//  Copyright © 2016 algostudio. All rights reserved.
//

import Foundation
import RealmSwift

class ClassModel: Object {
    
    dynamic var name = ""
    dynamic var address = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
