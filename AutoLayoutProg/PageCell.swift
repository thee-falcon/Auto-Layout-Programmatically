//
//  PageCell.swift
//  AutoLayoutProg
//
//  Created by Omar Makran on 23/6/2024.
//

import UIKit

class PageCell: UICollectionViewCell {
    
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
        attributedText.append(NSAttributedString(
            string: "\n \n \nYou probably have all the best reasons in the world to apply to 1337, don't waste any more time.",
                                                 attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }

    private func setUpLayout() {
        let topImageView = UIView()
        addSubview(topImageView)
        
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageView.addSubview(schoolImageView)
        schoolImageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        schoolImageView.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor).isActive = true
        schoolImageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor, multiplier: 0.5).isActive = true
        schoolImageView.widthAnchor.constraint(equalTo: topImageView.widthAnchor, multiplier: 0.9).isActive = true
        topImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        addSubview(descriptionText)
        descriptionText.topAnchor.constraint(equalTo: schoolImageView.bottomAnchor).isActive = true
        descriptionText.leftAnchor.constraint(equalTo: leftAnchor, constant:  24).isActive = true
        descriptionText.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
