//
//  Idea.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import Foundation

struct Idea: Equatable, Identifiable {
    let id = UUID()
    var idea: String
    var description: String
    var tags: [String]
    var createdDate: Date
}

extension Idea {
    static func sampleArray() -> [Idea] {
        let array: [Idea] = [
            Idea(idea: "Unique Idea 1", description: "Description for Idea 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non maximus erat.", tags: ["Tag1", "Tag2"], createdDate: Date()),
            Idea(idea: "Unique Idea 2", description: "Description for Idea 2. Aliquam fringilla molestie nisi, ac dapibus felis laoreet at.", tags: ["Tag3", "Tag4"], createdDate: Date()),
            Idea(idea: "Unique Idea 3", description: "Description for Idea 3. Proin in mauris in arcu laoreet viverra. Nullam sagittis euismod nisi, sit amet vestibulum augue fringilla sit amet.", tags: ["Tag5", "Tag6"], createdDate: Date()),
            Idea(idea: "Unique Idea 4", description: "Description for Idea 4. Vestibulum volutpat enim at ante vestibulum, nec auctor dolor commodo. Duis at volutpat dolor.", tags: ["Tag7", "Tag8"], createdDate: Date()),
            Idea(idea: "Unique Idea 5", description: "Description for Idea 5. Curabitur ac augue sit amet libero dapibus tincidunt. Morbi et metus at tortor commodo bibendum.", tags: ["Tag9", "Tag10"], createdDate: Date()),
            Idea(idea: "Unique Idea 6", description: "Description for Idea 6. Quisque eget facilisis tortor. Phasellus at turpis in nisl lobortis semper.", tags: ["Tag11", "Tag12"], createdDate: Date()),
            Idea(idea: "Unique Idea 7", description: "Description for Idea 7. Sed luctus fermentum velit, eu efficitur dolor mattis ac. Fusce auctor, leo eget hendrerit volutpat.", tags: ["Tag13", "Tag14"], createdDate: Date()),
            Idea(idea: "Unique Idea 8", description: "Description for Idea 8. Etiam eget leo vel odio tincidunt feugiat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.", tags: ["Tag15", "Tag16"], createdDate: Date()),
            Idea(idea: "Unique Idea 9", description: "Description for Idea 9. Nullam ac mi a libero tristique aliquam. Nam efficitur elit vel orci ullamcorper, id aliquam mi eleifend.", tags: ["Tag17", "Tag18"], createdDate: Date()),
            Idea(idea: "Unique Idea 10", description: "Description for Idea 10. Fusce euismod enim at mauris eleifend, id scelerisque erat cursus. Aenean congue nunc quis velit fermentum.", tags: ["Tag19", "Tag20"], createdDate: Date()),
            Idea(idea: "Unique Idea 11", description: "Description for Idea 11. Integer id neque vitae erat vulputate dictum. Nam condimentum quam vel tortor sollicitudin vestibulum.", tags: ["Tag21", "Tag22"], createdDate: Date()),
            Idea(idea: "Unique Idea 12", description: "Description for Idea 12. Quisque ut augue nec turpis tristique cursus vel eu mauris. Nam interdum efficitur hendrerit.", tags: ["Tag23", "Tag24"], createdDate: Date()),
            Idea(idea: "Unique Idea 13", description: "Description for Idea 13. Vestibulum non elit ut velit venenatis fermentum. In hac habitasse platea dictumst.", tags: ["Tag25", "Tag26"], createdDate: Date())
        ]
        return array
    }
}
