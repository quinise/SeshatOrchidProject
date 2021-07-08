//
//  Story.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 7/6/21.
//
//  Model for stories
//

import Foundation

class Story: Identifiable {
    public var storyId: Int64 = 0
    public var storyTitle: String? = ""
    public var storyText: String? = ""
//    public var storyPicture: String = ""
    public var storyTags: String? = ""
}
