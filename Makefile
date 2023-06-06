default: generate

generate:
	sox -r 48000 -n -b 24 -c 1 reference-tones/silence.wav trim 0.0 3.0
	sox -r 48000 -n -b 24 -c 1 reference-tones/sine1k.wav synth 20 sin 1000 vol -6dB fade 0.1
	sox -r 48000 -n -b 24 -c 1 reference-tones/sine10k.wav synth 20 sin 10000 vol -6dB
	sox -r 48000 -n -b 24 -c 1 reference-tones/sine15k.wav synth 20 sin 15000 vol -6dB
	sox -r 48000 -n -b 24 -c 1 reference-tones/sine100.wav synth 20 sin 100 vol -6dB
	sox -r 48000 -n -b 24 -c 1 reference-tones/sine50.wav synth 20 sin 50 vol -6dB
	sox reference-tones/silence.wav reference-tones/sine1k.wav reference-tones/silence.wav reference-tones/sine10k.wav reference-tones/silence.wav reference-tones/sine15k.wav reference-tones/silence.wav reference-tones/sine100.wav reference-tones/silence.wav reference-tones/sine50.wav reference-tones/silence.wav reference-tones/reference.wav
.PHONY: generate

release: generate
	zip reference-tones.zip reference-tones/*.wav
.PHONY: release

release-local: clean generate
	zip reference-tones/reference-tones.zip reference-tones/*.wav
	if [ -z "$(RELEASE_TAG)" ]; then \
		echo "RELEASE_TAG environment variable missing"; \
	else \
		gh release create $(RELEASE_TAG) --latest -t "Reference Tones $(RELEASE_TAG)" -F ReleaseNotes.template.md 'reference-tones/reference-tones.zip#Reference Tones'; \
	fi
.PHONY: release-local

clean:
	rm -f reference-tones/*.zip reference-tones/*.wav
.PHONY: clean

bootstrap-build-mac:
	brew install sox
.PHONY: bootstrap-build-mac

bootstrap-release-mac:
	brew install gh
.PHONY: bootstrap-release-mac

bootstrap-mac: bootstrap-build-mac bootstrap-release-mac
.PHONY: bootstrap-mac

