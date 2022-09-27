//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// ListViewController - экран со списком музыки
class ListViewController: UIViewController {
    // MARK: ButtonsOutlet
    @IBOutlet weak var firstTrackButton: UIButton!
    @IBOutlet weak var secondTrackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: Кнопка перехода на экран с первым треком
    @IBAction func firstTrackButtonAction(_ sender: UIButton) {
        goToPlayerViewController(song: SongInfo(
            name: "Blue Monday",
            time: 267,
            image: "mondayphoto",
            artist: "ORGY",
            trackName: "track1"))
    }
    // MARK: Кнопка перехода на экран со вторым треком
    @IBAction func secondTrackButtonAction(_ sender: UIButton) {
        goToPlayerViewController(song: SongInfo(
            name: "Cherry Pie",
            time: 207,
            image: "musicphoto",
            artist: "Warrant",
            trackName: "track2"))
    }
    // MARK: Переход на экран с треком, который мы выбрали
    func goToPlayerViewController(song: SongInfo) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let songVC = storyboard.instantiateViewController(
            withIdentifier: "vc2"
        ) as? TrackViewController else { return }
        songVC.song = SongInfo(
            name: song.name,
            time: song.time,
            image: song.image,
            artist: song.artist,
            trackName: song.trackName
        )
        songVC.modalPresentationStyle = .formSheet
        present(songVC, animated: true)
    }
}
