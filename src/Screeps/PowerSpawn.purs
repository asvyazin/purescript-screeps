-- | Corresponds to the Screeps API [StructurePowerSpawn](http://support.screeps.com/hc/en-us/articles/208436585-StructurePowerSpawn)
module Screeps.PowerSpawn where

import Screeps.Structure

import Data.Argonaut.Decode.Class (class DecodeJson)
import Data.Argonaut.Encode.Class (class EncodeJson)
import Data.Eq (class Eq)
import Data.Maybe (Maybe)
import Data.Show (class Show)
import Effect (Effect)
import Screeps.Destructible (class Destructible)
import Screeps.FFI (runThisEffectFn0, runThisEffectFn1, unsafeField, instanceOf)
import Screeps.Id (class HasId, encodeJsonWithId, decodeJsonWithId, eqById)
import Screeps.ReturnCode (ReturnCode)
import Screeps.RoomObject (class RoomObject)
import Screeps.Stores (class Stores)
import Screeps.Types (class Owned)

foreign import data PowerSpawn :: Type

instance objectPowerSpawn :: RoomObject PowerSpawn

instance ownedPowerSpawn :: Owned PowerSpawn

instance structuralPowerSpawn :: Structural PowerSpawn

instance powerSpawnHasId :: HasId PowerSpawn where
  validate = instanceOf "StructurePowerSpawn"

instance encodePowerSpawn :: EncodeJson PowerSpawn where
  encodeJson = encodeJsonWithId

instance decodePowerSpawn :: DecodeJson PowerSpawn where
  decodeJson = decodeJsonWithId

instance storesPowerSpawn :: Stores PowerSpawn

instance destructiblePowerSpawn :: Destructible PowerSpawn

instance structurePowerSpawn :: Structure PowerSpawn where
  _structureType _ = structure_power_spawn

instance eqPowerSpawn :: Eq PowerSpawn where
  eq = eqById

instance showPowerSpawn :: Show PowerSpawn where
  show = showStructure

createPowerCreep :: PowerSpawn -> String -> Effect ReturnCode
createPowerCreep spawn name = runThisEffectFn1 "createPowerCreep" spawn name

processPower :: PowerSpawn -> Effect ReturnCode
processPower = runThisEffectFn0 "processPower"

toPowerSpawn :: AnyStructure -> Maybe PowerSpawn
toPowerSpawn = fromAnyStructure
