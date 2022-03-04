port module Worker exposing (main)

import Platform


port start : (String -> msg) -> Sub msg
port responce : String -> Cmd msg


type alias Model =
    {}


type Msg
    = StartMsg String


init : () -> ( Model, Cmd Msg )
init flags =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StartMsg text ->
            let
                res =
                    text
                        |> String.replace "\n" ""
                        |> String.toInt
                        |> Maybe.map ((\n -> n * n) >> String.fromInt)
                        |> Maybe.withDefault (text++" is not Int")
            in
            ( model, responce res )


subscriptions : Model -> Sub Msg
subscriptions model =
    start StartMsg


main : Platform.Program () Model Msg
main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }
