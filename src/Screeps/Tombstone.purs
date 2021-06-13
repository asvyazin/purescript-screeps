-- corresponds to Screeps API https://docs.screeps.com/api/#Tombstone
module Screeps.Tombstone where

import Prelude

import Data.Argonaut.Decode (class DecodeJson)
import Data.Argonaut.Encode (class EncodeJson)
import Screeps.Creep (Creep)
import Screeps.FFI (instanceOf, unsafeField)
import Screeps.Id (class HasId, decodeJsonWithId, encodeJsonWithId, eqById)
import Screeps.Id as Id
import Screeps.RoomObject (class RoomObject, pos)
import Screeps.Stores (class Stores)

foreign import data Tombstone :: Type

instance roomObjectTombstone :: RoomObject Tombstone

instance hasIdTombstone :: HasId Tombstone where
  validate = instanceOf "Tombstone"

instance encodeJsonTombstone :: EncodeJson Tombstone where
  encodeJson = encodeJsonWithId

instance decodeJsonTombstone :: DecodeJson Tombstone where
  decodeJson = decodeJsonWithId

instance eqTombstone :: Eq Tombstone where
  eq = eqById

instance showTombstone :: Show Tombstone where
  show t = "Tombstone " <> show (Id.id t) <> "@" <> show (pos t)

instance storesTombstone :: Stores Tombstone

-- todo add PowerCreep
creep :: Tombstone -> Creep
creep = unsafeField "creep"

ticksToDecay :: Tombstone -> Int
ticksToDecay = unsafeField "ticksToDecay"

deathTime :: Tombstone -> Int
deathTime = unsafeField "deathTime"
