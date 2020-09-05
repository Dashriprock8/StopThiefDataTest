//
//  Location.swift
//  StopThiefDataTest
//
//  Created by Stephen Kennedy on 2020-07-16.
//  Copyright © 2020 Stephen Kennedy. All rights reserved.
//

import Foundation

struct Location {
    var locationNumber: Int
    var buildingStreet: BuildingStreet
    var locationType: LocationType // if LocationType.crime, and a crime occurs here, change to floor/street
    var adjacentLocations: [Int] //stores array of numbers representing board spaces
    
    
    init(locationNumber: Int, buildingStreet:BuildingStreet, locationType:LocationType, adjacentLocations: [Int]){
        self.locationNumber = locationNumber
        self.buildingStreet = buildingStreet
        self.locationType = locationType
        self.adjacentLocations = adjacentLocations
    }
    
    //function called when this Location is a crime and a crime occurs as this Location;
    //during the same game, no crime can be committed at this Location space again
    mutating func changeLocationType(){
        if buildingStreet == BuildingStreet.seventhStreet{
            locationType = LocationType.street
        }
        else{
            locationType = LocationType.floor
        }
    }
    
}
