//
//  Poem.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/19/21.
//
import Foundation

class PoemModel: Identifiable {
    public var id: Int64 = 0
    public var title: String = ""
    public var poemText: String = ""
    public var tags: String = ""
}
