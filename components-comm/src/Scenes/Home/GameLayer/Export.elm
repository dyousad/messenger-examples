module Scenes.Home.GameLayer.Export exposing
    ( Data
    , nullData
    , layer
    )

{-| This is the doc for this module

@docs Data
@docs nullData
@docs layer

-}

import Array
import Lib.Layer.Base exposing (Layer)
import Scenes.Home.GameLayer.Common exposing (Model)
import Scenes.Home.GameLayer.Model exposing (initModel, updateModel, viewModel)
import Scenes.Home.LayerBase exposing (CommonData, LayerInitData)


{-| Data
-}
type alias Data =
    Model


{-| nullData
-}
nullData : Data
nullData =
    { components = Array.empty
    }


{-| layer
-}
layer : Layer Data CommonData LayerInitData
layer =
    { name = "GameLayer"
    , data = nullData
    , init = initModel
    , update = updateModel
    , view = viewModel
    }
