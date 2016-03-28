//
//  Checklist.swift
//  Checklists
//
//  Created by lily on 11/20/15.
//  Copyright © 2015 Seab Jackson. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name = ""
    var items = [ChecklistItem]()
    var iconName: String
    
    convenience init(name: String) {
        self.init(name: name, iconName: "No Icon")
    }
    
    init(name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = ""
        self.items = [ChecklistItem]()
        self.iconName = ""
        
        super.init()
        
        guard let name = aDecoder.decodeObjectForKey("Name") as? String else { return nil }
        guard let items = aDecoder.decodeObjectForKey("Items") as? [ChecklistItem] else { return nil }
        guard let iconName = aDecoder.decodeObjectForKey("IconName") as? String else { return nil }
        
        self.name = name
        self.items = items
        self.iconName = iconName
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
        aCoder.encodeObject(iconName, forKey: "IconName")
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count 
    }
}
