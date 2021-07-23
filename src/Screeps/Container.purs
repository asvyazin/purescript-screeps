-- | Corresponds to the Screeps API [StructureContainer](http://support.screeps.com/hc/en-us/articles/208435885-StructureContainer)
module Screeps.Container where

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
import Screeps.Withdrawable (class Withdrawable)

foreign import data Container :: Type

instance objectContainer :: RoomObject Container

instance containerHasId :: HasId Container where
  validate = instanceOf "StructureContainer"

instance encodeContainer :: EncodeJson Container where
  encodeJson = encodeJsonWithId

instance decodeContainer :: DecodeJson Container where
  decodeJson = decodeJsonWithId

instance structuralContainer :: Structural Container

instance storeInContainer :: Stores Container

instance withdrawableContainer :: Withdrawable Container

instance structureContainer :: Structure Container where
  _structureType _ = structure_container

instance showContainer :: Show Container where
  show = showStructure

instance eqContainer :: Eq Container where
  eq = eqById

instance destructibleContainer :: Destructible Container

toContainer :: AnyStructure -> Maybe Container
toContainer = fromAnyStructure
