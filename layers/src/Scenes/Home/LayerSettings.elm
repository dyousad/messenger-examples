module Scenes.Home.LayerSettings exposing
    ( LayerDataType(..)
    , LayerT
    )

{-| This module is generated by Messenger, don't modify this.

@docs LayerDataType
@docs LayerT

-}

import Lib.Layer.Base exposing (Layer)
import Scenes.Home.GameLayer.Export as GameLayer
import Scenes.Home.GameLayer2.Export as GameLayer2
import Scenes.Home.LayerBase exposing (CommonData)


{-| LayerDataType
-}
type LayerDataType
    = GameLayerData GameLayer.Data
    | GameLayer2Data GameLayer2.Data
    | NullLayerData


{-| LayerT
-}
type alias LayerT =
    Layer LayerDataType CommonData
