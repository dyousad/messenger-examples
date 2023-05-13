module Scenes.Home.Model exposing
    ( initModel
    , handleLayerMsg
    , updateModel
    , viewModel
    )

{-| This module is generated by Messenger, don't modify this.

@docs initModel
@docs handleLayerMsg
@docs updateModel
@docs viewModel

-}

import Canvas exposing (Renderable)
import Lib.Audio.Base exposing (AudioOption(..))
import Lib.Env.Env exposing (Env, EnvC, addCommonData, noCommonData)
import Lib.Layer.Base exposing (LayerMsg(..))
import Lib.Layer.LayerHandler exposing (updateLayer, viewLayer)
import Lib.Scene.Base exposing (SceneInitData(..), SceneOutputMsg(..))
import Scenes.Home.Common exposing (Model)
import Scenes.Home.GameLayer.Export as GameLayer
import Scenes.Home.GameLayer.Global as GameLayerG
import Scenes.Home.GameLayer2.Export as GameLayer2
import Scenes.Home.GameLayer2.Global as GameLayer2G
import Scenes.Home.LayerBase exposing (CommonData, LayerInitData(..), nullCommonData)


{-| Initialize the model
-}
initModel : Env -> SceneInitData -> Model
initModel env _ =
    { commonData = nullCommonData
    , layers =
        [ GameLayerG.getLayerT <| GameLayer.initLayer (addCommonData nullCommonData env) NullLayerInitData
        , GameLayer2G.getLayerT <| GameLayer2.initLayer (addCommonData nullCommonData env) NullLayerInitData
        ]
    }


{-| handleLayerMsg

Usually you are adding logic here.

-}
handleLayerMsg : EnvC CommonData -> LayerMsg -> Model -> ( Model, List SceneOutputMsg, EnvC CommonData )
handleLayerMsg env _ model =
    ( model, [], env )


{-| updateModel

Default update function. Normally you won't change this function.

-}
updateModel : Env -> Model -> ( Model, List SceneOutputMsg, Env )
updateModel env model =
    let
        ( newdata, msgs, newenv ) =
            updateLayer (addCommonData model.commonData env) model.layers

        nmodel =
            { model | commonData = newenv.commonData, layers = newdata }

        ( newmodel, newsow, newgd2 ) =
            List.foldl (\x ( y, _, cgd ) -> handleLayerMsg cgd x y) ( nmodel, [], newenv ) msgs
    in
    ( newmodel, newsow, noCommonData newgd2 )


{-| Default view function
-}
viewModel : Env -> Model -> Renderable
viewModel env model =
    viewLayer (addCommonData model.commonData env) model.layers
