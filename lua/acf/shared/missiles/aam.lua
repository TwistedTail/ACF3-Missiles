--define the class
ACF_defineGunClass("AAM", {
	type            = "missile",
	spread          = 1,
	name            = "Air-To-Air Missile",
	desc            = "Missiles specialized for air-to-air flight.  They have varying range, but are agile, can be radar-guided, and withstand difficult launch angles well.",
	muzzleflash     = "gl_muzzleflash_noscale",
	rofmod          = 1,
	sound           = "acf_missiles/missiles/missile_rocket.mp3",
	soundDistance   = " ",
	soundNormal     = " ",
	effect          = "Rocket Motor",

	reloadmul       = 8,

	ammoBlacklist   = {"AP", "APHE", "FL", "HEAT"} -- Including FL would mean changing the way round classes work.
} )

-- BALANCE RATIONALE (open to discussion during development):
-- AAMs should be feasible in air-to-air combat but less feasible from the ground.
-- They will usually be launched from fast-moving aircraft.  Typical dogfighting distances are smaller than typical SAM engagement distances.
-- AAMs will have less time to adjust course before meeting their target due to decresed engagement range, and may be launched off-course due to flight.

-- With this in mind:
--      AAMs should be more powerful than SAMs of equivalent caliber.
--      AAMs should have weaker motors than SAMs of equivalent caliber.
--      AAMs should have less propellant than SAMs of equivalent caliber.
--      AAMs should be more manouverable than SAMs of equivalent caliber.
--      AAMs should be more agile than SAMs of equivalent caliber.
--      AAMs should have larger viewcones than SAMs of equivalent caliber.

--[[
-- Not based on any real missile - this is for smaller aircraft.
-- Balance the round in line with the 40mm pod rocket.
ACF_defineGun("40mmAAM", { --id
	name = "40mm Air-to-air Missile",
	desc = "Someone glued a radar dish to a firework.  It's puny, short-range and goes pop instead of boom. It's also fast and agile, like the tiny aircraft you'll be putting this on.",
	model = "models/missiles/70mmffar.mdl",
	gunclass = "AAM",
	rack = "4xRK",  -- Which rack to spawn this missile on?
	length = 45,
	caliber = 4.0,
	weight = 35,    -- Don't scale down the weight though!
	year = 1953,
	round = {
		model		= "models/missiles/70mmffar.mdl",
		rackmdl		= "models/missiles/70mmffar.mdl",
		maxlength	= 32,
		casing		= 0.2,	        -- thickness of missile casing, cm
		armour		= 5,				-- effective armour thickness of casing, in mm
		propweight	= 1,	        -- motor mass - motor casing
		thrust		= 8000,	    -- average thrust - kg*in/s^2
		burnrate	= 450,	        -- cm^3/s at average chamber pressure
		starterpct	= 0.15,          -- percentage of the propellant consumed in the starter motor.
		minspeed	= 8000,			-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.002,		-- drag coefficient of the missile
		finmul		= 0.003			-- fin multiplier (mostly used for unpropelled guidance)
	},

	ent         = "acf_rack", -- A workaround ent which spawns an appropriate rack for the missile.
	guidance    = ACF_GetAllGuidanceNames(),
	fuzes       = ACF_GetAllFuzeNames(),

	seekcone    = 40,   -- getting inside this cone will get you locked.  Divided by 2 ('seekcone = 40' means 80 degrees total.)
	viewcone    = 60,   -- getting outside this cone will break the lock.  Divided by 2.

	agility     = 1     -- multiplier for missile turn-rate.
} )
]]

-- The sidewinder analogue. we have to scale it down because acf is scaled down.
ACF_defineGun("AIM-9 AAM", { --id
	name = "AIM-9 Missile",
		desc = "The gold standard in airborne jousting sticks. Agile and reliable with a rather underwhelming effective range, this homing missile is the weapon of choice for dogfights.\nSeeks 20 degrees, so well suited to dogfights.",
	model = "models/missiles/aim9m.mdl",
	gunclass = "AAM",
	rack = "1xRK",  -- Which rack to spawn this missile on?
	length = 200,
	caliber = 12.7,
	weight = 75,    -- Don't scale down the weight though!
	rofmod = 0.5,
	year = 1953,
	round = {
		model		= "models/missiles/aim9m.mdl",
		maxlength	= 35,
		casing		= 0.1,	        -- thickness of missile casing, cm
		armour		= 15,			-- effective armour thickness of casing, in mm
		propweight	= 1,	        -- motor mass - motor casing
		thrust		= 20000,	    -- average thrust - kg*in/s^2		--was 100000
		burnrate	= 500,	        -- cm^3/s at average chamber pressure	--was 350
		starterpct	= 0.1,          -- percentage of the propellant consumed in the starter motor.	--was 0.2
		minspeed	= 3000,		-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.002,		-- drag coefficient while falling
				dragcoefflight  = 0.03,                 -- drag coefficient during flight
		finmul		= 0.025			-- fin multiplier (mostly used for unpropelled guidance)
	},

	ent         = "acf_rack", -- A workaround ent which spawns an appropriate rack for the missile.
	guidance    = { "Dumb", "Infrared", "Semi-Active Radar" },
	fuzes       = { "Contact", "Radio" },

	racks       = {["1xRK"] = true,  ["2xRK"] = true, ["3xRK"] = true, ["1xRK_small"] = true},   -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'

	seekcone    = 10,   -- getting inside this cone will get you locked.  Divided by 2 ('seekcone = 40' means 80 degrees total.)	--was 25
	viewcone    = 30,   -- getting outside this cone will break the lock.  Divided by 2.		--was 30

	agility     = 5,  -- multiplier for missile turn-rate.
	armdelay    = 0.2     -- minimum fuze arming delay		--was 0.4
} )

