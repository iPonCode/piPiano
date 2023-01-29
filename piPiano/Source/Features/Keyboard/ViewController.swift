//
//  ViewController.swift
//  piPiano
//
//  Created by superw on 07/12/2018.
//  Copyright © 2018 superw. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  private var audioPlayer : AVAudioPlayer!
  private let soundsNames = ["c3","c3s","d3","d3s","e3","f3","f3s","g3","g3s","a3","a3s","b3","c4"]

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  @IBAction
  func TouchUpInsidePlay(_ sender: UIButton) {
    guard let name = printKeyPressed("RELEASED", tag: sender.tag) else { return }
    if let soundURL : URL = Bundle.main.url(forResource: name, withExtension: "wav"){
      print("-> file URL is:\n->>\(soundURL)<<-")
      do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
      } catch {
        print(error)
      }
      audioPlayer.play()
    }
  }
  @IBAction
  func TouchDownPlay(_ sender: UIButton) {
    printKeyPressed("PRESSED", tag: sender.tag)
  }
}

private extension ViewController {
  func getIndexFromTag(_ buttonTag: Int) -> Int? {
    buttonTag > 0 ? buttonTag - 1 : nil
  }
  @discardableResult
  func printKeyPressed(_ event: String, tag: Int) -> String? {
    guard let index = getIndexFromTag(tag),
          let name = soundsNames[safe: index] else { return nil }
    print("-> key was \(event) with tag: \(tag) and name: \(name).")
    return name
  }
}
