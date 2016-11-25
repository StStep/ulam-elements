ULAM Elements
==

These selection of elements are an attempt at producing an organization template for calculations in MFM. Note: There are 71 usable bits for element instance members, and 32 bits for quarks.
To use these files, you'll need to install the Movable Feast Machine: [description](https://github.com/elenasa/ULAM/wiki/Ulam-Programming-Language) and [source](https://github.com/DaveAckley/MFM)

**Personal Restrictions**

Currently, the event window lookups are restricted to adjacent sites, sites 1 through 4, as a HW implementation feasibility measure.

Size Management
--
The desired requirements for size management elements are the following:

1. Allocate space in ratios
2. Have changing desired ratios change actual ratios
3. Separation between different allocation IDs
4. Containing a space
5. Want max allocation of some kind
6. Want movement of allocated space to try and fill available space optimally
7. Separation from unknown
8. Deal gracefully with inconsistencies in available space

**Demos**

* [ULAM - Space Allocation Demo](https://www.youtube.com/watch?v=diiUx5CkXa4)

**Groups**

The selection process involved multiple development groups, with group 4 being chosen. More details in past commits.
* Group 1 - Crystalline growth, limited by inconsistencies in available area
* Group 2 - Initial amorphous growth attempt, unstable
* Group 3 - Pulsing growth attempt, ran into growth instability, fuse problem
* Group 4 - Based on group 2, with a logic pass-over to improve stability

**Future Work**

* Currently, Cytoplasm based distance measuring means internal non-Cytoplasm elements will alter the overall shape of the allocated space
* Nucleus auto-centering works with simple organizations, current isses:
    * Corner sites are heavily prefered due to counting dirction
    * Nuclei of the same ID clumb, making multiple ID Nuclei less effective, and limits ID coverage
    * Nuclie swaping is type agnostic, maybe make it check some stuff first, such as only swaping to Cyto? Could fix at same time as corner preference.

###Nucleus
This element initiates site allocation, by creating Cytoplasm elements, and setting their dist data member.
Has an ID, that is bestowed on Cytoplasm children.
The ID is used to separate allocated sites by purpose.
Two nuclei of differing ID will not merge, and will stay distinct.
Two nuclei of the same ID will share allocated sites.
A nucleus will die if it is surrounded by Membrane elements.
Nuclei currently attempt to auto-center themselves within spaces, see Future Work for progress concerning this.

**Parameter: maxDist**

This parameter determines how much space is allocated.

###Cytoplasm
This element serves as the primary mechanism for size management.
Keeps track of a distance value, that decrements going outwards from the nucleus, that is used to determine distance.
The life-cycle of Cytoplasm is strongly connected to the Membrane life-cycle.

###Membrane
This element represents the boundary of allocated space.
This element forms as Cytoplasm elements contact unknown elements, Cytoplasm of a differing ID, or the max allocation range.

