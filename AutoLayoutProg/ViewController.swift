//
//  ViewController.swift
//  AutoLayoutProg
//
//  Created by Omar Makran on 16/6/2024.
//

import UIKit

class ViewController: UIViewController {

    // we use a closure
    let schoolImageView: UIImageView = {
        // create an instance of UIImage using the image name
        let image = UIImage(named: "one")
        let imageView = UIImageView(image: image)

        // enables autolayout for our image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionText: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(
            string: "Join 1337 And Embark On The Adventure", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.systemGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControler : UIPageControl = {
       let pc = UIPageControl()
        pc.numberOfPages = 3
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .systemGreen
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // entry point into out our applicationn
        view.addSubview(descriptionText)
        
        setUpbotomButons()
        setUpLayout()
    }
    
    fileprivate func setUpbotomButons() {
        
        let botomControlersStackView = UIStackView(arrangedSubviews: [
            prevButton, pageControler ,nextButton
        ])
        
        view.addSubview(botomControlersStackView)
        botomControlersStackView.translatesAutoresizingMaskIntoConstraints = false
        botomControlersStackView.distribution = .fillEqually
        NSLayoutConstraint.activate([
            botomControlersStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            botomControlersStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            botomControlersStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            botomControlersStackView.heightAnchor.constraint(equalToConstant: 50),
            ])
    }
    
    private func setUpLayout() {
        let topImageView = UIView()
        view.addSubview(topImageView)
        
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageView.addSubview(schoolImageView)
        schoolImageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        schoolImageView.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor).isActive = true
        schoolImageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor, multiplier: 0.5).isActive = true
        schoolImageView.widthAnchor.constraint(equalTo: topImageView.widthAnchor, multiplier: 0.9).isActive = true
        topImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true

        descriptionText.topAnchor.constraint(equalTo: schoolImageView.bottomAnchor).isActive = true
        descriptionText.leftAnchor.constraint(equalTo: view.leftAnchor, constant:  24).isActive = true
        descriptionText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}

