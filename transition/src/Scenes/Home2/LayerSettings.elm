module Scenes.Home2.LayerSettings exposing
    ( LayerDataType(..)
    , LayerT
    )

{-| This module is generated by Messenger, don't modify this.

@docs LayerDataType
@docs LayerT

-}

import Lib.Layer.Base exposing (Layer)
import Scenes.Home2.LayerBase exposing (CommonData)
import Scenes.Home2.Main.Export as Main


{-| LayerDataType
-}
type LayerDataType
    = MainData Main.Data
    | NullLayerData


{-| LayerT
-}
type alias LayerT =
    Layer LayerDataType CommonData
