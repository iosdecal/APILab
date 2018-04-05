import Foundation

struct Track: Equatable {
    var id: Int
    var title: String
    var artist: String
    var artworkURL: String?
    var streamURL: URL

    init?(fromAttributes attributes: [String: AnyObject?]) {
        id = 0 // TODO: Change this value
        artist = "" // TODO: Change this value
        title = "" //TODO: Change this value

        if let artworkURL = attributes["artwork_url"] as? String {
            var originalSize: String
            var largerSize: String

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
            // TODO: Replace with correct API endpoint.
            streamURL = URL(string: "")!
        } else {
            return nil
        }
    }
}
