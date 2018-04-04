import Foundation

class SoundCloudAPI {
    func loadTracks(_ completion: (([Track]) -> Void)!) {
        let clientID = Bundle.main.infoDictionary!["client_id"] as! String
        let playlistID = "75093516"
        let url = URL(string: "http://api.soundcloud.com/playlists/\(playlistID)?client_id=\(clientID)")!

        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) {(data, response, error) -> Void in
            if error == nil {
                var tracks: [Track] = []
                do {
                    let playlistDict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                    let trackDataList = playlistDict["tracks"] as! [[String: AnyObject?]]
                    for trackData in trackDataList {
                        if let track = Track(attributes: trackData) {
                            tracks.append(track)
                        }
                    }

                    DispatchQueue.global(qos: .background).async {
                        DispatchQueue.main.async {
                            completion(tracks)
                        }
                    }
                } catch let error as NSError {
                    print("ERROR: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
