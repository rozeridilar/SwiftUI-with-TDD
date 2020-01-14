//
//  CourseView.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/14/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import SwiftUI

let topColor = Color(red: 245/255, green: 234/255, blue: 234/255)
let centerColor = Color(red: 127/255, green: 205/255, blue: 145/255)
let bottomColor = Color(red: 91/255, green: 86/255, blue: 86/255)

struct CourseView: View {
    var course: CourseModel
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [topColor,centerColor, bottomColor]), startPoint: .topLeading, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ForEach(course.questions) { question in
                    VStack{
                        Text(question.question)
                            .font(.title)
                            .multilineTextAlignment(.center)
                        HStack{
                            Text(question.answer!)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(course.courseName), displayMode: .inline)
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: quiz.courses.first ?? CourseModel(courseName: "test", questions: [QuestionModel(question: "some question", id: 1, options: ["some"], answer: "1")]))
    }
}
