-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.StatusContext exposing (commit, context, createdAt, creator, description, id, state, targetUrl)

import Github.Enum.StatusState
import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| This commit this status context is attached to.
-}
commit : SelectionSet decodesTo Github.Object.Commit -> SelectionSet (Maybe decodesTo) Github.Object.StatusContext
commit object_ =
    Object.selectionForCompositeField "commit" [] object_ (identity >> Decode.nullable)


{-| The name of this status context.
-}
context : SelectionSet String Github.Object.StatusContext
context =
    Object.selectionForField (Just "String") "context" [] Decode.string


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.Scalar.DateTime Github.Object.StatusContext
createdAt =
    Object.selectionForField (Just "DateTime") "createdAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime)


{-| The actor who created this status context.
-}
creator : SelectionSet decodesTo Github.Interface.Actor -> SelectionSet (Maybe decodesTo) Github.Object.StatusContext
creator object_ =
    Object.selectionForCompositeField "creator" [] object_ (identity >> Decode.nullable)


{-| The description for this status context.
-}
description : SelectionSet (Maybe String) Github.Object.StatusContext
description =
    Object.selectionForField (Just "String") "description" [] (Decode.string |> Decode.nullable)


id : SelectionSet Github.Scalar.Id Github.Object.StatusContext
id =
    Object.selectionForField (Just "ID") "id" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Id)


{-| The state of this status context.
-}
state : SelectionSet Github.Enum.StatusState.StatusState Github.Object.StatusContext
state =
    Object.selectionForField Nothing "state" [] Github.Enum.StatusState.decoder


{-| The URL for this status context.
-}
targetUrl : SelectionSet (Maybe Github.Scalar.Uri) Github.Object.StatusContext
targetUrl =
    Object.selectionForField (Just "URI") "targetUrl" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Uri |> Decode.nullable)
