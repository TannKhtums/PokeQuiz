//
//  TestNavigationLink.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/26/22.
//

import SwiftUI

struct TestNavigationLink: View {
    @State var showDetail: Bool = false
    @State private var displayPopupMessage: Bool = false
     
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetailView(), isActive: self.$showDetail) { EmptyView() }
                Button(action: {
                    self.displayPopupMessage = true
                }) {Text("Alert and Navigate")}
                .alert(isPresented: $displayPopupMessage){
                    Alert(title: Text("Warning"), message: Text("This is a test"), dismissButton:
                        .default(Text("OK"), action: {self.showDetail = true})
                    )
                }
            }
        }
    }
}

struct DetailView :View {
    var body: some View {Text("details ...")}
}

struct TestNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        TestNavigationLink()
    }
}

