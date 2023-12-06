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

    var topBar = UIView()
    private var topBarConstraint: Constraint?
    var navigationBar: BaseNavigationBar?

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
        
        view.addSubview(topBar)
        topBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            topBarConstraint = $0.height.equalTo(ScreenUtil.getSafeAreaSize(direction: .top)).constraint
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

        topBarConstraint?.deactivate()
        topBar.snp.makeConstraints {
            topBarConstraint = $0.height.equalTo(ScreenUtil.getSafeAreaSize(direction: .top) +
                                                        navigationBar.contentHeight).constraint
        }

        topBar.addSubview(navigationBar)
        navigationBar.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(navigationBar.contentHeight)
        }
    }

    func useSafeArea() {
        view.addSubview(safeArea)
        safeArea.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom)
            $0.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)            
        }
        safeArea.backgroundColor = .clear
    }
}

protocol BaseViewControllerProtocol {
    func initConstraints()
    func initProperties()
    func binding()
}

extension BaseViewController: BaseViewControllerProtocol {
    @objc func initConstraints() { }
    @objc func initProperties() { }
    @objc func binding() { }
}
