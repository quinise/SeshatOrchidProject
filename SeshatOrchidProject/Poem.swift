//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/19/21.
//
//  Model for Poems
//

import Foundation

class Poem: Identifiable {
    public var id: Int64 = 0
    public var title: String = ""
    public var poemPicture: String = ""
    public var poemText: String = ""
    public var tags: String = ""
    
    var mainImage: String {
        title.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
}
