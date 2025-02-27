//
//  LogoView.swift
//  SSeu
//
//  Created by Turma01-23 on 27/02/25.
//

import SwiftUI

struct LogoView: View {
    @State private var showLogo = true
    @State private var navigateToSearch = false
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            if showLogo {
                VStack(spacing: 20) {
                    Image("logo_sseu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.bottom, 10)
                    
                    Text("SSeu")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Toque para continuar")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.top, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    withAnimation(.easeOut(duration: 0.5)) {
                        showLogo = false
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        navigateToSearch = true
                    }
                }
            }
            
            if navigateToSearch {
                ContentView()
                    .transition(.opacity)
            }
        }
    }
}

#Preview {
    LogoView()
}
