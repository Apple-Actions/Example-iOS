# Example-iOS

An example of how to use Apple development GitHub Actions to build, sign, and upload an iOS app to TestFlight.

The workflow lives at [`.github/workflows/build-ios-app.yml`](.github/workflows/build-ios-app.yml). On every push:

- Branches other than `prod` — compile against the iOS simulator as a smoke test.
- `prod` — import signing certs, download the provisioning profile, archive for `iphoneos`, and upload to TestFlight.

Build logs are uploaded as a workflow artifact on failure or cancellation.

## Required repo configuration

Secrets live under Settings → Secrets and variables → Actions → **Secrets**; variables under the **Variables** tab. See each action's README for how to obtain the values.

### [`Apple-Actions/import-codesign-certs`](https://github.com/Apple-Actions/import-codesign-certs)

Imports your distribution certificate into the runner keychain.

- Secret `APPSTORE_CERTIFICATES_FILE_BASE64` — base64-encoded `.p12` export of your distribution certificate.
- Secret `APPSTORE_CERTIFICATES_PASSWORD` — password for the `.p12`.

### [`Apple-Actions/download-provisioning-profiles`](https://github.com/Apple-Actions/download-provisioning-profiles) and [`Apple-Actions/upload-testflight-build`](https://github.com/Apple-Actions/upload-testflight-build)

Both authenticate with an App Store Connect API key.

- Variable `APPSTORE_ISSUER_ID` — App Store Connect API issuer ID.
- Variable `APPSTORE_KEY_ID` — App Store Connect API key ID.
- Secret `APPSTORE_PRIVATE_KEY` — contents of the `.p8` key file.

## Required Apple configuration

An App Store distribution provisioning profile for bundle `codes.orj.Example-iOS`, named exactly **`AppStore codes.orj.Example-iOS`**. The name is referenced in [`Support/ExportOptions.plist`](Support/ExportOptions.plist) and the Release config in [`Example-iOS/Example-iOS.xcodeproj/project.pbxproj`](Example-iOS/Example-iOS.xcodeproj/project.pbxproj) — all three must match.
