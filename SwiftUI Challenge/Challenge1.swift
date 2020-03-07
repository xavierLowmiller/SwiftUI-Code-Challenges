import SwiftUI

extension View {
    func badge(count: Int = 0) -> some View {
        ZStack(alignment: .topTrailing) {
            self
            ZStack {
                if count != 0 {
                    Text("\(count)")
                        .font(.footnote)
                        .frame(width: 24, height: 24)
                        .background(Circle().fill(Color.red))
                        .animation(nil)
                        .transition(.scale)
                }
            }
            .offset(x: 12, y: -12)
        }
    }
}

struct Challenge1: View {
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
                .animation(.default)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Challenge1().objcIOStyle()
    }
}
