# fuzz-Forgery script for QB-Core
A fork of m-Forgery that adds independent hacks for EACH license, A key requirement to enter the building and a function that breaks the key.


# Installation Guide

1. Install dependencies and place in [standalone] folder

2. Add These Items to qb-core/shared/items.lua

['keyfrags'] 					 = {['name'] = 'keyfrags', 						['label'] = 'Broken Key Pieces', 				    ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'keyfrags.png', 			    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Broke Key Pieces...Duh...'},
['forgerykey'] 					 = {['name'] = 'forgerykey', 						['label'] = 'Notary Office Key', 				    ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'forgerykey.png', 			    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Key for the Notary Office '},
['dirtybills'] 				 	= {['name'] = 'dirtybills', 			  	  	   ['label'] = 'Stolen Dollar Bill', 		['weight'] = 0, 		['type'] = 'item', 		['image'] = 'dirtybills.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Dollar per Dollar'},

3. Add Images into inventory/html/images

4. Configure to your liking :D

# Original Creators

https://github.com/ansljeremy/qb-forgery
https://github.com/marcinhuu/m-Forgery (Thank you again for the baller scripts :D )

# Updates
- Added item check or not
- Added function to call cops
- Added language to more pratic translate
- Added support to other notifications
- Added specific time to each forgery
- Added type of payment cash or bank
# Fuzzi Updates
- Added item requirement to enter building 
- Added function that breaks key when exiting building
- Added option to use dirty money/bills instead of cash
- Added hacks for each license 
 

 # Dependencies 
 - https://github.com/dsheedes/cd_keymaster
 - https://github.com/RanDXDev/ran-minigames