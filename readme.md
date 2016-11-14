ULAM Elements
==

These selection of elements are an attempt at producing an organization template for calculations in MFM. Note: There are 71 usable bits for element instance members, and 32 bits for quarks.
To use these files, you'll need to install the Moveable Feast Machine: [description](https://github.com/elenasa/ULAM/wiki/Ulam-Programming-Language) and [source](https://github.com/DaveAckley/MFM)


MapT (Quark)
--
A quark map implementation.

### Implementation Attributes
* K - Bits per entry key in distDict, sets limit on max different keys (K^2 - 1), with 0 being reserved as NULL key
* V - Bits per key-value in distDict, sets limit on max detectable distance (V^2  - 1)
* N - Entry per element in distDict, sets limit on max simultaneous measured distances
A standard implementation could be (K=3, V=7, N= 3), using 30 bits. Max Dist is 128, number of possible keys 8, and 3 keys can be represented at once, and leaving 2 spare bits.


Medium
--
A communication and direction finding mechanism for other elements. 

### Members
* distMap : Map = MapT(3, 7, 3) : 30 bits
    - Key represents the presence of a source
    - Value represents the distance to the source, where larger is closer
    - If a new key is added when the dictionary is full, then it replaces the smallest key-value it is larger than, otherwise it is not added

### Model Parameters
None

### Logic
* Spreads to adjacent dead molt tiles at fastest rate
* Uses adjacent mediums to update contained distances, setting it’s key-value pair to the largest adjacent value - 1 for each key independently.
* Turns adjacent empty sites into Barriers
* Turns self into barriar if unsafe element, other than empty, is adjacent.

### Details
This element is used as the routing medium for all other elements. It keeps a map of measured distances, which it uses neighboring Mediums to update. Thus serves as a communication mechanism between elements within a contiguous Medium group. 
Since this element works only on adjacent elements, it can be fenced in by a single tile width barrier. 
The distance measuring should be triggered by an outside source, which will require the distance set each cycle, otherwise it's values decay. For example, if an element sets a Medium key-value pair to 4 & 20 then the key 4 will propagate outwards , reducing in value each tile of distance, using Manhattan Distance. Each cycle this value decays, so to maintain this distance measure, and element needs to update the source Medium at a regular basis. These leads to a natural removal of any spurious distance measurements. 
This element naturally surrounds itself with barrier elements.


ExciterT (quark)
--
Adds the key-value pair K-V to all adjacent medium elements, leading to the key K being propagated out V tiles.

### Implementation Attributes
* K - The key to use : size = Medium.K bits
* V - The value to set : size = Medium.V bits

### Logic
* Adds K-V to all adjacent Medium distDict’s

### Details
This function exercises the Medium distMap member.

Molt and MoltChild
--
Expands outwards, allocating a regular sized diamond hunk of space.

### Members
* state: inactive(0), active(1), or dead(3)
* curGen: The generation of the molt
* sym: The symmetry of the element
* isCardinal: True of the element makes up the cardinal cross of the diamond, essentially a corner of the diamond.

### Model Parameters
* maxGen: The oldest generation that can exist, but cannot propogate

### Logic
* Inactive while upper and lower neigbor spots are empty
* Once active, propogate inactive molts with curGen++ into upper and lower child locations and then die or ascend if on edge
* Once dead, do nothin
* If ascending, become barrier.

### Details
Molt is used to allocate or reserve an adjustable amount of space by copying MoltChild's adjacent to it.
Ideally, this could be used as a mechanism for the reservation as a calculation space, and a way to seperate the calculation space from 'outside.'
The size can currently be adjusted by the maxGen model parameter.
Molts do not have any inherent centring abilities, so the space filled is entirely based on maxGen and the initial placement.

### Future Work
* Allow for the outer layer to maintain itself, rather than becoming dead and intert (Become barrier element)
* Better encapsulate internal inconsistancies
* Handle growth interruptsion better??


Barrier
--
Acts as buffer to 'unsafe' sites.

### Logic
* Become Medium if no unsafe neighbors

### Details
What is determine safe has a large effect on how barriers and medium interact.
If Empty is unsafe, then erased portions seperate out into their own barriers
If Empty is safe, then barriers and medium always propogate out on erasures to maintain a square.
