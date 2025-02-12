-- | Corresponds to the Screeps API [StructureNuker](http://support.screeps.com/hc/en-us/articles/208488255-StructureNuker)
module Screeps.Nuker where

import Screeps.Structure

import Data.Argonaut.Decode.Class (class DecodeJson)
import Data.Argonaut.Encode.Class (class EncodeJson)
import Data.Eq (class Eq)
import Data.Maybe (Maybe)
import Data.Show (class Show)
import Effect (Effect)
import Screeps.Constants (nuker_cooldown)
import Screeps.Coolsdown (class Coolsdown)
import Screeps.Destructible (class Destructible)
import Screeps.FFI (runThisEffectFn1, unsafeField, instanceOf)
import Screeps.Id (class HasId, encodeJsonWithId, decodeJsonWithId, eqById)
import Screeps.ReturnCode (ReturnCode)
import Screeps.RoomObject (class RoomObject)
import Screeps.RoomPosition.Type (RoomPosition)
import Screeps.Stores (class Stores)
import Screeps.Types (class Owned)

foreign import data Nuker :: Type

instance objectNuker :: RoomObject Nuker

instance ownedNuker :: Owned Nuker

instance nukerHasId :: HasId Nuker where
  validate = instanceOf "StructureNuker"

instance encodeNuker :: EncodeJson Nuker where
  encodeJson = encodeJsonWithId

instance decodeNuker :: DecodeJson Nuker where
  decodeJson = decodeJsonWithId

instance structuralNuker :: Structural Nuker

instance storesNuker :: Stores Nuker

instance coolsdownNuker :: Coolsdown Nuker where
  expectedCooldown _ = nuker_cooldown

instance structureNuker :: Structure Nuker where
  _structureType _ = structure_nuker

instance eqNuker :: Eq Nuker where
  eq = eqById

instance showNuker :: Show Nuker where
  show = showStructure

instance destructibleNuker :: Destructible Nuker

launchNuke :: Nuker -> RoomPosition -> Effect ReturnCode
launchNuke = runThisEffectFn1 "launchNuke"

toNuker :: AnyStructure -> Maybe Nuker
toNuker = fromAnyStructure
