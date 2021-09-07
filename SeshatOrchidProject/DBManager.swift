//
//  DBManager.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 7/5/21.
//
//  Database Manager: opens db connection, creates db and tables, getData
//

import Foundation
import SQLite

// how do I close the connection to the database
class DBManager {
    private var db: Connection!
    private var poems: Table!
    private var stories: Table!
    private var performances: Table!
    
    private var id: Expression<Int64>!
    private var title: Expression<String>!
    private var poemText: Expression<String>!
    private var poemPicture: Expression<String>!
    private var tags: Expression<String>!
    
    // ToDo: make these not optional
    private var storyId: Expression<Int64>!
    private var storyTitle: Expression<String?>!
    private var storyText: Expression<String?>!
    private var storyTags: Expression<String?>!
    
    // ToDo: make these not optional
    private var performanceId: Expression<Int64>!
    private var performanceTitle: Expression<String?>!
    private var performanceLocation: Expression<String?>!
    private var performanceTags: Expression<String?>!
    
    init()  {
        do {
            let path: String = "/Users/incito/Desktop/SeshatOrchidProject/site_content.db"
            db = try Connection("\(path)")

            poems = Table("poems")
            stories = Table("stories")
            performances = Table("performances")
            
            // create poems table
            
            id = Expression<Int64>("id")
            title = Expression<String>("title")
            poemText = Expression<String>("poemText")
            poemPicture = Expression<String>("poemPicture")
            tags = Expression<String>("tags")

                try db.run(poems.create(ifNotExists: true) { (t) in
                    t.column(id, primaryKey: true)
                    t.column(title)
                    t.column(poemText, unique: true)
                    t.column(poemPicture)
                    t.column(tags)
                })

                stories = Table("stories")
            
                // Create stories table
            
                storyId = Expression<Int64>("storyId")
                storyTitle = Expression<String?>("storyTitle")
                storyText = Expression<String?>("storyText")
                storyTags = Expression<String?>("storyTags")
                
                try db.run(stories.create(ifNotExists: true) { (t) in
                    t.column(storyId, primaryKey: true)
                    t.column(storyTitle)
                    t.column(storyText, unique: true)
                    t.column(storyTags)
                })
            
                // Create performances table
            
                performanceId = Expression<Int64>("performanceId")
                performanceTitle = Expression<String?>("performanceTitle")
                performanceLocation = Expression<String?>("performanceLocation")
                performanceTags = Expression<String?>("performanceTags")
                
                try! db.run(performances.create(ifNotExists: true) { (t) in
                    t.column(performanceId, primaryKey: true)
                    t.column(performanceTitle)
                    t.column(performanceLocation, unique: true)
                    t.column(performanceTags)
                })
                
        } catch {
            print("create tables", error.localizedDescription)
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
        
        stories = stories.order(storyId.desc)
        
        do {
            for story in try db.prepare(stories) {

                let storyModel: Story = Story()

                storyModel.storyId = story[storyId]
                storyModel.storyTitle  = story[storyTitle]
                storyModel.storyText = story[storyText]
                storyModel.storyTags = story[storyTags]

                storyModels.append(storyModel)
            }
        } catch {
            print("getStories", error.localizedDescription)
        }
        
      return storyModels
    }
    
    public func getPerformances() -> [Performance] {
        var performanceModels: [Performance] = []
        
        performances = performances.order(performanceId.desc)
        
        do {
            for performance in try db.prepare(performances) {
                let performanceModel: Performance = Performance()
                
                performanceModel.performanceId = performance[performanceId]
                performanceModel.performanceTitle  = performance[performanceTitle]
                performanceModel.performanceLocation = performance[performanceLocation]
                performanceModel.performanceTags = performance[performanceTags]
                
                performanceModels.append(performanceModel)
            }
        } catch {
            print("getPerformance", error.localizedDescription)
        }

      return performanceModels
    }
}
