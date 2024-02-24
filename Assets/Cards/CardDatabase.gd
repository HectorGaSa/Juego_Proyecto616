#Enemy/ALLY info = (Type, DMG, Health, Speed, DodgeRate, Name, Ranged or Mele, EspecialHability)
#OBJECT info = (Type, DMG, Armor, Value, Name, Ranged or Mele)
#RESOURCE info = (Type, HarvestTime, Value)

enum {Cerbero,Village,Sword,Rock}

const ENEMY = {
	Cerbero : ["Boss", 10, 30, 75, 33, "Cerbero", "Mele", "MultiAtk"]

}

const ALLY = {
	Village : ["Units", 1, 5, 100, 10, "Deafault", "Mele", "Nothing"]
}


const OBJECT = {
	Sword : ["MeleWeapon", 5, 0, 3, "Sword", "Mele"]


}

const RESOURCE = {
	Rock : ["Basic", 100, 1]
	
	
}