-- Sparrow analog.  We have to scale it down because acf is scaled down.  It's also short-range due to AAM guidelines.
-- Balance the round in line with the 70mm pod rocket.
-- no more 180 aim 120 shenanigans | This time hopefully
ACF_defineGun("AIM-120 AAM", { --id
	name = "AIM-120 Missile",
	desc = "Faster than the AIM-9, but also a lot heavier. Burns hot and fast, with a good reach, but harder to lock with.  This long-range missile is sure to deliver one heck of a blast upon impact.\nSeeks only 10 degrees and less agile than its smaller stablemate, so choose your shots carefully.",
	model = "models/missiles/aim120c.mdl",
	gunclass = "AAM",
	rack = "1xRK",  -- Which rack to spawn this missile on?
	length = 1000,
	caliber = 18,
	weight = 125,    -- Don't scale down the weight though! --was 152, I cut that down to 1/2 an AIM-7s weight
	year = 1991,
	modeldiameter = 7.1 * 2.54, -- in cm
	round = {
		model		= "models/missiles/aim120c.mdl",
		maxlength	= 50,
		casing		= 0.1,	        -- thickness of missile casing, cm
		armour		= 20,			-- effective armour thickness of casing, in mm
		propweight	= 2,	        -- motor mass - motor casing
		thrust		= 24000,	    -- average thrust - kg*in/s^2		--was 200000
		burnrate	= 2200,	        -- cm^3/s at average chamber pressure	--was 800
		starterpct	= 0.3,          -- percentage of the propellant consumed in the starter motor.
		minspeed	= 2000,			-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.002,		-- drag coefficient while falling
				dragcoefflight  = 0.0013,                 -- drag coefficient during flight
		finmul		= 0.027		-- fin multiplier (mostly used for unpropelled guidance)
	},

	ent         = "acf_rack", -- A workaround ent which spawns an appropriate rack for the missile.
	guidance    = { "Dumb", "Semi-Active Radar", "Active Radar" },
	fuzes       = { "Contact", "Radio" },

	racks       = {["1xRK"] = true, ["2xRK"] = true},   -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'

	seekcone    = 5,   -- getting inside this cone will get you locked.  Divided by 2 ('seekcone = 40' means 80 degrees total.)	--was 20
	viewcone    = 20,   -- getting outside this cone will break the lock.  Divided by 2.	--was 25

	agility     = 0.173,    -- multiplier for missile turn-rate.
	armdelay    = 0.2     -- minimum fuze arming delay --was 0.3
} )

--Phoenix.  Since we've rebalanced missile, and since we're making this a SPECIALIST weapon and scaling it to gmod, we can do it.
--it's heavily based off the sparrow.  Since we made the aim-120 LESS of the "big dick of the air", we'll have this take the more specialized role
--basically split the old aim-120 into the enw one and this.  This is WAY SLOWER than the real Phoenix, to compensate for long flight times.
ACF_defineGun("AIM-54 AAM", { --id
	name = "AIM-54 Missile",
	desc = "A BEEFY god-tier anti-bomber weapon, made with Jimmy Carter's repressed rage. Getting hit with one of these is a significant emotional event that is hard to avoid if you're flying high, but with a very narrow 8 degree seeker, a thin casing, and a laughable speed, don't expect to be using it vs MIGs.",
	model = "models/missiles/aim54.mdl",
	gunclass = "AAM",
	rack = "1xRK",  -- Which rack to spawn this missile on?
	length = 1000,
	caliber = 38,
	weight = 300,    -- Don't scale down the weight though!
	year = 1974,
	modeldiameter = 9.0 * 2.54, -- in cm
	round = {
		model		= "models/missiles/aim54.mdl",
		maxlength	= 60,
		casing		= 0.2,	        -- thickness of missile casing, cm
		armour		= 5,			-- effective armour thickness of casing, in mm
		propweight	= 5,	        -- motor mass - motor casing
		thrust		= 45000,	    -- average thrust - kg*in/s^2		--was 200000
		burnrate	= 1500,	        -- cm^3/s at average chamber pressure	--was 800
		starterpct	= 0.1,          -- percentage of the propellant consumed in the starter motor.
		minspeed	= 4000,			-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.005,		-- drag coefficient while falling
		dragcoefflight  = 0.05,                 -- drag coefficient during flight
		finmul		= 0.02			-- fin multiplier (mostly used for unpropelled guidance)
	},

	ent         = "acf_rack", -- A workaround ent which spawns an appropriate rack for the missile.
	guidance    = { "Dumb", "Semi-Active Radar", "Active Radar" },
	fuzes       = { "Contact", "Radio" },

	racks       = {["1xRK"] = true},   -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'

	seekcone    = 5,   -- getting inside this cone will get you locked.  Divided by 2 ('seekcone = 40' means 80 degrees total.)
	viewcone    = 20,   -- getting outside this cone will break the lock.  Divided by 2.

	agility     = 0.05,    -- multiplier for missile turn-rate.
	armdelay    = 0.4     -- minimum fuze arming delay --was 0.3
} )

