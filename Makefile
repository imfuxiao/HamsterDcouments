server = server01 server02 server03
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
	for server in $(server); do scp -r ./_book/* $$server:/var/www/hamster-document; done