//
//  QuizView.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/14/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel = QuizViewVM()
    
    var body: some View {
        NavigationView {
            List(quiz.courses, id: \.courseName) { course in
                NavigationLink(destination: CourseView(course: course)) {
                    CourseRow(course: course)
                }
            }
            .navigationBarTitle(Text("Quiz"))
            .listStyle(GroupedListStyle())
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
