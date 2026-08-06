# Example-iOS

An example of how to use Apple development GitHub Actions to build, sign, and upload an iOS app to TestFlight.

The workflow lives at [`.github/workflows/build-ios-app.yml`](.github/workflows/build-ios-app.yml). On every push:

- Branches other than `prod` — compile against the iOS simulator as a smoke test.
- `prod` — import signing certs, download the provisioning profile, archive for `iphoneos`, and upload to TestFlight.

Build logs are uploaded as a workflow artifact on failure or cancellation.

## Required repo configuration

Secrets live under Settings → Secrets and variables → Actions → **Secrets**; variables under the **Variables** tab.

Use the same ENV names as the [Apple-Actions setup scripts](https://github.com/Apple-Actions/download-provisioning-profiles#canonical-github-envs):

| Kind | Name |
| --- | --- |
| Variable | `APPSTORE_ISSUER_ID` |
| Variable | `APPSTORE_API_KEY_ID` |
| Secret | `APPSTORE_API_PRIVATE_KEY` |
| Secret | `APPSTORE_CERTIFICATES_FILE_BASE64` |
| Secret | `APPSTORE_CERTIFICATES_PASSWORD` |

[`import-codesign-certs`](https://github.com/Apple-Actions/import-codesign-certs) uses the certificate secrets; [`download-provisioning-profiles`](https://github.com/Apple-Actions/download-provisioning-profiles) and [`upload-testflight-build`](https://github.com/Apple-Actions/upload-testflight-build) use the ASC API trio.

## Required Apple configuration

An App Store distribution provisioning profile for bundle `codes.orj.Example-iOS`, named exactly **`AppStore codes.orj.Example-iOS`**. The name is referenced in [`Support/ExportOptions.plist`](Support/ExportOptions.plist) and the Release config in [`Example-iOS/Example-iOS.xcodeproj/project.pbxproj`](Example-iOS/Example-iOS.xcodeproj/project.pbxproj) — all three must match.

You can create the certificate, profile, ExportOptions, and GitHub ENVs with [`scripts/setup.sh`](https://github.com/Apple-Actions/download-provisioning-profiles#one-shot-setup).
