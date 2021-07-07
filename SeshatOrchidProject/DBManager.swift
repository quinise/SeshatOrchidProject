//
//  DBManager.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 7/5/21.
//

import Foundation
import SQLite
// how do I close the connection to the database

class DBManager {
    private var db: Connection!
    private var poems: Table!
    private var stories: Table!
    
    private var id: Expression<Int64>!
    private var title: Expression<String>!
    private var poemText: Expression<String>!
    private var poemPicture: Expression<String>!
    private var tags: Expression<String>!
    
    private var storyId: Expression<Int64>!
    private var storyTitle: Expression<String>!
    private var storyText: Expression<String>!
    private var storyTags: Expression<String>!
    
    init()  {
        do {
            let path: String = "/Users/incito/Desktop/site_content.db"
            db = try Connection("\(path)")
            
            poems = Table("poems")

            id = Expression<Int64>("id")
            title = Expression<String>("title")
            poemText = Expression<String>("poemText")
            poemPicture = Expression<String>("poemPicture")
            tags = Expression<String>("tags")

            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
                try db.run(poems.create { (t) in
                    t.column(id, primaryKey: true)
                    t.column(title)
                    t.column(poemText, unique: true)
                    t.column(poemPicture)
                    t.column(tags)
                })

                UserDefaults.standard.bool(forKey: "is_db_created")
             }
            
//            stories = Table("stories")
//            
//            storyId = Expression<Int64>("storyId")
//            storyTitle = Expression<String>("storyTitle")
//            storyText = Expression<String>("storyText")
//            storyTags = Expression<String>("storyTags")
//            
//            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
//                try db.run(stories.create { (t) in
//                    t.column(storyId, primaryKey: true)
//                    t.column(storyTitle)
//                    t.column(storyText, unique: true)
//                    t.column(storyTags)
//                })
//            }
//            
        } catch {
            print("create poems table", error.localizedDescription)
        }
        
    }
    
    public func getPoems() -> [Poem] {
        var poemModels: [Poem] = []
        
        poems = poems.order(id.desc)
        
        do {
            for poem in try db.prepare(poems) {
                let poemModel: Poem = Poem()
                
                poemModel.id = poem[id]
                poemModel.title  = poem[title]
                poemModel.poemText = poem[poemText]
                poemModel.tags = poem[tags]
                
                poemModels.append(poemModel)
            }
        } catch {
            print("getPoems", error.localizedDescription)
        }

      return poemModels
    }
    
    public func getStories() -> [Story] {
        var storyModels: [Story] = []
        print("just made story models array in getStories")
        
        stories = stories.order(storyId.desc)
        print("just made table be in decending order")
        
        do {
            for story in try db.prepare(stories) {
                print("in for loop")

                let storyModel: Story = Story()
                print("declared storyModel")

                storyModel.storyId = story[storyId]
                storyModel.storyTitle  = story[storyTitle]
                storyModel.storyText = story[storyText]
                storyModel.storyTags = story[storyTags]
                print("assigned uncomming story to storyModel")

                storyModels.append(storyModel)
                print("appended storyModels array")

            }
        } catch {
            print("getStories", error.localizedDescription)
        }
        
      return storyModels
    }
}
