//
//  SecondTrackViewController.swift
//  UIKitDZ
//
//  Created by coder on 25.09.2022.
//
import MediaPlayer
import UIKit
/// SecondTrackViewController - экран со вторым треком
class SecondTrackViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    @IBOutlet weak var secondImageTrack: UIImageView!
    @IBOutlet weak var labelTimeFinish: UILabel!
    @IBOutlet weak var sliderVolume: UISlider!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelTimeTrack: UILabel!
    @IBOutlet weak var buttonPlay: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsPlayer()
        timer()
    }
    @IBAction func sliderVolumeAction(_ sender: UISlider) {
        player.volume = sliderVolume.value
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
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
    func timer() {
        var _ = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(timeSong),
            userInfo: nil,
            repeats: true)
    }
    @objc func timeSong() {
        let timePlay = player.currentTime
        let minutes = Int(timePlay / 60)
        let seconds = Int(timePlay.truncatingRemainder(dividingBy: 60))
        labelTimeTrack.text = String(format: "%02d:%02d", minutes, seconds)
        
        let timeSong = 207
        let lastTime = player.currentTime - Double(timeSong)
        let minutes1 = Int(lastTime / 60)
        let seconds1 = Int(-lastTime.truncatingRemainder(dividingBy: 60))
        labelTimeFinish.text = String(format: "%02d:%02d", minutes1, seconds1)
        
        slider.setValue(Float(self.player.currentTime), animated: true)
    }
    
    func settingsPlayer() {
        do {
            if let audioPath = Bundle.main.path(forResource: "track2", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
        player.volume = sliderVolume.value
        self.slider.minimumValue = 0.0
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        secondImageTrack.layer.cornerRadius = 15
    }
}
