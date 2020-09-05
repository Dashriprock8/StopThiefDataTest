//
//  GameState.swift
//  StopThiefDataTest
//
//  Created by Stephen Kennedy on 2020-07-17.
//  Copyright © 2020 Stephen Kennedy. All rights reserved.
//

import Foundation

class GameState{
    
    let MAX_NUM_CRIMESCENES = 19
    let PERCENT_CHANCE_THIEF_DOES_NOT_MOVE = 10
    
    var gameBoard: [Int: Location] = [:] //stores Location spaces where thief might be
    
    let crimeScenes = [123,144,146,164,242,245,247,265,267,337,352,355,376,425,445,463,465,467,709]
    var currentLocation = 0
    var previousLocation = 0
    
    init(){
        createGameboard()
    }
    
    //function called from constructor to initialize gameBoard dictionary
    func createGameboard(){
        //insert a “do nothing” location at index 0
        //this occurs when 10% of the time the thief does not move;
        //this “action” is still recorded in the thief’s move history so needs a location 
        //corresponding to a sound
         insertLocation(locationNumber: 0, buildingStreet: BuildingStreet.furs, locationType: LocationType.donothing, adjacentLocations: [])
        //add all the remaining game board locations
        addFurriers()
        addJewelers()
        addAntiques()
        addBank()
        addFifthStreet()
        addSixthStreet()
        addSeventhStreet()
        addEighthStreet()
    }
    
    func addFurriers(){
        insertLocation(locationNumber: 113, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [503,124,123])
        insertLocation(locationNumber: 117, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [507,126,127])
        insertLocation(locationNumber: 123, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [113,124,132])
        insertLocation(locationNumber: 124, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [113,123,125])
        insertLocation(locationNumber: 125, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [124,126,136])
        insertLocation(locationNumber: 126, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [125,136,117,127])
        insertLocation(locationNumber: 127, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [117,126,136,128])
        insertLocation(locationNumber: 128, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [117,127,519,539])
        insertLocation(locationNumber: 131, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [132,142,630]) //check out 650
        insertLocation(locationNumber: 132, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [131,142,123])
        insertLocation(locationNumber: 136, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [125,126,127,146,147])
        insertLocation(locationNumber: 142, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [131,132,151,152,153])
        insertLocation(locationNumber: 144, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [154,153])
        insertLocation(locationNumber: 146, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [136,147,157])
        insertLocation(locationNumber: 147, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [136,146,157,148])
        insertLocation(locationNumber: 148, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [147,157,539,559])
        insertLocation(locationNumber: 151, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [142,152,162,650])
        insertLocation(locationNumber: 152, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [142,151,153,162])
        insertLocation(locationNumber: 153, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [142,152,162,144,154,164])
        insertLocation(locationNumber: 154, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [144,153,164,165])
        insertLocation(locationNumber: 157, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [146,147,148,166,167,168])
        insertLocation(locationNumber: 162, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [151,152,153,171,172,173])
        insertLocation(locationNumber: 164, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [153,154,165,173])
        insertLocation(locationNumber: 165, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [154,164,166,176])
        insertLocation(locationNumber: 166, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [165,167,176])
        insertLocation(locationNumber: 167, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [166,157,168,176])
        insertLocation(locationNumber: 168, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [157,167,559,579])
        insertLocation(locationNumber: 171, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [162,172,670])
        insertLocation(locationNumber: 172, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [162,171,173,182])
        insertLocation(locationNumber: 173, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [162,172,164,182])
        insertLocation(locationNumber: 176, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [165,166,167,185])
        insertLocation(locationNumber: 182, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [172,173,591,593])
        insertLocation(locationNumber: 185, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [176,595])
        
    }
    
