//
//  DbHelper.swift
//  RealmExample
//
//  Created by algo on 5/17/16.
//  Copyright © 2016 algostudio. All rights reserved.
//

import Foundation
import RealmSwift

struct DbHelper {
    
    static func addObjc(obj: ClassModel){
    
        try! Realm().write(){
            try! Realm().add(obj)
        }
    }
    
    static func getAll() -> [ClassModel] {
        let objs: Results<ClassModel> = {
            try! Realm().objects(ClassModel)
        }()
        
        return Array(objs)
    }
    
    static func deleteByName(name: String) {
        
        let obj = try! Realm().objects(ClassModel).filter("name == %@", name)
        try! Realm().write(){
            try! Realm().delete(obj)
        }
    }
    
    static func update(obj: ClassModel){
        
        try! Realm().write(){
            try! Realm().add(obj, update: true)
        }
    }
    
}
