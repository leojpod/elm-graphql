-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Interface.Subscribable exposing (Fragments, fragments, id, maybeFragments, viewerCanSubscribe, viewerSubscription)

import Github.Enum.SubscriptionState
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
import Graphql.SelectionSet exposing (FragmentSelectionSet(..), SelectionSet(..))
import Json.Decode as Decode


type alias Fragments decodesTo =
    { onCommit : SelectionSet decodesTo Github.Object.Commit
    , onIssue : SelectionSet decodesTo Github.Object.Issue
    , onPullRequest : SelectionSet decodesTo Github.Object.PullRequest
    , onRepository : SelectionSet decodesTo Github.Object.Repository
    , onTeam : SelectionSet decodesTo Github.Object.Team
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
    Fragments decodesTo
    -> SelectionSet decodesTo Github.Interface.Subscribable
fragments selections =
    Object.exhuastiveFragmentSelection
        [ Object.buildFragment "Commit" selections.onCommit
        , Object.buildFragment "Issue" selections.onIssue
        , Object.buildFragment "PullRequest" selections.onPullRequest
        , Object.buildFragment "Repository" selections.onRepository
        , Object.buildFragment "Team" selections.onTeam
        ]


{-| Can be used to create a non-exhuastive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    { onCommit = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onIssue = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onPullRequest = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onRepository = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onTeam = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


id : SelectionSet Github.Scalar.Id Github.Interface.Subscribable
id =
    Object.selectionForField (Just "ID") "id" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Id)


{-| Check if the viewer is able to change their subscription status for the repository.
-}
viewerCanSubscribe : SelectionSet Bool Github.Interface.Subscribable
viewerCanSubscribe =
    Object.selectionForField (Just "Boolean") "viewerCanSubscribe" [] Decode.bool


{-| Identifies if the viewer is watching, not watching, or ignoring the subscribable entity.
-}
viewerSubscription : SelectionSet Github.Enum.SubscriptionState.SubscriptionState Github.Interface.Subscribable
viewerSubscription =
    Object.selectionForField Nothing "viewerSubscription" [] Github.Enum.SubscriptionState.decoder
