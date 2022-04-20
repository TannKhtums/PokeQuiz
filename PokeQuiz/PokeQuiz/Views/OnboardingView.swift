//
//  OnboardingView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/4/22.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    @EnvironmentObject var viewModel: SettingsViewModel
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .darkGray
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
        UIPageControl.appearance().tintColor = .lightGray
    }
    
    var body: some View {
        TabView {
            Onboarding_1()
            Onboarding_2()
            Onboarding_3()
            Onboarding_4()
            Onboarding_5()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}


