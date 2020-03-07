import SwiftUI
import CoreGraphics

let p1 = CGPoint(x: 50, y: 50)
let p2 = CGPoint(x: 100, y: 25)
let p3 = CGPoint(x: 100, y: 100)

struct Challenge5: View {
	@State var toggle = true

	var body: some View {
		ZStack {
			Rectangle().foregroundColor(.white)
				.onTapGesture {
					withAnimation(.default) {
						self.toggle.toggle()
					}
			}
			AnimatedPath(from: toggle ? p1 : p2, to: p3)
				.stroke(lineWidth: 2)
		}.frame(width: 150, height: 125)
	}
}

struct AnimatedPath: Shape {

	var from: CGPoint
	var to: CGPoint

	func path(in rect: CGRect) -> Path {
		Path { p in
			p.move(to: from)
			p.addLine(to: to)
		}
	}

	var animatableData: AnimatablePair<CGPoint.AnimatableData, CGPoint.AnimatableData> {
		get { AnimatablePair(AnimatablePair(from.x, from.y),
												 AnimatablePair(to.x, to.y)) }
		set {
			(from.x, from.y) = (newValue.first.first, newValue.first.second)
			(to.x, to.y) = (newValue.second.first, newValue.second.second)
		}
	}
}

struct Challenge5_Previews: PreviewProvider {
	static var previews: some View {
		Challenge5().objcIOStyle()
	}
}
