# ClimateProof
Environmental data review and byte-level integrity checks. ClimateChain hackathon prototype, Climate Data & Environmental Monitoring track.

## Run
Serve the repository using `python3 -m http.server 8000`, then open http://localhost:8000. No dependencies, wallet, API key, or server-side uploads required.

## Demo
1. Load the synthetic sample: 12 readings, with a deliberately injected spike of 85.
2. Download a fingerprint receipt.
3. Load that receipt and verify: MATCH.
4. Change a value in the editor and verify: CHANGED.
5. Upload your own CSV with exact header `timestamp,sensor_id,value`.

## Implemented
CSV import (2 MB / 10,000 rows), per-sensor median absolute deviation flags, reading chart, table, SHA-256 receipt download, and receipt comparison. All data processing stays in-browser. CSV supports three unquoted columns; timestamps must parse as dates. Fingerprints cover the exact UTF-8 editor text, so whitespace and line-ending changes count.

## Boundaries
This version uses a statistical baseline, not a trained AI model. Minimum five readings per sensor; a zero-MAD group flags values different from its median. Small samples, drift, mixed units and seasonal patterns can lead to misleading flags. A flag requires human investigation.
Receipts are local and replaceable, not blockchain anchors or trusted timestamps. Neither hashes nor blockchain prove sensor accuracy. The Solidity registry in `ClimateProofRegistry.sol` is proposed integration source: not compiled, audited, deployed, or connected to this UI. No real-world accuracy or climate impact has been measured. Synthetic data is illustrative only.

## Next
Evaluate an AI detector on documented data, measure false positives, add sensor/unit metadata, test and deploy the registry to a test network, and connect transaction verification to the dashboard.


