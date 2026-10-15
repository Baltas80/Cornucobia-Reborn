# Cornucobia Reborn — Development Notes

## Current baseline

- Engine: Godot 4.3, GDScript.
- Original upstream: https://github.com/etherealxx/cornucobia
- Working branch: development; main remains the unmodified imported baseline.
- Android application ID: com.pagrey.cornucobiareborn.
- Project version currently set to 0.2.0.

## Changes made in this fork

1. Set an independent project/app name and a separate user-data directory so saves do not collide with the original game.
2. Removed machine-specific custom Android export template paths.
3. Enabled ARMv7 and ARM64 in the combined Android export preset.
4. Capped the final frame of player lane movement to prevent overshooting the target lane.
5. Clarified in the README that this is a fork and retained the original license and credit information.

## Release blockers to resolve before publishing

- **Branding:** the copyrighted Egothystical logo and its import metadata have been removed from the fork, along with the menu references. The Cornucobia title artwork remains and is covered by the original README's CC BY 4.0 visual-art attribution, which must be retained.
- **Export verification:** export presets have been edited but no APK/AAB has yet been built or run. Verify with the actual Godot 4.3 installation and installed Android export templates.
- **Google Play package:** prepare and test an Android App Bundle (AAB), not only an APK, and set a release version code that increases for each upload. The three presets now use version code 2 and App Bundle export format; verify this with the installed Godot Android export templates.
- **Signing:** configure a release keystore securely on the build machine. Do not commit keystores, passwords, or signing secrets.
- **Online leaderboard:** the repository does not contain secrets/api_keys/silentwolf_api_key.gd; leaderboard configuration therefore appears disabled unless a valid key file is supplied privately.
- **Privacy and terms:** review the existing terms/privacy screen, publish an accurate privacy policy, and verify all disclosures against the final build and any third-party services.
- **Licenses:** audit every shipped asset and runtime addon, including the individual license terms called out in the README. The Apache license for project code does not automatically cover every asset or addon.

## Next technical pass

1. Open and run the project in Godot 4.3; resolve parse errors and runtime errors first.
2. Test lane switching, collision/damage, score persistence, pause/back behavior, loading transitions and leaderboard fallback.
3. Replace the proprietary logo and update the main-menu identity.
4. Prepare a reproducible Android AAB export and test on a physical Android device.
