default: tags

## Note that the `merging` project requires Java 17 or later.

## For other tasks not automated by this Makefile, do something like the following:
# for project in bcel-util bibtex-clean hashmap-util html-pretty-print icalavailable javac-parse javadoc-lookup lookup merging multi-version-control options plume-util reflection-util require-javadoc ; do
#   echo $project && (cd $project && ...) || echo "Problem with $project"
# done

## For example, here is how to update the JDK in GitHub Actions CI:
# cd ~/java/plume-lib
# for project in bcel-util bibtex-clean hashmap-util html-pretty-print icalavailable javac-parse javadoc-lookup lookup merging multi-version-control options plume-util reflection-util require-javadoc ; do
#   echo $project && (cd $project && \
#   git pull && \
#   gnb ci-java23 && \
#   cd ../${project}-branch-ci-java23 && \
#   sed -i -e "s/'17', '21', '22'/'11', '17', '21', '23'/" .github/workflows/gradle.yml && \
#   git commit -a -m "Test under Java 23" && \
#   git push) || echo "Problem with $project"
# done
# # Then look through the output for "Problem with " to find and fix exceptions.



# Creates an overall TAGS table file that includes all projects.
../TAGS: tags
tags: project-TAGS
	cd .. && etags \
	-i bcel-util \
	-i bibtex-clean \
	-i hashmap-util \
	-i html-pretty-print \
	-i icalavailable \
	-i javac-parse \
	-i javadoc-lookup \
	-i lookup \
	-i merging \
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
	cd ../javac-parse && ./gradlew tags
	cd ../javadoc-lookup && ./gradlew tags
	cd ../lookup && ./gradlew tags
	cd ../merging && ./gradlew tags
	cd ../multi-version-control && ./gradlew tags
	cd ../options && ./gradlew tags
	cd ../plume-util && ./gradlew tags
	cd ../reflection-util && ./gradlew tags
	cd ../require-javadoc && ./gradlew tags

typecheck-local-cf:
	(cd ${CHECKERFRAMEWORK} && ./gradlew assembleForJavac)
	cd ../bcel-util && ./gradlew assemble -PcfLocal
	cd ../bibtex-clean && ./gradlew assemble -PcfLocal
	cd ../hashmap-util && ./gradlew assemble -PcfLocal
	cd ../html-pretty-print && ./gradlew assemble -PcfLocal
	cd ../icalavailable && ./gradlew assemble -PcfLocal
	cd ../javac-parse && ./gradlew assemble -PcfLocal
	cd ../javadoc-lookup && ./gradlew assemble -PcfLocal
	cd ../lookup && ./gradlew assemble -PcfLocal
	cd ../merging && ./gradlew assemble -PcfLocal
	cd ../multi-version-control && ./gradlew assemble -PcfLocal
	cd ../options && ./gradlew assemble -PcfLocal
	cd ../plume-util && ./gradlew assemble -PcfLocal
	cd ../reflection-util && ./gradlew assemble -PcfLocal
	cd ../require-javadoc && ./gradlew assemble -PcfLocal

build:
	cd ../bcel-util && ./gradlew build
	cd ../bibtex-clean && ./gradlew build
	cd ../hashmap-util && ./gradlew build
	cd ../html-pretty-print && ./gradlew build
	cd ../icalavailable && ./gradlew build
	cd ../javac-parse && ./gradlew build
	cd ../javadoc-lookup && ./gradlew build
	cd ../lookup && ./gradlew build
	cd ../merging && (./gradlew nativeCompile build || ./gradlew build)
	cd ../multi-version-control && ./gradlew build
	cd ../options && ./gradlew build
	cd ../plume-util && ./gradlew build
	cd ../reflection-util && ./gradlew build
	cd ../require-javadoc && ./gradlew build

# This is subsumed by "build".
javadoc:
	cd ../bcel-util && ./gradlew javadoc
	cd ../bibtex-clean && ./gradlew javadoc
	cd ../hashmap-util && ./gradlew javadoc
	cd ../html-pretty-print && ./gradlew javadoc
	cd ../icalavailable && ./gradlew javadoc
	cd ../javac-parse && ./gradlew javadoc
	cd ../javadoc-lookup && ./gradlew javadoc
	cd ../lookup && ./gradlew javadoc
	cd ../merging && ./gradlew javadoc
	cd ../multi-version-control && ./gradlew javadoc
	cd ../options && ./gradlew javadoc
	cd ../plume-util && ./gradlew javadoc
	cd ../reflection-util && ./gradlew javadoc
	cd ../require-javadoc && ./gradlew javadoc
