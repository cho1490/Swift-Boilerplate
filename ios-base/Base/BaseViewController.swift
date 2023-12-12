//
//  BaseViewController.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//
 
import RxSwift
import Then
import SnapKit

class BaseViewController: UIViewController {

    private var navigationBarArea = UIView()
    var navigationBar: BaseNavigationBar?
    private var navigationBarHeightConstraint: Constraint?

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
        
        view.addSubview(navigationBarArea)
        navigationBarArea.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            navigationBarHeightConstraint = $0.height.equalTo(ScreenUtil.safeAreaSize.top).constraint
        }

        initConstraints()
        initProperties()
        binding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func useNavigationBar(type: NavigationBarType = .base) { 
        switch type {
        case .base:
            navigationBar = NavigationBar()
        case .large:
            navigationBar = LargeNavigationBar()
        }

        guard let navigationBar = navigationBar else {
            return
        }

        navigationBarHeightConstraint?.deactivate()
        navigationBarArea.snp.makeConstraints {
            navigationBarHeightConstraint = $0.height.equalTo(ScreenUtil.safeAreaSize.top +
                                                              navigationBar.contentHeight).constraint
        }

        navigationBarArea.addSubview(navigationBar)
        navigationBar.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(navigationBar.contentHeight)
        }
    }

    func useSafeArea() {
        view.addSubview(safeArea)
        safeArea.snp.makeConstraints {
            $0.top.equalTo(navigationBarArea.snp.bottom)
            $0.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)            
        }
        safeArea.backgroundColor = .clear
    }
}

protocol BaseViewControllerProtocol {
    func binding()
} 

extension BaseViewController: BaseUIProtocol, BaseViewControllerProtocol {
    @objc func initConstraints() { }
    @objc func initProperties() { }
    @objc func binding() { }
}
