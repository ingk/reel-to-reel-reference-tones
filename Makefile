default: generate

generate:
	sox -r 48000 -n -b 24 -c 1 output/silence.wav trim 0.0 3.0
	sox -r 48000 -n -b 24 -c 1 output/sine1k.wav synth 20 sin 1000 vol -6dB fade 0.1
	sox -r 48000 -n -b 24 -c 1 output/sine10k.wav synth 20 sin 10000 vol -6dB
	sox -r 48000 -n -b 24 -c 1 output/sine15k.wav synth 20 sin 15000 vol -6dB
	sox -r 48000 -n -b 24 -c 1 output/sine100.wav synth 20 sin 100 vol -6dB
	sox -r 48000 -n -b 24 -c 1 output/sine50.wav synth 20 sin 50 vol -6dB
	sox output/silence.wav output/sine1k.wav output/silence.wav output/sine10k.wav output/silence.wav output/sine15k.wav output/silence.wav output/sine100.wav output/silence.wav output/sine50.wav output/silence.wav output/reference.wav
.PHONY: generate

clean:
	rm -f output/*.zip output/*.wav
.PHONY: clean

release: clean generate
	zip output/reference-tones.zip output/*.wav
	if [ -z "$(RELEASE_TAG)" ]; then \
		echo "RELEASE_TAG environment variable missing"; \
	else \
		gh release create $(RELEASE_TAG) --latest -t "Reference Tones $(RELEASE_TAG)" -F ReleaseNotes.template.md 'output/reference-tones.zip#Reference Tones'; \
	fi
	
.PHONY: release

bootstrap-build-mac:
	brew install sox
.PHONY: bootstrap-build-mac

bootstrap-release-mac:
	brew install gh
.PHONY: bootstrap-release-mac

bootstrap-mac: bootstrap-build-mac bootstrap-release-mac
.PHONY: bootstrap-mac
