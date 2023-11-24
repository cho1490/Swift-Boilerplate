//
//  Toast.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

final class Toast: BaseView {
    
    private let animateDuration: TimeInterval = 0.5
    
    private let toastMessageLabel = UILabel().then {
        $0.textColor = .systemBackground
        $0.numberOfLines = 0
    }
    
    override func initProperties() {
        backgroundColor = .label.withAlphaComponent(0.8)
        alpha = 0.0
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    override func initConstraints() {
        addSubview(toastMessageLabel)
        toastMessageLabel.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(8)
            $0.leading.equalTo(snp.leading).offset(16)
            $0.bottom.equalTo(snp.bottom).offset(-8)
            $0.trailing.equalTo(snp.trailing).offset(-16)
        }
    }
    
    func show(message: String, during time: TimeInterval) {
        toastMessageLabel.text = message
        
        UIView.animate(withDuration: animateDuration, animations: { self.alpha = 1.0 }) { [weak self] _ in
            guard let self = self else {
                return
            }
            
            UIView.animate(withDuration: animateDuration, delay: time, options: .curveEaseOut, animations: {
                self.alpha = 0.0
            }, completion: { _ in
                self.removeFromSuperview()
            })
        }
    }
    
}
