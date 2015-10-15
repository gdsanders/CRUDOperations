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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createPeople(moc: NSManagedObjectContext) {
        let names = ["Bob", "Anthony", "Evan", "Rickey"]
        
        for n in names {
            guard let person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc)
                as? Person else
            {continue}
            person.name = n
        }
    }



}

