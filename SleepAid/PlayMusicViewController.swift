//
//  PlayMusicViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/9/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit
import AVFoundation

class PlayMusicViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var backImageView: UIImageView!
    var audioPlayer: AVAudioPlayer! = nil
    var curMusicName = ""
    var curMusicIndex = 0
    var curMusicUrl:URL!
    var timer: Timer!
    var musicLength = 0.0
    var musicState = 2
    var musicRate = 1.0
    
    @IBOutlet weak var processBar: UISlider!
    @IBOutlet weak var curTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var aboutAuthorLabel: UILabel!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        initComponents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func initComponents() {
        curMusicIndex = Common.sharedInstance.getCurMusicIndex()
        curMusicName = Common.sharedInstance.getMusicNameByIndex(curMusicIndex)
        
        self.aboutAuthorLabel.text = "Berry Zecca"
        self.navigationItem.title = curMusicName
        self.curMusicUrl = URL(fileURLWithPath: Bundle.main.path(forResource: curMusicName, ofType: "mp3")!)
        self.musicState = 2
        self.musicRate = 1.0
        preparePlay()
    }
    
    func showTotalTime() {
        let minute_ = abs(Int((musicLength/60).truncatingRemainder(dividingBy: 60)))
        let second_ = abs(Int(musicLength.truncatingRemainder(dividingBy: 60)))
        
        let minute = minute_ > 9 ? "\(minute_)" : "0\(minute_)"
        let second = second_ > 9 ? "\(second_)" : "0\(second_)"
        
        self.totalTimeLabel.text = "-\(minute):\(second)"
    }
    
    func preparePlay() {
        do {
            if let bundle = Bundle.main.path(forResource: curMusicName, ofType: "mp3") {
                let alertSound = URL(fileURLWithPath: bundle)
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
            
                try audioPlayer = AVAudioPlayer(contentsOf: alertSound)
                audioPlayer.delegate = self
                self.musicLength = audioPlayer.duration
                self.processBar.maximumValue = CFloat(audioPlayer.duration)
                self.processBar.minimumValue = 0.0
                self.processBar.value = 0.0
                self.audioPlayer.enableRate = true
                self.audioPlayer.rate = Float(self.musicRate)
                audioPlayer.prepareToPlay()
                
                showTotalTime()
                self.curTimeLabel.text = "00:00"
                
                let playerItem = AVPlayerItem(url: alertSound)
                let metadataList = playerItem.asset.metadata 
                
                for item in metadataList {
                    
                    guard let key = item.commonKey, let value = item.value else{
                        continue
                    }
                    
                    switch key {
                    case "title" : self.musicTitleLabel.text = value as? String
////                    case "artist": artistLabel.text = value as? String
                    case "artwork" where value is Data :
                        self.backImageView.image = UIImage(data: value as! Data)!

                        break
                    default:
                        self.backImageView.image = nil
//                        self.backImageView.backgroundColor = CGColor()
                        break
                    }
                }
                
            }
        } catch {
            print(error)
        }
    }
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PlayMusicViewController.update(_:)), userInfo: nil,repeats: true)
            timer.fire()
        }
    }
    
    func update(_ timer: Timer){
        if !audioPlayer.isPlaying {
            return
        }
        
        let minute_ = abs(Int((audioPlayer.currentTime/60).truncatingRemainder(dividingBy: 60)))
        let second_ = abs(Int(audioPlayer.currentTime.truncatingRemainder(dividingBy: 60)))
        
        let minute = minute_ > 9 ? "\(minute_)" : "0\(minute_)"
        let second = second_ > 9 ? "\(second_)" : "0\(second_)"
        
        curTimeLabel.text  = "\(minute):\(second)"
        processBar.value = CFloat(audioPlayer.currentTime)
        self.musicLength = audioPlayer.duration - audioPlayer.currentTime
        showTotalTime()
    }

    
    func updateNowState() {
        
    }
    
    func saveCurrentTrackNumber() {
        UserDefaults.standard.set(curMusicIndex, forKey:"currentAudioIndex")
        UserDefaults.standard.synchronize()
    }
    
    func pauseAudioPlayer() {
        audioPlayer.pause()
        self.musicState = 1
    }
    
    func playAudioPlayer() {
        self.audioPlayer.enableRate = true
        self.audioPlayer.rate = Float(self.musicRate)
        audioPlayer.play()
        startTimer()
        updateNowState()
        saveCurrentTrackNumber()
        self.musicState = 0
        self.prevBtn.isEnabled = true
//        self.audioPlayer.rate = 1.0
    }

    @IBAction func playBtnClick(_ sender: AnyObject) {
        let play = UIImage(named: "play")
//        let pause = UIImage(named: "pause")
        if audioPlayer.isPlaying {
//            pauseAudioPlayer()
//            self.playBtn.setImage(pause, forState: UIControlState.Normal)
        }else{
            playAudioPlayer()
            self.playBtn.setImage(play, for: UIControlState())
        }
    }

    @IBAction func prevBtnClick(_ sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        self.musicRate = 2.0
        self.processBar.value = 0.0
        self.curTimeLabel.text = "00:00"
        self.musicLength = audioPlayer.duration
        showTotalTime()
    }

    @IBAction func stopBtnClick(_ sender: AnyObject) {
        if self.musicState == 0 {
            audioPlayer.pause()
            self.musicState = 1
        }else if self.musicState == 1 {
            audioPlayer.stop()
            audioPlayer.currentTime = 0.0
            self.processBar.value = 0.0
            self.curTimeLabel.text = "00:00"
            self.musicLength = audioPlayer.duration
            showTotalTime()
            self.musicState = 2
            self.musicRate = 1.0
        }
    }
    
    @IBAction func sliderChanged(_ sender: AnyObject) {
        let minute_ = abs(Int((processBar.value/60).truncatingRemainder(dividingBy: 60)))
        let second_ = abs(Int(processBar.value.truncatingRemainder(dividingBy: 60)))
        let minute = minute_ > 9 ? "\(minute_)" : "0\(minute_)"
        let second = second_ > 9 ? "\(second_)" : "0\(second_)"
        
        curTimeLabel.text  = "\(minute):\(second)"
        audioPlayer.currentTime = Double(processBar.value)
        self.musicLength = audioPlayer.duration - audioPlayer.currentTime
        showTotalTime()
    }
    @IBAction func backBtnClick(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
}
