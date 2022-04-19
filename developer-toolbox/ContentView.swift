//
//  ContentView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 16.05.2020.
//  Copyright © 2020 Roman Guseynov. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var info: [NSManagedObject] = []

//    var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "my_storage")
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Unable to load persistent stores: \(error)")
//            }
//        }
//        return container
//    }()

    let themes: [String] = ["All", "WWDC 2019", "WWDC 2020", "Apple Frameworks", "Swift", "XCode", "Common"]
    var body: some View {
        NavigationView {
            List {
                Section("Topics To Learn") {
                    NavigationLink("Data Structures", destination: {
                        DataStructuresView()
                    })
                    NavigationLink("Algorithms") {
                        DataStructuresView()
                    }
                    NavigationLink("Swift Language") {

                    }
                    NavigationLink("Apple Platforms") {

                    }
                    NavigationLink("Frameworks") {

                    }
                }

                Section("Etc..") {
                    NavigationLink("Statistic") {
                        MyStatisticView()
                    }
                }

                Section("UI Components") {
                    NavigationLink("Animations") {
                        MyStatisticView()
                    }
                }

                Section("Some Manipulations") {
                    Button("Hello There", action: {
                        save(duration: 101)
                    })
                    Button("Fetch") {
                        fetch()
                    }
                }
            }.navigationTitle("Menu")

        }
    }

    func fetch() {
        //1
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }

        let managedContext =
        appDelegate.persistentContainer.viewContext

        //2
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "ClassInfo")

        //3
        do {
            let fetched = try managedContext.fetch(fetchRequest)
            print(fetched)
            fetched.forEach { elem in
                print(elem.value(forKey: "classDate"))
                print(elem.value(forKey: "classDuration"))
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    func save(duration: Int) {
        // 1
        guard let appDelegate =
           UIApplication.shared.delegate as? AppDelegate else {
           return
         }

         // 1
         let managedContext =
           appDelegate.persistentContainer.viewContext

        // 2
        let entity =
        NSEntityDescription.entity(forEntityName: "ClassInfo",
                                   in: managedContext)!

        let classInfo = NSManagedObject(entity: entity,
                                        insertInto: managedContext)

        // 3
        classInfo.setValue(Date(), forKeyPath: "classDate")
        classInfo.setValue(duration, forKey: "classDuration")
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
