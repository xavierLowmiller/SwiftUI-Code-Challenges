import SwiftUI

extension View {
    func badge(count: Int = 0) -> some View {
        self.overlay(ZStack {
            if count > 0 {
                Text("\(count)")
                    .font(Font.body.monospacedDigit())
                    .padding(8)
                    .background(Circle().fill(Color.red))
            }
        }
        .alignmentGuide(.trailing) { $0.width / 2 }
        .alignmentGuide(.top) { $0.height / 2 }

            , alignment: .topTrailing)
    }
}

struct ContentView: View {
    @State var counter = 5

    var body: some View {
        VStack {
            Stepper(onIncrement: {
                self.counter += 1
            }, onDecrement: {
                self.counter -= 1
            }, label: { Text("Count")})
            Text("Hello, World!")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray))
                .badge(count: counter)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
