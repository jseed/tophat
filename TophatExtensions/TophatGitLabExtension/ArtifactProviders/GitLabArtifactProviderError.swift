//
//  GitLabArtifactProviderError.swift
//  Tophat
//
//  Created by Jonathan Seed on 2026-09-23.
//  Copyright © 2026 Shopify. All rights reserved.
//


import Foundation

enum GitLabArtifactProviderError: Error {
    case accessTokenNotSet
    case unauthorized
    case notFound
    case removed
    case unexpected
}

extension GitLabArtifactProviderError: LocalizedError {
    var errorDescription: String? {
        "Failed to Download Artifact"
    }

    var failureReason: String? {
        switch self {
        case .accessTokenNotSet:
            "A GitLab personal access token is required."
        case .unauthorized:
            "The access token used to authenticate with GitLab is invalid."
        case .notFound:
            "The requested artifact was not found. It may have expired."
        case .removed:
            "The requested artifact was permanently removed."
        case .unexpected:
            "Something went wrong that Tophat wasn’t able to identify."
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .accessTokenNotSet:
            "Go to Tophat Settings → Extensions → GitLab to add a token."
        case .unauthorized:
            "Go to Tophat Settings → Extensions → GitLab to update the token."
        case .notFound, .removed:
            nil
        case .unexpected:
            "Try again later."
        }
    }
}
