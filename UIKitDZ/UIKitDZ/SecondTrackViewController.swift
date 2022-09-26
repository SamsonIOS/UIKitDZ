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
    
    var player: AVPlayer!
    
    @IBOutlet weak var secondImageTrack: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderAction(_ sender: UIButton) {
        player.seek(to: CMTime(seconds: Double(slider.value), preferredTimescale: 1000))
        self.labelTimeTrack.text = "\(slider.value)"
    }
    
    @IBOutlet weak var labelTimeTrack: UILabel!
    
    @IBOutlet weak var buttonPlay: UIButton!
    
    @IBAction func buttonPlayAction(_ sender: UIButton) {
        if player.timeControlStatus == .playing {
            player.pause()
        } else {
            player.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "monday", ofType: "mp3") ?? "nil"))
        
        slider.maximumValue = Float(player.currentItem?.asset.duration.seconds ?? 0.0)
        
        player.addPeriodicTimeObserver(
            forInterval: CMTime(seconds: 1, preferredTimescale: 1000),
            queue: DispatchQueue.main) { time in
                self.labelTimeTrack.text = "\(time.seconds)"
                self.slider.value = Float(time.seconds)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        secondImageTrack.layer.cornerRadius = 15
    }
}
