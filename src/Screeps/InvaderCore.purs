-- | Corresponds to Screeps API [StructureInvaderCore](https://docs.screeps.com/api/#StructureInvaderCore)
module Screeps.InvaderCore where

import Prelude

import Data.Argonaut.Decode (class DecodeJson)
import Data.Argonaut.Encode (class EncodeJson)
import Screeps.Destructible (class Destructible)
import Screeps.FFI (instanceOf, unsafeField)
import Screeps.Id (class HasId, decodeJsonWithId, encodeJsonWithId, eqById)
import Screeps.RoomObject (class RoomObject)
import Screeps.Structure (class Structural, class Structure, showStructure, structure_invader_core)
import Screeps.Types (class Owned)
import Screeps.Withdrawable (class Withdrawable)

foreign import data InvaderCore :: Type

instance objectInvaderCore :: RoomObject InvaderCore

instance hasIdInvaderCore :: HasId InvaderCore where
  validate = instanceOf "StructureInvaderCore"

instance eqInvaderCore :: Eq InvaderCore where
  eq = eqById

instance ownedInvaderCore :: Owned InvaderCore

instance withdrawableInvaderCore :: Withdrawable InvaderCore

instance structuralInvaderCore :: Structural InvaderCore

instance structureInvaderCore :: Structure InvaderCore where
  _structureType _ = structure_invader_core

instance encodeJsonInvaderCore :: EncodeJson InvaderCore where
  encodeJson = encodeJsonWithId

instance decodeJsonInvaderCore :: DecodeJson InvaderCore where
  decodeJson = decodeJsonWithId

instance showInvaderCore :: Show InvaderCore where
  show = showStructure

instance destructibleInvaderCore :: Destructible InvaderCore

level :: InvaderCore -> Int
level = unsafeField "level"

ticksToDeploy :: InvaderCore -> Int
ticksToDeploy = unsafeField "ticksToDeploy"

-- TODO: spawning
