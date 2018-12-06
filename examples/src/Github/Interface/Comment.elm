-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Interface.Comment exposing (Fragments, UserContentEditsOptionalArguments, author, authorAssociation, body, bodyHTML, createdAt, createdViaEmail, editor, fragments, id, lastEditedAt, maybeFragments, publishedAt, updatedAt, userContentEdits, viewerDidAuthor)

import Github.Enum.CommentAuthorAssociation
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
    { onCommitComment : SelectionSet decodesTo Github.Object.CommitComment
    , onGistComment : SelectionSet decodesTo Github.Object.GistComment
    , onIssue : SelectionSet decodesTo Github.Object.Issue
    , onIssueComment : SelectionSet decodesTo Github.Object.IssueComment
    , onPullRequest : SelectionSet decodesTo Github.Object.PullRequest
    , onPullRequestReview : SelectionSet decodesTo Github.Object.PullRequestReview
    , onPullRequestReviewComment : SelectionSet decodesTo Github.Object.PullRequestReviewComment
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
    Fragments decodesTo
    -> SelectionSet decodesTo Github.Interface.Comment
fragments selections =
    Object.exhuastiveFragmentSelection
        [ Object.buildFragment "CommitComment" selections.onCommitComment
        , Object.buildFragment "GistComment" selections.onGistComment
        , Object.buildFragment "Issue" selections.onIssue
        , Object.buildFragment "IssueComment" selections.onIssueComment
        , Object.buildFragment "PullRequest" selections.onPullRequest
        , Object.buildFragment "PullRequestReview" selections.onPullRequestReview
        , Object.buildFragment "PullRequestReviewComment" selections.onPullRequestReviewComment
        ]


{-| Can be used to create a non-exhuastive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    { onCommitComment = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onGistComment = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onIssue = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onIssueComment = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onPullRequest = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onPullRequestReview = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onPullRequestReviewComment = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


{-| The actor who authored the comment.
-}
author : SelectionSet decodesTo Github.Interface.Actor -> SelectionSet (Maybe decodesTo) Github.Interface.Comment
author object_ =
    Object.selectionForCompositeField "author" [] object_ (identity >> Decode.nullable)


{-| Author's association with the subject of the comment.
-}
authorAssociation : SelectionSet Github.Enum.CommentAuthorAssociation.CommentAuthorAssociation Github.Interface.Comment
authorAssociation =
    Object.selectionForField Nothing "authorAssociation" [] Github.Enum.CommentAuthorAssociation.decoder


{-| The comment body as Markdown.
-}
body : SelectionSet String Github.Interface.Comment
body =
    Object.selectionForField (Just "String") "body" [] Decode.string


{-| The comment body rendered to HTML.
-}
bodyHTML : SelectionSet Github.Scalar.Html Github.Interface.Comment
bodyHTML =
    Object.selectionForField (Just "HTML") "bodyHTML" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Html)


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.Scalar.DateTime Github.Interface.Comment
createdAt =
    Object.selectionForField (Just "DateTime") "createdAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime)


{-| Check if this comment was created via an email reply.
-}
createdViaEmail : SelectionSet Bool Github.Interface.Comment
createdViaEmail =
    Object.selectionForField (Just "Boolean") "createdViaEmail" [] Decode.bool


{-| The actor who edited the comment.
-}
editor : SelectionSet decodesTo Github.Interface.Actor -> SelectionSet (Maybe decodesTo) Github.Interface.Comment
editor object_ =
    Object.selectionForCompositeField "editor" [] object_ (identity >> Decode.nullable)


id : SelectionSet Github.Scalar.Id Github.Interface.Comment
id =
    Object.selectionForField (Just "ID") "id" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Id)


{-| The moment the editor made the last edit
-}
lastEditedAt : SelectionSet (Maybe Github.Scalar.DateTime) Github.Interface.Comment
lastEditedAt =
    Object.selectionForField (Just "DateTime") "lastEditedAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime |> Decode.nullable)


{-| Identifies when the comment was published at.
-}
publishedAt : SelectionSet (Maybe Github.Scalar.DateTime) Github.Interface.Comment
publishedAt =
    Object.selectionForField (Just "DateTime") "publishedAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime |> Decode.nullable)


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.Scalar.DateTime Github.Interface.Comment
updatedAt =
    Object.selectionForField (Just "DateTime") "updatedAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime)


type alias UserContentEditsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of edits to this content.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
userContentEdits : (UserContentEditsOptionalArguments -> UserContentEditsOptionalArguments) -> SelectionSet decodesTo Github.Object.UserContentEditConnection -> SelectionSet (Maybe decodesTo) Github.Interface.Comment
userContentEdits fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "userContentEdits" optionalArgs object_ (identity >> Decode.nullable)


{-| Did the viewer author this comment.
-}
viewerDidAuthor : SelectionSet Bool Github.Interface.Comment
viewerDidAuthor =
    Object.selectionForField (Just "Boolean") "viewerDidAuthor" [] Decode.bool
