default:
	ulam Map.ulam Medium.ulam ExciterT.ulam Molt.ulam

.PHONY: run
run:
	mfzrun a.mfz

.PHONY: clean
clean:
	rm -f a.mfz
