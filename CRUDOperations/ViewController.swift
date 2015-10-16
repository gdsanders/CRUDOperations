//
//  ViewController.swift
//  CRUDOperations
//
//  Created by G.D. Sanders on 10/15/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let moc = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        moc.persistentStoreCoordinator = CDHelper.sharedInstance.coordinator
        // createPeople(moc)
        updatePeople(moc)
        
        fetchPeople(moc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Create people object
    func createPeople(moc: NSManagedObjectContext) {
        let names = ["Bob", "Anthony", "Evan", "Rickey"]
        
        for n in names {
            guard let person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc)
                as? Person else
            {continue}
            person.name = n
        }
        do {
            print("Save attempt here")
            try moc.save()
        } catch {
            print("Error saving!")
        }
    }
    
    // Fetch the records and return as an array
    
    func fetchPeople (moc: NSManagedObjectContext) -> [Person]? {
        let request = NSFetchRequest(entityName: "Person")
        
        do {
            guard let people = try
            moc.executeFetchRequest(request) as? [Person] else
            {return nil}
            
            for p in people {
                print(p.name)
                print(p.age)
            }
            return people
        }
        catch {
            print("We couldn't fetch a record!")
        }
        return nil
    }

    
    func updatePeople (moc: NSManagedObjectContext) {
        guard let people = fetchPeople(moc) else {return}
        
        for p in people {
            p.age = 27
        }
        do {
            try moc.save()
        } catch {
            print("Error saving")
        }
    }


}

