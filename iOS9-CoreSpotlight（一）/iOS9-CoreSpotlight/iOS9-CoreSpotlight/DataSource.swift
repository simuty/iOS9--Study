//
//  DataSource.swift
//  iOS9-CoreSpotlight
//
//  Created by 51Testing on 15/11/11.
//  Copyright © 2015年 HHW. All rights reserved.
//

import UIKit

import CoreSpotlight

class DataSource: NSObject {
    
    var peopleArray: [PersonModel]
    //为验证输出信息
    //let identifier = "com.hhw.identifier|"
    
    let identifier = ""

    
    override init() {
        let becky = PersonModel()
        becky.name = "Becky"
        becky.id = "1"
        becky.image = UIImage(named: "becky")!
        
        let ben = PersonModel()
        ben.name = "Ben"
        ben.id = "2"
        ben.image = UIImage(named: "ben")!
        
        let jane = PersonModel()
        jane.name = "Jane"
        jane.id = "3"
        jane.image = UIImage(named: "jane")!
        
        let pete = PersonModel()
        pete.name = "Pete"
        pete.id = "4"
        pete.image = UIImage(named: "pete")!
        
        let ray = PersonModel()
        ray.name = "Ray"
        ray.id = "5"
        ray.image = UIImage(named: "ray")!
        
        let tom = PersonModel()
        tom.name = "Tom"
        tom.id = "6"
        tom.image = UIImage(named: "tom")!
        
        peopleArray = [becky, ben, jane, pete, ray, tom];
        
    }
    
    
    func friendFromID(id: String) -> PersonModel? {
        for person in peopleArray {
            if person.id == id {
                return person
            }
        }
        return nil
    }

    
    
    func savePeopleToIndex() {
        
        /*
         *  注意：当第一次创建完Item后，如果需要更改，目前测试了好多，它不会随着你的插入而替换更新，需要删除再次添加
         */
        
        
        
        //定义一个CSSearchableItem类型的数组，为SearchSpotlight提供筛选的Item
        var searchableItems = [CSSearchableItem]()
        
        for person in peopleArray {
            //创建搜索时显示的Item,属性有很多，下面对常用的title、contentDescription、thumbnailData进行设置；
           let set = CSSearchableItemAttributeSet(itemContentType: "image" as String)
            set.title = person.name
            set.contentDescription = "This is \(person.name)"
            set.thumbnailData = UIImagePNGRepresentation(person.image)
            
        //以唯一的Identifier为索引，存储暴露在系统存储的控件
            let item = CSSearchableItem(uniqueIdentifier: person.id, domainIdentifier: "hhw", attributeSet: set)
            searchableItems.append(item)
        }
        
        //设置搜索时显示的位置
        CSSearchableIndex.defaultSearchableIndex().indexSearchableItems(searchableItems) { error -> Void in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    
    
    }
    
    
    //删除
    func deleteItem(person: PersonModel){
        let identifiers = ["\(identifier) \(person.id)"]
        CSSearchableIndex.defaultSearchableIndex().deleteSearchableItemsWithIdentifiers(identifiers) { (error) -> Void in
            print(error?.localizedDescription)
        }
    }
    
    
}
