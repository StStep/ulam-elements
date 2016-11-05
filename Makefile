default:
	ulam Medium.ulam Exciter.ulam

.PHONY: run
run:
	mfzrun a.mfz

.PHONY: clean
clean:
	rm -f a.mfz
