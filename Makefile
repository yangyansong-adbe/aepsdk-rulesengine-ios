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

test-podspec:
	(sh ./script/test-podspec.sh)

latest-version:
	(which jq)
	(pod spec cat AEPRulesEngine | jq '.version' | tr -d '"')

version-podspec-local:
	(which jq)
	(pod ipc spec AEPRulesEngine.podspec | jq '.version' | tr -d '"')