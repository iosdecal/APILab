import Foundation

class SoundCloudAPI {
    func loadTracks(_ completion: (([Track]) -> Void)!) {
        let clientID = Bundle.main.infoDictionary!["client_id"] as! String
        let playlistID = "75093516"
        let url = URL(string: "http://api.soundcloud.com/playlists/\(playlistID)?client_id=\(clientID)")!

        let session = URLSession(configuration: URLSessionConfiguration.default)
        // TODO:
        // Follow instructions in the Lab's README
    }
}