    func addJewelers(){
        insertLocation(locationNumber: 231, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [630,242])
        insertLocation(locationNumber: 251, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [650,242,252])
        insertLocation(locationNumber: 271, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [670,272])
        insertLocation(locationNumber: 242, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [231,251,252,233])
        insertLocation(locationNumber: 252, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [251,242,263])
        insertLocation(locationNumber: 272, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [271,282,273,263])
        insertLocation(locationNumber: 282, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [272,273,691,693])
        insertLocation(locationNumber: 223, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [233,214]) //check out 214
        insertLocation(locationNumber: 233, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [223,242])
        insertLocation(locationNumber: 263, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [252,272,273,274])
        insertLocation(locationNumber: 273, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [263,272,282,284,274])
        insertLocation(locationNumber: 214, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [703,705,223,225])
        insertLocation(locationNumber: 274, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [263,273,284,275,265])
        insertLocation(locationNumber: 284, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [273,274,275,693,695])
        insertLocation(locationNumber: 225, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [214,235,226])
        insertLocation(locationNumber: 235, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [225,226,245])
        insertLocation(locationNumber: 245, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [235,255])
        insertLocation(locationNumber: 255, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [245,265])
        insertLocation(locationNumber: 265, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [255,274,275,276])
        insertLocation(locationNumber: 275, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [265,274,284,286,276])
        insertLocation(locationNumber: 226, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [225,235,237,227,217])
        insertLocation(locationNumber: 276, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [265,275,286,267])
        insertLocation(locationNumber: 286, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [275,276,695,697])
        insertLocation(locationNumber: 217, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [707,226,227])
        insertLocation(locationNumber: 227, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [217,226,237,228])
        insertLocation(locationNumber: 237, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [226,227,228,247])
        insertLocation(locationNumber: 247, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [237,257])
        insertLocation(locationNumber: 257, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [247,267,268])
        insertLocation(locationNumber: 267, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [257,276,268])
        insertLocation(locationNumber: 228, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [227,237,619,639])
        insertLocation(locationNumber: 268, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [257,267,679,659])
        
    }
    
    func addAntiques(){
        insertLocation(locationNumber: 314, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [703,705,324,325])
        insertLocation(locationNumber: 317, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [707,326,327])
        insertLocation(locationNumber: 324, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [314,333,325])
        insertLocation(locationNumber: 325, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [324,314,326])
        insertLocation(locationNumber: 326, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [325,317,327,337])
        insertLocation(locationNumber: 327, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [317,326,328,337])
        insertLocation(locationNumber: 328, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [327,337,719,739])
        insertLocation(locationNumber: 331, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [830,332,342])
        insertLocation(locationNumber: 332, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [331,333,342])
        insertLocation(locationNumber: 333, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [332,342,324,344])
        insertLocation(locationNumber: 337, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [326,327,328,347])
        insertLocation(locationNumber: 342, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [331,332,333,351,352])
        insertLocation(locationNumber: 344, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [333,345,355,354])
        insertLocation(locationNumber: 345, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [344,355,354])
        insertLocation(locationNumber: 347, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [337,357,358])
        insertLocation(locationNumber: 351, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [850,342,352,362])
        insertLocation(locationNumber: 352, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [342,351,362])
        insertLocation(locationNumber: 354, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [344,345,355,365])
        insertLocation(locationNumber: 355, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [345,344,354,365])
        insertLocation(locationNumber: 357, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [347,358,367])
        insertLocation(locationNumber: 358, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [347,357,367,759])
        insertLocation(locationNumber: 362, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [351,352,371,372,373])
        insertLocation(locationNumber: 365, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [354,355,374,375,376])
        insertLocation(locationNumber: 367, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [357,358,376])
        insertLocation(locationNumber: 371, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [870,362,372])
        insertLocation(locationNumber: 372, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [371,362,373])
        insertLocation(locationNumber: 373, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [362,372,374,384])
        insertLocation(locationNumber: 374, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [365,373,375,384])
        insertLocation(locationNumber: 375, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [365,374,384,376,386])
        insertLocation(locationNumber: 376, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [365,367,375,386])
        insertLocation(locationNumber: 384, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [373,374,375,793,795])
        insertLocation(locationNumber: 386, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [375,376,795,797])
    }
    
