default:
	ulam --sd size-management Nucleus.ulam Cytoplasm.ulam Membrane.ulam --sd routing Medium.ulam Map.ulam ExciterT.ulam

.PHONY: run
run:
	mfzrun a.mfz

.PHONY: clean
clean:
	rm -f a.mfz
