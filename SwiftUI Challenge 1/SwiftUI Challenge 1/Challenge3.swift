import SwiftUI

struct CollectDict<Key: Hashable, Value>: PreferenceKey {
	static var defaultValue: [Key: Value] { [:] }
	static func reduce(value: inout [Key:Value], nextValue: () -> [Key:Value]) {
		value.merge(nextValue(), uniquingKeysWith: { $1 })
	}
}

struct TabBar: View {
	var items: [(Image, Text)]
	@State private var selectedIndex: Int = 0
	@State private var widths: [Int: CGFloat] = [:]
	typealias Key = CollectDict<Int, CGFloat>

	var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .top) {
				ForEach(0..<items.count) { index in
					VStack {
						self.items[index].0
						self.items[index].1
					}
					.background(
						GeometryReader { proxy in
							Color.clear
								.preference(key: Key.self, value: [index: proxy.size.width])
					})
						.foregroundColor(index == self.selectedIndex ? .blue : .black)
						.onTapGesture {
							withAnimation {
								self.selectedIndex = index
							}
					}
				}
			}
			.onPreferenceChange(Key.self) {
				self.widths = $0
			}
			Color.blue
				.frame(width: self.widths[self.selectedIndex], height: 1)
				.offset(x: (0..<self.selectedIndex).map { self.widths[$0]! + 8 }.reduce(0, +), y: 0)
		}
	}
}

struct Challenge3: View {
	var body: some View {
		return TabBar(items: [
			(Image(systemName: "tray"), Text("Inbox")),
			(Image(systemName: "archivebox"), Text("Archive")),
			(Image(systemName: "doc.text"), Text("Drafts"))
		]).padding().border(Color.blue)
	}
}

struct Challenge3_Previews: PreviewProvider {
	static var previews: some View {
		Challenge3().previewLayout(.sizeThatFits)
	}
}
