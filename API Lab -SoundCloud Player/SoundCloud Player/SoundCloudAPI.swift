import Foundation

class SoundCloudAPI {

    // You'll need to use this.
    let clientID = Bundle.main.infoDictionary!["client_id"] as! String

    func loadTracks(from playlistURL: String, withCompletionHandler completion: @escaping ([Track]) -> ()) {
        // TODO:
        // Follow instructions in the Lab's README.
        guard let url = URL(string: "") else {
            // If we cant create a URL from the passed in SoundCloud URL, we fail safely.
            completion([])
            return
        }

        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            do {
                // Need to cast this to something useful. Try printing it to see what structure it has.
                let playlistDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)

                DispatchQueue.global(qos: .background).async {
                    DispatchQueue.main.async {
                        // TODO: What do we need to do after we loaded our Tracks?
                    }
                }
            } catch let error as NSError {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }

}
