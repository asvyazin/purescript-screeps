-- | Corresponds to the Screeps API [StructureExtension](http://support.screeps.com/hc/en-us/articles/207711949-StructureExtension)
module Screeps.Extension where

import Screeps.Structure

import Data.Argonaut.Decode.Class (class DecodeJson)
import Data.Argonaut.Encode.Class (class EncodeJson)
import Data.Eq (class Eq)
import Data.Maybe (Maybe)
import Data.Show (class Show)
import Screeps.Destructible (class Destructible)
import Screeps.FFI (instanceOf)
import Screeps.Id (class HasId, decodeJsonWithId, encodeJsonWithId, eqById)
import Screeps.RoomObject (class RoomObject)
import Screeps.Stores (class Stores)
import Screeps.Types (class Owned)
import Screeps.Withdrawable (class Withdrawable)

foreign import data Extension :: Type

instance objectExtension :: RoomObject Extension

instance ownedExtension :: Owned Extension

instance extensionHasId :: HasId Extension where
  validate = instanceOf "StructureExtension"

instance encodeExtension :: EncodeJson Extension where
  encodeJson = encodeJsonWithId

instance decodeExtension :: DecodeJson Extension where
  decodeJson = decodeJsonWithId

instance structuralExtension :: Structural Extension

instance storesExtension :: Stores Extension

instance eqExtension :: Eq Extension where
  eq = eqById

instance showExtension :: Show Extension where
  show = showStructure

instance withdrawableExtension :: Withdrawable Extension

instance structureExtension :: Structure Extension where
  _structureType _ = structure_extension

instance destructibleExtension :: Destructible Extension

toExtension :: AnyStructure -> Maybe Extension
toExtension = fromAnyStructure

-- fixme
-- | Extension capacity on a given room control level.
-- extensionCapacity :: Int -> Int
-- extensionCapacity level
--   | level > 8 = extensionCapacity 8

-- extensionCapacity level =
--   0
--     `fromMaybe`
--       lookup level extension_energy_capacity
