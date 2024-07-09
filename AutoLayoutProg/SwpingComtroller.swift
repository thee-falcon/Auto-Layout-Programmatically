//
//  SwpingComtroller.swift
//  AutoLayoutProg
//
//  Created by Omar Makran on 23/6/2024.
//

import UIKit

class SwpingComtroller: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let pages = [
        Page(imageName: "one", headerText: "Join 1337 And Embark On The Adventure", bodyText: "1337 is the first to provide IT training in Morocco, completely free of charge, open and accessible to anyone between the ages of 18 and 30. No need for an IT degree, or of having undergone extensive IT training. The only criteria for admission in Treize, Trente-Sept is CREATIVITY."),
        Page(imageName: "two", headerText: "Our Campuses", bodyText: "Everything is in place to ensure the success of the students’ education."),
        Page(imageName: "three", headerText: "Steps to join", bodyText: "The school is totally free. No registration or tuition fees will be required during the program. Remember, depending on your status, you may need to pay for student social security contributions.")
    ]
    
    @objc private func handlePrev() {
        let indexNext = max(pageControler.currentPage - 1, 0)
        let indexPath = IndexPath(item: indexNext, section: 0)
        pageControler.currentPage = indexNext
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.systemGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let indexNext = min(pageControler.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: indexNext, section: 0)
        pageControler.currentPage = indexNext
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControler : UIPageControl = {
       let pc = UIPageControl()
        pc.numberOfPages = pages.count
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .systemGreen
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
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

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        
        pageControler.currentPage = Int(x / view.frame.width)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpbotomButons()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled =  true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        
        cell.page = page

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
