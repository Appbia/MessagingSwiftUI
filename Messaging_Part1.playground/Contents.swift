import SwiftUI
import PlaygroundSupport

struct MainScreen: View {
    
    @State private var selected = 0
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            TabView(selection: $selected) {
                Home().tabItem {
                    Image.init(systemName: selected == 0 ? "bubble.left.and.bubble.right.fill" : "bubble.left.and.bubble.right")
                }.tag(0)
                
                Text("Contacts").tabItem {
                    Image.init(systemName: selected == 1 ? "person.2.fill" : "person.2")
                }.tag(1)
                
                Text("Settings").tabItem {
                    Image.init(systemName: "gear")
                }.tag(2)
            }
        }
    }
    
    struct Home: View {
        var body: some View {
            VStack {
                NavigationView {
                    List {
                        ForEach(0 ..< 12) {_ in
                            Post()
                        }
                    }.navigationBarTitle("Chats", displayMode: .inline)
                        .navigationBarItems(
                            leading: Image(systemName: "magnifyingglass")
                                .resizable()
                                .foregroundColor(Color(UIColor.secondaryLabel))
                                .frame(width: 18, height: 18),
                            trailing: Image(systemName: "plus.circle")
                                .resizable()
                                .foregroundColor(Color(UIColor.secondaryLabel))
                                .frame(width: 18, height: 18))
                }.navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
    
    struct Post: View {
        var body: some View {
            HStack (alignment: .top) {
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
                VStack (alignment: .leading) {
                    HStack {
                        Text("Unknown user")
                            .fontWeight(.heavy)
                        Spacer()
                        Text("9:41")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    Text("I Love lorem ipsum")
                        .font(.subheadline)
                }
            }.padding(12)
        }
    }
}

PlaygroundPage.current.setLiveView(MainScreen().colorScheme(.dark))
