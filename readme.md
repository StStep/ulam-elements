ULAM Elements
==

These selection of elements are an attempt at producing an organization template for calculations in MFM. Note: There are 71 usable bits for element instance members, and 32 bits for quarks.
To use these files, you'll need to install the Moveable Feast Machine: [description](https://github.com/elenasa/ULAM/wiki/Ulam-Programming-Language) and [source](https://github.com/DaveAckley/MFM)


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

### Group 1
Group 1 uses a crystalline method of allocating a size.
This works as long as their are no inconsistancies in the area.
As soon as the growth pattern is interrupted, the growth halts.

**Pros:**
* Fulfills 4, 5 and 7
* Very stable if no growth inconsistancies

**Cons:**
* Very sensitive to area shape
* No dynamic growth

### Group 2 (Nucleus do not diffuse)
Group 2 has an amorphous growth pattern, which easily adapts to any shape.
If the nucleus is immobile, a staic area can be allocated.
An ID can be set for different nuclei to lead to a seperation of diff allocation spaces.

**Pros:**
* Fulfills all requirements but 2 and 6
* Very flexible

**Cons:**
* No dynamic allocation
* Edges of allocation are unstable

### Group 2 (Nucleus diffuse)
Group 2 has an amorphous growth pattern, which easily adapts to any shape.
If the nucleus is mobile, clouds of nuclei can be used to dynamically allocate an area.
Ratios of the areas depend upon concentration of each nuclei of each ID.
Ability to reallocate space is based on gaps of diffusing nucleus coverage, meaning that the entire allocated space it not contained, or else dynamic allocation is lost.

**Pros:**
* Fulfills all requirements but 4

**Cons:**
* Doesn't have clear allocated space boundries at all times
* Once nucleus density reaches a point where there is full cyto coverage, most space reallocation stops, despite nuclei ratios

### Group 3
Initial investigation fruitless, running into the fuse problem.

**TODO:**
Considering an outward pulse based growth, similar to an amorphous growth, but with space contention inherent.
Pulses could be used by borders to determine movement.
More pulses equal more weigt of movement
Pulses get weaker as the move outward, so two distance  pulses count less than one close pulse.


Future Work
==

* Make Membrane edges more solid
* Allow for nucleus border contention of some kind

