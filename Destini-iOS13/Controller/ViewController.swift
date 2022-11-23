//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyRepository: StoryRepository = StoryRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStory()
    }

    func setupStory() {
        let story = storyRepository.currentStory()
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)
    }
    
    @IBAction func choiceClicked(_ sender: UIButton) {
        let story = storyRepository.currentStory()
        let selectedChoice: String = sender.currentTitle!
        if selectedChoice == story.choice1 {
            storyRepository.setStoryNumber(destination: story.choice1Destination)
        } else {
            storyRepository.setStoryNumber(destination: story.choice2Destination)
        }
        setupStory()
    }
}