    func addBank(){
        insertLocation(locationNumber: 441, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [830,850,432,442,452])
        insertLocation(locationNumber: 471, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [870,472])
        insertLocation(locationNumber: 432, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [441,442,443,423])
        insertLocation(locationNumber: 442, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [441,432,452,443])
        insertLocation(locationNumber: 452, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [441,442,443,463])
        insertLocation(locationNumber: 472, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [471,482,463])
        insertLocation(locationNumber: 482, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [472,891,893])
        insertLocation(locationNumber: 413, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [503,423,424])
        insertLocation(locationNumber: 423, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [413,432,424])
        insertLocation(locationNumber: 443, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [432,442,452,444])
        insertLocation(locationNumber: 463, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [452,472,464])
        insertLocation(locationNumber: 424, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [413,423,425])
        insertLocation(locationNumber: 444, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [443,445])
        insertLocation(locationNumber: 464, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [463,465])
        insertLocation(locationNumber: 425, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [424,426])
        insertLocation(locationNumber: 445, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [444,446,456])
        insertLocation(locationNumber: 465, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [464,456,466])
        insertLocation(locationNumber: 426, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [425,427,437])
        insertLocation(locationNumber: 446, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [445,456,447,437])
        insertLocation(locationNumber: 456, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [445,446,447,465,466,467])
        insertLocation(locationNumber: 466, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [465,456,467,477])
        insertLocation(locationNumber: 427, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [426,437,428])
        insertLocation(locationNumber: 437, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [426,427,428,446,447,448])
        insertLocation(locationNumber: 447, buildingStreet: BuildingStreet.furs, locationType: LocationType.floor, adjacentLocations: [437,446,456,448])
        insertLocation(locationNumber: 467, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [456,466,477,468])
        insertLocation(locationNumber: 477, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [466,467,468,487])
        insertLocation(locationNumber: 487, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [477,897])
        insertLocation(locationNumber: 428, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [819,839,427,437])
        insertLocation(locationNumber: 448, buildingStreet: BuildingStreet.furs, locationType: LocationType.window, adjacentLocations: [839,859,437,447])
        insertLocation(locationNumber: 468, buildingStreet: BuildingStreet.furs, locationType: LocationType.door, adjacentLocations: [859,879,467,477])
       
    }
    
    func addFifthStreet(){
        insertLocation(locationNumber: 500, buildingStreet: BuildingStreet.furs, locationType: LocationType.subway, adjacentLocations: [500,501,599,610,699,701,799,810,899])
        insertLocation(locationNumber: 501, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [500,503]) //890?
        insertLocation(locationNumber: 503, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [501,505,113,413])
        insertLocation(locationNumber: 505, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [503,507])
        insertLocation(locationNumber: 507, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [505,509,117])
        insertLocation(locationNumber: 509, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [507,519,819])
        insertLocation(locationNumber: 519, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [509,539,128])
        insertLocation(locationNumber: 539, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [519,559,128,148]) //505?
        insertLocation(locationNumber: 559, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [539,579,148,168])
        insertLocation(locationNumber: 579, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [559,599,168])
        insertLocation(locationNumber: 599, buildingStreet: BuildingStreet.furs, locationType: LocationType.subway, adjacentLocations: [579,597,599,500,699,799,899])
        insertLocation(locationNumber: 597, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [599,595])
        insertLocation(locationNumber: 595, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [597,593,185])
        insertLocation(locationNumber: 593, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [595,591,182])
        insertLocation(locationNumber: 591, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [593,690,182])
        
    }
    
    func addSixthStreet(){
        insertLocation(locationNumber: 610, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [500,630])
        insertLocation(locationNumber: 630, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [610,650,131,231]) //890?
        insertLocation(locationNumber: 650, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [630,670,151,251])
        insertLocation(locationNumber: 670, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [650,690,171,271])
        insertLocation(locationNumber: 690, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [670,591,691])
        insertLocation(locationNumber: 691, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [690,693,282])
        insertLocation(locationNumber: 693, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [691,695,282,284])
        insertLocation(locationNumber: 695, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [693,697,284,286]) //505?
        insertLocation(locationNumber: 697, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [695,699,286])
        insertLocation(locationNumber: 699, buildingStreet: BuildingStreet.furs, locationType: LocationType.subway, adjacentLocations: [697,679,699,799,899,599,500])
        insertLocation(locationNumber: 679, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [699,659])
        insertLocation(locationNumber: 659, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [679,639,268])
        insertLocation(locationNumber: 639, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [659,619,228])
        insertLocation(locationNumber: 619, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [639,709,228])
        
    }
    
    func addSeventhStreet(){
        insertLocation(locationNumber: 701, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [500,703]) //890?
        insertLocation(locationNumber: 703, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [701,705,214,314])
        insertLocation(locationNumber: 705, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [703,707,214,314])
        insertLocation(locationNumber: 707, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [705,709,217,317])
        insertLocation(locationNumber: 709, buildingStreet: BuildingStreet.furs, locationType: LocationType.crime, adjacentLocations: [707,719,619])
        insertLocation(locationNumber: 719, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [709,739,328])
        insertLocation(locationNumber: 739, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [719,759,328]) //505?
        insertLocation(locationNumber: 759, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [739,779,358])
        insertLocation(locationNumber: 779, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [759,799])
        insertLocation(locationNumber: 799, buildingStreet: BuildingStreet.furs, locationType: LocationType.subway, adjacentLocations: [779,797,799,500,599,699,899])
        insertLocation(locationNumber: 797, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [799,795,386])
        insertLocation(locationNumber: 795, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [797,793,386])
        insertLocation(locationNumber: 793, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [795,791,384])
        insertLocation(locationNumber: 791, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [793,890])
    }
    
