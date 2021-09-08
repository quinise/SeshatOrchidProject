//
//  Performance.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 7/7/21.
//
//  Model for performances
//

import Foundation

class Performance: Identifiable {
    public var performanceId: Int64 = 0
    public var performanceTitle: String = ""
    public var performanceLocation: String = ""
//    public var performanceDescription: String = ""
    public var performanceTags: String = ""
}
