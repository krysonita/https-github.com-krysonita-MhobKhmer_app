import SwiftUI

struct ContentView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        NavigationView {
            VStack {
                WelcomeView(selectedTab: $selectedTab)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedTab: Tab = .home
        return ContentView(selectedTab: $selectedTab)
    }
}
