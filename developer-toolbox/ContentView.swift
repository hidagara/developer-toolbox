//
//  ContentView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 16.05.2020.
//  Copyright © 2020 Roman Guseynov. All rights reserved.
//

import SwiftUI
import CoreData
import AVKit

struct CardView: View {
    let cardTitle: String
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                Text(cardTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
        }
        .background(Color(hex: "A7ADC6"))
        .cornerRadius(8.0)
    }
}

struct ContentView: View {
    var info: [NSManagedObject] = []


    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(hex: "2C1320"))
    }

    let themes: [String] = ["All", "WWDC 2019", "WWDC 2020", "Apple Frameworks", "Swift", "XCode", "Common"]
    var body: some View {
        NavigationView {
            TabView {
                ZStack {
                    Color(hex: "2C1320")
                        .ignoresSafeArea()
                    HabitsTrackerView()
                }
                .tabItem {
                    Image(systemName: "aqi.medium")
                }
                ZStack {
                    Color(hex: "2C1320")
                        .ignoresSafeArea()
                    KnowledgeHubView()
                }.tabItem {
                    Image(systemName: "books.vertical.fill")
                }
                ZStack {
                    Color(hex: "2C1320")
                        .ignoresSafeArea()
                    DietView()
                }.tabItem {
                    Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                }
                ZStack {
                    Color(hex: "2C1320")
                        .ignoresSafeArea()
                    WorkoutView()
                }.tabItem {
                    Image(systemName: "lungs.fill")
                }
                ZStack {
                    Color(hex: "2C1320")
                        .ignoresSafeArea()
                    InspirationView()
                }.tabItem {
                    Image(systemName: "flame.circle.fill")
                }
            }
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
