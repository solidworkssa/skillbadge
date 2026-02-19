;; ────────────────────────────────────────
;; SkillBadge v1.0.0
;; Author: solidworkssa
;; License: MIT
;; ────────────────────────────────────────

(define-constant VERSION "1.0.0")

;; Error codes
(define-constant ERR-NOT-AUTHORIZED (err u401))
(define-constant ERR-NOT-FOUND (err u404))
(define-constant ERR-ALREADY-EXISTS (err u409))
(define-constant ERR-INVALID-INPUT (err u422))

;; SkillBadge Clarity Contract
;; NFT-based skill certification and verification system.


(define-non-fungible-token skill-badge uint)
(define-data-var next-token-id uint u0)

(define-map badge-info
    uint
    {
        recipient: principal,
        skill: (string-ascii 64),
        issuer: principal,
        timestamp: uint
    }
)

(define-public (issue-badge (recipient principal) (skill (string-ascii 64)))
    (let
        (
            (token-id (var-get next-token-id))
        )
        (try! (nft-mint? skill-badge token-id recipient))
        (map-set badge-info token-id {
            recipient: recipient,
            skill: skill,
            issuer: tx-sender,
            timestamp: block-height
        })
        (var-set next-token-id (+ token-id u1))
        (ok token-id)
    )
)

(define-read-only (get-badge-info (token-id uint))
    (ok (map-get? badge-info token-id))
)

