//
//  FirstTrackViewController.swift
//  UIKitDZ
//
//  Created by coder on 25.09.2022.
//
import AVFoundation
import UIKit
/// TrackViewController - экран с плеером
class TrackViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var song: SongInfo?
    
    @IBOutlet weak var imageFirstTrack: UIImageView!
    @IBOutlet weak var sliderVolume: UISlider!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var timeTrackStartLabel: UILabel!
    @IBOutlet weak var timeTrackFinishLabel: UILabel!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var nameTrackLabel: UILabel!
    @IBOutlet weak var nameArtistLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsPlayer()
        timer()
        setSong()
        allSliders()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageFirstTrack.layer.cornerRadius = 15
    }
    // MARK: Slider Action
    @IBAction func sliderAction(_ sender: UISlider) {
        if sender == slider {
            player.currentTime = TimeInterval(sender.value)
        }
    }
    // MARK: Slider Volume Action
    @IBAction func sliderVolumeAction(_ sender: UISlider) {
        player.volume = sliderVolume.value
    }
    // MARK: Button Play Action
    @IBAction func buttonPlayAction(_ sender: UIButton) {
        if player.isPlaying {
            let playImage = UIImage(systemName: "play.circle.fill")
            buttonPlay.setImage(playImage, for: .normal)
            player.pause()
        } else {
            let pauseImage = UIImage(systemName: "pause.fill")
            buttonPlay.setImage(pauseImage, for: .normal)
            player.play()
        }
    }
    // MARK: Timer
    func timer() {
        var _ = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(timeSongAction),
            userInfo: nil,
            repeats: true)
    }
    // MARK: Time Song(Start Time and Finish Time)
    @objc func timeSongAction() {
        let timePlay = player.currentTime
        let minutes = Int(timePlay / 60)
        let seconds = Int(timePlay.truncatingRemainder(dividingBy: 60))
        timeTrackStartLabel.text = String(format: "%02d:%02d", minutes, seconds)
        
        let timeSong = song?.time ?? 0
        let lastTime = player.currentTime - Double(timeSong) 
        let minutes1 = Int(lastTime / 60)
        let seconds1 = Int(-lastTime.truncatingRemainder(dividingBy: 60))
        timeTrackFinishLabel.text = String(format: "%02d:%02d", minutes1, seconds1)
        slider.setValue(Float(player.currentTime), animated: true)
    }
    func settingsPlayer() {
        do {
            if let audioPath = Bundle.main.path(
                forResource: song?.trackName,
                ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
    }
    func allSliders() {
        player.volume = sliderVolume.value
        slider.minimumValue = 0.0
    }
    // MARK: Настройки отображения при выборе определенного трека
    func setSong() {
        guard let song = song else { return }
        imageFirstTrack.image = UIImage(named: song.image)
        nameTrackLabel.text = song.name
        nameArtistLabel.text = song.artist
    }
}
