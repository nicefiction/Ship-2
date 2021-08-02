// ContentView.swift
// MARK: - SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/filtering-fetchrequest-using-nspredicate

// MARK: - LIBRARIES -

import SwiftUI
import CoreData



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @FetchRequest(entity: Ship.entity(),
                 sortDescriptors: [],
                 // predicate: NSPredicate(format: "universe == 'Star Wars'"),
                 // predicate: NSPredicate(format: "universe == %@", "Star Wars"),
                 // predicate: NSPredicate(format: "name < %a", "F"),
                 // predicate: NSPredicate(format: "universe IN %@", ["Firefly", "Aliens", "Star Trek"]),
                 // predicate: NSPredicate(format: "name BEGINSWITH %@", "E"),
                 // predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e"),
                 // predicate: NSPredicate(format: "name CONTAINS[c] %@", "e"),
                 predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e"),
                 animation: nil) var ships: FetchedResults<Ship>
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         List {
            ForEach(ships,
                    id: \.self) { (ship: Ship) in
               Text(ship.computedName)
            }
         }
         Button("Create Ships") {
            let ship1 = Ship(context: moc)
            ship1.name = "Enterprise"
            ship1.universe = "Star Trek"
            
            let ship2 = Ship(context: self.moc)
            ship2.name = "Defiant"
            ship2.universe = "Star Trek"
            
            let ship3 = Ship(context: self.moc)
            ship3.name = "Millennium Falcon"
            ship3.universe = "Star Wars"
            
            let ship4 = Ship(context: self.moc)
            ship4.name = "Executor"
            ship4.universe = "Star Wars"
            
            if self.moc.hasChanges {
               try? self.moc.save()
            }
         }
         .padding()
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
   }
}
