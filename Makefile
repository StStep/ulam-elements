default:
	ulam --sd size-management Nucleus.ulam Cytoplasm.ulam Membrane.ulam

.PHONY: run
run:
	mfzrun a.mfz

.PHONY: clean
clean:
	rm -f a.mfz
