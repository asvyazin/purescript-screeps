-- | Corresponds to the Screeps API [StructureSpawn](http://support.screeps.com/hc/en-us/articles/205990342-StructureSpawn)
module Screeps.Spawn where

import Data.Argonaut.Decode.Class (class DecodeJson)
import Data.Argonaut.Encode.Class (class EncodeJson, encodeJson)
import Data.Maybe (Maybe)
import Effect (Effect)
import Prelude (class Eq, class Show, ($))
import Screeps.BodyPartType (BodyPartType)
import Screeps.Creep (Creep)
import Screeps.Destructible (class Destructible)
import Screeps.Direction (Direction)
import Screeps.FFI (runThisEffectFn1, runThisEffectFn2, runThisFn1, toMaybe, unsafeField, instanceOf)
import Screeps.Id (class HasId, decodeJsonWithId, encodeJsonWithId, eqById)
import Screeps.ReturnCode (ReturnCode)
import Screeps.RoomObject (class RoomObject)
import Screeps.Stores (class Stores)
import Screeps.Structure (class Structural, class Structure, AnyStructure, fromAnyStructure, showStructure, structure_spawn)
import Screeps.Types (class Owned)
import Screeps.Withdrawable (class Withdrawable)

type CreepInfo
  = { name :: String
    , needTime :: Int
    , remainingTime :: Int
    }

foreign import data Spawn :: Type

instance objectSpawn :: RoomObject Spawn

instance ownedSpawn :: Owned Spawn

instance spawnHasId :: HasId Spawn where
  validate = instanceOf "StructureSpawn"

instance eqSpawn :: Eq Spawn where
  eq = eqById

instance encodeSpawn :: EncodeJson Spawn where
  encodeJson = encodeJsonWithId

instance decodeSpawn :: DecodeJson Spawn where
  decodeJson = decodeJsonWithId

instance structuralSpawn :: Structural Spawn

instance storesSpawn :: Stores Spawn

instance withdrawableSpawn :: Withdrawable Spawn

instance structureSpawn :: Structure Spawn where
  _structureType _ = structure_spawn

instance showSpawn :: Show Spawn where
  show = showStructure

instance destructibleSpawn :: Destructible Spawn

memory :: forall props. Spawn -> { | props }
memory = unsafeField "memory"

name :: Spawn -> String
name = unsafeField "name"

spawning :: Spawn -> Maybe CreepInfo
spawning spawn = toMaybe $ unsafeField "spawning" spawn

canCreateCreep :: Spawn -> Array BodyPartType -> ReturnCode
canCreateCreep spawn parts = runThisFn1 "canCreateCreep" spawn parts

canCreateCreep' :: Spawn -> Array BodyPartType -> String -> Effect ReturnCode
canCreateCreep' spawn parts name' = runThisEffectFn2 "canCreateCreep" spawn parts name'

type SpawnCreepOpts mem
  = { memory :: mem
    , energyStructures :: Array AnyStructure
    , dryRun :: Boolean
    , directions :: Array Direction
    }

foreign import spawnCreep ::
  Spawn ->
  Array BodyPartType ->
  String ->
  Effect ReturnCode

foreign import spawnCreepOptsImpl ::
  forall mem.
  Spawn ->
  Array BodyPartType ->
  String ->
  SpawnCreepOpts mem ->
  Effect ReturnCode

spawnCreepOpts :: forall mem. EncodeJson mem => Spawn -> Array BodyPartType -> String -> SpawnCreepOpts mem -> Effect ReturnCode
spawnCreepOpts spawn b n x@{ memory: m } =
  spawnCreepOptsImpl spawn b n x { memory = encodeJson m }

recycleCreep :: Spawn -> Creep -> Effect ReturnCode
recycleCreep = runThisEffectFn1 "recycleCreep"

renewCreep :: Spawn -> Creep -> Effect ReturnCode
renewCreep = runThisEffectFn1 "renewCreep"

toSpawn :: AnyStructure -> Maybe Spawn
toSpawn = fromAnyStructure
