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
            let path: String = "/Users/incito/Desktop/site_content.db"
            db = try Connection("\(path)")
            print("about to use the poems table")

            poems = Table("poems")
            stories = Table("stories")
            performances = Table("performances")

            print("used the poems table about to create columns")
            
            // create poems table
            
            id = Expression<Int64>("id")
            title = Expression<String>("title")
            poemText = Expression<String>("poemText")
            poemPicture = Expression<String>("poemPicture")
            tags = Expression<String>("tags")
            print("created poems columns, creating table if not already")

                try db.run(poems.create(ifNotExists: true) { (t) in
                    t.column(id, primaryKey: true)
                    t.column(title)
                    t.column(poemText, unique: true)
                    t.column(poemPicture)
                    t.column(tags)
                })

                print("before using the table stories")
                stories = Table("stories")
                print("after using the table stories")
            
                // Create stories table
            
                storyId = Expression<Int64>("storyId")
                storyTitle = Expression<String?>("storyTitle")
                storyText = Expression<String?>("storyText")
                storyTags = Expression<String?>("storyTags")
                
                print("about to create stories table")

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
                
                print("about to create performance table")

                try! db.run(performances.create(ifNotExists: true) { (t) in
                    t.column(performanceId, primaryKey: true)
                    t.column(performanceTitle)
                    t.column(performanceLocation, unique: true)
                    t.column(performanceTags)
                })
            print("db.run(s) completed")

                
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
