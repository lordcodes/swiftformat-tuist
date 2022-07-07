install:
	swift package update
	swift build -c release
	install .build/release/swift-linters /usr/local/bin/swiftlinters

uninstall:
	rm -f /usr/local/bin/swiftlinters
