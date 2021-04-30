module Screeps.Color where

import Prelude
import Data.Eq.Generic (genericEq)
import Data.Show.Generic (genericShow)
import Data.Generic.Rep (class Generic)

newtype Color
  = Color Int

derive instance genericColor :: Generic Color _

instance eqColor :: Eq Color where
  eq = genericEq

instance showColor :: Show Color where
  show = genericShow

foreign import color_red :: Color

foreign import color_purple :: Color

foreign import color_blue :: Color

foreign import color_cyan :: Color

foreign import color_green :: Color

foreign import color_yellow :: Color

foreign import color_orange :: Color

foreign import color_brown :: Color

foreign import color_grey :: Color

foreign import color_white :: Color
