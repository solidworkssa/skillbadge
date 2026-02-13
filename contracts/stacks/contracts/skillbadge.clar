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

