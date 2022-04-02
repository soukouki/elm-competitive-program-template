port module Worker exposing (main)

import Main
import Platform


port start : (String -> msg) -> Sub msg


port responce : String -> Cmd msg


type alias Model =
    {}


type Msg
    = StartMsg String


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StartMsg input ->
            let
                res : String
                res =
                    Main.proc input |> Maybe.withDefault "nothing"
            in
            ( model, responce res )


subscriptions : Model -> Sub Msg
subscriptions _ =
    start StartMsg


main : Platform.Program () Model Msg
main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }
