//
//  FAQ.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
struct FAQ {
    let id: String          // Unique identifier for the FAQ
    let question: String    // The FAQ question
    let answer: String      // The FAQ answer
}
/*
 import SwiftUI

 struct HelpDeskScreen: View {
     @State private var searchText: String = ""
     let faqs: [FAQ]

     var filteredFAQs: [FAQ] {
         if searchText.isEmpty {
             return Array(faqs.prefix(3)) // Show the first 3 FAQs as default
         } else {
             return faqs.filter { $0.question.lowercased().contains(searchText.lowercased()) }
         }
     }

     var body: some View {
         NavigationView {
             VStack {
                 // Search Bar
                 TextField("Search FAQs...", text: $searchText)
                     .padding()
                     .background(Color(.systemGray6))
                     .cornerRadius(10)
                     .padding(.horizontal)

                 // FAQ List
                 List(filteredFAQs, id: \.id) { faq in
                     VStack(alignment: .leading, spacing: 5) {
                         Text(faq.question)
                             .font(.headline)
                         Text(faq.answer)
                             .font(.subheadline)
                             .foregroundColor(.gray)
                             .lineLimit(2)
                     }
                     .padding(.vertical, 5)
                 }
                 .listStyle(PlainListStyle())

                 // "View All FAQs" Button
                 Button(action: {
                     // Navigate to the detailed FAQ screen
                     print("View All FAQs tapped")
                 }) {
                     Text("View All FAQs")
                         .frame(maxWidth: .infinity)
                         .padding()
                         .background(Color.blue)
                         .foregroundColor(.white)
                         .cornerRadius(10)
                 }
                 .padding(.horizontal)
                 .padding(.bottom)
             }
             .navigationTitle("Help Desk")
         }
     }
 }
 struct FAQDetailScreen: View {
     let faqs: [FAQ]

     var body: some View {
         List(faqs, id: \.id) { faq in
             VStack(alignment: .leading, spacing: 5) {
                 Text(faq.question)
                     .font(.headline)
                 Text(faq.answer)
                     .font(.subheadline)
                     .foregroundColor(.gray)
             }
             .padding(.vertical, 5)
         }
         .navigationTitle("All FAQs")
     }
 }

 */
