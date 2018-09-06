module Screeps.Destructible where

import Effect

import Screeps.FFI     (unsafeField, runThisEffFn1)
import Screeps.ReturnCode (ReturnCode)

class Destructible o

hits :: forall       d.
        Destructible d
     =>              d
     -> Int
hits = unsafeField "hits"

hitsMax :: forall       d.
           Destructible d
        =>              d
        -> Int
hitsMax  = unsafeField "hitsMax"

notifyWhenAttacked :: forall       o.
                      Destructible o
                   =>              o
                   -> Boolean
                   -> Effect ReturnCode
notifyWhenAttacked = runThisEffFn1 "notifyWhenAttacked"

