install:
	npm install honkit -g
dev:
	npx honkit serve
build:
	npx honkit build
pdf:
	# brew install --cask calibre
	npx honkit pdf ./ ~/Downloads/hamster_docs.pdf
upload: build
	scp -r ./_book/* test03:/var/www/hamster-document