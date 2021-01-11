
lint-autocorrect:
	swiftlint autocorrect

lint:
	swiftlint lint

check-format:
	swiftformat --lint Sources
	
format:
	swiftformat .

generate-lcov:
	xcrun llvm-cov export -format="lcov" .build/debug/AEPRulesEnginePackageTests.xctest/Contents/MacOS/AEPRulesEnginePackageTests -instr-profile .build/debug/codecov/default.profdata > info.lcov

# make check-version VERSION=1.0.0-beta.1
check-version:
	(sh ./script/version.sh $(VERSION))
test-SPM-integration:
	(sh ./script/test-SPM.sh)