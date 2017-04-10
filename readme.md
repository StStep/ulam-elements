ULAM Elements
==

These selection of elements are an attempt at producing an organization template for calculations in MFM.
To use these files, you'll need to install the Movable Feast Machine: [description](https://github.com/elenasa/ULAM/wiki/Ulam-Programming-Language) and [source](https://github.com/DaveAckley/MFM)

**Branch Specific Information**

This branch is using some ULAM statistical neighbor selection methods, ala WindowScanner, to see it's affects
as an alternative to checking every neighbor. This method is preferable for native ULAM applications, I feel, but
since I hope to port this project at some point to a simple HW implementation, I have been avoiding using a lot
of the less-obvious ULAM functionality.

Documentation
--

Currently the bulk of the project documentation can be found in ./notes.org.

Building
--

Running the command 'make' will build the project if the SW requirements are met.
Running the command 'make run' will run the built project if the SW requirements are met.

Element Groupings
--

**Size Management**

Handles the allocation of resources.

**Routing**

Handles the transportation of elements around the system.

Demos
--
* [ULAM - Space Allocation Demo](https://www.youtube.com/watch?v=diiUx5CkXa4)
