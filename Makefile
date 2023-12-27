install:
	npm install honkit -g
preview:
	npx honkit serve
build:
	npx honkit build
pdf:
	# brew install --cask calibre
	npx honkit pdf ./ ~/Downloads/hamster_docs.pdf