//
//  SwipeController+extension.swift
//  AutoLayoutProg
//
//  Created by Omar Makran on 13/7/2024.
//

import UIKit

extension SwpingComtroller {
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            let indexPath = IndexPath(item: self.pageControler.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }) {(_) in
            
        }
    }
}
