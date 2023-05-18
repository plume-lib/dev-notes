default: tags

# Creates an overall TAGS table file that includes all projects.
../TAGS: tags
tags: project-TAGS
	cd .. && etags \
	-i bcel-util \
	-i bibtex-clean \
	-i hashmap-util \
	-i html-pretty-print \
	-i icalavailable \
	-i javadoc-lookup \
	-i lookup \
	-i multi-version-control \
	-i options \
	-i plume-util \
	-i reflection-util \
	-i require-javadoc

# Creates multiple TAGS table files, one for each project.
project-TAGS project-tags:
	cd ../bcel-util && ./gradlew tags
	cd ../bibtex-clean && ./gradlew tags
	cd ../hashmap-util && ./gradlew tags
	cd ../html-pretty-print && ./gradlew tags
	cd ../icalavailable && ./gradlew tags
	cd ../javadoc-lookup && ./gradlew tags
	cd ../lookup && ./gradlew tags
	cd ../multi-version-control && ./gradlew tags
	cd ../options && ./gradlew tags
	cd ../plume-util && ./gradlew tags
	cd ../reflection-util && ./gradlew tags
	cd ../require-javadoc && ./gradlew tags

test-local-cf:
	cd ${CHECKERFRAMEWORK} && ./gradlew assembleForJavac
	cd ../bcel-util && ./gradlew assemble -PcfLocal
	cd ../bibtex-clean && ./gradlew assemble -PcfLocal
	cd ../hashmap-util && ./gradlew assemble -PcfLocal
	cd ../html-pretty-print && ./gradlew assemble -PcfLocal
	cd ../icalavailable && ./gradlew assemble -PcfLocal
	cd ../javadoc-lookup && ./gradlew assemble -PcfLocal
	cd ../lookup && ./gradlew assemble -PcfLocal
	cd ../multi-version-control && ./gradlew assemble -PcfLocal
	cd ../options && ./gradlew assemble -PcfLocal
	cd ../plume-util && ./gradlew assemble -PcfLocal
	cd ../reflection-util && ./gradlew assemble -PcfLocal
	cd ../require-javadoc && ./gradlew assemble -PcfLocal
