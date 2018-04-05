import Foundation

struct Track: Equatable {
    var id: Int
    var title: String
    var artist: String
    var artworkURL: String?
    var streamURL: URL

    init?(attributes: [String: AnyObject?]) {
        id = 0// TODO: Change this value
        artist = ""// TODO: Change this value
        title = "" //TODO: Change this value

        var originalSize: String
        var largerSize: String

        if let artworkURL = attributes["artwork_url"] as? String {
            self.artworkURL = artworkURL
            if artworkURL.last == "0" {
                originalSize = "80&height=80"
                largerSize = "500&height=500"
            } else {
                originalSize = "large.jpg"
                largerSize = "t500x500.jpg"
            }

            self.artworkURL = artworkURL.replacingOccurrences(of: originalSize, with: largerSize)
        }

        if let streamable = attributes["streamable"] as? Bool, streamable {
            let clientID = Bundle.main.infoDictionary!["client_id"] as! String
            streamURL = URL(string: "https://api.soundcloud.com/tracks/\(id)/stream?client_id=\(clientID)")!
        } else {
            return nil
        }
    }
}
