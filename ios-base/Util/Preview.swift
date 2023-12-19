//
//  Preview.swift
//  ios-base
//
//  Created by 조상현 on 12/19/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

#if DEBUG
import SwiftUI

struct UIViewControllerPreview: UIViewControllerRepresentable {

    let viewController: UIViewController

    init(_ builder: @escaping () -> UIViewController) {
        viewController = builder()
    }

    func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, 
                                context: UIViewControllerRepresentableContext<UIViewControllerPreview>) {
        return
    }

} 

struct UIViewPreview: UIViewRepresentable {

    let view: UIView

    init(_ builder: @escaping () -> UIView) {
        view = builder()
    }

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }

}

extension View {
    func applyPreviewConfigs(with name: String) -> some View {
        return Group {
            previewDevice(nil)
                .preferredColorScheme(.light)
                .previewDisplayName("\(name) Light Mode")

            previewDevice(nil)
                .preferredColorScheme(.dark)
                .previewDisplayName("\(name) Dark Mode")
        }
    }
}
#endif

