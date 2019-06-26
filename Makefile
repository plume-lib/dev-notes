TAGS: tags
tags:
	etags \
	-i bcel-util \
	-i bibtex-clean \
	-i html-pretty-print \
	-i icalavailable \
	-i lookup \
	-i multi-version-control \
	-i options \
	-i plume-util \
	-i reflection-util \
	-i require-javadoc

project-TAGS:
	cd bcel-util && ./gradlew tags
	cd bibtex-clean && ./gradlew tags
	cd html-pretty-print && ./gradlew tags
	cd icalavailable && ./gradlew tags
	cd lookup && ./gradlew tags
	cd multi-version-control && ./gradlew tags
	cd options && ./gradlew tags
	cd plume-util && ./gradlew tags
	cd reflection-util && ./gradlew tags
	cd require-javadoc && ./gradlew tags
