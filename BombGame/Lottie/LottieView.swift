//
//  LottieView.swift
//  TestApp
//
//  Created by Даниил Павленко on 11.02.2025.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let animationName: String
    let loopMode: LottieLoopMode
    @Binding var animationProgress: CGFloat // Добавили Binding для прогресса

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(animationName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Получаем animationView из UIView
        if let animationView = uiView.subviews.first(where: { $0 is LottieAnimationView }) as? LottieAnimationView {
            // Устанавливаем прогресс анимации
            animationView.currentProgress = animationProgress
        }
    }
}
