//
//  BaseBottomSheetViewController.swift
//  MemoryOfDay
//
//  Created by 조상현 on 12/13/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit
import SnapKit

class BaseBottomSheetViewController: UIViewController {

    let padding = Theme.Padding.Medium

    private var bottomSheetViewHeightConstraint: Constraint?
    private lazy var bottomSheetViewDefaultHeight: CGFloat = (padding * 2) + ScreenUtil.safeAreaSize.bottom

    private var bottomSheetViewOffsetYConstraint: Constraint?
    private lazy var bottomSheetViewOffsetY: CGFloat = 0

    lazy var bottomSheetView = UIView().then {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = Theme.Radius.Large
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.clipsToBounds = true
    }

    let innerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground.withAlphaComponent(0.7)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backAction)))

        initConstraints()
        initProperties()
    }

    func useInnerView() {
        view.addSubview(bottomSheetView)
        bottomSheetView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            bottomSheetViewHeightConstraint = $0.height.equalTo(bottomSheetViewDefaultHeight).constraint
            bottomSheetViewOffsetYConstraint = $0.bottom.equalToSuperview().offset(bottomSheetViewOffsetY).constraint
        }

        bottomSheetView.addSubview(innerView)
        innerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(padding)
            $0.leading.equalToSuperview().offset(padding)
            $0.bottom.equalToSuperview().offset(-(padding + ScreenUtil.safeAreaSize.bottom))
            $0.trailing.equalToSuperview().offset(-padding)
        }
    }

    @objc private func backAction() {
        hideBottomSheet()
    }

    func showBottomSheet(_ height: CGFloat) {
        let totalHeight = height + (padding * 2) + ScreenUtil.safeAreaSize.bottom
        bottomSheetViewOffsetYConstraint?.update(offset: totalHeight)
        bottomSheetViewHeightConstraint?.update(offset: totalHeight)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let self = self else {
                return
            }

            bottomSheetViewOffsetYConstraint?.update(offset: 0)
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
    }

    func hideBottomSheet() {
        let heightConstant = bottomSheetViewHeightConstraint?.layoutConstraints[0].constant ?? 0
        bottomSheetViewOffsetYConstraint?.update(offset: heightConstant)
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            self?.dismiss(animated: false)
        })
    }

}

extension BaseBottomSheetViewController: BaseUIProtocol {
    @objc func initConstraints() { }
    @objc func initProperties() { }
}