    func addEighthStreet(){
        insertLocation(locationNumber: 810, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [500,830])
        insertLocation(locationNumber: 830, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [810,850,331]) //890?
        insertLocation(locationNumber: 850, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [830,870,351])
        insertLocation(locationNumber: 870, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [850,890,371,471])
        insertLocation(locationNumber: 890, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [870,791,891])
        insertLocation(locationNumber: 891, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [890,893,482])
        insertLocation(locationNumber: 893, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [891,895,482])
        insertLocation(locationNumber: 895, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [893,897]) //505?
        insertLocation(locationNumber: 897, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [895,899,487])
        insertLocation(locationNumber: 899, buildingStreet: BuildingStreet.furs, locationType: LocationType.subway, adjacentLocations: [897,879,699,799,899,599,500])
        insertLocation(locationNumber: 879, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [899,859,468])
        insertLocation(locationNumber: 859, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [879,839,468])
        insertLocation(locationNumber: 839, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [859,819,428,448])
        insertLocation(locationNumber: 819, buildingStreet: BuildingStreet.furs, locationType: LocationType.street, adjacentLocations: [839,509,428])
    }
    
    func insertLocation(locationNumber:Int, buildingStreet:BuildingStreet, locationType:LocationType, adjacentLocations:[Int]){
        gameBoard[locationNumber] = Location(locationNumber: locationNumber, buildingStreet: buildingStreet, locationType: locationType, adjacentLocations: adjacentLocations)
    }
    
    //Called to start the game. it will return a board location that is a crime.
    func getFirstClue() -> Int{
      currentLocation = crimeScenes[getRandomNumber(max: MAX_NUM_CRIMESCENES)]
        return currentLocation
    }
    
    //Called whenever a clue is needed except for the very first time when the game starts
    //Does various checks including whether the thief doesn’t move
    func getClue()->Int{
        var nextLocation = 0
        
        //check to see if thief does nothing
        if getRandomNumber(max: PERCENT_CHANCE_THIEF_DOES_NOT_MOVE) == 0{
            return 0
        }
        if gameBoard[currentLocation]?.locationType==LocationType.crime{
            gameBoard[currentLocation]?.changeLocationType()
        }
    
        nextLocation=getNextLocation()
        previousLocation = currentLocation
        currentLocation=nextLocation
        
        return currentLocation
    }
    
    //Called from getClue to do extensive checks on the adjacent locations of the currentLocation of the thief
    func getNextLocation() -> Int {
        
    
        //get list of adjacent locations
        var adjacentLocations = gameBoard[currentLocation]?.adjacentLocations
        
        //thief cannot return to location she/he was just at so remove from list
        adjacentLocations?.remove(at: getIndexOfMatchingValue(adjacents: adjacentLocations!,lookingFor:previousLocation))
        
        //is the current location a door or window; if so thief HAS TO go through it
        if gameBoard[currentLocation]?.locationType==LocationType.door || gameBoard[currentLocation]?.locationType==LocationType.window{
            adjacentLocations=getLocationsOnOtherSideOfDoorWindow(adjacents: adjacentLocations!)
        }
        
        //is the current location a subway
        if gameBoard[currentLocation]?.locationType==LocationType.subway{
            adjacentLocations=dealWithSubwayTravel(adjacents: adjacentLocations!)
        }
        
        //if any of the remaining adjacent locations is a crime location thief must go there
        let crimeLocations: [Int] = lookForAdjacentCrimeLocations(adjacents: adjacentLocations!)
        if crimeLocations.count != 0{
            adjacentLocations = crimeLocations
        }
        
        //randomly choose a location number from the array and return it
        return adjacentLocations![getRandomNumber(max: (adjacentLocations?.count)!)]
    }
    
    //once a thief leaves a building, all the valuables are replenished and floor locations return to being crime locations
    func resetTheCrimeScenes(){
        //get the building number
        let buildingNumber = currentLocation/100
        
        var crimeLocations:[Int] = []
        //for that building, get the list of crime locations
        switch buildingNumber {
        case 1:
            crimeLocations=[123,144,146,164]
        case 2:
            crimeLocations=[242,245,247,265,267]
        case 3:
            crimeLocations=[337,352,355,376]
        default:
            crimeLocations=[425,445,463,465,467]
        }
        //loop through crime locations and ensure they are crime
        for index in 0 ... crimeLocations.count-1{
            let locationNumber = crimeLocations[index]
            gameBoard[locationNumber]?.locationType = LocationType.crime
        }
        
    }
    
