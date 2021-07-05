//
//  DBManager.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 7/5/21.
//

import Foundation
import SQLite

class DBManager {
    private var db: Connection!
    private var poems: Table!
    
    private var id: Expression<Int64>!
    private var title: Expression<String>!
    private var poemText: Expression<String>!
    private var tags: Expression<String>!
    
    init()  {
        do {
            let path: String = "/Users/incito/Desktop/site_content.db"
            db = try Connection("\(path)")
            
            poems = Table("poems")
            
            id = Expression<Int64>("id")
            title = Expression<String>("title")
            poemText = Expression<String>("poemText")
            tags = Expression<String>("tags")
            
            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
                try db.run(poems.create { (t) in
                    t.column(id, primaryKey: true)
                    t.column(title)
                    t.column(poemText, unique: true)
                    t.column(tags)
                })
                
                UserDefaults.standard.bool(forKey: "is_db_created")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func getPoems() -> [Poem] {
        var poemModels: [Poem] = []
        
        poems = poems.order(id.desc)
        
        do {
            for poem in try db.prepare(poems) {
                var poemModel: Poem = Poem()
                
                poemModel.id = poem[id]
                poemModel.title  = poem[title]
                poemModel.poemText = poem[tags]
                
                poemModels.append(poemModel)
            }
        } catch {
            print(error.localizedDescription)
        }
        
      return poemModels
    }
}
