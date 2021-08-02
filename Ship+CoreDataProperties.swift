// Ship+CoreDataProperties.swift

// MARK: - LIBRARIES -

import Foundation
import CoreData



extension Ship {
   
   @nonobjc
   public class func fetchRequest()
   -> NSFetchRequest<Ship> {
      
      return NSFetchRequest<Ship>(entityName: "Ship")
   }
   
   
   @NSManaged public var name: String?
   @NSManaged public var universe: String?
   
   
   
   // MARK: - COMPUTED PROPERTIES -
   
   var computedName: String { return name ?? "N/A" }
   var computedUniverse: String { return universe ?? "N/A" }
}





// MARK: - EXTENSIONS -

extension Ship : Identifiable {}
