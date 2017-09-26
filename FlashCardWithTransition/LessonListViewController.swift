//
//  LessonListViewController.swift
//  FlashCardWithTransition
//
//  Created by VuHongSon on 9/26/17.
//  Copyright © 2017 VuHongSon. All rights reserved.
//

import UIKit
var currentLessonName = ""
class LessonListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
    }
    
    @IBAction func les1Did(_ sender: UIButton) {
        currentLessonName = "Test1"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func les2Did(_ sender: UIButton) {
        currentLessonName = "Test2"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func les3Did(_ sender: UIButton) {
        currentLessonName = "Test3"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func les4Did(_ sender: UIButton) {
        currentLessonName = "Test4"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func les5Did(_ sender: UIButton) {
        currentLessonName = "Test5"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func les6Did(_ sender: UIButton) {
        currentLessonName = "Test6"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func les7Did(_ sender: UIButton) {
        currentLessonName = "Test7"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func les8Did(_ sender: UIButton) {
        currentLessonName = "Test8"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func les9Did(_ sender: UIButton) {
        currentLessonName = "Test9"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func les10Did(_ sender: UIButton) {
        currentLessonName = "Test10"
        let controller = ViewController()
        controller.titleView = (sender.titleLabel?.text)!
        navigationController?.pushViewController(controller, animated: true)
    }
}
