//
//  APIPostView.swift
//  Mlem
//
//  Created by Nicholas Lawson on 09/06/2023.
//

import Foundation

// lemmy_db_views::structs::PostView
struct APIPostView: Decodable {
    let post: APIPost
    let creator: APIPerson
    let community: APICommunity
    let creatorBannedFromCommunity: Bool
    var counts: APIPostAggregates
    let subscribed: APISubscribedStatus
    let saved: Bool
    let read: Bool
    let creatorBlocked: Bool
    var myVote: ScoringOperation?
    let unreadComments: Int
}

extension APIPostView: Identifiable {
    var id: Int { self.hashValue }
}

extension APIPostView: Equatable {
    static func == (lhs: APIPostView, rhs: APIPostView) -> Bool {
        // defer to our child `post` value conformance
        lhs.hashValue == rhs.hashValue
    }
}

extension APIPostView: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.post.id)
        hasher.combine(self.myVote)
        hasher.combine(self.saved)
        hasher.combine(self.read)
    }
}