    //examine the lost of adjacent locations and extract an array of just the crime scenes
    func lookForAdjacentCrimeLocations(adjacents: [Int])->[Int]{
        var crimeLocations: [Int] = []
        
        for index in 0 ... adjacents.count-1{
            let locationNumber = adjacents[index]
            
            let location = gameBoard[locationNumber]
            if location != nil{
                if location?.locationType==LocationType.crime{
                    crimeLocations.append(adjacents[index])
                }
            }
        }
        return crimeLocations
    }
    
    
    func dealWithSubwayTravel(adjacents:[Int])->[Int]{
        var tempAdjacents = adjacents
        //if previousLocation was a subway, thief already travelled so can’t immediately travel again
        if gameBoard[previousLocation]?.locationType==LocationType.subway{
            tempAdjacents = getNonSubwayLocations(adjacents: tempAdjacents)
        }
        else{
            //if the currentLocation is a corner subway, thief must take subway
            if currentLocation==599 || currentLocation==699 || currentLocation==799 || currentLocation==899{
                tempAdjacents = [500,599,699,799,899]
            }
        }
        return tempAdjacents
    }
    func getLocationsOnOtherSideOfDoorWindow(adjacents:[Int])->[Int]{
        var tempAdjacents = adjacents
        //if the previousLocation is greater than 499, thief was on the street and is entering the building
        if previousLocation>499 {
            tempAdjacents = getIndexOfGreaterOrLesserValue(adjacents: tempAdjacents, lookingFor: 499, greaterOrLessThan: GreaterOrLessThan.lessThan)
        }
        else{
            //go through adjacents list and get anything > 499; this indicates an outside door/window
            tempAdjacents = getIndexOfGreaterOrLesserValue(adjacents: tempAdjacents, lookingFor: 499, greaterOrLessThan: GreaterOrLessThan.greaterThan)
            //if there are items in list, thief was leaving building so reset the crime locations
            if tempAdjacents.count != 0{
                resetTheCrimeScenes()
            }
        }
        //check if door/window is inside a building; if tempAdjacents has no items, the door/window is inside
        if tempAdjacents.count == 0{
            tempAdjacents=adjacents //reset working list of adjacent locations
            if previousLocation > currentLocation{
                    tempAdjacents = getIndexOfGreaterOrLesserValue(adjacents: tempAdjacents, lookingFor: currentLocation, greaterOrLessThan: GreaterOrLessThan.lessThan)            }
            else{
                    tempAdjacents = getIndexOfGreaterOrLesserValue(adjacents: tempAdjacents, lookingFor: currentLocation, greaterOrLessThan: GreaterOrLessThan.greaterThan)            }
        }
        return tempAdjacents
    }
    
    //loop through the list of adjacent locations for a given value and return index
    func getIndexOfMatchingValue(adjacents:[Int],lookingFor:Int)->Int{
        for index in 0 ... adjacents.count-1{
            if lookingFor == adjacents[index]{
                return index
            }
        }
        return 0
    }
    
    //loop through the list of adjacent locations for a given value greater or less than an array value and return index
    func getIndexOfGreaterOrLesserValue(adjacents:[Int],lookingFor:Int,greaterOrLessThan:GreaterOrLessThan)->[Int]{
        var tempAdjacents:[Int] = []
        
        if greaterOrLessThan==GreaterOrLessThan.greaterThan{
        for index in 0 ... adjacents.count-1{
            if adjacents[index]>lookingFor{
                tempAdjacents.append(adjacents[index])
            }
        }
        }
        else{
            for index in 0 ... adjacents.count-1{
                if adjacents[index]<lookingFor{
                      tempAdjacents.append(adjacents[index])                }
            }
        }
        return tempAdjacents
    }
    
    //thief just took the subway so has to exit to street; get adjacent street locations
    func getNonSubwayLocations(adjacents:[Int])->[Int]{
        var tempAdjacents:[Int] = []
        
            for index in 0 ... adjacents.count-1{
                let locationNumber = adjacents[index]
                
                let location = gameBoard[locationNumber]
                if location != nil{
                if location?.locationType==LocationType.subway{
                    tempAdjacents.append(adjacents[index])
                }
            }
        }
        return tempAdjacents
    }
    
    
    
    //Return a random number from 0 to the parameter max-1
    func getRandomNumber(max: Int) -> Int {
        let randomNum = Int(arc4random_uniform(UInt32(max)))
        return randomNum
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
