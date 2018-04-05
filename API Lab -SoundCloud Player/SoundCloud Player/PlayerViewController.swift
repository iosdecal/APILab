import UIKit
import AVFoundation
import AVKit

class PlayerViewController: UIViewController {

    @IBOutlet var trackImageView: UIImageView!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!

    var soundCloudAPI: SoundCloudAPI
    var player: AVQueuePlayer!

    var tracks: [Track]!
    var currentIndex: Int
    var currentTrack: Track?

    required init?(coder aDecoder: NSCoder) {
        soundCloudAPI = SoundCloudAPI()
        currentIndex = 0

        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        soundCloudAPI.loadTracks(from: "https://soundcloud.com/bruin-pollard/sets/uc-berkeley-math-1b-professor-coward", withCompletionHandler: didLoadTracks)
        player = AVQueuePlayer()

        playPauseButton.setImage(UIImage(named: "pause")?.withRenderingMode(.alwaysTemplate), for: UIControlState.selected)
    }

    func load(track: Track) {
        let isPlaying = player.rate != 0

        asyncLoadTrackImage(track)

        titleLabel.text = track.title
        artistLabel.text = track.artist

        currentTrack = track
        player = AVQueuePlayer(playerItem: AVPlayerItem(url: track.streamURL))

        if isPlaying {
            player.play()
        }
    }

    @IBAction func playOrPauseTrack(_ sender: UIButton) {
        if player.rate != 0 {
            playPauseButton.isSelected = false
            player.pause()
        } else {
            playPauseButton.isSelected = true
            player.play()
        }

        let track = tracks[currentIndex]
        if currentTrack != track {
            load(track: track)
        }
    }

    @IBAction func nextTrackTapped(_ sender: UIButton) {
        if currentIndex < tracks.count - 1 {
            currentIndex += 1
            load(track: tracks[currentIndex])
        }
    }

    @IBAction func previousTrackTapped(_ sender: UIButton) {
        if currentIndex == 0 || (Int(player.currentTime().value) / Int(player.currentTime().timescale)) > 3 {
            player.seek(to: CMTime(seconds: 0, preferredTimescale: 1))
        } else {
            currentIndex -= 1
            load(track: tracks[currentIndex])
        }
    }

    func asyncLoadTrackImage(_ track: Track) {
        guard let artworkURL = track.artworkURL, let url = URL(string: artworkURL) else {
            trackImageView.image = UIImage(named: "missing")
            return
        }

        let session = URLSession(configuration: URLSessionConfiguration.default)

        let task = session.dataTask(with: url) {(data, response, error) -> Void in
            if error == nil, let imageData = data {
                DispatchQueue.main.async {
                    self.trackImageView.image = UIImage(data: imageData)
                }
            }
        }
        task.resume()
    }

    func didLoadTracks(_ tracks: [Track]) {
        self.tracks = tracks
        if let track = tracks.first {
            load(track: track)
        }
    }
}
