//
//  BaseTabBarController.swift
//  ios-base
//
//  Created by 조상현 on 11/24/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit
import RxSwift
 
class BaseTabBarController: UITabBarController {
    
    let safeArea = UIView()
    
    var viewModel: BaseViewModel?
    var navigator: Navigator!
        
    var disposeBag = DisposeBag()
    
    init(viewModel: BaseViewModel? = nil, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
                
        initConstraints()
        binding()
    }
     
    func useSafeAreaView() {
        view.addSubview(safeArea)
        safeArea.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        safeArea.backgroundColor = .clear
    }
     
}

extension BaseTabBarController: BaseViewControllerProtocol {
    @objc func initConstraints() { }
    @objc func binding() { }
}
