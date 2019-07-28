.PHONEY: dist clean

dist: imagepuller.yaml

imagepuller.yaml:
	helm template imagepuller > imagepuller.yaml

clean:
	rm imagepuller.yaml