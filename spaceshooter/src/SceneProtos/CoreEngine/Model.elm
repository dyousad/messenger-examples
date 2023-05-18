module SceneProtos.CoreEngine.Model exposing
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
import SceneProtos.CoreEngine.Common exposing (Model)
import SceneProtos.CoreEngine.GameLayer.Export as GameLayer
import SceneProtos.CoreEngine.GameLayer.Global as GameLayerG
import SceneProtos.CoreEngine.LayerBase exposing (CommonData, nullCommonData)
import SceneProtos.CoreEngine.LayerInit exposing (LayerInitData(..))


{-| Initialize the model
-}
initModel : Env -> SceneInitData -> Model
initModel env init =
    let
        layerInitData =
            case init of
                CoreEngineInitData x ->
                    GameLayerInitData x

                _ ->
                    NullLayerInitData
    in
    { commonData = nullCommonData
    , layers =
        [ GameLayerG.getLayerT <| GameLayer.initLayer (addCommonData nullCommonData env) layerInitData
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
