-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module ScalarDecoders exposing (Id, PosixTime, decoders)

import Json.Decode as Decode exposing (Decoder)
import Swapi.Scalar exposing (defaultDecoders)


type alias Id =
    Swapi.Scalar.Id


type alias PosixTime =
    Swapi.Scalar.PosixTime


decoders : Swapi.Scalar.Decoders Id PosixTime
decoders =
    Swapi.Scalar.defineDecoders
        { decoderId = defaultDecoders.decoderId
        , decoderPosixTime = defaultDecoders.decoderPosixTime
        }
