;; SkillBadge - Achievement NFT Minter (Clarity v4)

(define-data-var badge-nonce uint u0)

(define-map badges
    uint
    {
        recipient: principal,
        skill: (string-utf8 128),
        metadata: (string-utf8 256),
        issued-at: uint,
        soulbound: bool
    }
)

(define-map user-badges
    {user: principal, index: uint}
    uint
)

(define-map user-badge-count
    principal
    uint
)

(define-public (mint-badge (recipient principal) (skill (string-utf8 128)) (metadata (string-utf8 256)))
    (let
        (
            (badge-id (var-get badge-nonce))
            (user-count (default-to u0 (map-get? user-badge-count recipient)))
        )
        (map-set badges badge-id {
            recipient: recipient,
            skill: skill,
            metadata: metadata,
            issued-at: block-height,
            soulbound: true
        })
        
        (map-set user-badges {user: recipient, index: user-count} badge-id)
        (map-set user-badge-count recipient (+ user-count u1))
        (var-set badge-nonce (+ badge-id u1))
        
        (ok badge-id)
    )
)

(define-read-only (get-badge (badge-id uint))
    (ok (map-get? badges badge-id))
)

(define-read-only (get-user-badge (user principal) (index uint))
    (ok (map-get? user-badges {user: user, index: index}))
)
