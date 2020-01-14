//
//  CourseRow.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/14/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import SwiftUI

struct CourseRow: View {
    var course: CourseModel
    var body: some View {
        HStack {
            Text(course.courseName)
                .font(.title)
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var course: CourseModel = CourseModel(courseName: quiz.courses.first!.courseName, questions: [])
    static var previews: some View {
        CourseRow(course: course)
    }
}
