Config = {}

Config.Core = "qb-core" -- Your qb-core folder name
Config.Target = "qb-target" -- Your qb-target folder name
Config.Input = "qb-input" -- Your qb-input folder name
Config.Notify = "QBCore" -- "QBCore" | "okok" | "mythic"
Config.Amount = 5000 -- Amount of money pay for documents
Config.Debug = false -- Enable debug?
Config.NeedItem = true -- Need item to enter on warehouse?
Config.Item = "forgerykey" -- Put the item you want for enter on warehouse
Config.CallCops = true -- Call cops when forgery?
Config.HackItemNeeded = 'forgeryscript'
Config.RemoveHackItem = true
Config.AddBrokenKey = true
Config.DirtyPay = true -- If true then Config.Payment is ignored
Config.DirtyPayItem = 'dirtybills'
Config.Payment = "cash" -- "cash" or "bank" 


Config.Times = {
	ForgeID = 10, -- Time of progressbar
	ForgeDriver = 10, -- Time of progressbar
	ForgeWeapon = 10, -- Time of progressbar
	ForgeLawyer = 10, -- Time of progressbar
}

Config.Locations = {
	EnterWarehouse = vector3(-333.5, 6228.77, 31.67), -- Location to enter warehouse
	ExitWarehouse = vector3(1174.0, -3196.63, -39.01), -- Location to exit warehouse
	ForgeID = vector3(1169.52, -3196.85, -39.01), -- Location to forge a ID
	ForgeDriver = vector3(1159.82, -3199.15, -39.01), -- Location to forge a Driver Licenses
	ForgeWeapon = vector3(1168.32, -3195.56, -39.21), -- Location to forge a Weapon Licenses
	ForgeLawyer = vector3(1169.34, -3199.64, -39.21), -- Location to forge a Lawyer Pass
}