ACF.RegisterMissileClass("AAM", {
	Name		= "Air-To-Air Missiles",
	Description	= "Missiles specialized for air-to-air flight. They have varying range, but are agile, can be radar-guided, and withstand difficult launch angles well.",
	Sound		= "acf_missiles/missiles/missile_rocket.mp3",
	Effect		= "Rocket Motor",
	ReloadMul	= 8,
	RoFMod		= 1,
	Spread		= 1,
	Blacklist	= { "AP", "APHE", "HEAT", "HP", "FL", "SM" }
})

ACF.RegisterMissile("AIM-9 AAM", "AAM", {
	Name		= "AIM-9 Sidewinder",
	Description	= "Agile and reliable with a rather underwhelming effective range, this homing missile is the weapon of choice for dogfights.",
	Model		= "models/missiles/aim9m.mdl",
	Length		= 200,
	Caliber		= 127,
	Mass		= 85,
	RoFMod		= 0.5,
	Year		= 1953,
	Guidance	= { "Dumb", "Infrared", "Semi-Active Radar" },
	Fuzes		= { "Contact", "Radio" },
	Racks		= { ["1xRK"] = true, ["2xRK"] = true, ["3xRK"] = true, ["1xRK_small"] = true },
	SeekCone	= 10,
	ViewCone	= 30,
	Agility		= 5,
	ArmDelay	= 0.2,
	Round = {
		Model			= "models/missiles/aim9m.mdl",
		MaxLength		= 35,
		Armor			= 5,
		PropMass		= 1,
		Thrust			= 20000, -- in kg*in/s^2
		BurnRate		= 500, -- in cm^3/s
		StarterPercent	= 0.1,
		MinSpeed		= 3000,
		DragCoef		= 0.002,
		DragCoefFlight	= 0.03,
		FinMul			= 0.025,
		CanDelayLaunch	= true,
	},
})

ACF.RegisterMissile("AIM-120 AAM", "AAM", {
	Name		= "AIM-120 AMRAAM",
	Description	= "Burns hot and fast, with a good reach, but harder to lock with. This long-range missile is sure to deliver one heck of a blast upon impact.",
	Model		= "models/missiles/aim120c.mdl",
	Length		= 1000,
	Caliber		= 180,
	Mass		= 152,
	Year		= 1991,
	Diameter	= 130, -- in mm
	Guidance	= { "Dumb", "Semi-Active Radar", "Active Radar" },
	Fuzes		= { "Contact", "Radio" },
	Racks		= { ["1xRK"] = true, ["2xRK"] = true },
	SeekCone	= 5,
	ViewCone	= 20,
	Agility		= 0.173,
	ArmDelay	= 0.2,
	Round = {
		Model			= "models/missiles/aim120c.mdl",
		MaxLength		= 50,
		Armor			= 5,
		PropMass		= 2,
		Thrust			= 24000, -- in kg*in/s^2
		BurnRate		= 2200, -- in cm^3/s
		StarterPercent	= 0.3,
		MinSpeed		= 2000,
		DragCoef		= 0.002,
		DragCoefFlight	= 0.0013,
		FinMul			= 0.027,
		CanDelayLaunch	= true,
	},
})

ACF.RegisterMissile("AIM-54 AAM", "AAM", {
	Name		= "AIM-54 Phoenix",
	Description	= "A BEEFY god-tier anti-bomber weapon, made with Jimmy Carter's repressed rage. Getting hit with one of these is a significant emotional event that is hard to avoid if you're flying high.",
	Model		= "models/missiles/aim54.mdl",
	Length		= 1000,
	Caliber		= 380,
	Mass		= 453,
	Year		= 1974,
	Diameter	= 300, -- in mm
	Guidance	= { "Dumb", "Semi-Active Radar", "Active Radar" },
	Fuzes		= { "Contact", "Radio" },
	Racks		= { ["1xRK"] = true },
	SeekCone	= 5,
	ViewCone	= 20,
	Agility		= 0.05,
	ArmDelay	= 0.4,
	Round = {
		Model			= "models/missiles/aim54.mdl",
		MaxLength		= 60,
		Armor			= 5,
		PropMass		= 5,
		Thrust			= 45000, -- in kg*in/s^2
		BurnRate		= 1500, -- in cm^3/s
		StarterPercent	= 0.1,
		MinSpeed		= 4000,
		DragCoef		= 0.005,
		DragCoefFlight	= 0.05,
		FinMul			= 0.02,
		CanDelayLaunch	= true,
	},
})
