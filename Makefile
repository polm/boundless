all:
	lsc -o src src
	browserify -d -t browserify-livescript src/boundless.ls > boundless.js
