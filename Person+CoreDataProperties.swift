//
//  Person+CoreDataProperties.swift
//  CRUDOperations
//
//  Created by G.D. Sanders on 10/15/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var age: NSNumber?
    @NSManaged var name: String?

}
