//
//  ViewController.swift
//  FlashCardWithTransition
//
//  Created by VuHongSon on 9/26/17.
//  Copyright © 2017 VuHongSon. All rights reserved.
//

import UIKit

struct FlashCard {
    let index : String
    let kanji : String
    let hiragana : String
    let vietnamese : String
}

class ViewController: UIViewController {
    
    var Data = [FlashCard]()
    var indexApp = 0
    var titleView = ""
    
    let questionView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let answerView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(#colorLiteral(red: 0.0368008456, green: 0.08081357971, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let flipView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let kanjiQuestion : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        label.layer.borderWidth = 0.5
//        label.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let kanjiAnswer : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
//        label.text = "PROFILE"
        label.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        label.layer.borderWidth = 0.5
//        label.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hiragana : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
//        label.text = "PROFILE"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        label.layer.borderWidth = 0.5
//        label.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
//        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let vietnamese : UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.isSelectable = false
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let yesButton : UIButton = {
        let button = UIButton()
        button.setTitle("Yes", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let noButton : UIButton = {
        let button = UIButton()
        button.setTitle("No", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var lockToflip = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        navigationItem.title = titleView
        questionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HandleTapInView)))
        answerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HandleTapInView)))
        
        let fileURL = Bundle.main.path(forResource: currentLessonName, ofType: "txt")
        var dataString = ""
        do {
            dataString = try String(contentsOfFile: fileURL!, encoding: String.Encoding.utf8)
            let myStrings = dataString.components(separatedBy: .newlines)
            for i in 0..<(myStrings.count - 1) {
                let eachString = myStrings[i].components(separatedBy: " ")
                var vietnamese = ""
                for j in 3..<eachString.count{
                    if vietnamese == "" {
                        vietnamese += eachString[j]
                    } else {
                        vietnamese += " \(eachString[j])"
                    }
                }
                let flashcard : FlashCard = FlashCard(index: eachString[0], kanji: eachString[1], hiragana: eachString[2], vietnamese: vietnamese)
                Data.append(flashcard)
            }
            showData()
            
//            print(Data)
//            textView.text = myStrings.joined(separator: ", ")
//            textView.text = dataString
        }catch {
            print("Error")
        }
    }
    
    func showData() {
        button.setTitle(Data[indexApp].index, for: .normal)
        kanjiQuestion.text = Data[indexApp].kanji
        kanjiAnswer.text = Data[indexApp].kanji
        hiragana.text = Data[indexApp].hiragana
        vietnamese.text = Data[indexApp].vietnamese
    }
    
    func setupView() {
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4552601329, blue: 0, alpha: 1)
        view.addSubview(button)
        view.addSubview(flipView)
        view.addSubview(yesButton)
        view.addSubview(noButton)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[v1(30)]-30-[v0]-30-[v2(60)]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : flipView , "v1" : button, "v2" : yesButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : flipView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-120-[v0]-120-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : button]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-30-[v2(60)]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : flipView , "v2" : noButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]-10-[v1]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : yesButton, "v1" : noButton]))
        yesButton.widthAnchor.constraint(equalTo: noButton.widthAnchor).isActive = true
        
        yesButton.addTarget(self, action: #selector(ChangeCard), for: .touchUpInside)
        noButton.addTarget(self, action: #selector(ChangeCard), for: .touchUpInside)
        
        
        flipView.addSubview(answerView)
        flipView.addSubview(questionView)
        flipView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : answerView]))
        flipView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : questionView]))
        
        flipView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : answerView]))
        flipView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : questionView]))
        
        questionView.addSubview(kanjiQuestion)
        questionView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : kanjiQuestion]))
        questionView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : kanjiQuestion]))
        
        answerView.addSubview(kanjiAnswer)
        answerView.addSubview(hiragana)
        answerView.addSubview(vietnamese)
        answerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : kanjiAnswer]))
        answerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : hiragana]))
        answerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : vietnamese]))
        hiragana.centerXAnchor.constraint(equalTo: answerView.centerXAnchor).isActive = true
        hiragana.centerYAnchor.constraint(equalTo: answerView.centerYAnchor).isActive = true
        answerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-10-[v1]-15-[v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : kanjiAnswer, "v1" : hiragana , "v2" : vietnamese]))
        kanjiAnswer.heightAnchor.constraint(equalTo: answerView.heightAnchor, multiplier: 1/5).isActive = true
        hiragana.heightAnchor.constraint(equalTo: answerView.heightAnchor, multiplier: 1/5).isActive = true
        
    }
    
    func HandleTapInView(sender : UITapGestureRecognizer) {
        if sender.view == questionView {
            UIView.transition(from: questionView, to: answerView, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews]) { (completed) in}
        }else if sender.view == answerView {
            UIView.transition(from: answerView, to: questionView, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews]) { (completed) in}
        }
        
    }
    
    func ChangeCard() {
        indexApp += 1
        if indexApp == Data.count {
            indexApp = 0
        }
        if questionView.isHidden == true {
            questionView.isHidden = false
            answerView.isHidden = true
        }
        showData()
    }

}
