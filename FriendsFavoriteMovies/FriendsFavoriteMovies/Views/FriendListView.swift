import SwiftUI
import SwiftData

struct FriendListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Friend.name) private var friends: [Friend]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(friends) { friend in
                    NavigationLink(friend.name) {
                        Text("Detail view for \(friend.name)")
                            .navigationTitle("Friends")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationTitle("Friends")
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FriendListView()
        .modelContainer(SampleData.shared.modelContainer)
}
